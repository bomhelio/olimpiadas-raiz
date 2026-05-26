import { getServerSession } from "@/lib/auth/session";
import { CATALOGO } from "@/lib/olimpiadas/catalogo";
import { listPlanilhas } from "./actions";
import { OlimpiadasCatalogo } from "@/components/academico/olimpiadas-catalogo";

export const metadata = { title: "Olimpíadas — Acadêmico" };

export default async function AcademicoOlimpiadasPage() {
  const session = await getServerSession();
  if (!session) return null;

  const planilhasMap: Record<
    string,
    Array<{ name: string; created_at: string; fullPath: string }>
  > = {};

  await Promise.all(
    CATALOGO.map(async (o) => {
      planilhasMap[o.sigla] = await listPlanilhas(o.sigla);
    }),
  );

  return (
    <div className="max-w-4xl space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-foreground">Olimpíadas</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Informações das principais olimpíadas do conhecimento
        </p>
      </div>
      <OlimpiadasCatalogo catalogo={CATALOGO} planilhasMap={planilhasMap} />
    </div>
  );
}
