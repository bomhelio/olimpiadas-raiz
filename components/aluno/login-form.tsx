"use client";

import { useActionState, useEffect, useRef } from "react";
import { loginAluno } from "@/app/aluno/login/actions";

const TEAL = "rgb(91,184,193)";

export function LoginAlunoForm() {
  const [state, formAction, isPending] = useActionState(loginAluno, null);
  const needsConsent = state !== null && "needsConsent" in state;
  const errorMsg = state !== null && "error" in state ? state.error : null;
  const formRef = useRef<HTMLFormElement>(null);

  useEffect(() => {
    const email = sessionStorage.getItem("_test_email");
    const senha = sessionStorage.getItem("_test_senha");
    if (!email || !senha) return;
    sessionStorage.removeItem("_test_email");
    sessionStorage.removeItem("_test_senha");
    const fill = () => {
      const f = formRef.current;
      if (!f) return;
      const emailInput = f.querySelector('input[name="email"]') as HTMLInputElement;
      const passInput = f.querySelector('input[name="password"]') as HTMLInputElement;
      if (!emailInput || !passInput) return;
      emailInput.value = email;
      passInput.value = senha;
      const btn = f.querySelector('button[type="submit"]') as HTMLButtonElement;
      btn?.click();
    };
    setTimeout(fill, 200);
  }, []);

  return (
    <form ref={formRef} action={formAction} className="space-y-4">
      {/* ── Passo 1: credenciais ─────────────────────────────── */}
      {!needsConsent && (
        <>
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
        </>
      )}

      {/* ── Passo 2: consentimento (primeiro acesso) ─────────── */}
      {needsConsent && (
        <div className="space-y-4">
          <div className="rounded-xl border border-border bg-muted/20 p-4">
            <p className="text-sm font-semibold text-foreground">Autorização do responsável</p>
            <p className="mt-0.5 text-xs text-muted-foreground">
              Necessária uma única vez para liberar o acesso ao portal.
            </p>
          </div>

          <div>
            <label
              htmlFor="responsavel_nome"
              className="mb-1.5 block text-sm font-medium text-foreground"
            >
              Nome completo do responsável
            </label>
            <input
              id="responsavel_nome"
              name="responsavel_nome"
              type="text"
              autoComplete="off"
              autoFocus
              className="w-full rounded-lg border border-input bg-background px-3 py-2 text-sm text-foreground placeholder:text-muted-foreground focus:border-ring focus:outline-none"
              placeholder="Nome do responsável"
            />
          </div>

          <div>
            <p className="mb-1.5 text-sm font-medium text-foreground">Tipo de responsável</p>
            <div className="flex gap-5">
              {[
                { value: "pedagogico", label: "Pedagógico" },
                { value: "financeiro", label: "Financeiro" },
              ].map((opt) => (
                <label key={opt.value} className="flex items-center gap-2 cursor-pointer">
                  <input
                    type="radio"
                    name="responsavel_tipo"
                    value={opt.value}
                    className="h-4 w-4 accent-teal-500"
                  />
                  <span className="text-sm text-foreground">{opt.label}</span>
                </label>
              ))}
            </div>
          </div>

          <label className="flex items-start gap-2.5 cursor-pointer">
            <input
              type="checkbox"
              name="consentimento_aceito"
              className="mt-0.5 h-4 w-4 shrink-0 accent-teal-500"
            />
            <span className="text-xs text-muted-foreground leading-relaxed">
              Autorizo o acesso do(a) aluno(a) à Plataforma Olímpica e concordo com o tratamento dos
              dados pessoais conforme a{" "}
              <span className="font-medium text-foreground">LGPD (Lei 13.709/2018)</span>.
            </span>
          </label>
        </div>
      )}

      {errorMsg && (
        <p className="rounded-lg bg-destructive/10 px-3 py-2 text-sm text-destructive">
          {errorMsg}
        </p>
      )}

      <button
        type="submit"
        disabled={isPending}
        className="w-full rounded-lg py-2.5 text-sm font-semibold text-white transition-opacity disabled:opacity-50"
        style={{ backgroundColor: TEAL }}
      >
        {isPending ? "Aguarde…" : needsConsent ? "Autorizar e Entrar" : "Entrar"}
      </button>
    </form>
  );
}
