"use client";

import { useState } from "react";
import { AulaPlayer } from "@/components/aluno/aula-player";
import { MaterialList } from "@/components/aluno/material-list";
import { TreinoClient } from "@/app/aluno/(area)/treino/treino-client";
import type { Questao, Alternativa } from "@/lib/types/database";

const TEAL = "rgb(91,184,193)";

type MaterialComUrl = {
  id: string;
  nome: string;
  arquivo_path: string;
  criado_em: string;
  signedUrl: string | null;
};

export type AulaCompleta = {
  id: string;
  titulo: string;
  tipo: string;
  modalidade_online: "ao_vivo" | "gravada" | null;
  data_hora: string | null;
  duracao_minutos: number | null;
  link_aula: string | null;
  descricao: string | null;
  polos: string | null;
  ordem: number;
  materiais: MaterialComUrl[];
  questoes: Questao[];
  primeiraAlt: Alternativa[];
};

function TipoBadgeAluno({ tipo, modalidade, polos }: { tipo: string; modalidade: string | null; polos?: string | null }) {
  if (tipo === "presencial")
    return (
      <span className="shrink-0 rounded-full bg-violet-500/10 px-2 py-0.5 text-[10px] font-semibold text-violet-400">
        Presencial
      </span>
    );
  if (tipo === "simulado")
    return (polos as string | null)
      ? <span className="shrink-0 rounded-full bg-violet-500/10 px-2 py-0.5 text-[10px] font-semibold text-violet-400">Presencial</span>
      : <span className="shrink-0 rounded-full bg-sky-500/10 px-2 py-0.5 text-[10px] font-semibold text-sky-400">Online</span>;
  if (tipo === "online" && modalidade === "ao_vivo")
    return (
      <span className="shrink-0 inline-flex items-center gap-1 rounded-full bg-red-500/10 px-2 py-0.5 text-[10px] font-semibold text-red-400">
        <span className="h-1.5 w-1.5 rounded-full bg-red-400" />Ao vivo
      </span>
    );
  // online gravada (default)
  return (
    <span className="shrink-0 rounded-full bg-sky-500/10 px-2 py-0.5 text-[10px] font-semibold text-sky-400">
      Gravada
    </span>
  );
}

function tipoIcon(tipo: string) {
  if (tipo === "online")
    return (
      <svg className="h-4 w-4" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
        <path d="M15 10l4.553-2.069A1 1 0 0121 8.87v6.26a1 1 0 01-1.447.9L15 14M3 8a2 2 0 012-2h10a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2V8z" />
      </svg>
    );
  if (tipo === "presencial")
    return (
      <svg className="h-4 w-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
        <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2" />
        <circle cx="9" cy="7" r="4" />
        <path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75" />
      </svg>
    );
  if (tipo === "modulo")
    return (
      <svg className="h-4 w-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
        <path d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2" />
        <rect x="9" y="3" width="6" height="4" rx="1" />
        <path d="M9 12h6M9 16h4" />
      </svg>
    );
  return (
    <svg className="h-4 w-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true">
      <path d="M9 11l3 3L22 4" /><path d="M21 12v7a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h11" />
    </svg>
  );
}

function fmtDateTime(iso: string) {
  return new Date(iso).toLocaleString("pt-BR", {
    weekday: "short", day: "2-digit", month: "2-digit",
    hour: "2-digit", minute: "2-digit",
    timeZone: "America/Sao_Paulo",
  });
}

function fmtDuracao(seg: number) {
  const h = Math.floor(seg / 3600);
  const m = Math.floor((seg % 3600) / 60);
  const s = seg % 60;
  return `${String(h).padStart(2, "0")}:${String(m).padStart(2, "0")}:${String(s).padStart(2, "0")}`;
}

export function ProjetoPageClient({
  projetoId,
  aulas,
}: {
  projetoId: string;
  aulas: AulaCompleta[];
}) {
  const [expandida, setExpandida] = useState<string | null>(null);
  const [questoesAbertas, setQuestoesAbertas] = useState<Set<string>>(new Set());

  if (aulas.length === 0) {
    return (
      <div className="rounded-xl border border-dashed border-border p-10 text-center">
        <p className="text-sm text-muted-foreground">
          Nenhuma aula publicada ainda. Volte em breve!
        </p>
      </div>
    );
  }

  return (
    <div className="space-y-2">
      {aulas.sort((a, b) => a.ordem - b.ordem).map((aula, idx) => {
        const aberta = expandida === aula.id;
        return (
          <div key={aula.id} className="rounded-lg border border-border bg-card overflow-hidden">
            {/* Cabeçalho clicável */}
            <button
              type="button"
              onClick={() => setExpandida(aberta ? null : aula.id)}
              className="group flex w-full items-center gap-3 p-3 text-left transition-colors hover:bg-white/[0.03]"
            >
              <TipoBadgeAluno tipo={aula.tipo} modalidade={aula.modalidade_online} polos={aula.polos} />
              <div className="flex-1 min-w-0">
                <p className="truncate text-sm font-medium text-foreground">
                  <span className="mr-2 text-muted-foreground">{idx + 1}.</span>
                  {aula.titulo}
                </p>
                <div className="mt-0.5 flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
                  {aula.data_hora && <span>{fmtDateTime(aula.data_hora)}</span>}
                  {aula.duracao_minutos && <span>· {fmtDuracao(aula.duracao_minutos)}</span>}
                  {aula.materiais.length > 0 && (
                    <span>· {aula.materiais.length} {aula.materiais.length === 1 ? "material" : "materiais"}</span>
                  )}
                  {aula.questoes.length > 0 && (
                    <span>· {aula.questoes.length} {aula.questoes.length === 1 ? "questão" : "questões"}</span>
                  )}
                </div>
                {/* Descrição visível mesmo fechado */}
                {aula.descricao && (
                  <p className="mt-1.5 text-xs text-muted-foreground/70 line-clamp-2">{aula.descricao}</p>
                )}
              </div>
              <svg
                className={`h-4 w-4 shrink-0 text-muted-foreground transition-transform ${aberta ? "rotate-90" : ""}`}
                viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" aria-hidden="true"
              >
                <path d="M9 18l6-6-6-6" />
              </svg>
            </button>

            {/* Conteúdo expandido */}
            {aberta && (
              <div className="border-t border-border p-4 space-y-5">
                {aula.descricao && (
                  <p className="text-sm text-muted-foreground">{aula.descricao}</p>
                )}

                {aula.polos && (
                  <div className="rounded-lg border border-violet-400/20 bg-violet-400/5 px-4 py-3">
                    <p className="text-xs font-semibold text-violet-400 mb-1">Local / Polo</p>
                    <p className="text-sm text-violet-300 whitespace-pre-line">{aula.polos}</p>
                  </div>
                )}

                {aula.link_aula && (
                  <AulaPlayer url={aula.link_aula} titulo={aula.titulo} />
                )}

                {aula.materiais.length > 0 && (
                  <MaterialList materiais={aula.materiais} />
                )}

                {aula.questoes.length > 0 && (
                  <div>
                    {/* Cabeçalho colapsável das questões */}
                    <button
                      type="button"
                      onClick={() =>
                        setQuestoesAbertas((prev) => {
                          const next = new Set(prev);
                          if (next.has(aula.id)) next.delete(aula.id);
                          else next.add(aula.id);
                          return next;
                        })
                      }
                      className="flex w-full items-center justify-between rounded-lg border border-border bg-background px-4 py-3 text-left transition-colors hover:bg-white/[0.03]"
                    >
                      <span className="text-sm font-semibold uppercase tracking-wide text-muted-foreground">
                        Lista de questões
                      </span>
                      <svg
                        className={`h-4 w-4 shrink-0 text-muted-foreground transition-transform ${questoesAbertas.has(aula.id) ? "rotate-90" : ""}`}
                        viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"
                      >
                        <path d="M9 18l6-6-6-6" />
                      </svg>
                    </button>

                    {questoesAbertas.has(aula.id) && (
                      <div className="mt-3">
                        <TreinoClient
                          questoes={aula.questoes}
                          primeiraAlt={aula.primeiraAlt}
                          numeracaoSequencial
                          completionUrl={`/aluno/projeto/${projetoId}`}
                          completionLabel="Fechar"
                          contexto={aula.tipo === "simulado" ? "simulado" : "aula"}
                          aulaId={aula.id}
                        />
                      </div>
                    )}
                  </div>
                )}

              </div>
            )}
          </div>
        );
      })}
    </div>
  );
}
