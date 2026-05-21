import { getServerSession } from "@/lib/auth/session";
import { createAdminClient } from "@/lib/supabase/admin";
import { MarcaMultiSelect } from "@/components/olimpiadas/marca-multi-select";
import { OlimpiadaMultiSelect } from "@/components/olimpiadas/olimpiada-multi-select";
import { YearMultiSelect } from "@/components/dashboard/year-multi-select";

const ANO_INICIO = 2021;

export const metadata = { title: "Olimpíadas — Olimpíadas" };

type Stats = {
  nome: string;
  inscritos: number;
  participantes: number;
  ouro: number;
  prata: number;
  bronze: number;
  mencao: number;
};

function fmt(n: number) {
  return n === 0 ? "—" : n.toLocaleString("pt-BR");
}

function engajamento(participantes: number, inscritos: number) {
  if (inscritos === 0) return "—";
  return `${Math.round((participantes / inscritos) * 100)}%`;
}

export default async function OlimpiadasPage({
  searchParams,
}: {
  searchParams: Promise<{ marca?: string; olimpiada?: string; anos?: string }>;
}) {
  const session = await getServerSession();
  if (!session) return null;

  const supabase = createAdminClient();
  const sp = await searchParams;

  const marcaParam = sp.marca ?? "todas";
  const olimpiadaParam = sp.olimpiada ?? "todas";

  const marcaTodosMode = marcaParam === "todas";
  const olimpiadaTodosMode = olimpiadaParam === "todas";

  const selectedMarcas = marcaTodosMode ? [] : marcaParam.split(",").filter(Boolean);
  const selectedOlimpiadas = olimpiadaTodosMode ? [] : olimpiadaParam.split(",").filter(Boolean);

  const anoCorrente = new Date().getFullYear();
  const anosDisponiveis = Array.from(
    { length: anoCorrente - ANO_INICIO + 1 },
    (_, i) => ANO_INICIO + i,
  ).reverse();
  const todosModeAnos = sp.anos === "todos";
  const selectedYears: number[] = todosModeAnos
    ? anosDisponiveis
    : sp.anos
      ? sp.anos
          .split(",")
          .map(Number)
          .filter((n) => !isNaN(n) && anosDisponiveis.includes(n))
      : [anoCorrente];

  const { data: marcas } = await supabase.from("marca").select("id, nome").order("nome");

  let query = supabase
    .from("v_dashboard_inscricoes")
    .select("olimpiada_nome, status, classificacao")
    .in("ano_letivo", selectedYears);

  if (!marcaTodosMode && selectedMarcas.length > 0) {
    query = query.in("marca_nome", selectedMarcas);
  }
  if (!olimpiadaTodosMode && selectedOlimpiadas.length > 0) {
    const conditions = selectedOlimpiadas.map((s) => `olimpiada_nome.ilike.%${s}%`).join(",");
    query = query.or(conditions);
  }

  const { data: rows } = await query;

  const statsMap = new Map<string, Stats>();
  for (const row of rows ?? []) {
    const nome = row.olimpiada_nome ?? "—";
    if (!statsMap.has(nome)) {
      statsMap.set(nome, {
        nome,
        inscritos: 0,
        participantes: 0,
        ouro: 0,
        prata: 0,
        bronze: 0,
        mencao: 0,
      });
    }
    const s = statsMap.get(nome)!;
    s.inscritos++;
    if (row.status === "confirmada") s.participantes++;
    if (row.classificacao === "ouro") s.ouro++;
    if (row.classificacao === "prata") s.prata++;
    if (row.classificacao === "bronze") s.bronze++;
    if (row.classificacao === "mencao_honrosa") s.mencao++;
  }

  const statsRows = Array.from(statsMap.values()).sort((a, b) =>
    a.nome.localeCompare(b.nome, "pt-BR"),
  );

  const totals = statsRows.reduce(
    (acc, r) => ({
      inscritos: acc.inscritos + r.inscritos,
      participantes: acc.participantes + r.participantes,
      ouro: acc.ouro + r.ouro,
      prata: acc.prata + r.prata,
      bronze: acc.bronze + r.bronze,
      mencao: acc.mencao + r.mencao,
    }),
    { inscritos: 0, participantes: 0, ouro: 0, prata: 0, bronze: 0, mencao: 0 },
  );

  return (
    <div className="space-y-6">
      {/* Cabeçalho */}
      <div>
        <h1 className="text-2xl font-bold text-foreground">Olimpíadas</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Participação por marca, olimpíada e ano
        </p>
      </div>

      {/* Filtros */}
      <div className="flex flex-wrap items-end gap-4">
        <div className="flex flex-col gap-1.5">
          <p
            className="text-xs font-semibold uppercase tracking-wider"
            style={{ color: "rgb(91,184,193)" }}
          >
            Marca
          </p>
          <MarcaMultiSelect
            marcas={marcas ?? []}
            selected={selectedMarcas}
            todosMode={marcaTodosMode}
          />
        </div>

        <div className="flex flex-col gap-1.5">
          <p
            className="text-xs font-semibold uppercase tracking-wider"
            style={{ color: "rgb(91,184,193)" }}
          >
            Olimpíada
          </p>
          <OlimpiadaMultiSelect selected={selectedOlimpiadas} todosMode={olimpiadaTodosMode} />
        </div>

        <div className="flex flex-col gap-1.5">
          <p
            className="text-xs font-semibold uppercase tracking-wider"
            style={{ color: "rgb(91,184,193)" }}
          >
            Ano
          </p>
          <YearMultiSelect
            anos={anosDisponiveis}
            selected={selectedYears}
            todosMode={todosModeAnos}
          />
        </div>
      </div>

      {/* Tabela */}
      {statsRows.length === 0 ? (
        <p className="text-sm text-muted-foreground">Nenhuma inscrição encontrada.</p>
      ) : (
        <div className="overflow-x-auto rounded-xl border border-border bg-card">
          <table className="w-full min-w-[760px] text-sm">
            <thead>
              <tr className="border-b border-border bg-background">
                <th
                  className="px-4 py-3 text-left font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Olimpíada
                </th>
                <th
                  className="px-4 py-3 text-right font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Inscritos
                </th>
                <th
                  className="px-4 py-3 text-right font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Participantes
                </th>
                <th
                  className="px-4 py-3 text-right font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Engajamento
                </th>
                <th className="px-4 py-3 text-right font-medium text-yellow-400">Ouro</th>
                <th className="px-4 py-3 text-right font-medium text-slate-300">Prata</th>
                <th className="px-4 py-3 text-right font-medium text-amber-600">Bronze</th>
                <th
                  className="px-4 py-3 text-right font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Menção
                </th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border">
              {statsRows.map((r) => (
                <tr key={r.nome} className="hover:bg-background/50">
                  <td className="px-4 py-3 font-medium text-foreground">{r.nome}</td>
                  <td className="px-4 py-3 text-right text-muted-foreground">
                    {r.inscritos.toLocaleString("pt-BR")}
                  </td>
                  <td className="px-4 py-3 text-right text-muted-foreground">
                    {fmt(r.participantes)}
                  </td>
                  <td className="px-4 py-3 text-right text-muted-foreground">
                    {engajamento(r.participantes, r.inscritos)}
                  </td>
                  <td className="px-4 py-3 text-right text-yellow-400">{fmt(r.ouro)}</td>
                  <td className="px-4 py-3 text-right text-slate-300">{fmt(r.prata)}</td>
                  <td className="px-4 py-3 text-right text-amber-600">{fmt(r.bronze)}</td>
                  <td className="px-4 py-3 text-right text-muted-foreground">{fmt(r.mencao)}</td>
                </tr>
              ))}
            </tbody>
            <tfoot>
              <tr className="border-t-2 border-border bg-background font-semibold">
                <td className="px-4 py-3 text-foreground">Total</td>
                <td className="px-4 py-3 text-right text-foreground">
                  {totals.inscritos.toLocaleString("pt-BR")}
                </td>
                <td className="px-4 py-3 text-right text-foreground">
                  {fmt(totals.participantes)}
                </td>
                <td className="px-4 py-3 text-right text-foreground">
                  {engajamento(totals.participantes, totals.inscritos)}
                </td>
                <td className="px-4 py-3 text-right text-yellow-400">{fmt(totals.ouro)}</td>
                <td className="px-4 py-3 text-right text-slate-300">{fmt(totals.prata)}</td>
                <td className="px-4 py-3 text-right text-amber-600">{fmt(totals.bronze)}</td>
                <td className="px-4 py-3 text-right text-foreground">{fmt(totals.mencao)}</td>
              </tr>
            </tfoot>
          </table>
        </div>
      )}
    </div>
  );
}
