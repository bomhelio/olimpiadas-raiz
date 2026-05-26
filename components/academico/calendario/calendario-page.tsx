"use client";

import { useState } from "react";
import { useRouter, usePathname, useSearchParams } from "next/navigation";

// ─── Tipos públicos (usados pela page.tsx) ────────────────────────────────────

export type FaseRow = {
  id: string;
  tipo: "inscricao" | "prova_1" | "prova_2" | "final" | "divulgacao";
  nome: string;
  data_inicio: string; // "YYYY-MM-DD"
  data_fim: string; // "YYYY-MM-DD"
  observacoes: string | null;
  olimpiada_nome: string;
  olimpiada_ano: number;
};

export type AulaRow = {
  id: string;
  titulo: string;
  tipo: "online" | "presencial" | "simulado";
  data_hora: string; // ISO datetime
  duracao_minutos: number | null;
  link_aula: string | null;
  polos: string | null;
  projeto_nome: string;
  olimpiada_sigla: string;
  projeto_ano: number;
};

// ─── Helpers ──────────────────────────────────────────────────────────────────

function parseLocalDate(dateStr: string): Date {
  const [y, m, d] = dateStr.split("-").map(Number);
  return new Date(y!, m! - 1, d!);
}

function fmtDay(d: Date) {
  return d.toLocaleDateString("pt-BR", { day: "2-digit", month: "2-digit" });
}

function fmtDayNum(d: Date) {
  return d.getDate().toString().padStart(2, "0");
}

function fmtWeekday(d: Date) {
  return d.toLocaleDateString("pt-BR", { weekday: "short" }).replace(".", "");
}

function fmtTime(iso: string) {
  return new Date(iso).toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" });
}

function fmtMonthYear(d: Date) {
  return d.toLocaleDateString("pt-BR", { month: "long", year: "numeric" });
}

function monthKey(d: Date) {
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, "0")}`;
}

function diffDays(a: Date, b: Date) {
  return Math.round((b.getTime() - a.getTime()) / 86400000) + 1;
}

// ─── Configuração de tipos ────────────────────────────────────────────────────

const FASE_CONFIG: Record<
  FaseRow["tipo"],
  { label: string; bg: string; text: string; dot: string }
> = {
  inscricao: {
    label: "Inscrição",
    bg: "bg-emerald-400/10",
    text: "text-emerald-400",
    dot: "bg-emerald-400",
  },
  prova_1: { label: "1ª Fase", bg: "bg-amber-400/10", text: "text-amber-400", dot: "bg-amber-400" },
  prova_2: {
    label: "2ª Fase",
    bg: "bg-orange-400/10",
    text: "text-orange-400",
    dot: "bg-orange-400",
  },
  final: { label: "Final", bg: "bg-rose-400/10", text: "text-rose-400", dot: "bg-rose-400" },
  divulgacao: { label: "Divulgação", bg: "bg-sky-400/10", text: "text-sky-400", dot: "bg-sky-400" },
};

const AULA_CONFIG: Record<
  AulaRow["tipo"],
  { label: string; bg: string; text: string; dot: string }
> = {
  online: {
    label: "Online",
    bg: "bg-[rgb(91,184,193)]/10",
    text: "text-[rgb(91,184,193)]",
    dot: "bg-[rgb(91,184,193)]",
  },
  presencial: {
    label: "Presencial",
    bg: "bg-violet-400/10",
    text: "text-violet-400",
    dot: "bg-violet-400",
  },
  simulado: {
    label: "Simulado",
    bg: "bg-indigo-400/10",
    text: "text-indigo-400",
    dot: "bg-indigo-400",
  },
};

// ─── Badge ────────────────────────────────────────────────────────────────────

function Badge({ bg, text, label }: { bg: string; text: string; label: string }) {
  return (
    <span
      className={`inline-flex shrink-0 items-center rounded-full px-2 py-0.5 text-[11px] font-semibold ${bg} ${text}`}
    >
      {label}
    </span>
  );
}

// ─── Card de fase olímpica ────────────────────────────────────────────────────

function FaseCard({ fase }: { fase: FaseRow }) {
  const cfg = FASE_CONFIG[fase.tipo];
  const inicio = parseLocalDate(fase.data_inicio);
  const fim = parseLocalDate(fase.data_fim);
  const dias = diffDays(inicio, fim);

  return (
    <div className="flex gap-4">
      {/* Coluna de data */}
      <div className="w-12 shrink-0 text-center">
        <p className="text-lg font-bold leading-none text-foreground">{fmtDayNum(inicio)}</p>
        <p className="text-[10px] uppercase text-muted-foreground">{fmtWeekday(inicio)}</p>
      </div>
      <div className="h-full w-px shrink-0 bg-border self-stretch" />
      {/* Conteúdo */}
      <div className="min-w-0 flex-1 pb-1">
        <div className="flex flex-wrap items-center gap-2">
          <Badge bg={cfg.bg} text={cfg.text} label={cfg.label} />
          <span className="text-xs font-semibold text-muted-foreground">{fase.olimpiada_nome}</span>
        </div>
        <p className="mt-0.5 text-sm font-medium text-foreground">{fase.nome}</p>
        <p className="text-xs text-muted-foreground">
          {fmtDay(inicio)} → {fmtDay(fim)}
          {dias > 1 && <span className="ml-1 text-muted-foreground/60">({dias} dias)</span>}
        </p>
        {fase.observacoes && (
          <p className="mt-1 text-xs text-muted-foreground/70 italic">{fase.observacoes}</p>
        )}
      </div>
    </div>
  );
}

// ─── Card de aula de preparação ───────────────────────────────────────────────

function AulaCard({ aula }: { aula: AulaRow }) {
  const cfg = AULA_CONFIG[aula.tipo];
  const dt = new Date(aula.data_hora);

  return (
    <div className="flex gap-4">
      {/* Coluna de data */}
      <div className="w-12 shrink-0 text-center">
        <p className="text-lg font-bold leading-none text-foreground">{fmtDayNum(dt)}</p>
        <p className="text-[10px] uppercase text-muted-foreground">{fmtWeekday(dt)}</p>
      </div>
      <div className="h-full w-px shrink-0 bg-border self-stretch" />
      {/* Conteúdo */}
      <div className="min-w-0 flex-1 pb-1">
        <div className="flex flex-wrap items-center gap-2">
          <Badge bg={cfg.bg} text={cfg.text} label={cfg.label} />
          <span className="text-xs font-semibold text-muted-foreground">
            {aula.olimpiada_sigla}
          </span>
        </div>
        <p className="mt-0.5 text-xs text-muted-foreground/70">{aula.projeto_nome}</p>
        <p className="text-sm font-medium text-foreground">{aula.titulo}</p>
        <p className="text-xs text-muted-foreground">
          {fmtTime(aula.data_hora)}
          {aula.duracao_minutos && <> · {aula.duracao_minutos} min</>}
          {aula.tipo === "online" && aula.link_aula && (
            <>
              {" · "}
              <a
                href={aula.link_aula}
                target="_blank"
                rel="noopener noreferrer"
                className="hover:underline"
                style={{ color: "rgb(91,184,193)" }}
              >
                Acessar aula
              </a>
            </>
          )}
          {aula.tipo === "presencial" && aula.polos && (
            <>
              {" "}
              · <span className="text-violet-400">{aula.polos.split("\n")[0]}</span>
            </>
          )}
        </p>
      </div>
    </div>
  );
}

// ─── Componente principal ─────────────────────────────────────────────────────

type Evento =
  | { kind: "fase"; sortKey: string; data: FaseRow }
  | { kind: "aula"; sortKey: string; data: AulaRow };

export function CalendarioAcademicoPage({
  fases,
  aulas,
  anos,
  anoParam,
}: {
  fases: FaseRow[];
  aulas: AulaRow[];
  anos: number[];
  anoParam?: string;
}) {
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();

  const anoCorrente = new Date().getFullYear();
  const selectedAno = Number(anoParam) || anoCorrente;

  const [showFases, setShowFases] = useState(true);
  const [showAulas, setShowAulas] = useState(true);
  const [showSimulados, setShowSimulados] = useState(true);

  function setAno(ano: number) {
    const params = new URLSearchParams(searchParams.toString());
    params.set("ano", String(ano));
    router.push(`${pathname}?${params.toString()}`);
  }

  // Filtra e normaliza eventos para o ano selecionado
  const eventos: Evento[] = [];

  if (showFases) {
    for (const f of fases) {
      if (f.olimpiada_ano !== selectedAno) continue;
      eventos.push({ kind: "fase", sortKey: f.data_inicio, data: f });
    }
  }

  for (const a of aulas) {
    if (a.projeto_ano !== selectedAno) continue;
    if (a.tipo === "simulado") {
      if (showSimulados) eventos.push({ kind: "aula", sortKey: a.data_hora, data: a });
    } else {
      if (showAulas) eventos.push({ kind: "aula", sortKey: a.data_hora, data: a });
    }
  }

  eventos.sort((a, b) => a.sortKey.localeCompare(b.sortKey));

  // Agrupa por mês
  const porMes = new Map<string, { label: string; eventos: Evento[] }>();
  for (const ev of eventos) {
    const d =
      ev.kind === "fase"
        ? parseLocalDate((ev.data as FaseRow).data_inicio)
        : new Date((ev.data as AulaRow).data_hora);
    const key = monthKey(d);
    if (!porMes.has(key)) {
      porMes.set(key, { label: fmtMonthYear(d), eventos: [] });
    }
    porMes.get(key)!.eventos.push(ev);
  }

  const meses = [...porMes.entries()].sort(([a], [b]) => a.localeCompare(b));

  return (
    <>
      {/* Controles — ocultos na impressão */}
      <div className="no-print flex flex-wrap items-center justify-between gap-3">
        {/* Seletor de ano */}
        <div className="flex flex-wrap gap-1.5">
          {anos.map((ano) => (
            <button
              key={ano}
              type="button"
              onClick={() => setAno(ano)}
              className={`rounded-full px-3 py-1 text-xs font-medium transition-all ${
                ano === selectedAno
                  ? "bg-[rgb(91,184,193)] text-white"
                  : "border border-border text-muted-foreground hover:text-foreground hover:border-ring"
              }`}
            >
              {ano}
            </button>
          ))}
        </div>

        {/* Filtros de tipo + botão imprimir */}
        <div className="flex items-center gap-2">
          <button
            type="button"
            onClick={() => setShowFases((v) => !v)}
            className={`flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium transition-all border ${
              showFases
                ? "bg-emerald-400/10 text-emerald-400 border-emerald-400/30"
                : "border-border text-muted-foreground/40"
            }`}
          >
            <span className="h-1.5 w-1.5 rounded-full bg-emerald-400" />
            Fases
          </button>
          <button
            type="button"
            onClick={() => setShowAulas((v) => !v)}
            className={`flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium transition-all border ${
              showAulas
                ? "bg-[rgb(91,184,193)]/10 text-[rgb(91,184,193)] border-[rgb(91,184,193)]/30"
                : "border-border text-muted-foreground/40"
            }`}
          >
            <span className="h-1.5 w-1.5 rounded-full bg-[rgb(91,184,193)]" />
            Aulas
          </button>
          <button
            type="button"
            onClick={() => setShowSimulados((v) => !v)}
            className={`flex items-center gap-1.5 rounded-full px-3 py-1 text-xs font-medium transition-all border ${
              showSimulados
                ? "bg-indigo-400/10 text-indigo-400 border-indigo-400/30"
                : "border-border text-muted-foreground/40"
            }`}
          >
            <span className="h-1.5 w-1.5 rounded-full bg-indigo-400" />
            Simulados
          </button>

          <div className="h-4 w-px bg-border" />

          <button
            type="button"
            onClick={() => window.print()}
            className="flex items-center gap-1.5 rounded-lg border border-border px-3 py-1.5 text-xs text-muted-foreground hover:text-foreground hover:border-ring transition-colors"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 20 20"
              fill="currentColor"
              className="h-3.5 w-3.5"
            >
              <path
                fillRule="evenodd"
                d="M5 2.75C5 1.784 5.784 1 6.75 1h6.5c.966 0 1.75.784 1.75 1.75v3.552c.377.046.752.097 1.126.153A2.25 2.25 0 0118 8.757v4.493a2.25 2.25 0 01-1.875 2.215c-.151.023-.302.044-.454.063A2.75 2.75 0 0113 17.5H7a2.75 2.75 0 01-2.671-2.972 44.112 44.112 0 01-.454-.063A2.25 2.25 0 012 12.25V8.757a2.25 2.25 0 011.874-2.202c.374-.056.75-.107 1.126-.153V2.75zm1.5 0v3.28a49.59 49.59 0 016.5 0V2.75a.25.25 0 00-.25-.25h-6a.25.25 0 00-.25.25zM5 12.25v3.25a1.25 1.25 0 001.25 1.25h7.5A1.25 1.25 0 0015 15.5v-3.25a.25.25 0 00-.25-.25H5.25a.25.25 0 00-.25.25z"
                clipRule="evenodd"
              />
            </svg>
            Imprimir
          </button>
        </div>
      </div>

      {/* Cabeçalho visível apenas na impressão */}
      <div className="hidden print:block mb-6">
        <p className="text-lg font-bold">Calendário Acadêmico Olímpico {selectedAno}</p>
        <p className="text-sm text-muted-foreground">Raiz Educação</p>
      </div>

      {/* Legenda impressão */}
      <div className="hidden print:flex print:flex-wrap gap-3 mb-4 text-xs">
        {Object.entries(FASE_CONFIG).map(([, cfg]) => (
          <span key={cfg.label} className="flex items-center gap-1">
            <span className={`h-2 w-2 rounded-full ${cfg.dot}`} />
            {cfg.label}
          </span>
        ))}
        {Object.entries(AULA_CONFIG).map(([, cfg]) => (
          <span key={cfg.label} className="flex items-center gap-1">
            <span className={`h-2 w-2 rounded-full ${cfg.dot}`} />
            {cfg.label}
          </span>
        ))}
      </div>

      {/* Timeline */}
      {meses.length === 0 ? (
        <div className="rounded-xl border border-border bg-card px-5 py-10 text-center">
          <p className="text-sm text-muted-foreground">
            Nenhum evento encontrado para {selectedAno}.
          </p>
          <p className="mt-1 text-xs text-muted-foreground/60">
            Cadastre fases nas olimpíadas ou aulas na Preparação.
          </p>
        </div>
      ) : (
        <div className="space-y-8">
          {meses.map(([key, { label, eventos: evs }]) => (
            <div key={key}>
              {/* Cabeçalho do mês */}
              <p
                className="mb-3 text-xs font-semibold uppercase tracking-wider capitalize"
                style={{ color: "rgb(91,184,193)" }}
              >
                {label}
              </p>

              {/* Eventos do mês */}
              <div className="rounded-xl border border-border bg-card divide-y divide-border/50">
                {evs.map((ev) => (
                  <div key={`${ev.kind}-${ev.data.id}`} className="px-5 py-4">
                    {ev.kind === "fase" ? (
                      <FaseCard fase={ev.data as FaseRow} />
                    ) : (
                      <AulaCard aula={ev.data as AulaRow} />
                    )}
                  </div>
                ))}
              </div>
            </div>
          ))}
        </div>
      )}
    </>
  );
}
