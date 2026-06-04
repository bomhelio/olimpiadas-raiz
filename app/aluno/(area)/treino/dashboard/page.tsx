/* eslint-disable @typescript-eslint/no-explicit-any */
import { redirect } from "next/navigation";
import Link from "next/link";
import { getStudentSession } from "@/lib/auth/student-session";
import { getDashboardAluno, getUltimasErradas } from "../actions";

const TEAL = "rgb(91,184,193)";

function pctColor(pct: number) {
  if (pct >= 70) return "#4ade80";
  if (pct >= 50) return "#fbbf24";
  return "#f87171";
}

function PctBar({ pct }: { pct: number }) {
  return (
    <div className="h-2 rounded-full bg-card overflow-hidden">
      <div className="h-full rounded-full transition-all" style={{ width: `${pct}%`, background: pctColor(pct) }} />
    </div>
  );
}

function ResumoCards({ total, acertos }: { total: number; acertos: number }) {
  const erros = total - acertos;
  const pct = total > 0 ? Math.round((acertos / total) * 100) : 0;
  return (
    <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
      <div className="rounded-xl border border-border bg-card p-4 text-center">
        <div className="text-3xl font-black text-foreground">{total}</div>
        <div className="text-xs text-muted-foreground mt-1">Respondidas</div>
      </div>
      <div className="rounded-xl border border-border bg-card p-4 text-center">
        <div className="text-3xl font-black text-emerald-400">{acertos}</div>
        <div className="text-xs text-muted-foreground mt-1">Acertos</div>
      </div>
      <div className="rounded-xl border border-border bg-card p-4 text-center">
        <div className="text-3xl font-black text-red-400">{erros}</div>
        <div className="text-xs text-muted-foreground mt-1">Erros</div>
      </div>
      <div className="rounded-xl border border-border bg-card p-4 text-center">
        <div className="text-3xl font-black" style={{ color: pctColor(pct) }}>{pct}%</div>
        <div className="text-xs text-muted-foreground mt-1">Acerto</div>
      </div>
    </div>
  );
}

export default async function TreinoDashboardPage() {
  const session = await getStudentSession();
  if (!session) redirect("/aluno/login");

  const [dashboard, erradas] = await Promise.all([getDashboardAluno(), getUltimasErradas(8)]);
  const { total_geral, acertos_geral, banco, aulas, simulados } = dashboard as any;

  const pctGeral = total_geral > 0 ? Math.round((acertos_geral / total_geral) * 100) : null;

  return (
    <div className="max-w-3xl space-y-8">
      {/* Cabeçalho */}
      <div className="flex items-center justify-between">
        <h1 className="text-xl font-bold text-foreground">Meu Desempenho</h1>
        <Link href="/aluno/treino" className="rounded-lg px-4 py-2 text-sm font-semibold text-[#0f172a]" style={{ background: TEAL }}>
          Continuar treinando
        </Link>
      </div>

      {total_geral === 0 ? (
        <div className="rounded-xl border border-border bg-card p-12 text-center">
          <p className="text-muted-foreground mb-4">Você ainda não respondeu nenhuma questão.</p>
          <Link href="/aluno/treino" className="text-sm font-semibold" style={{ color: TEAL }}>Começar agora →</Link>
        </div>
      ) : (
        <>
          {/* Resumo geral */}
          <section>
            <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
              Geral — {total_geral} questões · {pctGeral}% de acerto
            </h2>
            <ResumoCards total={total_geral} acertos={acertos_geral} />
          </section>

          {/* ── 1. Banco de Questões ──────────────────────────────────────── */}
          {banco?.total > 0 && (
            <section>
              <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground flex items-center gap-2">
                <span className="rounded-full bg-sky-500/10 px-2 py-0.5 text-sky-400">Banco de Questões</span>
                <span className="text-muted-foreground/60 text-xs font-normal">treino livre</span>
              </h2>
              <ResumoCards total={banco.total} acertos={banco.acertos} />

              {banco.por_topico?.length > 0 && (
                <div className="mt-3 rounded-xl border border-border bg-card overflow-hidden">
                  <div className="px-5 py-3 border-b border-border flex items-center justify-between">
                    <p className="text-xs font-semibold text-foreground">Por tópico</p>
                    <p className="text-[10px] text-muted-foreground">mais fraco → mais forte</p>
                  </div>
                  <div className="divide-y divide-border/40">
                    {banco.por_topico.map((row: any) => {
                      const pA = row.total > 0 ? Math.round((row.acertos / row.total) * 100) : 0;
                      return (
                        <div key={row.topico} className="px-5 py-3">
                          <div className="mb-1.5 flex flex-col gap-0.5 sm:flex-row sm:items-center sm:justify-between">
                            <span className="text-sm font-medium text-foreground">{row.topico}</span>
                            <div className="flex items-center gap-3 text-xs">
                              <span className="text-muted-foreground">{row.total} questões</span>
                              <span className="font-bold text-emerald-400">{pA}% acerto</span>
                            </div>
                          </div>
                          <PctBar pct={pA} />
                        </div>
                      );
                    })}
                  </div>
                </div>
              )}
            </section>
          )}

          {/* ── 2. Listas de Questões (Aulas) ────────────────────────────── */}
          {aulas?.total > 0 && (
            <section>
              <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground flex items-center gap-2">
                <span className="rounded-full bg-amber-500/10 px-2 py-0.5 text-amber-400">Listas de Questões</span>
                <span className="text-muted-foreground/60 text-xs font-normal">questões das aulas</span>
              </h2>
              <ResumoCards total={aulas.total} acertos={aulas.acertos} />

              {aulas.por_aula?.length > 0 && (
                <div className="mt-3 overflow-x-auto rounded-xl border border-border bg-card">
                  <table className="w-full min-w-[340px] text-sm">
                    <thead>
                      <tr className="border-b border-border text-xs text-muted-foreground">
                        <th className="px-5 py-3 text-left font-semibold">Aula</th>
                        <th className="px-5 py-3 text-right font-semibold">Questões</th>
                        <th className="px-5 py-3 text-right font-semibold text-emerald-400">Acerto</th>
                        <th className="px-5 py-3 w-20"></th>
                      </tr>
                    </thead>
                    <tbody>
                      {aulas.por_aula.map((row: any) => {
                        const pA = row.total > 0 ? Math.round((row.acertos / row.total) * 100) : 0;
                        return (
                          <tr key={row.aula_id} className="border-b border-border/40">
                            <td className="px-5 py-3 font-medium text-foreground">{row.titulo}</td>
                            <td className="px-5 py-3 text-right text-muted-foreground">{row.total}</td>
                            <td className="px-5 py-3 text-right font-bold" style={{ color: pctColor(pA) }}>{pA}%</td>
                            <td className="px-5 py-3"><PctBar pct={pA} /></td>
                          </tr>
                        );
                      })}
                    </tbody>
                  </table>
                </div>
              )}
            </section>
          )}

          {/* ── 3. Simulados ─────────────────────────────────────────────── */}
          {simulados?.total > 0 && (
            <section>
              <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground flex items-center gap-2">
                <span className="rounded-full bg-indigo-400/10 px-2 py-0.5 text-indigo-400">Simulados</span>
              </h2>
              <ResumoCards total={simulados.total} acertos={simulados.acertos} />

              {simulados.por_simulado?.length > 0 && (
                <div className="mt-3 overflow-x-auto rounded-xl border border-border bg-card">
                  <table className="w-full min-w-[340px] text-sm">
                    <thead>
                      <tr className="border-b border-border text-xs text-muted-foreground">
                        <th className="px-5 py-3 text-left font-semibold">Simulado</th>
                        <th className="px-5 py-3 text-right font-semibold">Questões</th>
                        <th className="px-5 py-3 text-right font-semibold text-emerald-400">Acerto</th>
                        <th className="px-5 py-3 w-20"></th>
                      </tr>
                    </thead>
                    <tbody>
                      {simulados.por_simulado.map((row: any) => {
                        const pA = row.total > 0 ? Math.round((row.acertos / row.total) * 100) : 0;
                        return (
                          <tr key={row.aula_id} className="border-b border-border/40">
                            <td className="px-5 py-3 font-medium text-foreground">{row.titulo}</td>
                            <td className="px-5 py-3 text-right text-muted-foreground">{row.total}</td>
                            <td className="px-5 py-3 text-right font-bold" style={{ color: pctColor(pA) }}>{pA}%</td>
                            <td className="px-5 py-3"><PctBar pct={pA} /></td>
                          </tr>
                        );
                      })}
                    </tbody>
                  </table>
                </div>
              )}
            </section>
          )}

          {/* Questões para revisar */}
          {erradas.length > 0 && (
            <section>
              <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
                Questões para revisar
              </h2>
              <div className="overflow-x-auto rounded-xl border border-border bg-card">
                <table className="w-full min-w-[340px] text-sm">
                  <thead>
                    <tr className="border-b border-border text-xs text-muted-foreground">
                      <th className="px-5 py-3 text-left font-semibold">Origem</th>
                      <th className="px-5 py-3 text-left font-semibold hidden sm:table-cell">Fase · Ano</th>
                      <th className="px-5 py-3 text-left font-semibold hidden sm:table-cell">Tópico</th>
                      <th className="px-5 py-3"></th>
                    </tr>
                  </thead>
                  <tbody>
                    {(erradas as any[]).map((r: any) => (
                      <tr key={r.questao_id} className="border-b border-border/40">
                        <td className="px-5 py-3">{r.questao?.olimpiada ?? "—"}</td>
                        <td className="px-5 py-3 text-muted-foreground hidden sm:table-cell">
                          {r.questao?.fase}ª Fase · {r.questao?.ano}
                        </td>
                        <td className="px-5 py-3 text-muted-foreground hidden sm:table-cell">
                          {r.questao?.topico ?? r.questao?.assunto ?? "—"}
                        </td>
                        <td className="px-5 py-3 text-right">
                          <Link href={`/aluno/treino/${r.questao_id}`} className="text-xs font-semibold" style={{ color: TEAL }}>
                            Revisar →
                          </Link>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </section>
          )}
        </>
      )}
    </div>
  );
}
