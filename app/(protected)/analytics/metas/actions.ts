"use server";

import { revalidatePath } from "next/cache";
import { createAdminClient } from "@/lib/supabase/admin";
import { getServerSession } from "@/lib/auth/session";
import { can } from "@/lib/auth/roles";

export type MetaState = { error: string } | { ok: true } | null;

export type MetaRow = {
  id: string;
  marca_id: string;
  ano_letivo: number;
  tipo: "inscricoes" | "participantes" | "premiados";
  valor: number;
};

export async function salvarMetas(
  ano: number,
  _prev: MetaState,
  formData: FormData,
): Promise<MetaState> {
  const session = await getServerSession();
  if (!session || !can(session.user.role, "audit_log:read")) {
    return { error: "Não autorizado" };
  }

  // Coleta todos os marca_id presentes no form
  const marcaIds = new Set<string>();
  for (const key of formData.keys()) {
    const match = key.match(/^meta_([^_]+)_/);
    if (match?.[1]) marcaIds.add(match[1]);
  }

  if (marcaIds.size === 0) return { ok: true };

  const upserts: { marca_id: string; ano_letivo: number; tipo: string; valor: number }[] = [];
  for (const marcaId of marcaIds) {
    for (const tipo of ["inscricoes", "participantes", "premiados", "vendas"] as const) {
      const raw = formData.get(`meta_${marcaId}_${tipo}`);
      const valor = Math.max(0, parseInt(String(raw ?? "0"), 10) || 0);
      upserts.push({ marca_id: marcaId, ano_letivo: ano, tipo, valor });
    }
  }

  const supabase = createAdminClient();
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const { error } = await (supabase as any)
    .from("meta_marca")
    .upsert(upserts, { onConflict: "marca_id,ano_letivo,tipo" });

  if (error) return { error: error.message };

  revalidatePath("/analytics");
  revalidatePath("/analytics/metas");
  return { ok: true };
}
