-- =============================================================================
-- Migration 033 — Classificação de subtópico e dificuldade
-- OBMEP Nível 3 · 2ª Fase · 2021–2025 (30 questões)
-- Mantém coerência com a taxonomia já usada no banco (Nível 1 e Nível 2, 2ª Fase).
-- Introduz subtópicos novos onde a taxonomia existente não cobre o conteúdo:
--   - Probabilidade combinatória (Probabilidade)
--   - Relações métricas (Geometria — tangência/proporções entre circunferências)
--   - Funções geométricas (Geometria — grandeza geométrica em função de um parâmetro + gráfico)
-- =============================================================================
-- DOWN:
-- UPDATE questao SET subtopico = NULL, dificuldade = NULL
-- WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano BETWEEN 2021 AND 2025;
-- =============================================================================

-- 2021 ---------------------------------------------------------------------
UPDATE questao SET subtopico='Raciocínio espacial e estratégia', dificuldade='medio'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2021 AND numero=1;

UPDATE questao SET subtopico='Contagem e enumeração', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2021 AND numero=2;

UPDATE questao SET subtopico='Probabilidade combinatória', dificuldade='medio'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2021 AND numero=3;

UPDATE questao SET subtopico='Geometria espacial', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2021 AND numero=4;

UPDATE questao SET subtopico='Relações métricas', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2021 AND numero=5;

UPDATE questao SET subtopico='Dedução lógica', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2021 AND numero=6;

-- 2022 ---------------------------------------------------------------------
UPDATE questao SET subtopico='Criptaritmética', dificuldade='medio'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2022 AND numero=1;

UPDATE questao SET subtopico='Arranjos e combinações', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2022 AND numero=2;

UPDATE questao SET subtopico='Relações métricas', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2022 AND numero=3;

UPDATE questao SET subtopico='Algarismos e representações', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2022 AND numero=4;

UPDATE questao SET subtopico='Probabilidade combinatória', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2022 AND numero=5;

UPDATE questao SET subtopico='Dedução lógica', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2022 AND numero=6;

-- 2023 ---------------------------------------------------------------------
UPDATE questao SET subtopico='Grafos e conexidade', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2023 AND numero=1;

UPDATE questao SET subtopico='Múltiplos e divisores', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2023 AND numero=2;

UPDATE questao SET subtopico='Funções geométricas', dificuldade='medio'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2023 AND numero=3;

UPDATE questao SET subtopico='Probabilidade combinatória', dificuldade='medio'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2023 AND numero=4;

UPDATE questao SET subtopico='Geometria espacial', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2023 AND numero=5;

UPDATE questao SET subtopico='Contagem e enumeração', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2023 AND numero=6;

-- 2024 ---------------------------------------------------------------------
UPDATE questao SET subtopico='Operações e cálculo', dificuldade='medio'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2024 AND numero=1;

UPDATE questao SET subtopico='Áreas e perímetros', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2024 AND numero=2;

UPDATE questao SET subtopico='Funções geométricas', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2024 AND numero=3;

UPDATE questao SET subtopico='Arranjos e combinações', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2024 AND numero=4;

UPDATE questao SET subtopico='Contagem e enumeração', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2024 AND numero=5;

UPDATE questao SET subtopico='Probabilidade combinatória', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2024 AND numero=6;

-- 2025 ---------------------------------------------------------------------
UPDATE questao SET subtopico='Operações e cálculo', dificuldade='medio'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2025 AND numero=1;

UPDATE questao SET subtopico='Arranjos e combinações', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2025 AND numero=2;

UPDATE questao SET subtopico='Funções geométricas', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2025 AND numero=3;

UPDATE questao SET subtopico='Princípio da casa dos pombos', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2025 AND numero=4;

UPDATE questao SET subtopico='Probabilidade combinatória', dificuldade='dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2025 AND numero=5;

UPDATE questao SET subtopico='Dedução lógica', dificuldade='muito_dificil'
WHERE olimpiada='obmep' AND nivel='nivel_3' AND fase=2 AND ano=2025 AND numero=6;
