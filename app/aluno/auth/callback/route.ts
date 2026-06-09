import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import type { NextRequest } from "next/server";
import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";
import {
  ALUNO_SESSION_COOKIE,
  ALUNO_PENDING_COOKIE,
  signStudentCookie,
  cookieSessionOpts,
  cookiePendingOpts,
} from "@/lib/auth/student-cookie";

export async function GET(request: NextRequest) {
  const code = request.nextUrl.searchParams.get("code");
  const origin = request.nextUrl.origin;

  if (!code) {
    return NextResponse.redirect(`${origin}/aluno/login?erro=oauth`);
  }

  const cookieStore = await cookies();

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => cookieStore.set(name, value, options));
        },
      },
    },
  );

  const { error: exchangeError } = await supabase.auth.exchangeCodeForSession(code);
  if (exchangeError) {
    return NextResponse.redirect(`${origin}/aluno/login?erro=oauth`);
  }

  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user?.email) {
    return NextResponse.redirect(`${origin}/aluno/login?erro=oauth`);
  }

  const admin = createAdminClient();
  const { data: aluno } = await admin
    .from("aluno")
    .select("id, consentimento_responsavel, supabase_auth_id")
    .eq("email", user.email)
    .eq("ativo", true)
    .maybeSingle();

  if (!aluno) {
    // Email do Google não está cadastrado na plataforma
    await supabase.auth.signOut();
    return NextResponse.redirect(`${origin}/aluno/login?erro=nao-cadastrado`);
  }

  // Vincula o supabase_auth_id na primeira vez que o aluno usa o Google SSO
  if (!aluno.supabase_auth_id) {
    await admin.from("aluno").update({ supabase_auth_id: user.id }).eq("id", aluno.id);
  }

  // Primeiro acesso: coleta consentimento do responsável
  if (!aluno.consentimento_responsavel) {
    cookieStore.set(ALUNO_PENDING_COOKIE, signStudentCookie(aluno.id), cookiePendingOpts());
    return NextResponse.redirect(`${origin}/aluno/login`);
  }

  cookieStore.set(ALUNO_SESSION_COOKIE, signStudentCookie(aluno.id), cookieSessionOpts());
  return NextResponse.redirect(`${origin}/aluno/dashboard`);
}
