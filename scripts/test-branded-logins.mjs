import { chromium } from "playwright";
import path from "path";
import fs from "fs";

const BASE = "https://olimpiadas-raiz.vercel.app";
const OUT = path.join(process.cwd(), "preview-docs", "screenshots");
if (!fs.existsSync(OUT)) fs.mkdirSync(OUT, { recursive: true });

const TESTS = [
  // Diretores
  { url: `${BASE}/login?marca=americano`, file: "dir-americano.png" },
  { url: `${BASE}/login?marca=apogeu`, file: "dir-apogeu.png" },
  { url: `${BASE}/login?marca=matriz-educacao`, file: "dir-matriz.png" },
  { url: `${BASE}/login?marca=qi-bilingue`, file: "dir-qi.png" },
  { url: `${BASE}/login?marca=uniao`, file: "dir-uniao.png" },
  { url: `${BASE}/login?marca=unificado`, file: "dir-unificado.png" },
  // Alunos
  { url: `${BASE}/aluno/login?marca=americano`, file: "aluno-americano.png" },
  { url: `${BASE}/aluno/login?marca=apogeu`, file: "aluno-apogeu.png" },
  { url: `${BASE}/aluno/login?marca=matriz-educacao`, file: "aluno-matriz.png" },
  { url: `${BASE}/aluno/login?marca=qi-bilingue`, file: "aluno-qi.png" },
  { url: `${BASE}/aluno/login?marca=uniao`, file: "aluno-uniao.png" },
  { url: `${BASE}/aluno/login?marca=unificado`, file: "aluno-unificado.png" },
];

const browser = await chromium.launch({ headless: true });
const ctx = await browser.newContext({ viewport: { width: 500, height: 700 } });
const page = await ctx.newPage();

for (const t of TESTS) {
  console.log(`→ ${t.file}`);
  await page.goto(t.url, { waitUntil: "networkidle" });
  await page.screenshot({ path: path.join(OUT, t.file), fullPage: false });
}

await browser.close();
console.log(`\nScreenshots salvos em: ${OUT}`);
