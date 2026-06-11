-- =============================================================================
-- Migration 033 — Classificação de topico/subtopico/dificuldade
-- OBMEP · Nível 1 · 1ª Fase · 2019 · Questão 16 (múltipla escolha)
-- Última questão do banco sem classificação completa.
-- =============================================================================
-- DOWN: UPDATE questao SET topico = NULL, subtopico = NULL, dificuldade = NULL WHERE id = 'a6126e40-fc1d-4e9e-bf3a-6a2371c9c546';
-- =============================================================================

-- "Dois livros estão em uma prateleira... Volume II está de cabeça para baixo..."
-- Raciocínio espacial: visualizar a orientação do livro invertido para calcular
-- a distância pedida — mesma família do problema dos dados empilhados (Lógica).
UPDATE questao
SET topico = 'Lógica', subtopico = 'Raciocínio espacial e estratégia', dificuldade = 'dificil'
WHERE id = 'a6126e40-fc1d-4e9e-bf3a-6a2371c9c546';
