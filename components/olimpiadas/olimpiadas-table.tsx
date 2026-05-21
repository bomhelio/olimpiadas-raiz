"use client";

import { useState } from "react";

export type OlimpiadaStats = {
  nome: string;
  marca: string;
  inscritos: number;
  participantes: number;
  ouro: number;
  prata: number;
  bronze: number;
  mencao: number;
};

type Totals = {
  inscritos: number;
  participantes: number;
  ouro: number;
  prata: number;
  bronze: number;
  mencao: number;
};

type Props = {
  statsRows: OlimpiadaStats[];
  totals: Totals;
};

type ColKey =
  | "inscritos"
  | "participantes"
  | "engajamento"
  | "ouro"
  | "prata"
  | "bronze"
  | "mencao";

const COLUMNS: { key: ColKey; label: string }[] = [
  { key: "inscritos", label: "Inscritos" },
  { key: "participantes", label: "Participantes" },
  { key: "engajamento", label: "Engajamento" },
  { key: "ouro", label: "Ouro" },
  { key: "prata", label: "Prata" },
  { key: "bronze", label: "Bronze" },
  { key: "mencao", label: "Menção Honrosa" },
];

const ACTIVE_STYLE: Record<ColKey, string> = {
  inscritos: "bg-[rgb(91,184,193)]/10 text-[rgb(91,184,193)] ring-1 ring-[rgb(91,184,193)]/40",
  participantes: "bg-[rgb(91,184,193)]/10 text-[rgb(91,184,193)] ring-1 ring-[rgb(91,184,193)]/40",
  engajamento: "bg-[rgb(91,184,193)]/10 text-[rgb(91,184,193)] ring-1 ring-[rgb(91,184,193)]/40",
  ouro: "bg-yellow-400/10 text-yellow-400 ring-1 ring-yellow-400/40",
  prata: "bg-slate-300/10 text-slate-300 ring-1 ring-slate-300/40",
  bronze: "bg-amber-600/10 text-amber-600 ring-1 ring-amber-600/40",
  mencao: "bg-[rgb(91,184,193)]/10 text-[rgb(91,184,193)] ring-1 ring-[rgb(91,184,193)]/40",
};

function sigla(nome: string) {
  const idx = nome.indexOf(" — ");
  return idx !== -1 ? nome.substring(0, idx) : nome;
}

function fmt(n: number) {
  return n === 0 ? "—" : n.toLocaleString("pt-BR");
}

function engajamento(participantes: number, inscritos: number) {
  if (inscritos === 0) return "—";
  return `${Math.round((participantes / inscritos) * 100)}%`;
}

export function OlimpiadasTable({ statsRows, totals }: Props) {
  const [visible, setVisible] = useState<Record<ColKey, boolean>>({
    inscritos: true,
    participantes: true,
    engajamento: true,
    ouro: true,
    prata: true,
    bronze: true,
    mencao: true,
  });

  function toggle(key: ColKey) {
    setVisible((prev) => ({ ...prev, [key]: !prev[key] }));
  }

  if (statsRows.length === 0) {
    return <p className="text-sm text-muted-foreground">Nenhuma inscrição encontrada.</p>;
  }

  return (
    <div className="space-y-4">
      {/* Column toggles */}
      <div className="flex flex-wrap items-center gap-3 rounded-xl border border-border bg-card px-4 py-3">
        <span
          className="shrink-0 text-xs font-semibold uppercase tracking-wider"
          style={{ color: "rgb(91,184,193)" }}
        >
          Colunas
        </span>
        <div className="h-4 w-px shrink-0 bg-border" />
        <div className="flex flex-wrap gap-2">
          {COLUMNS.map((col) => (
            <button
              key={col.key}
              type="button"
              onClick={() => toggle(col.key)}
              className={`rounded-full px-3 py-1 text-xs font-medium transition-all ${
                visible[col.key]
                  ? ACTIVE_STYLE[col.key]
                  : "text-muted-foreground/40 ring-1 ring-border/40 hover:text-muted-foreground hover:ring-border"
              }`}
            >
              {col.label}
            </button>
          ))}
        </div>
      </div>

      {/* Table */}
      <div className="overflow-x-auto rounded-xl border border-border bg-card">
        <table className="w-full min-w-[400px] text-sm">
          <thead>
            <tr className="border-b border-border bg-background">
              <th className="px-4 py-3 text-left font-medium" style={{ color: "rgb(91,184,193)" }}>
                Marca
              </th>
              <th className="px-4 py-3 text-left font-medium" style={{ color: "rgb(91,184,193)" }}>
                Olimpíada
              </th>
              {visible.inscritos && (
                <th
                  className="px-4 py-3 text-right font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Inscritos
                </th>
              )}
              {visible.participantes && (
                <th
                  className="px-4 py-3 text-right font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Participantes
                </th>
              )}
              {visible.engajamento && (
                <th
                  className="px-4 py-3 text-right font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Engajamento
                </th>
              )}
              {visible.ouro && (
                <th className="px-4 py-3 text-right font-medium text-yellow-400">Ouro</th>
              )}
              {visible.prata && (
                <th className="px-4 py-3 text-right font-medium text-slate-300">Prata</th>
              )}
              {visible.bronze && (
                <th className="px-4 py-3 text-right font-medium text-amber-600">Bronze</th>
              )}
              {visible.mencao && (
                <th
                  className="px-4 py-3 text-right font-medium"
                  style={{ color: "rgb(91,184,193)" }}
                >
                  Menção
                </th>
              )}
            </tr>
          </thead>
          <tbody className="divide-y divide-border">
            {statsRows.map((r) => (
              <tr key={`${r.marca}::${r.nome}`} className="hover:bg-background/50">
                <td className="px-4 py-3 font-medium text-foreground">{r.marca}</td>
                <td className="px-4 py-3 text-muted-foreground">{sigla(r.nome)}</td>
                {visible.inscritos && (
                  <td className="px-4 py-3 text-right text-muted-foreground">
                    {r.inscritos.toLocaleString("pt-BR")}
                  </td>
                )}
                {visible.participantes && (
                  <td className="px-4 py-3 text-right text-muted-foreground">
                    {fmt(r.participantes)}
                  </td>
                )}
                {visible.engajamento && (
                  <td className="px-4 py-3 text-right text-muted-foreground">
                    {engajamento(r.participantes, r.inscritos)}
                  </td>
                )}
                {visible.ouro && (
                  <td className="px-4 py-3 text-right text-yellow-400">{fmt(r.ouro)}</td>
                )}
                {visible.prata && (
                  <td className="px-4 py-3 text-right text-slate-300">{fmt(r.prata)}</td>
                )}
                {visible.bronze && (
                  <td className="px-4 py-3 text-right text-amber-600">{fmt(r.bronze)}</td>
                )}
                {visible.mencao && (
                  <td className="px-4 py-3 text-right text-muted-foreground">{fmt(r.mencao)}</td>
                )}
              </tr>
            ))}
          </tbody>
          <tfoot>
            <tr className="border-t-2 border-border bg-background font-semibold">
              <td className="px-4 py-3 text-foreground">Total</td>
              <td className="px-4 py-3" />
              {visible.inscritos && (
                <td className="px-4 py-3 text-right text-foreground">
                  {totals.inscritos.toLocaleString("pt-BR")}
                </td>
              )}
              {visible.participantes && (
                <td className="px-4 py-3 text-right text-foreground">
                  {fmt(totals.participantes)}
                </td>
              )}
              {visible.engajamento && (
                <td className="px-4 py-3 text-right text-foreground">
                  {engajamento(totals.participantes, totals.inscritos)}
                </td>
              )}
              {visible.ouro && (
                <td className="px-4 py-3 text-right text-yellow-400">{fmt(totals.ouro)}</td>
              )}
              {visible.prata && (
                <td className="px-4 py-3 text-right text-slate-300">{fmt(totals.prata)}</td>
              )}
              {visible.bronze && (
                <td className="px-4 py-3 text-right text-amber-600">{fmt(totals.bronze)}</td>
              )}
              {visible.mencao && (
                <td className="px-4 py-3 text-right text-foreground">{fmt(totals.mencao)}</td>
              )}
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  );
}
