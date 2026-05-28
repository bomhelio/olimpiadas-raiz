import { LoginAlunoForm } from "@/components/aluno/login-form";

export const metadata = {
  title: "Acesso do Aluno — Plataforma Olímpica",
};

const SLUG_TO_LOGO: Record<string, string> = {
  americano: "americano",
  apogeu: "apogeu",
  "matriz-educacao": "matriz",
  "qi-bilingue": "qi",
  uniao: "uniao",
  unificado: "unificado",
};

const SLUG_TO_NOME: Record<string, string> = {
  americano: "Americano",
  apogeu: "Apogeu",
  "matriz-educacao": "Matriz Educação",
  "qi-bilingue": "QI Bilíngue",
  uniao: "União",
  unificado: "Unificado",
};

// URL do vídeo promocional. Deixar vazio para mostrar apenas o fundo.
const VIDEO_SRC = "";

const TEAL = "rgb(91,184,193)";

export default async function LoginAlunoPage({
  searchParams,
}: {
  searchParams: Promise<{ marca?: string }>;
}) {
  const { marca } = await searchParams;
  const logoFile = marca ? SLUG_TO_LOGO[marca] : null;
  const marcaNome = marca ? SLUG_TO_NOME[marca] : null;

  return (
    <main className="flex min-h-screen">
      {/* ── Lado esquerdo: vídeo ───────────────────────────────────────── */}
      <div
        className="relative hidden flex-col items-center justify-center overflow-hidden lg:flex lg:w-1/2"
        style={{ background: "linear-gradient(135deg, #0a1628 0%, #0d2240 50%, #0a2a2a 100%)" }}
      >
        {/* Vídeo de fundo */}
        {VIDEO_SRC && (
          <video
            autoPlay
            muted
            loop
            playsInline
            className="absolute inset-0 h-full w-full object-cover"
            style={{ opacity: 0.55 }}
          >
            <source src={VIDEO_SRC} type="video/mp4" />
          </video>
        )}

        {/* Gradiente sobre o vídeo */}
        <div
          className="absolute inset-0"
          style={{
            background:
              "linear-gradient(to bottom, rgba(10,22,40,0.3) 0%, rgba(10,22,40,0.15) 50%, rgba(10,22,40,0.5) 100%)",
          }}
        />

        {/* Conteúdo sobre o vídeo */}
        <div className="relative z-10 flex flex-col items-center px-12 text-center">
          {/* eslint-disable-next-line @next/next/no-img-element */}
          <img
            src="/logo-raiz.png"
            alt="Raiz Educação"
            className="mb-8 block max-h-24 w-auto object-contain"
          />

          <div className="mb-3 h-px w-16 rounded" style={{ background: TEAL }} />

          <h2 className="text-3xl font-bold leading-tight text-white">Plataforma Olímpica</h2>
          <p className="mt-3 max-w-xs text-base leading-relaxed" style={{ color: TEAL }}>
            Prepare-se para as olimpíadas do conhecimento
          </p>

          {/* Decoração */}
          <div className="mt-12 flex gap-2">
            {[...Array(3)].map((_, i) => (
              <div
                key={i}
                className="h-1.5 rounded-full"
                style={{
                  width: i === 1 ? 32 : 8,
                  background: i === 1 ? TEAL : "rgba(91,184,193,0.35)",
                }}
              />
            ))}
          </div>
        </div>
      </div>

      {/* ── Lado direito: formulário ───────────────────────────────────── */}
      <div className="flex w-full flex-col items-center justify-center bg-background px-6 py-12 lg:w-1/2">
        <div className="w-full max-w-sm">
          {/* Header com logo da marca */}
          <div className="mb-8 text-center">
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={logoFile ? `/marcas/${logoFile}.png` : "/logo-raiz.png"}
              alt={marcaNome ?? "Raiz Educação"}
              className="mx-auto mb-4 block max-h-40 max-w-full"
            />
            <h1 className="text-xl font-bold text-foreground">Plataforma Olímpica</h1>
            <p className="mt-1 text-sm text-muted-foreground">
              {marcaNome ? `${marcaNome} — Área do Aluno` : "Raiz Educação — Área do Aluno"}
            </p>
          </div>

          {/* Card de login */}
          <div className="rounded-2xl border border-border bg-card p-8 shadow-sm">
            <h2 className="mb-6 text-lg font-semibold text-foreground">Entrar</h2>
            <LoginAlunoForm />
          </div>

          <p className="mt-6 text-center text-xs text-muted-foreground">
            Dificuldades para acessar?{" "}
            <a
              href="mailto:olimpiadas@raizeducacao.com.br"
              className="hover:underline"
              style={{ color: TEAL }}
            >
              Fale com a coordenação
            </a>
          </p>
        </div>
      </div>
    </main>
  );
}
