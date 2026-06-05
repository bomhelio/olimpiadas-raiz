"use client";

import { useActionState, useState, useTransition, useRef } from "react";
import { salvarSolucao, uploadSolucaoImagem } from "../actions";
import { inputClass } from "@/components/ui/form-field";
import type { Solucao } from "@/lib/types/database";

const LARGURA_MAP: Record<string, string> = {
  pequena: "180px",
  media: "360px",
  grande: "560px",
  completa: "100%",
};

export function SolucaoEditor({
  questaoId,
  solucao,
  videoUrl,
  imagemUrl: initialImagemUrl,
}: {
  questaoId: string;
  solucao?: Solucao | null;
  videoUrl?: string | null;
  imagemUrl?: string | null;
}) {
  const [state, action, isPending] = useActionState(salvarSolucao, null);
  const [imagemUrl, setImagemUrl] = useState<string | null>(initialImagemUrl ?? null);
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const [largura, setLargura] = useState<string>((solucao as any)?.imagem_largura ?? "completa");
  const [isUploading, startUploadTransition] = useTransition();
  const [uploadError, setUploadError] = useState<string | null>(null);
  const fileRef = useRef<HTMLInputElement>(null);

  const handleImageSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setUploadError(null);
    const fd = new FormData();
    fd.append("file", file);
    startUploadTransition(async () => {
      const result = await uploadSolucaoImagem(fd);
      if ("url" in result) {
        setImagemUrl(result.url);
      } else {
        setUploadError(result.error);
      }
    });
    e.target.value = "";
  };

  return (
    <form action={action} className="space-y-4">
      <input type="hidden" name="questao_id" value={questaoId} />
      <input type="hidden" name="imagem_url" value={imagemUrl ?? ""} />
      <input type="hidden" name="imagem_largura" value={largura} />

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

      <div className="space-y-1.5">
        <label className="block text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          Resolução em texto
        </label>
        <textarea
          name="texto"
          rows={6}
          defaultValue={solucao?.texto ?? ""}
          placeholder="Digite a resolução completa da questão…"
          className={inputClass}
        />
      </div>

      {/* Imagem da resolução */}
      <div className="space-y-2">
        <label className="block text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          Imagem da resolução
        </label>

        {imagemUrl && (
          <div className="space-y-2">
            <div className="relative inline-block">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={imagemUrl}
                alt="Resolução"
                className="rounded-lg border border-border object-contain"
                style={{ width: LARGURA_MAP[largura] ?? "100%", maxWidth: "100%" }}
              />
              <button
                type="button"
                onClick={() => setImagemUrl(null)}
                className="absolute -right-2 -top-2 flex h-5 w-5 items-center justify-center rounded-full border border-red-500/50 bg-card text-[10px] text-red-400 hover:text-red-300"
                title="Remover imagem"
              >
                ✕
              </button>
            </div>
            {/* Seletor de largura */}
            <div className="flex items-center gap-2">
              <span className="text-[11px] text-muted-foreground">Largura:</span>
              {(["pequena", "media", "grande", "completa"] as const).map((op) => (
                <button
                  key={op}
                  type="button"
                  onClick={() => setLargura(op)}
                  className={`rounded px-2 py-0.5 text-[11px] capitalize transition-colors ${
                    largura === op
                      ? "bg-primary text-primary-foreground"
                      : "border border-border text-muted-foreground hover:text-foreground"
                  }`}
                >
                  {op === "media"
                    ? "Média"
                    : op === "pequena"
                      ? "Pequena"
                      : op === "grande"
                        ? "Grande"
                        : "Completa"}
                </button>
              ))}
            </div>
          </div>
        )}

        {isUploading && <p className="text-xs text-muted-foreground">Enviando imagem…</p>}
        {uploadError && <p className="text-xs text-destructive">{uploadError}</p>}

        <label
          className={`inline-flex cursor-pointer rounded-lg border border-border px-3 py-1.5 text-xs text-muted-foreground transition-colors ${
            isUploading ? "pointer-events-none opacity-50" : "hover:text-foreground"
          }`}
        >
          {imagemUrl ? "Trocar imagem" : "+ Imagem"}
          <input
            ref={fileRef}
            type="file"
            accept="image/*"
            className="hidden"
            onChange={handleImageSelect}
          />
        </label>
      </div>

      <div className="space-y-1.5">
        <label className="block text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          Vídeo de resolução
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
