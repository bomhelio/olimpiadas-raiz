-- =============================================================================
-- Migration: 031 — Rastreamento de login do aluno (Plataforma Olímpica)
-- =============================================================================
-- Adiciona last_login_at e login_count em aluno para o painel de Gestão exibir
-- alunos online agora e os mais frequentes na plataforma, por marca.
-- DOWN:
--   DROP FUNCTION IF EXISTS registrar_login_aluno(uuid);
--   DROP INDEX IF EXISTS idx_aluno_last_login_at;
--   ALTER TABLE aluno DROP COLUMN IF EXISTS last_login_at;
--   ALTER TABLE aluno DROP COLUMN IF EXISTS login_count;
-- =============================================================================

ALTER TABLE aluno
  ADD COLUMN IF NOT EXISTS last_login_at timestamptz,
  ADD COLUMN IF NOT EXISTS login_count integer NOT NULL DEFAULT 0;

CREATE INDEX IF NOT EXISTS idx_aluno_last_login_at
  ON aluno (last_login_at DESC)
  WHERE last_login_at IS NOT NULL;

CREATE OR REPLACE FUNCTION registrar_login_aluno(p_aluno_id uuid)
RETURNS void
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  UPDATE aluno
  SET last_login_at = now(),
      login_count = login_count + 1
  WHERE id = p_aluno_id;
$$;

COMMENT ON FUNCTION registrar_login_aluno IS
  'Registra login do aluno: atualiza last_login_at e incrementa login_count.';
