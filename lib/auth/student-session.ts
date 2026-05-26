import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import type { Database, Aluno } from "@/lib/types/database";
import { createAdminClient } from "@/lib/supabase/admin";

export type StudentSession = {
  aluno: Aluno;
  supabaseUserId: string;
} | null;

/**
 * Recupera a sessão do aluno autenticado no servidor.
 * Usa o mesmo Supabase Auth do admin, mas busca o perfil em public.aluno.
 * Retorna null se não autenticado ou se o auth.uid() não tem aluno vinculado.
 */
export async function getStudentSession(): Promise<StudentSession> {
  const cookieStore = await cookies();

  const supabase = createServerClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value, options }) => {
            cookieStore.set(name, value, options);
          });
        },
      },
    },
  );

  const {
    data: { user: authUser },
  } = await supabase.auth.getUser();

  if (!authUser) return null;

  // Admin client bypassa RLS para lookup do aluno e verificação de staff
  const admin = createAdminClient();

  const { data: staff } = await admin
    .from("usuario")
    .select("id")
    .eq("id", authUser.id)
    .maybeSingle();

  if (staff) return null;

  const { data: aluno, error } = await admin
    .from("aluno")
    .select("*")
    .eq("supabase_auth_id", authUser.id)
    .eq("ativo", true)
    .single();

  if (error || !aluno) return null;

  return { aluno, supabaseUserId: authUser.id };
}
