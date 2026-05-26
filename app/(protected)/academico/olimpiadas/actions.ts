"use server";

import { createAdminClient } from "@/lib/supabase/admin";
import { getServerSession } from "@/lib/auth/session";
import { revalidatePath } from "next/cache";

const BUCKET = "planilhas-olimpiadas";

async function ensureBucket() {
  const supabase = createAdminClient();
  await supabase.storage.createBucket(BUCKET, {
    public: false,
    fileSizeLimit: 10 * 1024 * 1024,
    allowedMimeTypes: [
      "application/vnd.ms-excel",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      "text/csv",
      "application/vnd.oasis.opendocument.spreadsheet",
    ],
  });
  // Ignora o erro "already exists" — bucket pode já existir
}

export type UploadState = { error: string } | { ok: true } | null;

export async function uploadPlanilha(
  sigla: string,
  _prevState: UploadState,
  formData: FormData,
): Promise<UploadState> {
  const session = await getServerSession();
  if (!session) return { error: "Não autorizado" };

  const file = formData.get("file") as File | null;
  if (!file || file.size === 0) return { error: "Selecione um arquivo válido" };

  const ext = file.name.split(".").pop()?.toLowerCase();
  const allowed = ["xlsx", "xls", "csv", "ods"];
  if (!ext || !allowed.includes(ext)) {
    return { error: "Formato inválido. Use .xlsx, .xls, .csv ou .ods" };
  }

  await ensureBucket();

  const supabase = createAdminClient();
  const timestamp = Date.now();
  const safeName = file.name.replace(/[^a-zA-Z0-9._-]/g, "_");
  const path = `${sigla}/${timestamp}-${safeName}`;

  const bytes = await file.arrayBuffer();
  const { error } = await supabase.storage
    .from(BUCKET)
    .upload(path, bytes, { contentType: file.type, upsert: false });

  if (error) return { error: `Erro ao enviar: ${error.message}` };

  revalidatePath("/academico/olimpiadas");
  return { ok: true };
}

export async function deletePlanilha(path: string): Promise<void> {
  const session = await getServerSession();
  if (!session) return;

  const supabase = createAdminClient();
  await supabase.storage.from(BUCKET).remove([path]);
  revalidatePath("/academico/olimpiadas");
}

export async function listPlanilhas(
  sigla: string,
): Promise<Array<{ name: string; created_at: string; fullPath: string }>> {
  try {
    const supabase = createAdminClient();
    const { data } = await supabase.storage
      .from(BUCKET)
      .list(sigla, { sortBy: { column: "created_at", order: "desc" } });

    return (data ?? [])
      .filter((f) => f.name !== ".emptyFolderPlaceholder")
      .map((f) => ({
        name: f.name,
        created_at: f.created_at ?? "",
        fullPath: `${sigla}/${f.name}`,
      }));
  } catch {
    return [];
  }
}
