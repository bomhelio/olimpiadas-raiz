#!/usr/bin/env bash
# Conversor PDF -> Markdown com cache, usado pelo guard pdf-read-guard.sh.
#
# Motor: Node + @opendocsg/pdf2md (instalado em .claude/scripts/node_modules).
# Adaptacao deliberada do plano original (markitdown/Python): esta maquina nao
# tem python3/uv/pipx funcionais — apenas Node, ja exigido pelo projeto Next.js.
#
# Uso:
#   bash pdf2md.sh <arquivo.pdf> [saida.md]
#
# Exit codes:
#   0 = ok (convertido ou cache hit)
#   2 = motor de conversao indisponivel (node_modules ausente)
#   3 = falha na conversao OU PDF escaneado sem texto (usar PDF_VISUAL=1)
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PDF="${1:-}"
OUT="${2:-}"

if [ -z "$PDF" ]; then
  echo "uso: bash pdf2md.sh <arquivo.pdf> [saida.md]" >&2
  exit 2
fi
if [ ! -f "$PDF" ]; then
  echo "[erro] arquivo nao encontrado: $PDF" >&2
  exit 2
fi
if [ -z "$OUT" ]; then
  OUT="${PDF%.*}.md"
fi

# CACHE: reusar .md existente se mais novo que o .pdf
if [ -f "$OUT" ] && [ "$OUT" -nt "$PDF" ]; then
  echo "[cache] ja convertido: $OUT"
  exit 0
fi

# Resolver motor de conversao (node + lib local em .claude/scripts/node_modules)
if [ ! -d "$SCRIPT_DIR/node_modules/@opendocsg/pdf2md" ]; then
  echo "[erro] motor de conversao nao instalado." >&2
  echo "Instale com: cd '$SCRIPT_DIR' && npm install" >&2
  exit 2
fi

if ! node "$SCRIPT_DIR/pdf2md.mjs" "$PDF" "$OUT"; then
  rm -f "$OUT"
  echo "[erro] conversao falhou ou PDF escaneado sem texto — use PDF_VISUAL=1 + Read multimodal com 'pages'." >&2
  exit 3
fi

exit 0
