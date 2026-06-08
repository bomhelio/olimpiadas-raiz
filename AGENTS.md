<!-- BEGIN:nextjs-agent-rules -->

# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.

<!-- END:nextjs-agent-rules -->

## PDFs — sempre via conversão para Markdown

Nunca ler `.pdf` diretamente. Converter: `bash .claude/scripts/pdf2md.sh "<arquivo.pdf>"` → `Read "<arquivo.md>"`.
Visual deliberado: `PDF_VISUAL=1`. Ver `.claude/rules/pdf-markitdown.md`.
