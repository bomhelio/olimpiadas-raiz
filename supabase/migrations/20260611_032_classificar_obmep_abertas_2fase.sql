-- =============================================================================
-- Migration 032 — Classificação de subtópico/dificuldade
-- OBMEP · 2ª Fase (questões abertas) · Níveis 1 e 2 · 2021–2025
-- Mantém coerência com a taxonomia já usada nas questões de múltipla escolha
-- (nivel_1, 1ª fase). Subtópico "Grafos e conexidade" (Combinatória) é novo,
-- introduzido para os dois problemas de teoria dos grafos do nível 2.
-- =============================================================================
-- DOWN: UPDATE questao SET subtopico = NULL, dificuldade = NULL WHERE olimpiada='obmep' AND tipo='aberta' AND fase=2;
-- =============================================================================

-- ─── NÍVEL 1 ────────────────────────────────────────────────────────────────

-- 2021 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Equações lineares',          dificuldade = 'medio'         WHERE id = 'c5c72b59-8cb9-48e8-9c67-f3af57101f52'; -- N1 2021 Q1 (Aritmética)
UPDATE questao SET subtopico = 'Contagem e enumeração',      dificuldade = 'facil'         WHERE id = '15ba75f9-71ea-476c-8038-e2723c3ac972'; -- N1 2021 Q2 (Combinatória)
UPDATE questao SET subtopico = 'Áreas e perímetros',         dificuldade = 'medio'         WHERE id = 'c0244db2-7c8d-4ab7-b359-3d63f812e3f4'; -- N1 2021 Q3 (Geometria)
UPDATE questao SET subtopico = 'Frações e números racionais',dificuldade = 'dificil'       WHERE id = '3b6bd92a-9e8a-4880-9b5c-2f4f3e85942b'; -- N1 2021 Q4 (Aritmética)
UPDATE questao SET subtopico = 'Contagem e enumeração',      dificuldade = 'dificil'       WHERE id = 'c1e12545-5e51-464a-a800-d5e97f527956'; -- N1 2021 Q5 (Combinatória)
UPDATE questao SET subtopico = 'Contagem e enumeração',      dificuldade = 'muito_dificil' WHERE id = '921a1491-4198-488b-85ff-702408ac7677'; -- N1 2021 Q6 (Combinatória)

-- 2022 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Criptaritmética',             dificuldade = 'medio'         WHERE id = '9a64b212-b8f3-47c8-a509-7ad9793dd370'; -- N1 2022 Q1 (Aritmética)
UPDATE questao SET subtopico = 'Operações e cálculo',         dificuldade = 'medio'         WHERE id = 'ce4f5608-8693-459d-a007-da85a3d17cfa'; -- N1 2022 Q2 (Aritmética)
UPDATE questao SET subtopico = 'Velocidade e percurso',       dificuldade = 'dificil'       WHERE id = 'a1edad8d-d56f-4753-8dfc-613c4522ec36'; -- N1 2022 Q3 (Aritmética)
UPDATE questao SET subtopico = 'Áreas e perímetros',          dificuldade = 'medio'         WHERE id = 'c625b0c3-777d-4da4-8b7b-fe9391490e9b'; -- N1 2022 Q4 (Geometria)
UPDATE questao SET subtopico = 'Arranjos e combinações',      dificuldade = 'muito_dificil' WHERE id = 'bceb8808-1cc9-466d-be7f-b0338131f529'; -- N1 2022 Q5 (Combinatória)
UPDATE questao SET subtopico = 'Princípio da casa dos pombos',dificuldade = 'muito_dificil' WHERE id = 'c064a034-e49f-416e-9c1d-cb65145fb64e'; -- N1 2022 Q6 (Combinatória)

-- 2023 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Operações e cálculo',         dificuldade = 'medio'   WHERE id = '05d61d8f-71d0-4f71-87ca-645740ee7a49'; -- N1 2023 Q1 (Aritmética)
UPDATE questao SET subtopico = 'Áreas e perímetros',          dificuldade = 'medio'   WHERE id = '93ca56b4-77d8-40ed-b353-15d4c5c63b59'; -- N1 2023 Q2 (Geometria)
UPDATE questao SET subtopico = 'Múltiplos e divisores',       dificuldade = 'dificil' WHERE id = 'd9145dfb-c49e-4a9b-bb3a-e3f27fb2491a'; -- N1 2023 Q3 (Números)
UPDATE questao SET subtopico = 'Operações e cálculo',         dificuldade = 'dificil' WHERE id = '908053f8-f269-48c8-b7f3-d49e40ca597c'; -- N1 2023 Q4 (Aritmética)
UPDATE questao SET subtopico = 'Arranjos e combinações',      dificuldade = 'dificil' WHERE id = '7aa7aa97-ef8b-4a24-abd3-4a9054a48fb9'; -- N1 2023 Q5 (Combinatória)
UPDATE questao SET subtopico = 'Princípio da casa dos pombos',dificuldade = 'dificil' WHERE id = '54b44ad5-25fa-44f6-a039-340f1e4efca6'; -- N1 2023 Q6 (Combinatória)

-- 2024 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Verdade e mentira',      dificuldade = 'medio'         WHERE id = '739b1b46-ec31-4920-a20c-579ec2160d9d'; -- N1 2024 Q1 (Lógica)
UPDATE questao SET subtopico = 'Operações e cálculo',    dificuldade = 'medio'         WHERE id = '6e68fcea-14e1-4900-bdb5-522da903568e'; -- N1 2024 Q2 (Aritmética)
UPDATE questao SET subtopico = 'Áreas e perímetros',     dificuldade = 'medio'         WHERE id = '9d4219cf-5782-4052-ba0d-7daf7704c09d'; -- N1 2024 Q3 (Geometria)
UPDATE questao SET subtopico = 'Múltiplos e divisores',  dificuldade = 'dificil'       WHERE id = '5aae3018-346e-43aa-ab27-33a055c82ada'; -- N1 2024 Q4 (Números)
UPDATE questao SET subtopico = 'Contagem e enumeração',  dificuldade = 'dificil'       WHERE id = '4388c082-5147-4290-8bc3-8d0b2682506d'; -- N1 2024 Q5 (Combinatória)
UPDATE questao SET subtopico = 'Arranjos e combinações', dificuldade = 'muito_dificil' WHERE id = '96dd10a6-378e-4055-be9b-a8296d9b03fb'; -- N1 2024 Q6 (Combinatória)

-- 2025 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Equações lineares',           dificuldade = 'dificil' WHERE id = '5a3d2a3d-cf40-4c9d-8ed9-6f0ac98ec067'; -- N1 2025 Q1 (Aritmética)
UPDATE questao SET subtopico = 'Frações e números racionais', dificuldade = 'dificil' WHERE id = 'bf74b947-b29c-4e81-a378-3af7dd9da3b5'; -- N1 2025 Q2 (Aritmética)
UPDATE questao SET subtopico = 'Verdade e mentira',           dificuldade = 'medio'   WHERE id = '69aade37-267d-4097-adfe-d9eb5d510ad0'; -- N1 2025 Q3 (Lógica)
UPDATE questao SET subtopico = 'Equações lineares',           dificuldade = 'dificil' WHERE id = 'c41bf78b-45da-4096-96f7-2244ae49d9f3'; -- N1 2025 Q4 (Aritmética)
UPDATE questao SET subtopico = 'Geometria espacial',          dificuldade = 'dificil' WHERE id = '108366ab-4562-4710-bc7a-947567b24c23'; -- N1 2025 Q5 (Geometria)
UPDATE questao SET subtopico = 'Operações e cálculo',         dificuldade = 'medio'   WHERE id = 'a11f2af9-cb92-47f3-9152-1bb7d96753cd'; -- N1 2025 Q6 (Aritmética)

-- ─── NÍVEL 2 ────────────────────────────────────────────────────────────────

-- 2021 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Dedução lógica',               dificuldade = 'medio'         WHERE id = 'fe235bfe-e4dc-4a8d-82dd-e80a7f4c9d95'; -- N2 2021 Q1 (Lógica)
UPDATE questao SET subtopico = 'Frações e números racionais',  dificuldade = 'dificil'       WHERE id = '5f8eba6c-aeb3-4ae7-b66a-31fe25887809'; -- N2 2021 Q2 (Aritmética)
UPDATE questao SET subtopico = 'Operações e cálculo',          dificuldade = 'dificil'       WHERE id = 'ea34468e-7ca7-4d2b-bd56-683bf0960bbd'; -- N2 2021 Q3 (Aritmética)
UPDATE questao SET subtopico = 'Contagem e enumeração',        dificuldade = 'dificil'       WHERE id = '33beeff4-3bec-483f-b005-e890d281025a'; -- N2 2021 Q4 (Combinatória)
UPDATE questao SET subtopico = 'Áreas e perímetros',           dificuldade = 'muito_dificil' WHERE id = 'a8315acd-cd89-4491-8b98-9c0f902c7777'; -- N2 2021 Q5 (Geometria)
UPDATE questao SET subtopico = 'Grafos e conexidade',          dificuldade = 'muito_dificil' WHERE id = '159ed79c-0989-4941-8ff4-26ba14dbb0f3'; -- N2 2021 Q6 (Combinatória)

-- 2022 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Arranjos e combinações', dificuldade = 'medio'         WHERE id = '74a452d2-d5d9-4d6f-a3e3-fa71accfddf6'; -- N2 2022 Q1 (Combinatória)
UPDATE questao SET subtopico = 'Dedução lógica',         dificuldade = 'medio'         WHERE id = '2effe79a-3e25-46d4-b040-474b16be23c0'; -- N2 2022 Q2 (Lógica)
UPDATE questao SET subtopico = 'Áreas e perímetros',     dificuldade = 'medio'         WHERE id = '679de5c9-c785-42ca-a488-d31d57e1b5dc'; -- N2 2022 Q3 (Geometria)
UPDATE questao SET subtopico = 'Múltiplos e divisores',  dificuldade = 'dificil'       WHERE id = 'd90b1f1a-14c8-4e46-90dc-16b4167cdf79'; -- N2 2022 Q4 (Números)
UPDATE questao SET subtopico = 'Dedução lógica',         dificuldade = 'muito_dificil' WHERE id = '23decd61-d10c-4944-9fa1-99f93a1a2c2b'; -- N2 2022 Q5 (Lógica)
UPDATE questao SET subtopico = 'Grafos e conexidade',    dificuldade = 'muito_dificil' WHERE id = '4058d124-56df-4ff2-9cb3-02dc645d54ef'; -- N2 2022 Q6 (Combinatória)

-- 2023 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Dedução lógica',          dificuldade = 'dificil'       WHERE id = '401d14ca-58ed-453c-8d79-139b7be4972e'; -- N2 2023 Q1 (Lógica)
UPDATE questao SET subtopico = 'Somas e séries',          dificuldade = 'dificil'       WHERE id = 'ed23a150-ae87-44a1-9adb-c769f9a427e5'; -- N2 2023 Q2 (Números)
UPDATE questao SET subtopico = 'Áreas e perímetros',      dificuldade = 'dificil'       WHERE id = '1a29eedb-c65f-443f-afa7-75d93f4472b1'; -- N2 2023 Q3 (Geometria)
UPDATE questao SET subtopico = 'Arranjos e combinações',  dificuldade = 'muito_dificil' WHERE id = 'bd2b3e12-d12f-4168-811d-04095f8034a3'; -- N2 2023 Q4 (Combinatória)
UPDATE questao SET subtopico = 'Múltiplos e divisores',   dificuldade = 'muito_dificil' WHERE id = 'aeeca16d-da92-4612-bf06-7167af250195'; -- N2 2023 Q5 (Números)
UPDATE questao SET subtopico = 'Princípio da casa dos pombos', dificuldade = 'dificil' WHERE id = '48425868-aae9-471c-8669-a276b0bf3241'; -- N2 2023 Q6 (Combinatória)

-- 2024 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Operações e cálculo',   dificuldade = 'medio'         WHERE id = 'e2f5eb5f-e1c2-4e20-b86a-314bacf3f0c6'; -- N2 2024 Q1 (Aritmética)
UPDATE questao SET subtopico = 'Múltiplos e divisores', dificuldade = 'dificil'       WHERE id = '46b99c64-9c82-4d6e-ac9d-11d889bbddf2'; -- N2 2024 Q2 (Números)
UPDATE questao SET subtopico = 'Áreas e perímetros',    dificuldade = 'dificil'       WHERE id = 'a482ba97-890e-4f86-a981-d2e461259081'; -- N2 2024 Q3 (Geometria)
UPDATE questao SET subtopico = 'Múltiplos e divisores', dificuldade = 'dificil'       WHERE id = '8f290e3a-619a-452c-b9ba-9e0728eb5872'; -- N2 2024 Q4 (Números)
UPDATE questao SET subtopico = 'Geometria espacial',    dificuldade = 'muito_dificil' WHERE id = '878bf9bc-b2ca-4a70-abdb-d3973b535a58'; -- N2 2024 Q5 (Geometria)
UPDATE questao SET subtopico = 'Dedução lógica',        dificuldade = 'muito_dificil' WHERE id = '324dd579-6057-4c77-bbef-cfd545f3c423'; -- N2 2024 Q6 (Lógica)

-- 2025 -------------------------------------------------------------------------
UPDATE questao SET subtopico = 'Verdade e mentira',            dificuldade = 'medio'         WHERE id = 'c2180529-956a-42a8-9873-367e6d3cb606'; -- N2 2025 Q1 (Lógica)
UPDATE questao SET subtopico = 'Múltiplos e divisores',        dificuldade = 'medio'         WHERE id = 'b9142792-1ba6-4412-8ad6-f17c62c63d6a'; -- N2 2025 Q2 (Números)
UPDATE questao SET subtopico = 'Áreas e perímetros',           dificuldade = 'dificil'       WHERE id = 'f42923f5-a062-42d6-8b83-6f69a75b82c7'; -- N2 2025 Q3 (Geometria)
UPDATE questao SET subtopico = 'Algarismos e representações',  dificuldade = 'muito_dificil' WHERE id = '95d99865-c417-4641-9650-e719c2ee7bf0'; -- N2 2025 Q4 (Números)
UPDATE questao SET subtopico = 'Princípio da casa dos pombos', dificuldade = 'dificil'       WHERE id = 'e67d48d0-aea7-4c34-bbb6-9246fe86876e'; -- N2 2025 Q5 (Combinatória)
UPDATE questao SET subtopico = 'Arranjos e combinações',       dificuldade = 'muito_dificil' WHERE id = '73a83b0e-c24c-404f-9c81-9be1bf3755b4'; -- N2 2025 Q6 (Combinatória)
