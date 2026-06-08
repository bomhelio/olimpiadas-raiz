#!/usr/bin/env node
// Conversor PDF -> Markdown (motor Node, substitui markitdown — Python/uv/pipx
// indisponiveis nesta maquina). Usado por pdf2md.sh; nao chamar diretamente.
import { readFileSync, writeFileSync, statSync } from "node:fs";
import { basename } from "node:path";
import pdf2md from "@opendocsg/pdf2md";

const [, , pdfPath, outPath] = process.argv;
if (!pdfPath || !outPath) {
  console.error("uso: node pdf2md.mjs <entrada.pdf> <saida.md>");
  process.exit(2);
}

const pdfBuffer = readFileSync(pdfPath);
const pdfSize = statSync(pdfPath).size;

let text;
try {
  text = await pdf2md(pdfBuffer);
} catch (err) {
  console.error(`[erro] falha ao converter ${pdfPath}: ${err.message}`);
  process.exit(3);
}

const trimmed = text.trim();
if (trimmed.length < 50) {
  console.error(
    `[aviso] saida com apenas ${trimmed.length} chars — provavel PDF escaneado sem camada de texto.`,
  );
  console.error("Use PDF_VISUAL=1 e leia o PDF original via Read multimodal com 'pages'.");
  process.exit(3);
}

const stamp = new Date().toISOString();
const header = `<!-- gerado por pdf2md (node/@opendocsg/pdf2md) de ${basename(pdfPath)} em ${stamp} — nao editar manualmente -->\n\n`;
writeFileSync(outPath, header + text, "utf-8");

const chars = trimmed.length;
const tokensEst = Math.round(chars / 4);
console.log(
  `[ok] ${outPath} (${chars} chars ~ ${tokensEst} tokens) — PDF original: ${pdfSize} bytes`,
);
