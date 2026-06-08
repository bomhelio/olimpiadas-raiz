---
description: "100% dos PDFs via conversao para Markdown antes de leitura"
paths:
  - "**/*.pdf"
  - "**/*.PDF"
---

# PDFs sempre via conversao para Markdown

Read multimodal de PDF custa ~1.5-2k tokens/pagina (renderizado como imagem).
O `.md` extraido custa fração disso, é grepável e cacheável.

**Adaptação desta máquina**: o plano original usava `markitdown` (Python). Esta
máquina não tem `python3`/`uv`/`pipx` funcionais — só Node (já exigido pelo
projeto Next.js). O motor de conversão é `@opendocsg/pdf2md`, instalado isolado
em `.claude/scripts/node_modules` (não polui as deps do app).

## Comando

```bash
bash .claude/scripts/pdf2md.sh "<arquivo.pdf>"   # gera <arquivo>.md ao lado
Read "<arquivo.md>"
```

Cache automático: se o `.md` já existe e é mais novo que o `.pdf`, reusa
(`[cache] ja convertido`). Header de proveniência na 1ª linha do `.md` gerado.

## Matriz texto vs visual

| Necessidade                                           | Caminho                                                                                      |
| ----------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| Extrair texto/tabelas (relatórios, contratos, specs)  | `pdf2md.sh` → Read/Grep no `.md` (DEFAULT)                                                   |
| Análise VISUAL (layout, slides, gráficos como imagem) | Converter PRIMEIRO (referência textual), depois `PDF_VISUAL=1` + Read multimodal com `pages` |
| PDF escaneado sem texto (`pdf2md.sh` retorna exit 3)  | `PDF_VISUAL=1` + Read multimodal com `pages`                                                 |
| Buscar termo em N PDFs                                | Converter todos em loop, Grep nos `.md`                                                      |

## Enforcement

Hook `PreToolUse` (`pdf-read-guard.sh`, matcher `Read`) bloqueia (`exit 2`)
leitura direta de `.pdf`/`.PDF` quando não existe `.md` mais novo ao lado —
instrui a converter primeiro.

**Bypasses documentados**:

- `PDF_GUARD_DISABLED=1` — desliga o guard inteiro
- `PDF_VISUAL=1` — leitura visual deliberada (layout/slides/gráficos, ou PDF
  escaneado sem texto)

## Anti-patterns

- Read direto de `.pdf` "para ver o que tem"
- Reconverter ignorando o cache (`pdf2md.sh` já reusa automaticamente)
- Colar conteúdo extraído inline em prompt de subagent — passar o PATH do `.md`
- Editar o `.md` gerado manualmente (é regenerado a cada conversão)
- Pular conversão "porque é só 1 página" — o hook bloqueia de qualquer forma
