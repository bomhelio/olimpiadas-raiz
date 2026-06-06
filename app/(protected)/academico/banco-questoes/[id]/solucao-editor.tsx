"use client";

import { useActionState } from "react";
import { salvarSolucao, uploadSolucaoImagem } from "../actions";
import { inputClass } from "@/components/ui/form-field";
import type { Solucao } from "@/lib/types/database";
import {
  EnunciadoBlocosEditor,
  type BlocoEnunciado,
  type BlocoLargura,
} from "../enunciado-blocos-editor";

const RESOLUCAO_STATUS = [
  { value: "nao", label: "Não" },
  { value: "em_producao", label: "Em produção" },
  { value: "sim", label: "Sim" },
];

function RadioStatus({
  name,
  label,
  defaultValue,
}: {
  name: string;
  label: string;
  defaultValue: string;
}) {
  return (
    <div className="flex items-center gap-4">
      <span className="text-xs font-semibold text-muted-foreground uppercase tracking-wider w-48 shrink-0">
        {label}
      </span>
      <div className="flex gap-3">
        {RESOLUCAO_STATUS.map((opt) => (
          <label
            key={opt.value}
            className="flex items-center gap-1.5 cursor-pointer text-sm text-muted-foreground hover:text-foreground"
          >
            <input
              type="radio"
              name={name}
              value={opt.value}
              defaultChecked={opt.value === (defaultValue || "nao")}
              className="accent-primary"
            />
            {opt.label}
          </label>
        ))}
      </div>
    </div>
  );
}

function solucaoParaBlocos(
  solucao?: Solucao | null,
  imagemUrl?: string | null,
): BlocoEnunciado[] | null {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const blocos = (solucao as any)?.blocos;
  if (blocos && Array.isArray(blocos) && blocos.length > 0) return blocos as BlocoEnunciado[];
  const result: BlocoEnunciado[] = [];
  if (solucao?.texto) result.push({ tipo: "texto", conteudo: solucao.texto });
  if (imagemUrl)
    result.push({
      tipo: "imagem",
      url: imagemUrl,
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      largura: ((solucao as any)?.imagem_largura as BlocoLargura) ?? undefined,
    });
  return result.length > 0 ? result : null;
}

export function SolucaoEditor({
  questaoId,
  solucao,
  videoUrl,
  imagemUrl,
  temResolucaoVideo,
  temResolucaoTexto,
}: {
  questaoId: string;
  solucao?: Solucao | null;
  videoUrl?: string | null;
  imagemUrl?: string | null;
  temResolucaoVideo?: string;
  temResolucaoTexto?: string;
}) {
  const [state, action, isPending] = useActionState(salvarSolucao, null);

  const initialBlocos = solucaoParaBlocos(solucao, imagemUrl);

  return (
    <form action={action} className="space-y-5">
      <input type="hidden" name="questao_id" value={questaoId} />

      {state && "error" in state && (
        <div className="rounded-lg border border-destructive/30 bg-destructive/10 px-4 py-2 text-sm text-destructive">
          {state.error}
        </div>
      )}
      {state && "ok" in state && (
        <div className="rounded-lg border border-emerald-500/30 bg-emerald-500/10 px-4 py-2 text-sm text-emerald-400">
          Resolução salva.
        </div>
      )}

      {/* Flags de status de produção */}
      <div className="rounded-lg border border-border/60 bg-background/40 p-4 space-y-3">
        <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wider mb-1">
          Status de produção
        </p>
        <RadioStatus
          name="tem_resolucao_video"
          label="Tem resolução em vídeo?"
          defaultValue={temResolucaoVideo ?? "nao"}
        />
        <RadioStatus
          name="tem_resolucao_texto"
          label="Tem resolução em texto/imagem?"
          defaultValue={temResolucaoTexto ?? "nao"}
        />
      </div>

      {/* Vídeo de resolução */}
      <div className="space-y-1.5">
        <label className="block text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          URL do vídeo
        </label>
        <input
          name="video_url"
          type="url"
          defaultValue={videoUrl ?? ""}
          placeholder="https://youtube.com/…"
          className={inputClass}
        />
        <p className="text-xs text-muted-foreground">YouTube, Vimeo ou link direto. Opcional.</p>
      </div>

      {/* Resolução em blocos (texto + imagem) */}
      <div className="space-y-1.5">
        <label className="block text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          Resolução em texto/imagem
        </label>
        <p className="text-xs text-muted-foreground mb-2">
          Use blocos de texto e imagem — arranje na ordem que quiser.
        </p>
        <EnunciadoBlocosEditor
          initialBlocos={initialBlocos}
          fieldNameBlocos="solucao_blocos"
          fieldNameTexto="solucao_texto"
          placeholder="Digite o texto da resolução…"
          uploadFn={uploadSolucaoImagem}
        />
      </div>

      <button
        type="submit"
        disabled={isPending}
        className="rounded-lg bg-primary px-4 py-2 text-sm font-semibold text-primary-foreground disabled:opacity-60"
      >
        {isPending ? "Salvando…" : "Salvar resolução"}
      </button>
    </form>
  );
}
