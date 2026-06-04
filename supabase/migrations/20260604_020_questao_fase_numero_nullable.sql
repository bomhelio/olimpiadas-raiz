-- Permite fase e numero serem nulos (questões sem fase ou número definido)
ALTER TABLE questao ALTER COLUMN fase DROP NOT NULL;
ALTER TABLE questao ALTER COLUMN numero DROP NOT NULL;
