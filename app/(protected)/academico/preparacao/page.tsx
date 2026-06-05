import { getServerSession } from "@/lib/auth/session";
import { getProjetos } from "./actions";
import { PreparacaoPage } from "@/components/academico/preparacao/preparacao-page";

export const metadata = { title: "Projetos — Acadêmico" };

export default async function PreparacaoRootPage() {
  const session = await getServerSession();
  if (!session) return null;

  const projetos = await getProjetos();

  return (
    <div className="max-w-4xl space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-foreground">Projetos</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Projetos e aulas de preparação para olimpíadas do conhecimento
        </p>
      </div>
      <PreparacaoPage projetos={projetos} />
    </div>
  );
}
