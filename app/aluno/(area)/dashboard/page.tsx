import { redirect } from "next/navigation";
import Link from "next/link";
import { getStudentSession } from "@/lib/auth/student-session";
import { createAdminClient } from "@/lib/supabase/admin";
import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import type { Database, PreparacaoProjeto, PreparacaoAula } from "@/lib/types/database";

export const metadata = { title: "Início — Plataforma Olímpica" };

const TEAL = "rgb(91,184,193)";

function isLiveNow(dataHora: string | null) {
  if (!dataHora) return false;
  const d = new Date(dataHora);
  const now = new Date();
  const diffMs = d.getTime() - now.getTime();
  return diffMs >= -3 * 60 * 60 * 1000 && diffMs <= 30 * 60 * 1000;
}

function isUpcoming(dataHora: string | null) {
  if (!dataHora) return false;
  const d = new Date(dataHora);
  const now = new Date();
  const diffMs = d.getTime() - now.getTime();
  return diffMs > 30 * 60 * 1000 && diffMs <= 7 * 24 * 60 * 60 * 1000;
}

function fmtDateTime(iso: string) {
  return new Date(iso).toLocaleString("pt-BR", {
    day: "2-digit",
    month: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    timeZone: "America/Sao_Paulo",
  });
}

type ProjetoComAulas = PreparacaoProjeto & { aulas: PreparacaoAula[] };

export default async function AlunoDashboard() {
  const session = await getStudentSession();
  if (!session) redirect("/aluno/login");

  const admin = createAdminClient();
  const cookieStore = await cookies();
  const supabase = createServerClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll();
        },
        setAll(cs) {
          cs.forEach(({ name, value, options }) => cookieStore.set(name, value, options));
        },
      },
    },
  );

  const firstName = session.aluno.nome.split(" ")[0]!;

  const [respostasResult, inscricoesResult, proximoSimuladoResult] = await Promise.all([
    admin.from("resposta_aluno").select("correta").eq("aluno_id", session.aluno.id),
    supabase
      .from("inscricao")
      .select("olimpiada_id")
      .eq("aluno_id", session.aluno.id)
      .eq("status", "confirmada"),
    admin
      .from("preparacao_aula")
      .select("id, titulo, data_hora")
      .eq("tipo", "simulado")
      .eq("publicada", true)
      .gte("data_hora", new Date().toISOString())
      .order("data_hora")
      .limit(1),
  ]);

  const respostas = respostasResult.data ?? [];
  const total = respostas.length;
  const acertos = respostas.filter((r) => r.correta).length;
  const erros = total - acertos;
  const pct = total > 0 ? Math.round((acertos / total) * 100) : null;

  const olimpiadaIds = (inscricoesResult.data ?? []).map((i) => i.olimpiada_id);
  let query = supabase
    .from("preparacao_projeto")
    .select("*, aulas:preparacao_aula(*)")
    .eq("publicado", true)
    .eq("ativo", true);

  if (olimpiadaIds.length > 0) {
    query = query.or(`olimpiada_id.is.null,olimpiada_id.in.(${olimpiadaIds.join(",")})`);
  } else {
    query = query.is("olimpiada_id", null);
  }

  const { data: projetos } = await query.order("criado_em", { ascending: false });
  const lista = (projetos ?? []) as unknown as ProjetoComAulas[];

  const aulasOnline = lista.flatMap((p) =>
    p.aulas.filter((a) => a.tipo === "online" && a.publicada && a.data_hora),
  );
  const proximasAoVivo = aulasOnline
    .filter((a) => isLiveNow(a.data_hora) || isUpcoming(a.data_hora))
    .sort((a, b) => new Date(a.data_hora!).getTime() - new Date(b.data_hora!).getTime())
    .slice(0, 2);

  const proximoSimulado = proximoSimuladoResult.data?.[0] ?? null;

  const kpis = [
    { label: "Respondidas", value: total.toLocaleString("pt-BR"), cls: "text-foreground" },
    { label: "Acertos", value: acertos.toLocaleString("pt-BR"), cls: "text-emerald-400" },
    { label: "Erros", value: erros.toLocaleString("pt-BR"), cls: "text-red-400" },
    {
      label: "% Acerto",
      value: pct !== null ? `${pct}%` : "—",
      cls:
        pct === null
          ? "text-muted-foreground"
          : pct >= 70
            ? "text-emerald-400"
            : pct >= 50
              ? "text-amber-400"
              : "text-red-400",
    },
  ];

  return (
    <div className="space-y-8">
      {/* Saudação + ação rápida */}
      <div className="flex items-start justify-between gap-4 flex-wrap">
        <div>
          <h1 className="text-2xl font-bold text-foreground">Olá, {firstName}!</h1>
          <p className="mt-1 text-sm text-muted-foreground">
            Sua plataforma de preparação olímpica.
          </p>
        </div>
        <Link
          href="/aluno/treino"
          className="shrink-0 rounded-lg px-5 py-2.5 text-sm font-bold text-[#0f172a]"
          style={{ background: TEAL }}
        >
          Continuar treinando →
        </Link>
      </div>

      {/* Snapshot de desempenho */}
      {total > 0 && (
        <section>
          <h2 className="mb-3 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
            Seu desempenho
          </h2>
          <div className="grid grid-cols-2 gap-3 sm:grid-cols-4">
            {kpis.map((k) => (
              <div
                key={k.label}
                className="rounded-xl border border-border bg-card p-4 text-center"
              >
                <p className={`text-2xl font-black ${k.cls}`}>{k.value}</p>
                <p className="text-xs text-muted-foreground mt-1">{k.label}</p>
              </div>
            ))}
          </div>
          <div className="mt-2 text-right">
            <Link
              href="/aluno/treino/dashboard"
              className="text-xs font-semibold transition-colors hover:opacity-80"
              style={{ color: TEAL }}
            >
              Ver desempenho completo →
            </Link>
          </div>
        </section>
      )}

      {/* Aulas ao vivo / próximas na semana */}
      {proximasAoVivo.length > 0 && (
        <section>
          <h2 className="mb-3 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
            Aulas ao vivo
          </h2>
          <div className="space-y-2">
            {proximasAoVivo.map((aula) => (
              <Link
                key={aula.id}
                href={`/aluno/aula/${aula.id}`}
                className="flex items-center gap-3 rounded-xl border border-border bg-card p-4 hover:border-ring transition-colors"
              >
                <span className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-red-500/10">
                  <svg
                    className="h-4 w-4 text-red-500"
                    viewBox="0 0 24 24"
                    fill="currentColor"
                    aria-hidden="true"
                  >
                    <circle cx="12" cy="12" r="10" opacity="0.2" />
                    <circle cx="12" cy="12" r="4" />
                  </svg>
                </span>
                <div className="flex-1 min-w-0">
                  <p className="truncate text-sm font-medium text-foreground">{aula.titulo}</p>
                  <p className="text-xs text-muted-foreground">
                    {isLiveNow(aula.data_hora) ? (
                      <span className="font-semibold text-red-500">AO VIVO AGORA</span>
                    ) : (
                      <>{fmtDateTime(aula.data_hora!)}</>
                    )}
                  </p>
                </div>
                <svg
                  className="h-4 w-4 shrink-0 text-muted-foreground"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  aria-hidden="true"
                >
                  <path d="M9 18l6-6-6-6" />
                </svg>
              </Link>
            ))}
          </div>
        </section>
      )}

      {/* Próximo simulado */}
      {proximoSimulado && (
        <section>
          <h2 className="mb-3 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
            Próximo simulado
          </h2>
          <Link
            href="/aluno/simulados"
            className="flex items-center gap-4 rounded-xl border border-border bg-card p-4 hover:border-ring transition-colors"
          >
            <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-violet-500/10">
              <svg
                className="h-5 w-5 text-violet-400"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="1.75"
                aria-hidden="true"
              >
                <path d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
            </div>
            <div className="flex-1 min-w-0">
              <p className="truncate text-sm font-medium text-foreground">
                {proximoSimulado.titulo}
              </p>
              <p className="text-xs text-muted-foreground">
                {fmtDateTime(proximoSimulado.data_hora!)}
              </p>
            </div>
            <svg
              className="h-4 w-4 shrink-0 text-muted-foreground"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              strokeWidth="2"
              aria-hidden="true"
            >
              <path d="M9 18l6-6-6-6" />
            </svg>
          </Link>
        </section>
      )}

      {/* Projetos de preparação */}
      <section>
        <div className="mb-3 flex items-center justify-between">
          <h2 className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">
            Projetos de preparação
          </h2>
          {lista.length > 0 && (
            <span className="text-xs text-muted-foreground">
              {lista.length} disponível{lista.length !== 1 ? "is" : ""}
            </span>
          )}
        </div>

        {lista.length === 0 ? (
          <div className="rounded-xl border border-dashed border-border p-10 text-center">
            <p className="text-sm text-muted-foreground">
              Nenhum projeto publicado ainda. Volte em breve!
            </p>
          </div>
        ) : (
          <div className="grid gap-3 sm:grid-cols-2">
            {lista.map((projeto) => {
              const totalAulas = projeto.aulas.filter(
                (a) => a.tipo !== "simulado" && a.publicada,
              ).length;
              const aulaViva = projeto.aulas.find(
                (a) => a.tipo === "online" && isLiveNow(a.data_hora),
              );
              return (
                <Link
                  key={projeto.id}
                  href={`/aluno/projeto/${projeto.id}`}
                  className="group rounded-lg border border-border bg-card p-3 hover:border-ring transition-colors"
                >
                  <div className="mb-1.5 flex items-start justify-between gap-2">
                    <div
                      className="inline-flex items-center rounded-full px-2 py-0.5 text-[10px] font-semibold text-white"
                      style={{ background: TEAL }}
                    >
                      {projeto.olimpiada_sigla}
                    </div>
                    {aulaViva && (
                      <span className="inline-flex items-center gap-1 rounded-full bg-red-500/10 px-2 py-0.5 text-[10px] font-semibold text-red-500">
                        <span className="h-1.5 w-1.5 rounded-full bg-red-500" />
                        AO VIVO
                      </span>
                    )}
                  </div>
                  <h3 className="mb-0.5 text-sm font-semibold text-foreground group-hover:text-primary transition-colors">
                    {projeto.nome}
                  </h3>
                  {projeto.descricao && (
                    <p className="mb-2 line-clamp-1 text-xs text-muted-foreground">
                      {projeto.descricao}
                    </p>
                  )}
                  <div className="flex items-center gap-2 text-xs text-muted-foreground">
                    <span>{projeto.ano_letivo}</span>
                    <span>·</span>
                    <span>
                      {totalAulas} {totalAulas === 1 ? "aula" : "aulas"}
                    </span>
                  </div>
                </Link>
              );
            })}
          </div>
        )}
      </section>
    </div>
  );
}
