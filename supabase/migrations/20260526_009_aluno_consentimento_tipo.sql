-- =============================================================================
-- Migration: 009 — Tipo do responsável no consentimento do aluno
-- Adiciona campo para identificar se é responsável pedagógico ou financeiro.
-- =============================================================================
-- DOWN: ALTER TABLE aluno DROP COLUMN consentimento_responsavel_tipo;
-- =============================================================================

ALTER TABLE aluno
  ADD COLUMN consentimento_responsavel_tipo text
    CHECK (consentimento_responsavel_tipo IN ('pedagogico', 'financeiro'));
