-- Migration: 016 — Enunciado em blocos (texto + imagem alternados)
-- Cada bloco: { "tipo": "texto"|"imagem", "conteudo"?: string, "url"?: string }
-- enunciado (text) continua preenchido como fallback de busca/compatibilidade.
-- enunciado_blocos é a fonte de verdade quando não-null.
--
-- DOWN: ALTER TABLE questao DROP COLUMN IF EXISTS enunciado_blocos;

ALTER TABLE questao ADD COLUMN IF NOT EXISTS enunciado_blocos jsonb;
