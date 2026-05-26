import type { NextRequest } from "next/server";
import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { getServerSession } from "@/lib/auth/session";

export async function GET(req: NextRequest) {
  const session = await getServerSession();
  if (!session) return NextResponse.json({ error: "Não autorizado" }, { status: 401 });

  const path = req.nextUrl.searchParams.get("path");
  if (!path) return NextResponse.json({ error: "Parâmetro 'path' obrigatório" }, { status: 400 });

  const supabase = createAdminClient();
  const { data, error } = await supabase.storage
    .from("planilhas-olimpiadas")
    .createSignedUrl(path, 300);

  if (error || !data?.signedUrl) {
    return NextResponse.json({ error: "Arquivo não encontrado" }, { status: 404 });
  }

  return NextResponse.redirect(data.signedUrl);
}
