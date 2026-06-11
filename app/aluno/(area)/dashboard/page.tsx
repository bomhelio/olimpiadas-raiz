import { redirect } from "next/navigation";
import Link from "next/link";
import { getStudentSession } from "@/lib/auth/student-session";
import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import type { Database, PreparacaoProjeto, PreparacaoAula } from "@/lib/types/database";

export const metadata = { title: "Meus Projetos — Plataforma Olímpica" };

type ProjetoComAulas = PreparacaoProjeto & {
  aulas: PreparacaoAula[];
};

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
  return diffMs > 30 * 60 * 1000 && diffMs <= 24 * 60 * 60 * 1000;
}

function fmtDateTime(iso: string) {
  return new Date(iso).toLocaleString("pt-BR", {
    day: "2-digit",
    month: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
  });
}

export default async function AlunoDashboard() {
  const session = await getStudentSession();
  if (!session) redirect("/aluno/login");

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
          cookiesToSet.forEach(({ name, value, options }) => cookieStore.set(name, value, options));
        },
      },
    },
  );

  // IDs das olimpíadas em que o aluno está inscrito (status confirmada)
  const { data: inscricoes } = await supabase
    .from("inscricao")
    .select("olimpiada_id")
    .eq("aluno_id", session.aluno.id)
    .eq("status", "confirmada");

  const olimpiadaIds = (inscricoes ?? []).map((i) => i.olimpiada_id);

  // Projetos publicados: universais (sem olimpiada_id) OU da olimpíada do aluno
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

  const aulasBrute = lista.flatMap((p) =>
    p.aulas.filter((a) => a.tipo === "online" && a.publicada && a.data_hora),
  );
  const proximasAoVivo = aulasBrute
    .filter((a) => isLiveNow(a.data_hora) || isUpcoming(a.data_hora))
    .sort((a, b) => new Date(a.data_hora!).getTime() - new Date(b.data_hora!).getTime())
    .slice(0, 3);

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-bold text-foreground">
          Olá, {session.aluno.nome.split(" ")[0]}!
        </h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Bem-vindo à sua plataforma de preparação olímpica.
        </p>
      </div>

      {proximasAoVivo.length > 0 && (
        <section>
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
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
                      <>Hoje às {fmtDateTime(aula.data_hora!)}</>
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

      <section>
        <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-muted-foreground">
          Projetos de preparação
        </h2>

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
