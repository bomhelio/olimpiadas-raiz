/**
 * Testes unitários — lib/auth/roles.ts
 * Valida o mapa de permissões do frontend e helpers can/canAll/canAny/canUser.
 *
 * Modelo atual (lib/types/database.ts):
 *   raiz                 — acesso total (todas as ações em todos os recursos)
 *   direcao_marca        — somente leitura (READ_ONLY)
 *   direcao_unidade      — somente leitura (READ_ONLY)
 *   coordenacao_unidade  — somente leitura (READ_ONLY)
 * O flag admin_marca concede permissões extras de convite/usuário (canUser).
 */

import { describe, it, expect } from "vitest";
import {
  can,
  canAll,
  canAny,
  canUser,
  ROLE_LABELS,
  ROLE_PERMISSIONS,
  ADMIN_MARCA_EXTRA,
} from "@/lib/auth/roles";
import type { RoleUsuario } from "@/lib/types/database";

const READ_ONLY_ROLES: RoleUsuario[] = ["direcao_marca", "direcao_unidade", "coordenacao_unidade"];
const ALL_ROLES: RoleUsuario[] = ["raiz", ...READ_ONLY_ROLES];

describe("can()", () => {
  it("raiz pode criar, deletar e ler audit_log", () => {
    expect(can("raiz", "olimpiada:create")).toBe(true);
    expect(can("raiz", "olimpiada:delete")).toBe(true);
    expect(can("raiz", "audit_log:read")).toBe(true);
  });

  it("roles de leitura não podem criar nem deletar olimpíadas", () => {
    for (const role of READ_ONLY_ROLES) {
      expect(can(role, "olimpiada:create")).toBe(false);
      expect(can(role, "olimpiada:delete")).toBe(false);
    }
  });

  it("roles de leitura não podem criar nem deletar inscrição", () => {
    for (const role of READ_ONLY_ROLES) {
      expect(can(role, "inscricao:create")).toBe(false);
      expect(can(role, "inscricao:delete")).toBe(false);
    }
  });

  it("roles de leitura podem ler olimpíadas e inscrições", () => {
    for (const role of READ_ONLY_ROLES) {
      expect(can(role, "olimpiada:read")).toBe(true);
      expect(can(role, "inscricao:read")).toBe(true);
    }
  });

  it("roles de leitura podem ler audit_log (READ_ONLY inclui audit_log:read)", () => {
    for (const role of READ_ONLY_ROLES) {
      expect(can(role, "audit_log:read")).toBe(true);
    }
  });

  it("nenhuma role tem permissão sobre questao exceto raiz", () => {
    expect(can("raiz", "questao:create")).toBe(true);
    for (const role of READ_ONLY_ROLES) {
      expect(can(role, "questao:read")).toBe(false);
    }
  });
});

describe("canUser() — flag admin_marca", () => {
  it("admin_marca concede criar/deletar convite a role de leitura", () => {
    const user = { role: "direcao_marca" as RoleUsuario, admin_marca: true };
    expect(can(user.role, "convite:create")).toBe(false);
    expect(canUser(user, "convite:create")).toBe(true);
    expect(canUser(user, "convite:delete")).toBe(true);
    expect(canUser(user, "usuario:create")).toBe(true);
    expect(canUser(user, "usuario:update")).toBe(true);
  });

  it("sem admin_marca não concede permissões extras", () => {
    const user = { role: "direcao_marca" as RoleUsuario, admin_marca: false };
    expect(canUser(user, "convite:create")).toBe(false);
    expect(canUser(user, "usuario:create")).toBe(false);
  });

  it("admin_marca não concede deletar olimpíada (fora do conjunto extra)", () => {
    const user = { role: "direcao_marca" as RoleUsuario, admin_marca: true };
    expect(canUser(user, "olimpiada:delete")).toBe(false);
  });

  it("raiz mantém acesso total independentemente do flag", () => {
    const user = { role: "raiz" as RoleUsuario, admin_marca: false };
    expect(canUser(user, "olimpiada:delete")).toBe(true);
    expect(canUser(user, "convite:create")).toBe(true);
  });
});

describe("canAll()", () => {
  it("retorna true quando todas as permissões são satisfeitas", () => {
    expect(canAll("raiz", ["olimpiada:create", "olimpiada:delete"])).toBe(true);
  });

  it("retorna false quando ao menos uma permissão falta", () => {
    expect(canAll("direcao_marca", ["olimpiada:read", "olimpiada:delete"])).toBe(false);
  });

  it("retorna true para lista vazia", () => {
    expect(canAll("coordenacao_unidade", [])).toBe(true);
  });
});

describe("canAny()", () => {
  it("retorna true quando pelo menos uma permissão é satisfeita", () => {
    expect(canAny("direcao_unidade", ["olimpiada:create", "olimpiada:read"])).toBe(true);
  });

  it("retorna false quando nenhuma permissão é satisfeita", () => {
    expect(canAny("direcao_unidade", ["olimpiada:create", "olimpiada:delete"])).toBe(false);
  });
});

describe("ROLE_LABELS", () => {
  it("tem label para todas as roles", () => {
    for (const role of ALL_ROLES) {
      expect(ROLE_LABELS[role]).toBeTruthy();
      expect(typeof ROLE_LABELS[role]).toBe("string");
    }
  });
});

describe("ROLE_PERMISSIONS — invariantes críticos", () => {
  it("raiz tem mais permissões que qualquer role de leitura", () => {
    const raizPerms = ROLE_PERMISSIONS.raiz.size;
    for (const role of READ_ONLY_ROLES) {
      expect(raizPerms).toBeGreaterThan(ROLE_PERMISSIONS[role].size);
    }
  });

  it("as 3 roles de leitura compartilham o mesmo conjunto de permissões", () => {
    const sizes = READ_ONLY_ROLES.map((r) => ROLE_PERMISSIONS[r].size);
    expect(new Set(sizes).size).toBe(1);
    const base = ROLE_PERMISSIONS.direcao_marca;
    for (const role of READ_ONLY_ROLES) {
      for (const perm of base) {
        expect(ROLE_PERMISSIONS[role].has(perm)).toBe(true);
      }
    }
  });

  it("nenhuma role tem a permissão inexistente convite:export", () => {
    for (const role of ALL_ROLES) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      expect((ROLE_PERMISSIONS[role] as Set<any>).has("convite:export")).toBe(false);
    }
  });

  it("ADMIN_MARCA_EXTRA não é concedido por padrão a roles de leitura", () => {
    for (const role of READ_ONLY_ROLES) {
      for (const perm of ADMIN_MARCA_EXTRA) {
        expect(ROLE_PERMISSIONS[role].has(perm)).toBe(false);
      }
    }
  });
});
