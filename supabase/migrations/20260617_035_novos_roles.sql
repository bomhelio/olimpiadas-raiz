-- Adiciona os novos roles ao enum role_usuario.
-- Os valores legados (direcao_marca, direcao_unidade, coordenacao_unidade)
-- permanecem no enum por compatibilidade com o banco, mas recebem
-- zero permissões no código até que os usuários sejam reatribuídos.

ALTER TYPE role_usuario ADD VALUE IF NOT EXISTS 'diretor_marca';
ALTER TYPE role_usuario ADD VALUE IF NOT EXISTS 'gestor_conteudo';
ALTER TYPE role_usuario ADD VALUE IF NOT EXISTS 'professor';
ALTER TYPE role_usuario ADD VALUE IF NOT EXISTS 'coordenador';
ALTER TYPE role_usuario ADD VALUE IF NOT EXISTS 'diretor';
