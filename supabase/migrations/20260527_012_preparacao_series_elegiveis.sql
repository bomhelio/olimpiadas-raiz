-- =============================================================================
-- Migration: 012 — Séries elegíveis por projeto de preparação
-- Permite direcionar cada projeto a séries/segmentos específicos.
-- =============================================================================
-- DOWN: ALTER TABLE preparacao_projeto DROP COLUMN series_elegiveis;
-- =============================================================================

ALTER TABLE preparacao_projeto
  ADD COLUMN series_elegiveis text[] NOT NULL DEFAULT '{}';

-- Array vazio = todas as séries da olimpíada (sem restrição).
-- Array não-vazio = somente as séries listadas têm acesso no portal do aluno.

CREATE INDEX idx_prep_projeto_series ON preparacao_projeto USING gin (series_elegiveis);
