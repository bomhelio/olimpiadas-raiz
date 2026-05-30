"use client";

import { useActionState, useEffect, useRef } from "react";
import { login } from "@/app/login/actions";
import { inputClass } from "@/components/ui/form-field";

type LoginState = {
  error?: string;
} | null;

export function LoginForm() {
  const [state, formAction, isPending] = useActionState<LoginState, FormData>(login, null);
  const formRef = useRef<HTMLFormElement>(null);

  useEffect(() => {
    const email = sessionStorage.getItem("_test_email");
    const senha = sessionStorage.getItem("_test_senha");
    if (!email || !senha || !formRef.current) return;
    sessionStorage.removeItem("_test_email");
    sessionStorage.removeItem("_test_senha");
    const f = formRef.current;
    (f.querySelector('input[name="email"]') as HTMLInputElement).value = email;
    (f.querySelector('input[name="password"]') as HTMLInputElement).value = senha;
    f.requestSubmit();
  }, []);

  return (
    <form ref={formRef} action={formAction} className="space-y-5" noValidate>
      {state?.error && (
        <div
          role="alert"
          className="rounded-lg border border-destructive/30 bg-destructive/10 px-4 py-3 text-sm text-destructive"
        >
          {state.error}
        </div>
      )}

      <div className="space-y-1.5">
        <label htmlFor="email" className="block text-sm font-medium text-foreground">
          E-mail
        </label>
        <input
          id="email"
          name="email"
          type="email"
          autoComplete="email"
          required
          placeholder="seu@email.com"
          className={inputClass}
          disabled={isPending}
        />
      </div>

      <div className="space-y-1.5">
        <label htmlFor="password" className="block text-sm font-medium text-foreground">
          Senha
        </label>
        <input
          id="password"
          name="password"
          type="password"
          autoComplete="current-password"
          required
          placeholder="••••••••"
          className={inputClass}
          disabled={isPending}
        />
      </div>

      <button
        type="submit"
        disabled={isPending}
        className="w-full rounded-lg bg-blue-700 px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-800 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-60 transition-colors"
        aria-busy={isPending}
      >
        {isPending ? "Entrando…" : "Entrar"}
      </button>
    </form>
  );
}
