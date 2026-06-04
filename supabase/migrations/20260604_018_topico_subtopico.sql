-- Migration: 018 — Substituir assunto por topico + subtopico
-- assunto permanece na tabela para compatibilidade com dados anteriores
--
-- DOWN:
--   ALTER TABLE questao DROP COLUMN IF EXISTS topico;
--   ALTER TABLE questao DROP COLUMN IF EXISTS subtopico;

ALTER TABLE questao ADD COLUMN IF NOT EXISTS topico text;
ALTER TABLE questao ADD COLUMN IF NOT EXISTS subtopico text;

CREATE INDEX IF NOT EXISTS idx_questao_topico ON questao (topico);
