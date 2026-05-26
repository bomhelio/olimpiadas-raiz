"use server";

import { createServerClient, type CookieOptions } from "@supabase/ssr";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";
import type { Database } from "@/lib/types/database";
import { createAdminClient } from "@/lib/supabase/admin";

export type LoginAlunoState = { error?: string } | null;

export async function loginAluno(
  _prevState: LoginAlunoState,
  formData: FormData,
): Promise<LoginAlunoState> {
  const email = formData.get("email") as string;
  const password = formData.get("password") as string;

  if (!email || !password) return { error: "Preencha e-mail e senha." };

  // Campos de consentimento (opcionais no form — obrigatórios apenas no primeiro acesso)
  const nomeResponsavel = (formData.get("responsavel_nome") as string)?.trim() || null;
  const tipoResponsavel = (formData.get("responsavel_tipo") as string) || null;
  const consentimentoAceito = formData.get("consentimento_aceito") === "on";

  const cookieStore = await cookies();

  const supabase = createServerClient<Database>(
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

  const { data, error } = await supabase.auth.signInWithPassword({ email, password });

  if (error) {
    const isInvalidCredentials =
      error.message.toLowerCase().includes("invalid") ||
      error.message.toLowerCase().includes("credentials");
    return {
      error: isInvalidCredentials
        ? "E-mail ou senha incorretos."
        : "Não foi possível fazer login. Tente novamente.",
    };
  }

  // Usa admin client para bypassed RLS no lookup inicial do aluno
  const adminClient = createAdminClient();
  const { data: aluno } = await adminClient
    .from("aluno")
    .select("id, consentimento_responsavel")
    .eq("supabase_auth_id", data.user.id)
    .maybeSingle();

  if (!aluno) {
    await supabase.auth.signOut();
    return { error: "Acesso não encontrado. Fale com a coordenação da sua escola." };
  }

  // Primeiro acesso: consentimento obrigatório
  if (!aluno.consentimento_responsavel) {
    if (!nomeResponsavel) {
      await supabase.auth.signOut();
      return { error: "Informe o nome completo do responsável para continuar." };
    }
    if (!tipoResponsavel || !["pedagogico", "financeiro"].includes(tipoResponsavel)) {
      await supabase.auth.signOut();
      return { error: "Selecione o tipo de responsável (pedagógico ou financeiro)." };
    }
    if (!consentimentoAceito) {
      await supabase.auth.signOut();
      return { error: "O responsável deve aceitar os termos para liberar o acesso." };
    }

    await supabase
      .from("aluno")
      .update({
        consentimento_responsavel: true,
        consentimento_data: new Date().toISOString(),
        consentimento_responsavel_nome: nomeResponsavel,
        consentimento_responsavel_tipo: tipoResponsavel as "pedagogico" | "financeiro",
      })
      .eq("id", aluno.id);
  }

  redirect("/aluno/dashboard");
}

export async function logoutAluno() {
  const cookieStore = await cookies();

  const supabase = createServerClient<Database>(
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

  await supabase.auth.signOut();
  redirect("/aluno/login");
}
