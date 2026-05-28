import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import type { Database, Aluno } from "@/lib/types/database";
import { createAdminClient } from "@/lib/supabase/admin";

export type StudentSession = {
  aluno: Aluno;
  supabaseUserId: string;
  marcaSlug: string | null;
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

  const admin = createAdminClient();

  // Verificação de staff via adminClient (bypassa RLS de usuario)
  const { data: staff } = await admin
    .from("usuario")
    .select("id")
    .eq("id", authUser.id)
    .maybeSingle();

  if (staff) return null;

  // Leitura do aluno via cliente autenticado (policy aluno_read_own)
  const { data: aluno, error } = await supabase
    .from("aluno")
    .select("*")
    .eq("supabase_auth_id", authUser.id)
    .eq("ativo", true)
    .single();

  if (error || !aluno) return null;

  // Busca o slug da marca via adminClient (bypassa RLS de turma/unidade/marca)
  let marcaSlug: string | null = null;
  if (aluno.turma_id) {
    const { data: turmaRow } = await admin
      .from("turma")
      .select("unidade:unidade_id(marca:marca_id(slug))")
      .eq("id", aluno.turma_id)
      .single();

    if (turmaRow) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const unidade = (turmaRow as any).unidade;
      const marcaObj = Array.isArray(unidade) ? unidade[0]?.marca : unidade?.marca;
      marcaSlug = (Array.isArray(marcaObj) ? marcaObj[0]?.slug : marcaObj?.slug) ?? null;
    }
  }

  return { aluno, supabaseUserId: authUser.id, marcaSlug };
}
