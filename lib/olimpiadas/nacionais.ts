export const OLIMPIADAS_NACIONAIS = [
  {
    sigla: "OBMEP",
    nome: "Olimpíada Brasileira de Matemática das Escolas Públicas",
    nivel: "EF II · EM",
  },
  { sigla: "OBM", nome: "Olimpíada Brasileira de Matemática", nivel: "EF II · EM" },
  {
    sigla: "OBA",
    nome: "Olimpíada Brasileira de Astronomia e Astronáutica",
    nivel: "EF I · EF II · EM",
  },
  { sigla: "OBF", nome: "Olimpíada Brasileira de Física", nivel: "EF II · EM" },
  {
    sigla: "OBFEP",
    nome: "Olimpíada Brasileira de Física das Escolas Públicas",
    nivel: "EF II · EM",
  },
  { sigla: "OBQ", nome: "Olimpíada Brasileira de Química", nivel: "EF II · EM" },
  { sigla: "OBB", nome: "Olimpíada Brasileira de Biologia", nivel: "EM" },
  { sigla: "OBL", nome: "Olimpíada Brasileira de Linguística", nivel: "EM" },
  { sigla: "OBG", nome: "Olimpíada Brasileira de Geografia", nivel: "EF II · EM" },
  { sigla: "ONHB", nome: "Olimpíada Nacional em História do Brasil", nivel: "EF II · EM" },
  { sigla: "OBI", nome: "Olimpíada Brasileira de Informática", nivel: "EF · EM" },
  { sigla: "OBR", nome: "Olimpíada Brasileira de Robótica", nivel: "EF · EM" },
  { sigla: "OBCT", nome: "Olimpíada Brasileira de Ciências da Terra", nivel: "EF II · EM" },
  { sigla: "ONC", nome: "Olimpíada Nacional de Ciências", nivel: "EF · EM" },
  { sigla: "OBN", nome: "Olimpíada Brasileira de Neurociências", nivel: "EM" },
  {
    sigla: "OBICT",
    nome: "Olimpíada Brasileira de Inovação, Ciência e Tecnologia",
    nivel: "EF II · EM",
  },
  { sigla: "OP", nome: "Olimpíada de Português — Escrevendo o Futuro", nivel: "EF II" },
  { sigla: "OBEF", nome: "Olimpíada Brasileira de Educação Financeira", nivel: "EF II · EM" },
  { sigla: "Canguru", nome: "Canguru de Matemática Brasil", nivel: "EF · EM" },
] as const;

export type OlimpiadaNacional = (typeof OLIMPIADAS_NACIONAIS)[number];
