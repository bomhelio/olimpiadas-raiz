"use client";

import { useActionState } from "react";
import { salvarMetas, type MetaState } from "@/app/(protected)/analytics/metas/actions";

type Marca = { id: string; nome: string };

type Props = {
  marcas: Marca[];
  metasMap: Record<string, Record<string, number>>; // marcaId → tipo → valor
  ano: number;
};

const TEAL = "rgb(91,184,193)";

export function MetasForm({ marcas, metasMap, ano }: Props) {
  const bound = salvarMetas.bind(null, ano);
  const [state, formAction, isPending] = useActionState<MetaState, FormData>(bound, null);

  return (
    <form action={formAction} className="space-y-6">
      <p className="text-xs text-muted-foreground">
        Defina as metas anuais para cada marca. Os valores são salvos por ano letivo.
      </p>

      <div className="overflow-x-auto rounded-xl border border-border">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-border bg-background">
              <th className="px-5 py-3 text-left font-semibold text-muted-foreground">Marca</th>
              <th className="px-4 py-3 text-center font-semibold text-blue-400">
                Inscrições
                <span className="ml-1 text-[10px] font-normal text-muted-foreground/60">meta</span>
              </th>
              <th className="px-4 py-3 text-center font-semibold text-indigo-400">
                Participantes
                <span className="ml-1 text-[10px] font-normal text-muted-foreground/60">meta</span>
              </th>
              <th className="px-4 py-3 text-center font-semibold text-yellow-400">
                Premiados
                <span className="ml-1 text-[10px] font-normal text-muted-foreground/60">meta</span>
              </th>
              <th className="px-4 py-3 text-center font-semibold text-emerald-400">
                Vendas Prog. Olímpico
                <span className="ml-1 text-[10px] font-normal text-muted-foreground/60">meta</span>
              </th>
            </tr>
          </thead>
          <tbody className="divide-y divide-border">
            {marcas.map((m) => (
              <tr key={m.id} className="hover:bg-background/50">
                <td className="px-5 py-3 font-medium text-foreground">{m.nome}</td>
                {(["inscricoes", "participantes", "premiados", "vendas"] as const).map((tipo) => (
                  <td key={tipo} className="px-4 py-3 text-center">
                    <input
                      type="number"
                      name={`meta_${m.id}_${tipo}`}
                      defaultValue={metasMap[m.id]?.[tipo] ?? 0}
                      min={0}
                      step={1}
                      className="w-24 rounded-lg border border-input bg-card px-3 py-1.5 text-center text-sm text-foreground focus:border-ring focus:outline-none"
                    />
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {state && "error" in state && <p className="text-sm text-destructive">{state.error}</p>}
      {state && "ok" in state && (
        <p className="text-sm text-emerald-400">Metas salvas com sucesso.</p>
      )}

      <button
        type="submit"
        disabled={isPending}
        className="rounded-lg px-5 py-2.5 text-sm font-medium text-white disabled:opacity-50 transition-opacity"
        style={{ backgroundColor: TEAL }}
      >
        {isPending ? "Salvando…" : `Salvar metas de ${ano}`}
      </button>
    </form>
  );
}
