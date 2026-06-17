create table if not exists questao_favorita (
  aluno_id   uuid        not null references aluno(id) on delete cascade,
  questao_id uuid        not null references questao(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (aluno_id, questao_id)
);

create index if not exists idx_questao_favorita_aluno on questao_favorita(aluno_id);
