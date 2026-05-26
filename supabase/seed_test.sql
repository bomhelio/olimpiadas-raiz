-- ============================================================
-- seed_test.sql — Dados fictícios para teste do painel
-- ~8.000+ inscrições distribuídas entre as 6 marcas
-- Execute no Supabase SQL Editor
-- Nota: audit_log registrará todas as inserções (comportamento normal)
-- ============================================================

BEGIN;

-- =============================================================
-- 1. UNIDADES — 4 por marca (ON CONFLICT ignora as existentes)
-- =============================================================
INSERT INTO unidade (marca_id, nome, cidade, estado)
SELECT m.id, v.nome, v.cidade, v.estado
FROM marca m
CROSS JOIN (VALUES
  ('Unidade Centro',   'Rio de Janeiro', 'RJ'),
  ('Unidade Barra',    'Rio de Janeiro', 'RJ'),
  ('Unidade Norte',    'Niterói',        'RJ'),
  ('Unidade Oeste',    'São Gonçalo',    'RJ')
) AS v(nome, cidade, estado)
ON CONFLICT (marca_id, nome) DO NOTHING;

-- =============================================================
-- 2. TURMAS — 7 séries × todas as unidades, ano_letivo 2025
-- =============================================================
INSERT INTO turma (unidade_id, nome, serie, ano_letivo)
SELECT u.id, v.nome, v.serie, 2025
FROM unidade u
CROSS JOIN (VALUES
  ('6A',  '6º ano'),
  ('7A',  '7º ano'),
  ('8A',  '8º ano'),
  ('9A',  '9º ano'),
  ('1EM', '1º EM'),
  ('2EM', '2º EM'),
  ('3EM', '3º EM')
) AS v(nome, serie)
ON CONFLICT (unidade_id, nome, ano_letivo) DO NOTHING;

-- =============================================================
-- 3. ALUNOS — 30 por turma, consentimento = true (obrigatório)
-- =============================================================
INSERT INTO aluno (turma_id, nome, data_nascimento, consentimento_responsavel, consentimento_data, ativo)
SELECT
  t.id,
  -- Nome único dentro de cada turma: Prenome Sobrenome 01..30
  (ARRAY[
    'Ana','João','Maria','Pedro','Lucas','Júlia','Mateus','Larissa',
    'Gabriel','Camila','Rafael','Fernanda','Gustavo','Amanda','Rodrigo',
    'Beatriz','Leonardo','Isabela','Thiago','Mariana','Felipe','Caroline',
    'Vitor','Natália','Henrique','Letícia','Bruno','Débora','Eduardo','Priscila'
  ])[gs]
  || ' '
  || (ARRAY[
    'Silva','Santos','Oliveira','Souza','Lima','Pereira','Costa','Ferreira',
    'Rodrigues','Almeida','Nascimento','Carvalho','Freitas','Melo','Barbosa',
    'Ribeiro','Martins','Gomes','Rocha','Araújo'
  ])[(abs(hashtext(t.id::text)) + gs) % 20 + 1]
  || ' ' || lpad(gs::text, 2, '0') AS nome,
  -- Datas de nascimento variadas: 2006–2012 (13–19 anos em 2025)
  date '2006-01-01' + ((gs * 41 + abs(hashtext(t.id::text)) % 365) % 2192)::int AS data_nascimento,
  true  AS consentimento_responsavel,
  now() - ((abs(hashtext(t.id::text || gs::text)) % 300 + 30) || ' days')::interval AS consentimento_data,
  true  AS ativo
FROM turma t
CROSS JOIN generate_series(1, 30) AS gs
ON CONFLICT (turma_id, nome, data_nascimento) DO NOTHING;

-- =============================================================
-- 4. INSCRIÇÕES — OBMEP (70% dos alunos)
--    distribuição: 60% confirmada, 30% pendente, 10% cancelada
-- =============================================================
INSERT INTO inscricao (olimpiada_id, aluno_id, status, inscrito_em)
SELECT
  o.id,
  a.id,
  (ARRAY[
    'confirmada','confirmada','confirmada','confirmada','confirmada','confirmada',
    'pendente','pendente','pendente',
    'cancelada'
  ])[abs(hashtext(a.id::text || 'obmep')) % 10 + 1]::status_inscricao,
  now() - ((abs(hashtext(a.id::text || 'obmep')) % 55 + 5) || ' days')::interval
FROM olimpiada o
CROSS JOIN aluno a
WHERE o.nome = 'OBMEP'
  AND abs(hashtext(a.id::text || 'obmep')) % 10 < 7
ON CONFLICT (olimpiada_id, aluno_id) DO NOTHING;

-- =============================================================
-- 5. INSCRIÇÕES — OBI (60% dos alunos)
--    distribuição: 50% confirmada, 30% pendente, 20% cancelada
-- =============================================================
INSERT INTO inscricao (olimpiada_id, aluno_id, status, inscrito_em)
SELECT
  o.id,
  a.id,
  (ARRAY[
    'confirmada','confirmada','confirmada','confirmada','confirmada',
    'pendente','pendente','pendente',
    'cancelada','cancelada'
  ])[abs(hashtext(a.id::text || 'obi')) % 10 + 1]::status_inscricao,
  now() - ((abs(hashtext(a.id::text || 'obi')) % 45 + 5) || ' days')::interval
FROM olimpiada o
CROSS JOIN aluno a
WHERE o.nome = 'OBI'
  AND abs(hashtext(a.id::text || 'obi')) % 10 < 6
ON CONFLICT (olimpiada_id, aluno_id) DO NOTHING;

-- =============================================================
-- 6. INSCRIÇÕES — OBFE (50% dos alunos de Apogeu e Matriz Educação)
--    distribuição: 70% confirmada, 30% pendente
-- =============================================================
WITH apogeu_matriz AS (
  SELECT a.id
  FROM aluno a
  JOIN turma  t ON t.id = a.turma_id
  JOIN unidade u ON u.id = t.unidade_id
  JOIN marca   m ON m.id = u.marca_id
  WHERE m.nome IN ('Apogeu', 'Matriz Educação')
)
INSERT INTO inscricao (olimpiada_id, aluno_id, status, inscrito_em)
SELECT
  o.id,
  am.id,
  (ARRAY[
    'confirmada','confirmada','confirmada','confirmada','confirmada',
    'confirmada','confirmada',
    'pendente','pendente','pendente'
  ])[abs(hashtext(am.id::text || 'obfe')) % 10 + 1]::status_inscricao,
  now() - ((abs(hashtext(am.id::text || 'obfe')) % 35 + 5) || ' days')::interval
FROM olimpiada o
CROSS JOIN apogeu_matriz am
WHERE o.nome = 'OBFE'
  AND abs(hashtext(am.id::text || 'obfe')) % 10 < 5
ON CONFLICT (olimpiada_id, aluno_id) DO NOTHING;

-- =============================================================
-- 7. RESULTADOS — fase principal de cada olimpíada
--    Para 70% das inscrições confirmadas
--    Distribuição: 10% ouro, 10% prata, 10% bronze,
--                  10% menção, 40% aprovado, 20% não aprovado
-- =============================================================
WITH fase_principal AS (
  -- Pega a primeira fase de competição (não inscrição, não divulgação)
  SELECT DISTINCT ON (olimpiada_id)
    id    AS fase_id,
    olimpiada_id
  FROM olimpiada_fase
  WHERE tipo NOT IN ('inscricao', 'divulgacao')
  ORDER BY olimpiada_id, ordem
)
INSERT INTO resultado (inscricao_id, fase_id, tipo, registrado_em)
SELECT
  i.id,
  fp.fase_id,
  (ARRAY[
    'ouro','prata','bronze','mencao_honrosa',
    'aprovado','aprovado','aprovado','aprovado',
    'nao_aprovado','nao_aprovado'
  ])[abs(hashtext(i.id::text || fp.fase_id::text)) % 10 + 1]::tipo_resultado,
  now() - ((abs(hashtext(i.id::text)) % 20 + 1) || ' days')::interval
FROM inscricao i
JOIN fase_principal fp ON fp.olimpiada_id = i.olimpiada_id
WHERE i.status = 'confirmada'
  AND abs(hashtext(i.id::text || 'result')) % 10 < 7
ON CONFLICT (inscricao_id, fase_id) DO NOTHING;

COMMIT;

-- =============================================================
-- Contagens esperadas após execução:
-- SELECT 'unidades' AS tabela, count(*) FROM unidade
-- UNION ALL SELECT 'turmas',   count(*) FROM turma
-- UNION ALL SELECT 'alunos',   count(*) FROM aluno
-- UNION ALL SELECT 'inscricoes', count(*) FROM inscricao
-- UNION ALL SELECT 'resultados', count(*) FROM resultado;
-- =============================================================
