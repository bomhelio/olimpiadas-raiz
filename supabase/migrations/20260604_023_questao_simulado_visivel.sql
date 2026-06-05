-- Toggle visibilidade da questão para o aluno dentro do simulado
ALTER TABLE preparacao_aula_questao ADD COLUMN IF NOT EXISTS visivel_aluno boolean DEFAULT true NOT NULL;
