-- =============================================================================
-- Migration 029 — Fix questao_unique: incluir `nivel` no constraint
-- =============================================================================
-- Contexto: questao_unique era UNIQUE (olimpiada, fase, ano, numero), sem
-- `nivel`. A OBMEP tem Nível 1/2/3, cada um com seu próprio conjunto de 6
-- questões por fase/ano — ou seja, (olimpiada='obmep', fase=2, ano=2021,
-- numero=1) é uma chave válida tanto para nivel_1 quanto para nivel_2.
-- Sem `nivel` no constraint, ON CONFLICT ON CONSTRAINT questao_unique
-- DO NOTHING descarta silenciosamente questões de níveis diferentes que
-- compartilham (fase, ano, numero) — caso da migration 030 (nivel_2)
-- colidindo com a 027 (nivel_1), ambas fase=2, anos 2021-2025.
-- NULLS NOT DISTINCT preserva o comportamento atual para `obmep_mirim`
-- (nivel = NULL), que não tem sub-nível.
-- =============================================================================
-- DOWN:
--   ALTER TABLE questao DROP CONSTRAINT questao_unique;
--   ALTER TABLE questao ADD CONSTRAINT questao_unique UNIQUE (olimpiada, fase, ano, numero);
-- =============================================================================

ALTER TABLE questao DROP CONSTRAINT questao_unique;
ALTER TABLE questao ADD CONSTRAINT questao_unique UNIQUE NULLS NOT DISTINCT (olimpiada, nivel, fase, ano, numero);
