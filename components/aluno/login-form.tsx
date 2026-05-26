"use client";

import { useActionState } from "react";
import { loginAluno } from "@/app/aluno/login/actions";

const TEAL = "rgb(91,184,193)";

export function LoginAlunoForm() {
  const [state, formAction, isPending] = useActionState(loginAluno, null);

  return (
    <form action={formAction} className="space-y-4">
      {/* Credenciais do aluno */}
      <div>
        <label htmlFor="email" className="mb-1.5 block text-sm font-medium text-foreground">
          E-mail
        </label>
        <input
          id="email"
          name="email"
          type="email"
          autoComplete="email"
          required
          className="w-full rounded-lg border border-input bg-background px-3 py-2 text-sm text-foreground placeholder:text-muted-foreground focus:border-ring focus:outline-none"
          placeholder="seu@email.com"
        />
      </div>

      <div>
        <label htmlFor="password" className="mb-1.5 block text-sm font-medium text-foreground">
          Senha
        </label>
        <input
          id="password"
          name="password"
          type="password"
          autoComplete="current-password"
          required
          className="w-full rounded-lg border border-input bg-background px-3 py-2 text-sm text-foreground placeholder:text-muted-foreground focus:border-ring focus:outline-none"
          placeholder="••••••••"
        />
      </div>

      {/* Consentimento do responsável */}
      <div className="rounded-xl border border-border bg-muted/30 p-4 space-y-3">
        <div>
          <p className="text-xs font-semibold text-foreground">Consentimento do responsável</p>
          <p className="mt-0.5 text-[11px] text-muted-foreground">
            Obrigatório apenas no primeiro acesso. Preenchido uma única vez.
          </p>
        </div>

        <div>
          <label
            htmlFor="responsavel_nome"
            className="mb-1.5 block text-xs font-medium text-foreground"
          >
            Nome completo do responsável
          </label>
          <input
            id="responsavel_nome"
            name="responsavel_nome"
            type="text"
            autoComplete="off"
            className="w-full rounded-lg border border-input bg-background px-3 py-2 text-sm text-foreground placeholder:text-muted-foreground focus:border-ring focus:outline-none"
            placeholder="Nome do responsável"
          />
        </div>

        <div>
          <p className="mb-1.5 text-xs font-medium text-foreground">Tipo de responsável</p>
          <div className="flex gap-4">
            {[
              { value: "pedagogico", label: "Pedagógico" },
              { value: "financeiro", label: "Financeiro" },
            ].map((opt) => (
              <label key={opt.value} className="flex items-center gap-2 cursor-pointer">
                <input
                  type="radio"
                  name="responsavel_tipo"
                  value={opt.value}
                  className="h-3.5 w-3.5 accent-teal-500"
                />
                <span className="text-xs text-foreground">{opt.label}</span>
              </label>
            ))}
          </div>
        </div>

        <label className="flex items-start gap-2.5 cursor-pointer">
          <input
            type="checkbox"
            name="consentimento_aceito"
            className="mt-0.5 h-3.5 w-3.5 shrink-0 accent-teal-500"
          />
          <span className="text-[11px] text-muted-foreground leading-relaxed">
            Autorizo o acesso do(a) aluno(a) à Plataforma Olímpica e concordo com o tratamento dos
            dados pessoais conforme a{" "}
            <span className="font-medium text-foreground">LGPD (Lei 13.709/2018)</span>.
          </span>
        </label>
      </div>

      {state?.error && (
        <p className="rounded-lg bg-destructive/10 px-3 py-2 text-sm text-destructive">
          {state.error}
        </p>
      )}

      <button
        type="submit"
        disabled={isPending}
        className="w-full rounded-lg py-2.5 text-sm font-semibold text-white transition-opacity disabled:opacity-50"
        style={{ backgroundColor: TEAL }}
      >
        {isPending ? "Entrando…" : "Entrar"}
      </button>
    </form>
  );
}
