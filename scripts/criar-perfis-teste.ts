/**
 * Criação de perfis de teste: 1 diretor + 1 aluno por marca (6 marcas).
 * Uso: npx tsx scripts/criar-perfis-teste.ts
 */

import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = "https://ebdazvyyunilbkygtevn.supabase.co";
const SERVICE_ROLE_KEY =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImViZGF6dnl5dW5pbGJreWd0ZXZuIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3OTIxOTg3NywiZXhwIjoyMDk0Nzk1ODc3fQ.lUFt2cs8nBYvVTPNGzuaSk20xbcTXqcVHzMTdMB5X8c";
const SENHA = "Teste@2026";

const supabase = createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
  auth: { autoRefreshToken: false, persistSession: false },
});

// ─── Dados das 6 marcas ───────────────────────────────────────────────────────

const MARCAS = [
  {
    id: "11111111-0000-0000-0000-000000000001",
    nome: "Apogeu",
    slug: "apogeu",
    turmaId: "33333333-0000-0000-0000-000000000001",
  },
  {
    id: "11111111-0000-0000-0000-000000000002",
    nome: "Matriz Educação",
    slug: "matriz-educacao",
    turmaId: "e0754bf2-eb27-4e7c-ba82-6d818f35059a",
  },
  {
    id: "11111111-0000-0000-0000-000000000003",
    nome: "QI Bilíngue",
    slug: "qi-bilingue",
    turmaId: "4955b8fd-30b7-4b89-9e3d-07e9a4e2b8d0",
  },
  {
    id: "11111111-0000-0000-0000-000000000004",
    nome: "União",
    slug: "uniao",
    turmaId: "bc5a0b15-73a3-4d80-b4b8-82f8e8f35cc8",
  },
  {
    id: "11111111-0000-0000-0000-000000000005",
    nome: "Unificado",
    slug: "unificado",
    turmaId: "742fdeb0-9d2f-48a3-8238-74b3f5238bf5",
  },
  {
    id: "11111111-0000-0000-0000-000000000006",
    nome: "Americano",
    slug: "americano",
    turmaId: "df2295ef-6b12-4fc3-b902-c4b899a26dba",
  },
];

// ─── Helpers ─────────────────────────────────────────────────────────────────

// eslint-disable-next-line @typescript-eslint/no-unused-vars
function slugLabel(slug: string): string {
  return slug
    .split("-")
    .map((p) => p.charAt(0).toUpperCase() + p.slice(1))
    .join(" ");
}

async function criarAuthUser(email: string, nome: string) {
  const { data, error } = await supabase.auth.admin.createUser({
    email,
    password: SENHA,
    email_confirm: true,
    user_metadata: { nome },
  });
  if (error) throw new Error(`Auth user ${email}: ${error.message}`);
  return data.user;
}

// ─── Criação de diretores ─────────────────────────────────────────────────────

async function criarDiretor(marca: (typeof MARCAS)[number]) {
  const nome = `Diretor ${marca.nome}`;
  const email = `diretor.${marca.slug}@olimpiadas.teste`;

  console.log(`  Criando auth user: ${email}`);
  const authUser = await criarAuthUser(email, nome);

  console.log(`  Inserindo em usuario...`);
  const { error: uErr } = await supabase.from("usuario").insert({
    id: authUser.id,
    nome,
    email,
    role: "direcao_marca",
    marca_ativa_id: marca.id,
    ativo: true,
  });
  if (uErr) throw new Error(`usuario insert (${email}): ${uErr.message}`);

  console.log(`  Vinculando usuario_marca...`);
  const { error: umErr } = await supabase.from("usuario_marca").insert({
    usuario_id: authUser.id,
    marca_id: marca.id,
  });
  if (umErr) throw new Error(`usuario_marca insert (${email}): ${umErr.message}`);

  return { nome, email, authId: authUser.id };
}

// ─── Criação de alunos ────────────────────────────────────────────────────────

async function criarAluno(marca: (typeof MARCAS)[number]) {
  const nome = `Aluno Teste ${marca.nome}`;
  const email = `aluno.${marca.slug}@olimpiadas.teste`;

  console.log(`  Criando auth user: ${email}`);
  const authUser = await criarAuthUser(email, nome);

  console.log(`  Inserindo em aluno...`);
  const { error: aErr } = await supabase.from("aluno").insert({
    turma_id: marca.turmaId,
    nome,
    data_nascimento: "2010-01-01",
    email,
    supabase_auth_id: authUser.id,
    consentimento_responsavel: true,
    consentimento_responsavel_nome: "Responsável Teste",
    ativo: true,
  });
  if (aErr) throw new Error(`aluno insert (${email}): ${aErr.message}`);

  return { nome, email, authId: authUser.id };
}

// ─── Main ─────────────────────────────────────────────────────────────────────

(async () => {
  const diretores: { nome: string; email: string; marca: string }[] = [];
  const alunos: { nome: string; email: string; marca: string }[] = [];

  for (const marca of MARCAS) {
    console.log(`\n▶ ${marca.nome}`);

    try {
      console.log(" [diretor]");
      const d = await criarDiretor(marca);
      diretores.push({ ...d, marca: marca.nome });
    } catch (e: unknown) {
      console.error(`  ERRO diretor ${marca.nome}: ${e.message}`);
    }

    try {
      console.log(" [aluno]");
      const a = await criarAluno(marca);
      alunos.push({ ...a, marca: marca.nome });
    } catch (e: unknown) {
      console.error(`  ERRO aluno ${marca.nome}: ${e.message}`);
    }
  }

  // ─── Resumo ───────────────────────────────────────────────────────────────

  console.log("\n\n═══════════════════════════════════════════════════════");
  console.log("  PERFIS CRIADOS — senha para todos: Teste@2026");
  console.log("═══════════════════════════════════════════════════════\n");

  console.log("DIRETORES (role: direcao_marca)");
  console.log("─────────────────────────────────────────────────────");
  for (const d of diretores) {
    console.log(`  ${d.marca.padEnd(20)} ${d.email}`);
  }

  console.log("\nALUNOS TESTE");
  console.log("─────────────────────────────────────────────────────");
  for (const a of alunos) {
    console.log(`  ${a.marca.padEnd(20)} ${a.email}`);
  }

  console.log("\n═══════════════════════════════════════════════════════");
})();
