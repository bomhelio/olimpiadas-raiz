/* eslint-disable @typescript-eslint/no-explicit-any */
import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getStudentSession } from "@/lib/auth/student-session";
import { getOrCreateSessao } from "../actions";
import { SimuladoClient } from "./simulado-client";

export default async function SimuladoAtivoPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const session = await getStudentSession();
  if (!session) redirect("/aluno/login");

  const dados = await getOrCreateSessao(id);
  if (!dados) notFound();

  const { sessao, questoes, primeiraAlt, aula } = dados;

  // Sessão já concluída → vai para o relatório
  if (sessao.status === "concluido") {
    redirect(`/aluno/simulados/${id}/relatorio`);
  }

  if (questoes.length === 0) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-background">
        <div className="rounded-xl border border-border bg-card p-12 text-center max-w-sm">
          <p className="font-semibold text-foreground mb-2">Simulado sem questões</p>
          <p className="text-sm text-muted-foreground mb-4">
            Este simulado ainda não tem questões vinculadas.
          </p>
          <Link
            href="/aluno/simulados"
            className="text-sm font-medium"
            style={{ color: "rgb(91,184,193)" }}
          >
            ← Voltar aos simulados
          </Link>
        </div>
      </div>
    );
  }

  return (
    <SimuladoClient
      sessaoInicial={sessao}
      questoes={questoes as any}
      primeiraAlt={primeiraAlt as any}
      aulaId={id}
      aulaTitle={aula.titulo}
    />
  );
}
