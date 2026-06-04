"use server";

import { createServerClient, type CookieOptions } from "@supabase/ssr";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";
import { createAdminClient } from "@/lib/supabase/admin";
import {
  ALUNO_SESSION_COOKIE,
  ALUNO_PENDING_COOKIE,
  signStudentCookie,
  verifyStudentCookie,
  cookieSessionOpts,
  cookiePendingOpts,
} from "@/lib/auth/student-cookie";

export type LoginAlunoState = { error: string } | { needsConsent: true } | null;

function makeSupabase(cookieStore: Awaited<ReturnType<typeof cookies>>) {
  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll();
        },
        setAll(cookiesToSet: Array<{ name: string; value: string; options: CookieOptions }>) {
          cookiesToSet.forEach(({ name, value, options }) => cookieStore.set(name, value, options));
        },
      },
    },
  );
}

export async function loginAluno(
  _prevState: LoginAlunoState,
  formData: FormData,
): Promise<LoginAlunoState> {
  const cookieStore = await cookies();
  const adminClient = createAdminClient();

  // ── Já tem sessão própria ───────────────────────────────────────────────────
  const existingSession = cookieStore.get(ALUNO_SESSION_COOKIE)?.value;
  if (existingSession && verifyStudentCookie(existingSession)) {
    redirect("/aluno/dashboard");
  }

  // ── Reenvio do formulário de consentimento ──────────────────────────────────
  const pendingRaw = cookieStore.get(ALUNO_PENDING_COOKIE)?.value;
  const pendingAlunoId = pendingRaw ? verifyStudentCookie(pendingRaw) : null;

  if (pendingAlunoId && formData.get("responsavel_nome")) {
    const nome = (formData.get("responsavel_nome") as string)?.trim();
    const tipo = formData.get("responsavel_tipo") as string;
    const aceito = formData.get("consentimento_aceito") === "on";

    if (!nome) return { error: "Informe o nome completo do responsável." };
    if (!tipo || !["pedagogico", "financeiro"].includes(tipo))
      return { error: "Selecione o tipo de responsável." };
    if (!aceito)
      return { error: "O responsável deve aceitar os termos para liberar o acesso." };

    await adminClient
      .from("aluno")
      .update({
        consentimento_responsavel: true,
        consentimento_data: new Date().toISOString(),
        consentimento_responsavel_nome: nome,
        consentimento_responsavel_tipo: tipo as "pedagogico" | "financeiro",
      })
      .eq("id", pendingAlunoId);

    cookieStore.delete(ALUNO_PENDING_COOKIE);
    cookieStore.set(ALUNO_SESSION_COOKIE, signStudentCookie(pendingAlunoId), cookieSessionOpts());
    redirect("/aluno/dashboard");
  }

  // ── Login com e-mail e senha ────────────────────────────────────────────────
  const email = formData.get("email") as string;
  const password = formData.get("password") as string;

  if (!email || !password) return { error: "Preencha e-mail e senha." };

  // Usamos Supabase Auth APENAS para verificar as credenciais
  const supabase = makeSupabase(cookieStore);
  const { data, error } = await supabase.auth.signInWithPassword({ email, password });

  if (error) {
    const isInvalid =
      error.message.toLowerCase().includes("invalid") ||
      error.message.toLowerCase().includes("credentials");
    return {
      error: isInvalid
        ? "E-mail ou senha incorretos."
        : "Não foi possível fazer login. Tente novamente.",
    };
  }

  // Busca o aluno via adminClient (não depende da sessão Supabase)
  const { data: aluno, error: alunoError } = await adminClient
    .from("aluno")
    .select("id, consentimento_responsavel")
    .eq("supabase_auth_id", data.user.id)
    .eq("ativo", true)
    .maybeSingle();

  // Encerra a sessão Supabase Auth IMEDIATAMENTE — cookie próprio do aluno é suficiente
  // Isso garante que logout do admin NÃO afeta a sessão do aluno
  await supabase.auth.signOut();

  if (alunoError) {
    console.error("Erro ao buscar aluno:", alunoError.code ?? "unknown");
    return { error: "Não foi possível verificar o acesso. Tente novamente." };
  }

  if (!aluno) {
    return { error: "Acesso não encontrado. Fale com a coordenação da sua escola." };
  }

  if (!aluno.consentimento_responsavel) {
    // Guarda o aluno_id temporariamente (10 min) para o formulário de consentimento
    cookieStore.set(ALUNO_PENDING_COOKIE, signStudentCookie(aluno.id), cookiePendingOpts());
    return { needsConsent: true };
  }

  // Define o cookie de sessão próprio do aluno (7 dias, independente do admin)
  cookieStore.set(ALUNO_SESSION_COOKIE, signStudentCookie(aluno.id), cookieSessionOpts());
  redirect("/aluno/dashboard");
}

export async function logoutAluno() {
  const cookieStore = await cookies();
  // Apaga APENAS o cookie próprio do aluno — não toca nos cookies do admin
  cookieStore.delete(ALUNO_SESSION_COOKIE);
  cookieStore.delete(ALUNO_PENDING_COOKIE);
  redirect("/aluno/login");
}
