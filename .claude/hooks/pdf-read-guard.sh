#!/usr/bin/env bash
# PreToolUse guard (matcher: Read) — bloqueia leitura multimodal direta de PDF
# antes da conversao via pdf2md.sh. Le o JSON do stdin e extrai
# tool_input.file_path via Node (adaptacao: python3 indisponivel nesta maquina;
# Node ja e dependencia obrigatoria do projeto Next.js).
#
# Bypasses (documentados, uso deliberado):
#   PDF_GUARD_DISABLED=1   -> desliga o guard inteiro
#   PDF_VISUAL=1           -> permite leitura visual direta (ex: PDF escaneado,
#                             slides, graficos onde o layout importa)
#
# Caso PDF escaneado sem camada de texto: pdf2md.sh retorna exit 3 — nesse caso
# use PDF_VISUAL=1 + Read multimodal com paginas especificas.
set -euo pipefail

if [ "${PDF_GUARD_DISABLED:-}" = "1" ] || [ "${PDF_VISUAL:-}" = "1" ]; then
  exit 0
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_JSON="$(cat)"

FILE_PATH="$(node -e '
let data = "";
process.stdin.on("data", c => data += c);
process.stdin.on("end", () => {
  try {
    const j = JSON.parse(data);
    process.stdout.write(j?.tool_input?.file_path ?? "");
  } catch {
    process.stdout.write("");
  }
});
' <<< "$INPUT_JSON")"

# Nao e PDF -> libera
case "$FILE_PATH" in
  *.pdf|*.PDF) ;;
  *) exit 0 ;;
esac

MD_PATH="${FILE_PATH%.*}.md"

# .md ja existe e e mais novo que o PDF -> leitura visual deliberada pos-conversao, libera
if [ -f "$MD_PATH" ] && [ "$MD_PATH" -nt "$FILE_PATH" ]; then
  exit 0
fi

cat >&2 << MSG
[pdf-markitdown-guard] Leitura direta de PDF bloqueada — custa ~1.5-2k tokens/pagina como imagem.

Converta primeiro para Markdown (fracao do custo, gravavel e cacheavel):
  1. bash $SCRIPT_DIR/../scripts/pdf2md.sh "$FILE_PATH"
  2. Read "$MD_PATH"

Bypasses documentados:
  - PDF_GUARD_DISABLED=1   desliga o guard
  - PDF_VISUAL=1           leitura visual deliberada (layout/slides/graficos, ou
                           PDF escaneado sem texto — pdf2md.sh retornou exit 3)
MSG
exit 2
