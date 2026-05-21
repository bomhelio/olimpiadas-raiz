"use client";

import { useState, useRef, useEffect, Suspense } from "react";
import { useRouter, useSearchParams, usePathname } from "next/navigation";

function YearMultiSelectInner({ anos, selected }: { anos: number[]; selected: number[] }) {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);
  const router = useRouter();
  const pathname = usePathname();
  const searchParams = useSearchParams();

  useEffect(() => {
    function handleClick(e: MouseEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    }
    document.addEventListener("mousedown", handleClick);
    return () => document.removeEventListener("mousedown", handleClick);
  }, []);

  function toggle(ano: number) {
    const next = selected.includes(ano)
      ? selected.filter((a) => a !== ano)
      : [...selected, ano].sort((a, b) => a - b);
    const params = new URLSearchParams(searchParams.toString());
    if (next.length === 0) {
      params.delete("anos");
    } else {
      params.set("anos", next.join(","));
    }
    router.push(`${pathname}?${params.toString()}`);
  }

  const label =
    selected.length === 0
      ? "Selecionar"
      : selected.length === 1
        ? String(selected[0])
        : `${selected.length} anos`;

  return (
    <div ref={ref} className="relative">
      <button
        onClick={() => setOpen((o) => !o)}
        className="flex items-center gap-1.5 rounded-lg border border-border bg-card px-3 py-1.5 text-sm transition-colors hover:bg-background focus:outline-none"
        style={open ? { borderColor: "rgb(91,184,193)" } : {}}
      >
        <span style={{ color: "rgb(91,184,193)" }} className="font-medium">
          {label}
        </span>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="12"
          height="12"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          strokeWidth="2.5"
          strokeLinecap="round"
          strokeLinejoin="round"
          className="text-muted-foreground transition-transform"
          style={{ transform: open ? "rotate(180deg)" : "rotate(0deg)" }}
        >
          <polyline points="6 9 12 15 18 9" />
        </svg>
      </button>

      {open && (
        <div className="absolute right-0 top-full z-50 mt-1 min-w-[120px] rounded-xl border border-border bg-card p-1.5 shadow-lg">
          {anos.map((ano) => {
            const checked = selected.includes(ano);
            return (
              <button
                key={ano}
                onClick={() => toggle(ano)}
                className="flex w-full items-center gap-2.5 rounded-lg px-3 py-2 text-sm transition-colors hover:bg-background"
              >
                <span
                  className="flex h-3.5 w-3.5 shrink-0 items-center justify-center rounded-sm border transition-colors"
                  style={
                    checked
                      ? { backgroundColor: "rgb(91,184,193)", borderColor: "rgb(91,184,193)" }
                      : { borderColor: "var(--border)" }
                  }
                >
                  {checked && (
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="9"
                      height="9"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="white"
                      strokeWidth="3.5"
                      strokeLinecap="round"
                      strokeLinejoin="round"
                    >
                      <polyline points="20 6 9 17 4 12" />
                    </svg>
                  )}
                </span>
                <span className={checked ? "font-medium text-foreground" : "text-muted-foreground"}>
                  {ano}
                </span>
              </button>
            );
          })}
        </div>
      )}
    </div>
  );
}

export function YearMultiSelect({ anos, selected }: { anos: number[]; selected: number[] }) {
  return (
    <Suspense fallback={null}>
      <YearMultiSelectInner anos={anos} selected={selected} />
    </Suspense>
  );
}
