"use client";

import { createContext, useContext } from "react";
import type { Usuario } from "@/lib/types/database";
import type { Permission } from "@/lib/auth/roles";
import { canUser } from "@/lib/auth/roles";

// ---------------------------------------------------------------------------
// Contexto de usuário — disponível para Client Components
// Alimentado pelo layout protegido (Server Component)
// ---------------------------------------------------------------------------

export type UserContextValue = {
  user: Usuario;
};

const UserContext = createContext<UserContextValue | null>(null);

export function UserProvider({ user, children }: { user: Usuario; children: React.ReactNode }) {
  return <UserContext.Provider value={{ user }}>{children}</UserContext.Provider>;
}

/**
 * Hook para acessar o usuário autenticado em Client Components.
 * Lança erro se usado fora do UserProvider.
 */
export function useUser(): UserContextValue {
  const ctx = useContext(UserContext);
  if (!ctx) throw new Error("useUser deve ser usado dentro de UserProvider");
  return ctx;
}

/**
 * Hook de permissão — verifica se o usuário pode realizar uma ação.
 */
/**
 * Hook de permissão — considera role + flag admin_marca.
 */
export function useCan(permission: Permission): boolean {
  const { user } = useUser();
  return canUser(user, permission);
}
