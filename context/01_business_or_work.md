# 01 — Business / Work

## Schilling (empleo)

Empresa de software. Rol: full-stack developer.

### Proyectos activos

| Proyecto | Stack | Path |
|---|---|---|
| **wave-template** | Vite + React 19 + TanStack Router/Query/Table + shadcn/ui + Tailwind v4 + Playwright + MSW + Percy + Sentry | `~/Projects/ei-schilling/wave-template/` |
| **kontrakt-manager** | Node + server | `~/Projects/ei-schilling/kontrakt-manager/` |
| **ia-royalty-validations** | TS | `~/Projects/ei-schilling/ia-royalty-validations/` |
| **wave-tech-radar** | Vite + TS | `~/Projects/ei-schilling/wave-tech-radar/` |

### Convenciones (resumen)

Ver `~/.claude/skills/wave-template-conventions/SKILL.md` para el detalle completo.

- **Forms:** `FormContainer + IData[]` (NUNCA `react-hook-form` directo).
- **Tables:** `TanStack Table 8.21` + `TanStack Virtual`.
- **State:** Zustand.
- **API client:** `swagger-typescript-api` generado.
- **i18n:** backend-driven.
- **Testing:** Playwright 1.55 + MSW + Percy.
- **Lenguaje de código:** TypeScript estricto.

## Proyectos personales / freelance

| Proyecto | Path | Notas |
|---|---|---|
| **hermes-agent** (Nous Research, open source) | `~/Projects/eddremonts86/hermes-agent/` | Personal AI agent, Python + TS (ui-tui) + web + docs. |
| **iaWorkSpace** (meta-repo) | `~/Projects/eddremonts86/iaWorkSpace/` | Multi-root VS Code con apps independientes, fleet Traefik + Coolify. |
| **demos varios** | `~/Projects/eddremonts86/<descriptive-name>/` | ~50+ proyectos pequeños (Vue, React, Next.js, Svelte, Drupal, PHP, etc.). |

## Dominios de trabajo

- **Frontend:** React, Vue 3, Nuxt 3, Next.js, Svelte, TanStack ecosystem, shadcn/ui.
- **Backend:** Node.js (Express, Fastify, NestJS), Laravel, Drupal 7/8/9.
- **CMS legacy:** Drupal 7/8, OctoberCMS + Laravel 5.
- **AI agents:** Claude Code, Codex, Gemini CLI, Antigravity, **Hermes Agent** (Nous Research).
- **Cloud/Infra:** Hetzner Cloud, Coolify, Docker, Traefik, AWS básico, Cloudinary.
- **Tools:** VSCode, Warp + Terminal nativo, Homebrew, pnpm/npm.

## Qué tipo de trabajo delego a IA

- Refactors grandes con test coverage.
- Setup inicial de proyectos (scaffolding).
- Documentación técnica.
- Análisis de código (security review, dependency audit).
- Investigación + resumen de topics nuevos.
- Generación de skills, templates, prompts.
- Debugging sistemático.
- Escritura de Specs y ADRs.

## Qué NO delego

- Decisiones de arquitectura final (yo las tomo).
- Code review final de cambios grandes (yo reviso).
- Deploys a producción sin supervision.
- Comunicación con clientes.