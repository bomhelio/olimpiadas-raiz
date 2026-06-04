/* eslint-disable @typescript-eslint/no-explicit-any */
import { notFound, redirect } from "next/navigation";
import Link from "next/link";
import { getStudentSession } from "@/lib/auth/student-session";
import { getRelatorioSimulado, getSessaoConcluida } from "../../actions";

const TEAL = "rgb(91,184,193)";

function pctColor(pct: number) {
  if (pct >= 70) return "#4ade80";
  if (pct >= 50) return "#fbbf24";
  return "#f87171";
}

function fmtTempo(seg: number) {
  const h = Math.floor(seg / 3600);
  const m = Math.floor((seg % 3600) / 60);
  const s = seg % 60;
  if (h > 0) return `${h}h ${m}min`;
  if (m > 0) return `${m}min ${s}s`;
  return `${s}s`;
}

function PctBar({ pct }: { pct: number }) {
  return (
    <div className="h-2 rounded-full bg-card overflow-hidden">
      <div
        className="h-full rounded-full transition-all"
        style={{ width: `${pct}%`, background: pctColor(pct) }}
      />
    </div>
  );
}

export default async function RelatorioSimuladoPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const session = await getStudentSession();
  if (!session) redirect("/aluno/login");

  // Busca a sessão concluída mais recente para este simulado
  const dados = await getSessaoConcluida(id);
  if (!dados) {
    // Sem sessão concluída — redireciona para o simulado (início ou retomada)
    redirect(`/aluno/simulados/${id}`);
  }

  const relatorio = await getRelatorioSimulado(dados.sessao.id);
  if (!relatorio) notFound();

  const { total, acertos, porTopico, sessao } = relatorio;
  const erros = total - acertos;
  const pctGeral = total > 0 ? Math.round((acertos / total) * 100) : 0;

  // Tempo usado
  const iniciado = new Date(sessao.iniciado_em);
  const concluido = new Date(sessao.concluido_em!);
  const tempoUsadoSeg = Math.floor((concluido.getTime() - iniciado.getTime()) / 1000);

  return (
    <div className="max-w-3xl mx-auto px-4 py-8 space-y-8">
      {/* Cabeçalho */}
      <div className="flex items-start justify-between gap-4">
        <div>
          <Link
            href="/aluno/simulados"
            className="inline-flex items-center gap-1.5 text-sm text-muted-foreground hover:text-foreground transition-colors mb-3"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20"
              fill="currentColor"
              className="h-4 w-4"
            >
              <path
                fillRule="evenodd"
                d="M17 10a.75.75 0 01-.75.75H5.612l4.158 3.96a.75.75 0 11-1.04 1.08l-5.5-5.25a.75.75 0 010-1.08l5.5-5.25a.75.75 0 111.04 1.08L5.612 9.25H16.25A.75.75 0 0117 10z"
                clipRule="evenodd"
              />
            </svg>
            Simulados
          </Link>
          <h1 className="text-2xl font-bold text-foreground">Relatório do Simulado</h1>
          <p className="mt-1 text-sm text-muted-foreground">{dados.aula.titulo}</p>
        </div>
        <div className="shrink-0 text-right">
          <p className="text-3xl font-black" style={{ color: pctColor(pctGeral) }}>
            {pctGeral}%
          </p>
          <p className="text-xs text-muted-foreground mt-0.5">de acerto</p>
        </div>
      </div>

      {/* Resumo */}
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
        {[
          { label: "Questões", value: total, color: "text-foreground" },
          { label: "Acertos", value: acertos, color: "text-emerald-400" },
          { label: "Erros", value: erros, color: "text-red-400" },
          { label: "Tempo", value: fmtTempo(tempoUsadoSeg), color: "text-foreground" },
        ].map((c) => (
          <div key={c.label} className="rounded-xl border border-border bg-card p-4 text-center">
            <p className={`text-2xl font-black ${c.color}`}>{c.value}</p>
            <p className="text-xs text-muted-foreground mt-1">{c.label}</p>
          </div>
        ))}
      </div>

      {/* Por tópico */}
      {(porTopico as any[]).length > 0 && (
        <div className="rounded-xl border border-border bg-card overflow-hidden">
          <div className="px-5 py-4 border-b border-border flex items-center justify-between">
            <h2 className="text-sm font-semibold text-foreground">Desempenho por tópico</h2>
            <p className="text-[10px] text-muted-foreground uppercase tracking-wider">
              mais fraco → mais forte
            </p>
          </div>
          <div className="divide-y divide-border/40">
            {(porTopico as any[]).map((t: any) => {
              const pA = t.total > 0 ? Math.round((t.acertos / t.total) * 100) : 0;
              return (
                <div key={t.topico} className="px-5 py-4">
                  {/* Tópico */}
                  <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-1 mb-2">
                    <span className="text-sm font-semibold text-foreground">{t.topico}</span>
                    <div className="flex items-center gap-3 text-xs">
                      <span className="text-muted-foreground">
                        {t.total} questão{t.total !== 1 ? "ões" : ""}
                      </span>
                      <span className="font-bold text-emerald-400">
                        {t.acertos} acerto{t.acertos !== 1 ? "s" : ""}
                      </span>
                      <span className="font-bold" style={{ color: pctColor(pA) }}>
                        {pA}%
                      </span>
                    </div>
                  </div>
                  <PctBar pct={pA} />

                  {/* Subtópicos */}
                  {Object.keys(t.subtopicos ?? {}).length > 0 && (
                    <div className="mt-3 space-y-1.5 pl-3 border-l border-border/40">
                      {Object.entries(
                        t.subtopicos as Record<string, { total: number; acertos: number }>,
                      ).map(([sub, v]) => {
                        const pS = v.total > 0 ? Math.round((v.acertos / v.total) * 100) : 0;
                        return (
                          <div key={sub} className="flex items-center justify-between text-xs">
                            <span className="text-muted-foreground truncate flex-1 mr-3">
                              {sub}
                            </span>
                            <div className="flex items-center gap-2 shrink-0">
                              <span className="text-muted-foreground/60">{v.total}q</span>
                              <span className="font-semibold" style={{ color: pctColor(pS) }}>
                                {pS}%
                              </span>
                              <div className="w-16 h-1.5 rounded-full bg-card overflow-hidden">
                                <div
                                  className="h-full rounded-full"
                                  style={{ width: `${pS}%`, background: pctColor(pS) }}
                                />
                              </div>
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Ações */}
      <div className="flex justify-center gap-3">
        <Link
          href="/aluno/simulados"
          className="rounded-lg border border-border px-5 py-2.5 text-sm text-muted-foreground hover:text-foreground transition-colors"
        >
          Ver todos os simulados
        </Link>
        <Link
          href="/aluno/treino/dashboard"
          className="rounded-lg px-5 py-2.5 text-sm font-semibold text-[#0f172a]"
          style={{ background: TEAL }}
        >
          Meu desempenho completo
        </Link>
      </div>
    </div>
  );
}
