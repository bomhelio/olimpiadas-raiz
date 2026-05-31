import { createServerClient, type CookieOptions } from "@supabase/ssr";
import { cookies } from "next/headers";
import { NextResponse, type NextRequest } from "next/server";
import type { Database } from "@/lib/types/database";

/**
 * Callback de autenticação do Supabase.
 * Troca o code por uma sessão e redireciona para o destino correto.
 */
export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const code = searchParams.get("code");
  // Whitelist — impede open redirect para domínios externos
  const rawNext = searchParams.get("next") ?? "/dashboard";
  const SAFE_PREFIXES = [
    "/dashboard",
    "/aluno/",
    "/academico/",
    "/olimpiadas",
    "/inscricoes",
    "/resultados",
    "/configuracoes",
  ];
  const next = SAFE_PREFIXES.some((p) => rawNext.startsWith(p)) ? rawNext : "/dashboard";

  if (!code) {
    return NextResponse.redirect(new URL("/login?error=invalid_callback", request.url));
  }

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

  const { error } = await supabase.auth.exchangeCodeForSession(code);

  if (error) {
    console.error("[auth/callback] exchangeCodeForSession error:", error.code ?? "unknown");
    return NextResponse.redirect(new URL("/login?error=auth_callback_failed", request.url));
  }

  return NextResponse.redirect(new URL(next, request.url));
}
