-- =============================================================================
-- Migration: 004 — Função get_olimpiadas_stats
-- Sistema de Gestão de Olimpíadas do Conhecimento — Raiz Educação
-- =============================================================================
-- Retorna estatísticas agregadas de inscrições e resultados por olimpíada
-- e marca, com filtros de ano letivo, marca e sigla de olimpíada.
--
-- Parâmetros
--   p_anos   int[]   — anos letivos a incluir (obrigatório)
--   p_marcas text[]  — nomes de marcas (array vazio = todas as marcas)
--   p_siglas text[]  — siglas de olimpíadas (array vazio = todas as olimpíadas)
--
-- Nota: array_length('{}', 1) retorna NULL no PostgreSQL, portanto a condição
-- "array_length IS NULL" serve como "sem filtro" para arrays vazios.
--
-- DOWN: DROP FUNCTION IF EXISTS get_olimpiadas_stats(int[], text[], text[]);
-- =============================================================================

CREATE OR REPLACE FUNCTION get_olimpiadas_stats(
  p_anos   int[],
  p_marcas text[],
  p_siglas text[]
)
RETURNS TABLE (
  olimpiada_nome  text,
  marca_nome      text,
  inscritos       bigint,
  participantes   bigint,
  ouro            bigint,
  prata           bigint,
  bronze          bigint,
  mencao          bigint
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    o.nome                                                                 AS olimpiada_nome,
    m.nome                                                                 AS marca_nome,
    count(DISTINCT i.id)                                                   AS inscritos,
    count(DISTINCT i.id) FILTER (WHERE i.status = 'confirmada')            AS participantes,
    count(DISTINCT i.id) FILTER (WHERE r.tipo = 'ouro')                    AS ouro,
    count(DISTINCT i.id) FILTER (WHERE r.tipo = 'prata')                   AS prata,
    count(DISTINCT i.id) FILTER (WHERE r.tipo = 'bronze')                  AS bronze,
    count(DISTINCT i.id) FILTER (WHERE r.tipo = 'mencao_honrosa')           AS mencao
  FROM inscricao i
  JOIN aluno     a  ON a.id = i.aluno_id
  JOIN turma     t  ON t.id = a.turma_id
  JOIN unidade   u  ON u.id = t.unidade_id
  JOIN marca     m  ON m.id = u.marca_id
  JOIN olimpiada o  ON o.id = i.olimpiada_id
  LEFT JOIN resultado r ON r.inscricao_id = i.id
  WHERE o.ano_letivo = ANY(p_anos)
    AND (
      -- Sem filtro quando array vazio (array_length de '{}' = NULL)
      array_length(p_marcas, 1) IS NULL
      OR m.nome = ANY(p_marcas)
    )
    AND (
      array_length(p_siglas, 1) IS NULL
      OR EXISTS (
        SELECT 1
        FROM unnest(p_siglas) AS s(sigla)
        WHERE upper(o.nome) = upper(s.sigla)
           OR upper(o.nome) LIKE upper(s.sigla) || ' %'
           OR upper(o.nome) LIKE upper(s.sigla) || '-%'
      )
    )
  GROUP BY o.nome, m.nome
$$;

COMMENT ON FUNCTION get_olimpiadas_stats IS
  'Agrega inscrições e resultados por (olimpíada, marca) com filtros de ano, marca e sigla.';
