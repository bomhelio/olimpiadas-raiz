import type { RoleUsuario } from "@/lib/types/database";

export type Resource =
  | "marca"
  | "unidade"
  | "turma"
  | "aluno"
  | "olimpiada"
  | "inscricao"
  | "resultado"
  | "audit_log"
  | "convite"
  | "usuario"
  | "questao"
  | "simulado"
  | "projeto";

export type Action = "create" | "read" | "update" | "delete" | "export";

export type Permission = `${Resource}:${Action}`;

type RolePermissions = Partial<Record<RoleUsuario, Set<Permission>>>;

function perms(...list: Permission[]): Set<Permission> {
  return new Set(list);
}

// ─── Conjunto base de leitura geral ──────────────────────────────────────────
// Inclui questão, simulado e projeto — mas NÃO audit_log (Gestão) nem escrita em usuários

const LEITURA_GERAL = perms(
  "marca:read",
  "unidade:read",
  "turma:read",
  "aluno:read",
  "aluno:export",
  "olimpiada:read",
  "inscricao:read",
  "inscricao:export",
  "resultado:read",
  "resultado:export",
  "convite:read",
  "usuario:read",
  "questao:read",
  "simulado:read",
  "projeto:read",
);

// ─── Matriz de permissões ─────────────────────────────────────────────────────

export const ROLE_PERMISSIONS: RolePermissions = {
  // Super admin — acesso total
  raiz: perms(
    "questao:create",
    "questao:read",
    "questao:update",
    "questao:delete",
    "simulado:create",
    "simulado:read",
    "simulado:update",
    "simulado:delete",
    "projeto:create",
    "projeto:read",
    "projeto:update",
    "projeto:delete",
    "marca:create",
    "marca:read",
    "marca:update",
    "marca:delete",
    "unidade:create",
    "unidade:read",
    "unidade:update",
    "unidade:delete",
    "turma:create",
    "turma:read",
    "turma:update",
    "turma:delete",
    "aluno:create",
    "aluno:read",
    "aluno:update",
    "aluno:delete",
    "aluno:export",
    "olimpiada:create",
    "olimpiada:read",
    "olimpiada:update",
    "olimpiada:delete",
    "inscricao:create",
    "inscricao:read",
    "inscricao:update",
    "inscricao:delete",
    "inscricao:export",
    "resultado:create",
    "resultado:read",
    "resultado:update",
    "resultado:delete",
    "resultado:export",
    "audit_log:read",
    "convite:create",
    "convite:read",
    "convite:delete",
    "usuario:create",
    "usuario:read",
    "usuario:update",
    "usuario:delete",
  ),

  // Diretor de Marca — vê Gestão e Usuários, gerencia usuários da sua marca, leitura geral
  diretor_marca: perms(
    ...LEITURA_GERAL,
    "audit_log:read",
    "convite:create",
    "convite:delete",
    "usuario:create",
    "usuario:update",
  ),

  // Gestor de Conteúdo — cria e edita banco de questões, simulados e projetos
  // Leitura geral, mas NÃO vê Gestão nem Usuários (sem audit_log:read, sem convite:create)
  gestor_conteudo: perms(
    ...LEITURA_GERAL,
    "questao:create",
    "questao:update",
    "simulado:create",
    "simulado:update",
    "projeto:create",
    "projeto:update",
  ),

  // Professor, Coordenador, Diretor — leitura geral, sem escrita, sem Gestão/Usuários
  professor: perms(...LEITURA_GERAL),
  coordenador: perms(...LEITURA_GERAL),
  diretor: perms(...LEITURA_GERAL),

  // Legado — sem permissões até reatribuição manual de role
  direcao_marca: perms(),
  direcao_unidade: perms(),
  coordenacao_unidade: perms(),
};

// ─── Helpers ──────────────────────────────────────────────────────────────────

export function can(role: RoleUsuario, permission: Permission): boolean {
  return ROLE_PERMISSIONS[role]?.has(permission) ?? false;
}

export function canUser(
  user: { role: RoleUsuario; admin_marca: boolean },
  permission: Permission,
): boolean {
  return can(user.role, permission);
}

export function canAll(role: RoleUsuario, permissions: Permission[]): boolean {
  return permissions.every((p) => can(role, p));
}

export function canAny(role: RoleUsuario, permissions: Permission[]): boolean {
  return permissions.some((p) => can(role, p));
}

// ─── Labels e descrições ──────────────────────────────────────────────────────

export const ROLE_LABELS: Record<RoleUsuario, string> = {
  raiz: "Admin",
  diretor_marca: "Diretor de Marca",
  gestor_conteudo: "Gestor de Conteúdo",
  professor: "Professor",
  coordenador: "Coordenador",
  diretor: "Diretor",
  direcao_marca: "Direção de Marca (legado)",
  direcao_unidade: "Direção de Unidade (legado)",
  coordenacao_unidade: "Coordenação de Unidade (legado)",
};

export const ROLE_DESCRIPTIONS: Record<RoleUsuario, string> = {
  raiz: "Acesso total — leitura e escrita em todas as áreas",
  diretor_marca: "Visão de Gestão e Usuários — gerencia usuários da marca",
  gestor_conteudo: "Cria e edita banco de questões, simulados e projetos",
  professor: "Leitura geral — sem acesso a Gestão ou Usuários",
  coordenador: "Leitura geral — sem acesso a Gestão ou Usuários",
  diretor: "Leitura geral — sem acesso a Gestão ou Usuários",
  direcao_marca: "Role legado — sem permissões ativas",
  direcao_unidade: "Role legado — sem permissões ativas",
  coordenacao_unidade: "Role legado — sem permissões ativas",
};

// Roles atribuíveis via interface (exclui raiz e legados)
export const ROLES_ATRIBUIVEIS: RoleUsuario[] = [
  "diretor_marca",
  "gestor_conteudo",
  "professor",
  "coordenador",
  "diretor",
];

// Mantido para compatibilidade — não é mais usado no novo sistema
export const ADMIN_MARCA_EXTRA = perms(
  "convite:create",
  "convite:delete",
  "usuario:create",
  "usuario:update",
);
