# 02 — Projects

Inventario de proyectos activos y archivados. **Mantenlo actualizado** al empezar trabajo nuevo.

## Schilling (empleo)

### wave-template (activo, crítico)

- **Path:** `~/Projects/ei-schilling/wave-template/`
- **Stack:** Vite + React 19 + TanStack Router/Query/Table + shadcn/ui + Tailwind v4 + Playwright + MSW + Percy + Sentry + TypeScript estricto
- **Forma de trabajo:** form-builder (FormContainer + IData[]), tablas jerárquicas con grouping state
- **Skills relevantes:** `wave-template-conventions`, `tanstack-patterns`, `shadcn-patterns`, `react-patterns`, `typescript-advanced`

### kontrakt-manager (activo)

- **Path:** `~/Projects/ei-schilling/kontrakt-manager/`
- **Stack:** Node + Express + server/client split
- **Notas:** tiene `package.json` + `server/package.json` separados

### ia-royalty-validations (activo)

- **Path:** `~/Projects/ei-schilling/ia-royalty-validations/`
- **Stack:** TypeScript
- **Notas:** servicio de validaciones, sin UI

### wave-tech-radar (activo)

- **Path:** `~/Projects/ei-schilling/wave-tech-radar/`
- **Stack:** Vite + TS

## Nous Research (open source contribution)

### hermes-agent (activo, crítico)

- **Path:** `~/Projects/eddremonts86/hermes-agent/`
- **Stack:** Python 3.11 + TypeScript (ui-tui) + React 19 (web) + Docusaurus 3.9.2 (website)
- **Forma de trabajo:** tools auto-discover por AST, plugins en `plugins/`, skills con frontmatter completo
- **Skills relevantes:** `hermes-mcp-pattern`
- **Tests:** `scripts/run_tests.sh` (canonical, no pytest directo)
- **Conventional Commits** estricto con scopes

## Personales

### iaWorkSpace (meta-repo, activo)

- **Path:** `~/Projects/eddremonts86/iaWorkSpace/`
- **Estructura:** multi-root VS Code workspace, no monorepo
- **Apps independientes** en `apps/<name>/` (gitignored al root)
- **Skills committed** en `.agents/skills/` (100 skills, workspace-scoped)
- **Infra:** docker-compose.yml raíz (3 containers: openclaw, opencode, open-design) + `prod/docker-compose.fleet.yml` con Traefik
- **Deploy:** Coolify en VPS Hetzner (conuctor-01, cax21, fsn1)
- **Skills relevantes:** `iaworkspace-patterns`, `hetzner-cloud-cli`, `coolify-deploy`, `containers-architecture`, `prod-deploy-verification`, `prod-fleet-register`

### Demos / playgrounds (semi-activos)

~50+ proyectos en `~/Projects/eddremonts86/` (Vue, React, Next.js, Drupal, etc.). La mayoría son demos o ejemplos. Ver `~/Projects/eddremonts86/` directamente.

### ai-os (este proyecto)

- **Path:** `~/Projects/ai-os/`
- **Propósito:** AI Operating System local — método Karpathy Spec+Verifier+Entorno
- **Forma de trabajo:** `CLAUDE.md` se lee al iniciar sesión en cualquier CLI

## Archivados / inactivos

- **CubaProjects**, **HBO-loginPages**, **MyXpaces**, **ObtoberCMS-and-Laravel5** (legacy).
- **Drupal7-ModulesAndTemplates**, **Drupal8-ModulesAndTemplates** (Drupal 7/8 modules custom, archivado).
- **OctoberCMS-and-Laravel5** (Laravel 5 + OctoberCMS, archivado).
- **chucknorris**, **voice-prompt-cleaner**, **pokemon-index**, **mdxViewer**, **supersonic-calculator**, **sass-template**, **geoLocal**, **musicFilter**, **select-date-infinite**, **react-landing-page**, **firstReactProject**, **invoiceCalc**, **budget-app**, **To-Do**, **SnapShots**, **HackerNews**, **porfolio**, **portfolio**, **project-proposal**, **eddremonts/edd-portfolio** (todos demos/tutoriales vacíos).

## Convenciones de path

- **Proyectos personales:** `~/Projects/eddremonts86/<name>/`
- **Proyectos Schilling:** `~/Projects/ei-schilling/<name>/`
- **AI-OS:** `~/Projects/ai-os/`
- **Skills globales:** `~/.claude/skills/`
- **Hermes skills imported:** `~/.hermes/skills/imported/` (symlinks a `~/.claude/skills/`)
- **Tools/scripts globales:** `~/.local/bin/`, `~/bin/`