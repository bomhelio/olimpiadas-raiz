import { redirect } from "next/navigation";
import Link from "next/link";
import { getServerSession } from "@/lib/auth/session";
import { createAdminClient } from "@/lib/supabase/admin";
import { can } from "@/lib/auth/roles";
import { MetasForm } from "@/components/analytics/metas-form";
import type { MetaRow } from "./actions";

export const metadata = { title: "Metas — Gestão" };

export default async function MetasPage({
  searchParams,
}: {
  searchParams: Promise<{ ano?: string }>;
}) {
  const session = await getServerSession();
  if (!session) return null;
  if (!can(session.user.role, "audit_log:read")) redirect("/dashboard");

  const sp = await searchParams;
  const anoAtual = new Date().getFullYear();
  const ano = sp.ano ? parseInt(sp.ano, 10) : anoAtual;
  const anos = Array.from({ length: 4 }, (_, i) => anoAtual - 1 + i);

  const supabase = createAdminClient();
  const [{ data: marcas }, { data: metasData }] = await Promise.all([
    supabase.from("marca").select("id, nome").order("nome"),
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    (supabase as any).from("meta_marca").select("*").eq("ano_letivo", ano),
  ]);

  // Map: marcaId → tipo → valor
  const metasMap: Record<string, Record<string, number>> = {};
  for (const m of (metasData ?? []) as MetaRow[]) {
    if (!metasMap[m.marca_id]) metasMap[m.marca_id] = {};
    metasMap[m.marca_id]![m.tipo] = m.valor;
  }

  return (
    <div className="space-y-6">
      {/* Cabeçalho */}
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <div className="mb-1 flex items-center gap-2">
            <Link
              href="/analytics"
              className="text-xs text-muted-foreground hover:text-foreground transition-colors"
            >
              ← Gestão
            </Link>
          </div>
          <h1 className="text-2xl font-bold text-foreground">Metas por marca</h1>
          <p className="mt-1 text-sm text-muted-foreground">
            Defina os alvos de inscrições, participantes e premiados para cada marca.
          </p>
        </div>

        {/* Seletor de ano */}
        <form method="GET" className="flex items-center gap-2">
          <label className="text-xs font-medium text-muted-foreground">Ano letivo</label>
          <select
            name="ano"
            defaultValue={ano}
            className="rounded-lg border border-border bg-card px-3 py-2 text-sm focus:border-ring focus:outline-none"
          >
            {anos.map((a) => (
              <option key={a} value={a}>
                {a}
              </option>
            ))}
          </select>
          <button
            type="submit"
            className="rounded-lg bg-secondary px-4 py-2 text-sm font-medium hover:bg-secondary/80"
          >
            Aplicar
          </button>
        </form>
      </div>

      {/* Formulário */}
      <div className="rounded-xl border border-border bg-card p-6">
        <MetasForm marcas={marcas ?? []} metasMap={metasMap} ano={ano} />
      </div>

      {/* Legenda */}
      <div className="rounded-xl border border-border bg-card p-5">
        <p className="mb-3 text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          Definições
        </p>
        <div className="space-y-2 text-xs text-muted-foreground">
          <p>
            <span className="font-semibold text-blue-400">Inscrições</span> — total de alunos
            inscritos em pelo menos uma olimpíada pela marca no ano letivo.
          </p>
          <p>
            <span className="font-semibold text-indigo-400">Participantes</span> — inscrições com
            status <em>confirmada</em> (aluno efetivamente participou).
          </p>
          <p>
            <span className="font-semibold text-yellow-400">Premiados</span> — alunos que receberam
            ouro, prata, bronze ou menção honrosa em qualquer fase.
          </p>
        </div>
      </div>
    </div>
  );
}
