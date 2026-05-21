-- =============================================================================
-- Seed Histórico Fictício 2024–2025
-- Participação das 6 marcas em OBMEP, OBF e OBA para teste das páginas
-- Painel e Olimpíadas.
-- Idempotente — pode ser re-executado sem erros.
-- =============================================================================

-- ---------------------------------------------------------------------------
-- OLIMPÍADAS 2024
-- ---------------------------------------------------------------------------

INSERT INTO olimpiada (
  id, nome, area_conhecimento, classificacao,
  organizacao_promotora, premiacao,
  series_elegiveis, faixa_etaria_min, faixa_etaria_max,
  ano_letivo, ativo
) VALUES
  (
    '44444444-0000-2024-0001-000000000001',
    'OBMEP 2024 — Olimpíada Brasileira de Matemática das Escolas Públicas e Privadas',
    'Matemática', 'obrigatoria', 'IMPA / SBM',
    'Medalha de Ouro, Prata, Bronze, Menção Honrosa + bolsas de estudo',
    ARRAY['6º ano','7º ano','8º ano','9º ano','1º EM','2º EM','3º EM'],
    11, 19, 2024, true
  ),
  (
    '44444444-0000-2024-0002-000000000001',
    'OBF 2024 — Olimpíada Brasileira de Física',
    'Física', 'facultativa', 'Sociedade Brasileira de Física',
    'Medalhas de Ouro, Prata, Bronze',
    ARRAY['8º ano','9º ano','1º EM','2º EM','3º EM'],
    13, 19, 2024, true
  ),
  (
    '44444444-0000-2024-0003-000000000001',
    'OBA 2024 — Olimpíada Brasileira de Astronomia e Astronáutica',
    'Astronomia', 'facultativa', 'AEB / OBA',
    'Medalhas + certificados',
    ARRAY['5º ano','6º ano','7º ano','8º ano','9º ano','1º EM','2º EM','3º EM'],
    10, 19, 2024, true
  )
ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- OLIMPÍADAS 2025
-- ---------------------------------------------------------------------------

INSERT INTO olimpiada (
  id, nome, area_conhecimento, classificacao,
  organizacao_promotora, premiacao,
  series_elegiveis, faixa_etaria_min, faixa_etaria_max,
  ano_letivo, ativo
) VALUES
  (
    '44444444-0000-2025-0001-000000000001',
    'OBMEP 2025 — Olimpíada Brasileira de Matemática das Escolas Públicas e Privadas',
    'Matemática', 'obrigatoria', 'IMPA / SBM',
    'Medalha de Ouro, Prata, Bronze, Menção Honrosa + bolsas de estudo',
    ARRAY['6º ano','7º ano','8º ano','9º ano','1º EM','2º EM','3º EM'],
    11, 19, 2025, true
  ),
  (
    '44444444-0000-2025-0002-000000000001',
    'OBF 2025 — Olimpíada Brasileira de Física',
    'Física', 'facultativa', 'Sociedade Brasileira de Física',
    'Medalhas de Ouro, Prata, Bronze',
    ARRAY['8º ano','9º ano','1º EM','2º EM','3º EM'],
    13, 19, 2025, true
  ),
  (
    '44444444-0000-2025-0003-000000000001',
    'OBA 2025 — Olimpíada Brasileira de Astronomia e Astronáutica',
    'Astronomia', 'facultativa', 'AEB / OBA',
    'Medalhas + certificados',
    ARRAY['5º ano','6º ano','7º ano','8º ano','9º ano','1º EM','2º EM','3º EM'],
    10, 19, 2025, true
  )
ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- FASES 2024
-- ID scheme: 55555555-00{ordem}-{ano}-{olim_idx (4)}-000000000001
-- ordem: 01=prova_1, 02=divulgacao
-- ---------------------------------------------------------------------------

INSERT INTO olimpiada_fase (id, olimpiada_id, tipo, nome, data_inicio, data_fim, ordem) VALUES
  -- OBMEP 2024
  ('55555555-0001-2024-0001-000000000001', '44444444-0000-2024-0001-000000000001',
   'prova_1',    '1ª Fase OBMEP 2024',       '2024-08-20', '2024-08-20', 1),
  ('55555555-0002-2024-0001-000000000001', '44444444-0000-2024-0001-000000000001',
   'divulgacao', 'Divulgação Resultados OBMEP 2024', '2024-11-15', '2024-11-15', 2),
  -- OBF 2024
  ('55555555-0001-2024-0002-000000000001', '44444444-0000-2024-0002-000000000001',
   'prova_1',    '1ª Fase OBF 2024',          '2024-07-15', '2024-07-15', 1),
  ('55555555-0002-2024-0002-000000000001', '44444444-0000-2024-0002-000000000001',
   'divulgacao', 'Divulgação Resultados OBF 2024', '2024-10-10', '2024-10-10', 2),
  -- OBA 2024
  ('55555555-0001-2024-0003-000000000001', '44444444-0000-2024-0003-000000000001',
   'prova_1',    '1ª Fase OBA 2024',          '2024-06-10', '2024-06-10', 1),
  ('55555555-0002-2024-0003-000000000001', '44444444-0000-2024-0003-000000000001',
   'divulgacao', 'Divulgação Resultados OBA 2024', '2024-09-20', '2024-09-20', 2)
ON CONFLICT DO NOTHING;

-- FASES 2025

INSERT INTO olimpiada_fase (id, olimpiada_id, tipo, nome, data_inicio, data_fim, ordem) VALUES
  -- OBMEP 2025
  ('55555555-0001-2025-0001-000000000001', '44444444-0000-2025-0001-000000000001',
   'prova_1',    '1ª Fase OBMEP 2025',       '2025-08-19', '2025-08-19', 1),
  ('55555555-0002-2025-0001-000000000001', '44444444-0000-2025-0001-000000000001',
   'divulgacao', 'Divulgação Resultados OBMEP 2025', '2025-11-14', '2025-11-14', 2),
  -- OBF 2025
  ('55555555-0001-2025-0002-000000000001', '44444444-0000-2025-0002-000000000001',
   'prova_1',    '1ª Fase OBF 2025',          '2025-07-14', '2025-07-14', 1),
  ('55555555-0002-2025-0002-000000000001', '44444444-0000-2025-0002-000000000001',
   'divulgacao', 'Divulgação Resultados OBF 2025', '2025-10-09', '2025-10-09', 2),
  -- OBA 2025
  ('55555555-0001-2025-0003-000000000001', '44444444-0000-2025-0003-000000000001',
   'prova_1',    '1ª Fase OBA 2025',          '2025-06-09', '2025-06-09', 1),
  ('55555555-0002-2025-0003-000000000001', '44444444-0000-2025-0003-000000000001',
   'divulgacao', 'Divulgação Resultados OBA 2025', '2025-09-19', '2025-09-19', 2)
ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- OLIMPIADA_MARCA — todas as 6 marcas para as 6 olimpíadas 2024/2025
-- ---------------------------------------------------------------------------

INSERT INTO olimpiada_marca (olimpiada_id, marca_id)
SELECT o.id, m.id
FROM olimpiada o
CROSS JOIN marca m
WHERE o.id IN (
  '44444444-0000-2024-0001-000000000001',
  '44444444-0000-2024-0002-000000000001',
  '44444444-0000-2024-0003-000000000001',
  '44444444-0000-2025-0001-000000000001',
  '44444444-0000-2025-0002-000000000001',
  '44444444-0000-2025-0003-000000000001'
)
ON CONFLICT DO NOTHING;

-- ---------------------------------------------------------------------------
-- TURMAS, ALUNOS, INSCRIÇÕES, RESULTADOS (via bloco PLpgSQL)
--
-- Turmas: 1 por unidade por ano = 8 × 2 = 16 turmas
-- Alunos: 10 por turma = 160 alunos
--
-- Taxas de inscrição (de 10 alunos):
--   OBMEP: 10/10 (obrigatória)
--   OBF:    5/10 (facultativa — menor adesão)
--   OBA:    7/10 (facultativa — maior adesão)
--
-- Status: ~70% confirmada, ~20% pendente, ~10% cancelada
--
-- Medalhas por unidade (confirmadas):
--   ouro / prata / bronze / menção / aprovado — resto = nao_aprovado
--   Apogeu (u1,u2) > Matriz (u3,u4) > QI/União > Unificado/Americano
--
-- Turma UUID: 33333333-00{YY}-{YYYY}-{UUUU}-000000000001
-- Olimpiada UUID: 44444444-0000-{YYYY}-{OOOO}-000000000001
-- ---------------------------------------------------------------------------

DO $$
DECLARE
  -- unidades (ordem: Apogeu Barra, Apogeu Botafogo, Matriz Centro, Matriz Niterói,
  --           QI Bilíngue Recreio, União Tijuca, Unificado São Gonçalo, Americano Méier)
  v_unidades uuid[] := ARRAY[
    '22222222-0000-0000-0000-000000000001'::uuid,
    '22222222-0000-0000-0000-000000000002'::uuid,
    '22222222-0000-0000-0000-000000000003'::uuid,
    '22222222-0000-0000-0000-000000000004'::uuid,
    '22222222-0000-0000-0000-000000000005'::uuid,
    '22222222-0000-0000-0000-000000000006'::uuid,
    '22222222-0000-0000-0000-000000000007'::uuid,
    '22222222-0000-0000-0000-000000000008'::uuid
  ];

  v_nomes text[] := ARRAY[
    'Ana Silva',      'Bruno Costa',     'Carla Santos',   'Daniel Oliveira',
    'Eduarda Lima',   'Felipe Souza',    'Gabriela Pereira','Henrique Alves',
    'Isabela Martins','João Rocha'
  ];

  -- inscrição: quantos dos 10 alunos são inscritos em cada olimpíada (1=OBMEP,2=OBF,3=OBA)
  v_inscr_rates int[] := ARRAY[10, 5, 7];

  -- thresholds de medalhas por unidade (por olimpíada, ~7 confirmados OBMEP)
  --                          u1  u2  u3  u4  u5  u6  u7  u8
  v_ouro_t   int[] := ARRAY[ 1,  1,  0,  0,  0,  0,  0,  0];
  v_prata_t  int[] := ARRAY[ 1,  1,  1,  1,  0,  0,  0,  0];
  v_bronze_t int[] := ARRAY[ 2,  1,  1,  1,  1,  1,  0,  0];
  v_mencao_t int[] := ARRAY[ 2,  2,  2,  2,  2,  1,  1,  1];
  v_aprov_t  int[] := ARRAY[ 1,  1,  1,  1,  2,  2,  2,  2];

  v_ano           int;
  v_u_idx         int;
  v_o_idx         int;
  v_a_idx         int;
  v_u_id          uuid;
  v_o_id          uuid;
  v_fase_id       uuid;
  v_turma_id      uuid;
  v_aluno_id      uuid;
  v_inscricao_id  uuid;
  v_status        status_inscricao;
  v_tipo          tipo_resultado;
  v_confirmado_n  int;
  v_status_hash   int;
  v_cum           int;

BEGIN

  -- -------------------------------------------------------------------------
  -- Fase 1: Turmas e alunos
  -- -------------------------------------------------------------------------
  FOREACH v_ano IN ARRAY ARRAY[2024, 2025] LOOP
    FOR v_u_idx IN 1..8 LOOP
      v_u_id    := v_unidades[v_u_idx];
      v_turma_id := (
        '33333333-00' || lpad((v_ano % 100)::text, 2, '0')
        || '-' || v_ano::text
        || '-' || lpad(v_u_idx::text, 4, '0')
        || '-000000000001'
      )::uuid;

      INSERT INTO turma (id, unidade_id, nome, serie, ano_letivo, ativo)
      VALUES (v_turma_id, v_u_id, '6A', '6º ano', v_ano, true)
      ON CONFLICT (unidade_id, nome, ano_letivo) DO NOTHING;

      FOR v_a_idx IN 1..10 LOOP
        INSERT INTO aluno (turma_id, nome, data_nascimento, consentimento_responsavel, ativo)
        VALUES (
          v_turma_id,
          v_nomes[v_a_idx],
          make_date(2012, ((v_a_idx - 1) % 12) + 1, 15),
          true, true
        )
        ON CONFLICT (turma_id, nome, data_nascimento) DO NOTHING;
      END LOOP;
    END LOOP;
  END LOOP;

  -- -------------------------------------------------------------------------
  -- Fase 2: Inscrições e resultados
  -- -------------------------------------------------------------------------
  FOREACH v_ano IN ARRAY ARRAY[2024, 2025] LOOP
    FOR v_o_idx IN 1..3 LOOP
      -- olimpíada UUID deterministico
      v_o_id := (
        '44444444-0000-' || v_ano::text
        || '-000' || v_o_idx::text
        || '-000000000001'
      )::uuid;

      -- prova_1 fase para registrar resultados
      SELECT id INTO v_fase_id
      FROM olimpiada_fase
      WHERE olimpiada_id = v_o_id AND tipo = 'prova_1'
      LIMIT 1;

      FOR v_u_idx IN 1..8 LOOP
        v_turma_id := (
          '33333333-00' || lpad((v_ano % 100)::text, 2, '0')
          || '-' || v_ano::text
          || '-' || lpad(v_u_idx::text, 4, '0')
          || '-000000000001'
        )::uuid;

        v_confirmado_n := 0;

        FOR v_a_idx IN 1..v_inscr_rates[v_o_idx] LOOP
          -- buscar aluno pelo índice de posição na turma
          SELECT id INTO v_aluno_id
          FROM aluno
          WHERE turma_id = v_turma_id
          ORDER BY nome
          OFFSET v_a_idx - 1
          LIMIT 1;

          CONTINUE WHEN v_aluno_id IS NULL;

          -- status deterministico: 0-6=confirmada, 7-8=pendente, 9=cancelada
          v_status_hash := (
            v_a_idx * 7 + v_u_idx * 3 + v_o_idx * 11 + (v_ano - 2023) * 13
          ) % 10;

          IF v_status_hash < 7 THEN
            v_status := 'confirmada';
          ELSIF v_status_hash < 9 THEN
            v_status := 'pendente';
          ELSE
            v_status := 'cancelada';
          END IF;

          -- inscrição
          v_inscricao_id := NULL;
          INSERT INTO inscricao (olimpiada_id, aluno_id, status)
          VALUES (v_o_id, v_aluno_id, v_status)
          ON CONFLICT (olimpiada_id, aluno_id) DO NOTHING
          RETURNING id INTO v_inscricao_id;

          -- se houve conflito, buscar id existente
          IF v_inscricao_id IS NULL THEN
            SELECT id INTO v_inscricao_id
            FROM inscricao
            WHERE olimpiada_id = v_o_id AND aluno_id = v_aluno_id;
          END IF;

          -- resultado apenas para confirmadas com fase disponível
          CONTINUE WHEN v_status <> 'confirmada'
                     OR v_fase_id IS NULL
                     OR v_inscricao_id IS NULL;

          v_confirmado_n := v_confirmado_n + 1;

          -- tipo de resultado por posição na fila de confirmados
          v_cum := v_ouro_t[v_u_idx];
          IF v_confirmado_n <= v_cum THEN
            v_tipo := 'ouro';
          ELSE
            v_cum := v_cum + v_prata_t[v_u_idx];
            IF v_confirmado_n <= v_cum THEN
              v_tipo := 'prata';
            ELSE
              v_cum := v_cum + v_bronze_t[v_u_idx];
              IF v_confirmado_n <= v_cum THEN
                v_tipo := 'bronze';
              ELSE
                v_cum := v_cum + v_mencao_t[v_u_idx];
                IF v_confirmado_n <= v_cum THEN
                  v_tipo := 'mencao_honrosa';
                ELSE
                  v_cum := v_cum + v_aprov_t[v_u_idx];
                  IF v_confirmado_n <= v_cum THEN
                    v_tipo := 'aprovado';
                  ELSE
                    v_tipo := 'nao_aprovado';
                  END IF;
                END IF;
              END IF;
            END IF;
          END IF;

          INSERT INTO resultado (inscricao_id, fase_id, tipo)
          VALUES (v_inscricao_id, v_fase_id, v_tipo)
          ON CONFLICT (inscricao_id, fase_id) DO NOTHING;

        END LOOP; -- a_idx
      END LOOP; -- u_idx
    END LOOP; -- o_idx
  END LOOP; -- ano

END;
$$;
