-- 025: Melhorias no banco de questões
-- Adiciona: dificuldade, público-alvo, flags de resolução e status de cadastro

ALTER TABLE questao
  ADD COLUMN IF NOT EXISTS dificuldade          text,
  ADD COLUMN IF NOT EXISTS publico_alvo         text,
  ADD COLUMN IF NOT EXISTS tem_resolucao_video  text NOT NULL DEFAULT 'nao',
  ADD COLUMN IF NOT EXISTS tem_resolucao_texto  text NOT NULL DEFAULT 'nao',
  ADD COLUMN IF NOT EXISTS status_cadastro      text NOT NULL DEFAULT 'publicado';

-- Índice FTS para busca por similaridade no enunciado
CREATE INDEX IF NOT EXISTS idx_questao_enunciado_fts
  ON questao USING gin(to_tsvector('portuguese', coalesce(enunciado, '')));

-- Índices auxiliares de filtro
CREATE INDEX IF NOT EXISTS idx_questao_dificuldade     ON questao (dificuldade);
CREATE INDEX IF NOT EXISTS idx_questao_publico_alvo    ON questao (publico_alvo);
CREATE INDEX IF NOT EXISTS idx_questao_status_cadastro ON questao (status_cadastro);

-- Valores válidos (documentação; enforcement via app)
-- dificuldade:          elementar | facil | medio | dificil | muito_dificil
-- publico_alvo:         EFAI | EFAF | EM | Todos
-- tem_resolucao_video:  sim | nao | em_producao
-- tem_resolucao_texto:  sim | nao | em_producao
-- status_cadastro:      publicado | aguardando_revisao
