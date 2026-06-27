---
name: iaworkspace-patterns
description: Convenciones del workspace iaWorkSpace (meta-repo multi-root VS Code, no monorepo) — apps independientes en apps/, skills committed en .agents/skills/, pre-deploy verification, container architecture (openclaw/opencode/open-design), seguridad OWASP, fleet deployment via Coolify/Traefik.
license: Internal
---

# iaWorkSpace Patterns

Repo: `/Users/edd/Projects/eddremonts86/iaWorkSpace/`. NO es monorepo — es un multi-root VS Code workspace con apps independientes.

## Estructura crítica

```
iaWorkSpace/
├── apps/<app>/              # gitignored, cada app es repo independiente
├── .agents/
│   ├── skills/
│   │   ├── globals/         # 60+ skills transversales
│   │   ├── wave/            # específicas de wave
│   │   ├── schilling/       # sch-*
│   │   ├── tanstack-template/
│   │   ├── accesPoint/
│   │   ├── eddremonts/
│   │   └── workspace/       # open-design
│   ├── instructions/        # workspace.md (canonical)
│   └── AGENTS.md
├── .github/
│   ├── copilot-instructions.md   # ADAPTER (sync con .agents/instructions/workspace.md)
│   ├── instructions/
│   └── workflows/
├── docker/
│   ├── openclaw/
│   ├── opencode/
│   └── open-design/
├── prod/
│   ├── docker-compose.fleet.yml   # fleet completo
│   ├── compose.d/                 # uno por app
│   ├── traefik/                   # reverse proxy
│   └── stack.config.mjs           # config central
├── scripts/
│   ├── prod/       # up, down, status, setup, logs, exec, psql, open, urls, verify
│   ├── coolify/    # sync-env, set-post-deploy, add-deploy-key
│   ├── deploy/     # preflight-deploy.mjs, preflight-apply.sh
│   ├── containers/ # backup, open-openclaw
│   ├── maintenance/
│   ├── open-design/
│   └── workspace/  # init, doctor, install-git-hooks
├── tools/
├── projects.code-workspace   # VS Code multi-root
├── docker-compose.yml        # root: openclaw + opencode + open-design
└── AGENTS.md                 # canonical workspace instructions
```

## Reglas duras (de AGENTS.md)

1. **English only** — todo el contenido generado (código, comentarios, docs, commits, files). Aunque el usuario chatee en español.
2. **No hardcoded secrets** — `.env` (gitignored) + `.env.example` (placeholders). Frontend lee `import.meta.env.VITE_*`.
3. **CORS:** nunca `Access-Control-Allow-Origin: *` en prod; nunca `credentials: true` + wildcard origin. Vite proxy es dev-only.
4. **HTTP headers** — CSP, X-Frame-Options, X-Content-Type-Options, Referrer-Policy, Permissions-Policy obligatorios.
5. **React XSS** — sanitizar con DOMPurify antes de `dangerouslySetInnerHTML`. No `eval`, `document.write`, raw `innerHTML`.
6. **Pre-release gate** — `pnpm audit` con 0 Critical y 0 High.
7. **Skills/MCP committed al workspace** — NO instalar en `~/.agents/skills/`. PR en `.agents/skills/<scope>/<name>/SKILL.md`.

## Comandos del root

```bash
pnpm install            # root tooling (no app deps); también instala git hooks
pnpm doctor          # verificar integridad (folders, scripts, .gitignore, skills index)
pnpm audit           # audit de seguridad cross-app
pnpm audit:<app>     # single app
pnpm suggest         # audit + diffs sugeridos
pnpm fix             # audit + auto-apply LOW/MEDIUM fixes
pnpm check:cors|secrets|headers|deps|xss|noir
pnpm lint            # eslint + markdownlint-cli2
pnpm format          # prettier --write

# Containers
pnpm containers:up
pnpm containers:status
pnpm od:provider     # configurar open-design provider
pnpm od:link         # refresh designs/<slug>/ symlinks
pnpm od:migrate      # one-time migrate legacy

# Deploy
node scripts/deploy/preflight-deploy.mjs --app <name>
node scripts/deploy/preflight-deploy.mjs --all
```

**App-specific** (build/test/dev) → `cd apps/<name>/`, nunca desde root.

## Container architecture

3 containers + shared infra (ver `containers-architecture` skill):

- **openclaw** — port 8080, mounts `.:/workspace/repo` (upstream owns `/workspace`).
- **opencode** — port 3000, mounts `.:/workspace`.
- **open-design** — port 8081, mounts `.:/workspace`.

Persistencia: `docker/openclaw/config/`, `docker/opencode/config/`, `docker/open-design/data/` (gitignored, host-visible).

Pre-commit hook en `.githooks/pre-commit` rechaza commits a `docker/*/data/`.

## Skills organization

Skills committed al workspace, NO user-scope:

```
.agents/skills/
├── globals/<name>/SKILL.md         # transversal
├── <app-scope>/<prefix>-<name>/SKILL.md  # específica
└── workspace/<name>/SKILL.md      # open-design integration
```

**Naming convention:**
- `globals/` — sin prefijo: `hetzner-cloud`, `coolify-env-sync`, `clean-architecture`
- `<app>/` — prefijo de app: `wave-form-builder`, `sch-coding-standard`, `tt-docker-stack`, `ap-deployment`, `edd-ui-components`

**Index files** (actualizar al añadir skill):
- `globals-index.md`
- `project-skills-index.md`

## Adding a new app

1. Clonar repo de la app en `apps/<name>/` (queda gitignored al root).
2. Registrar en `projects.code-workspace` `folders[]`.
3. `pnpm doctor` — valida folder + script paths + per-app `.gitignore`.
4. Commit solo workspace-level (`projects.code-workspace`, skills index). Nunca `apps/<name>/` desde root.

## Conventional commits (English)

```
feat: add new endpoint for user export
fix(cli): prevent crash in save_config when model is missing
docs: update AGENTS.md with new preflight check
chore: bump dependencies
test: add e2e test for login flow
refactor: extract user validation into shared module
```

Scopes comunes: `cli, gateway, tools, skills, agent, install, api, ui, db, deploy`.

## Pre-commit hooks (Husky)

```bash
# .husky/pre-commit (en cada app)
pnpm lint-staged
node ../../scripts/deploy/preflight-deploy.mjs --app $(basename $PWD)
```

`lint-staged`: prettier + eslint --fix en staged files.

## Deploy workflow

```bash
# 1. Branch y PR
git checkout -b feat/my-feature
git commit -m "feat: ..."
git push origin feat/my-feature
gh pr create

# 2. Pre-merge: CI pasa (lint + test + audit + preflight)

# 3. Merge a main → trigger webhook → Coolify auto-deploy

# 4. Verificación post-deploy
node scripts/prod/status.sh
curl https://mi-app.example.com/health
ssh hetzner "docker logs --tail 100 mi-app-app-1"

# 5. Si falla → rollback via Coolify dashboard o:
node scripts/prod/exec.sh mi-app pnpm db:migrate:rollback
```

## Security baseline

Cada app debe tener:

```yaml
# docker-compose labels (Traefik)
- "traefik.http.middlewares.app-headers.headers.customrequestheaders.X-Forwarded-Proto=https"
- "traefik.http.middlewares.app-headers.headers.framedeny=true"
- "traefik.http.middlewares.app-headers.headers.contenttypenosniff=true"
- "traefik.http.middlewares.app-headers.headers.referrerpolicy=same-origin"
- "traefik.http.middlewares.app-csp.headers.contentsecuritypolicy=default-src 'self'; script-src 'self' 'unsafe-inline'; ..."
```

**CSP pattern:**
```ts
// _headers file (si Caddy) o middleware
{
  'Content-Security-Policy': [
    "default-src 'self'",
    "script-src 'self' 'unsafe-inline'",  // solo si usás inline scripts
    "style-src 'self' 'unsafe-inline'",
    "img-src 'self' data: https:",
    "connect-src 'self' https://api.example.com",
    "frame-ancestors 'none'",
    "base-uri 'self'",
    "form-action 'self'",
  ].join('; '),
}
```

## Scripts disponibles (resumen)

| Script | Propósito |
|---|---|
| `scripts/prod/up.sh` | Levantar fleet completo |
| `scripts/prod/down.sh` | Bajar fleet |
| `scripts/prod/status.sh` | Status de todos los servicios |
| `scripts/prod/setup.sh` | Setup inicial (crear networks, volumes) |
| `scripts/prod/logs.sh [service]` | Tail logs |
| `scripts/prod/exec.sh <svc> <cmd>` | Exec en container |
| `scripts/prod/psql.sh` | Conectar a Postgres prod |
| `scripts/prod/open.sh <svc>` | Abrir URL del service |
| `scripts/prod/urls.sh` | Listar URLs activas |
| `scripts/prod/verify.sh` | Verificar health checks |
| `scripts/prod/reseed.sh <svc>` | Reset + seed DB |
| `scripts/prod/register-app.mjs --name X --domain Y` | Registrar app nueva |
| `scripts/prod/generate-compose.mjs` | Compilar fleet + compose.d/ → docker-compose.fleet.yml |
| `scripts/coolify/sync-env.mjs --app X` | Sync .env → Coolify dashboard |
| `scripts/coolify/set-post-deploy.mjs --app X --command "..."` | Set post-deploy hook |
| `scripts/coolify/add-deploy-key.sh <repo>` | Add deploy key SSH |
| `scripts/deploy/preflight-deploy.mjs` | 12 checks pre-deploy |
| `scripts/deploy/preflight-apply.sh` | Versión bash legacy |
| `scripts/containers/backup.sh` | Tarball container state |
| `scripts/containers/open-openclaw.sh` | Open OpenClaw UI |
| `scripts/workspace/init.mjs` | Init workspace |
| `scripts/workspace/doctor.mjs` | Verify workspace integrity |
| `scripts/workspace/install-git-hooks.sh` | Install pre-commit hook |
| `scripts/workspace/setup-git-credentials.sh` | Setup git identity |
| `scripts/workspace/sync-pnpm-builds.mjs` | Sync builds cross-app |

## Errores comunes (de AGENTS.md "Things agents commonly get wrong")

1. ❌ Build/test/lint app desde root → `cd apps/<name>`.
2. ❌ Editar `apps/<name>/` esperando que root `git status` lo muestre.
3. ❌ Tratar README "6 apps" como ground truth → leer `projects.code-workspace`.
4. ❌ Escribir no-English porque el user chatea en otro idioma.
5. ❌ Añadir skills a `~/.agents/skills/` en vez de commit en `.agents/skills/`.
6. ❌ Olvidar actualizar skills index al añadir una skill.
7. ❌ `docker compose up` desde root → no funciona, root compose es solo containers.

## Package management

- **pnpm 9.0.0+** (lockfile: `pnpm-lock.yaml`)
- **Node >= 18** (`.nvmrc` lo pinea)
- Scripts plain `node`/`bash`, no wrappers
- Prettier 2-space TS/JS/JSON
- markdownlint-cli2

## Stack típico por app

| App | Stack |
|---|---|
| wave / wave1 | Vite + React 19 + TanStack + shadcn |
| schilling | TBD (legacy) |
| accesPoint | TBD (legacy) |
| royaltyValidator | TBD |
| confluence-md | TBD |
| tanstack-template | TanStack Start + Drizzle |
| eddremonts/* | Vite + React + Vite |

## Cuando usar cada skill

| Tarea | Skill |
|---|---|
| Deploy a VPS | `hetzner-cloud`, `coolify-deploy`, `prod-deploy-verification` |
| Multi-service compose | `coolify-deploy`, `prod-deploy-verification` |
| Sincronizar env | `coolify-deploy`, `env-config` |
| Configurar containers | `containers-architecture` |
| OpenClaw/OpenCode/OpenDesign | `containers-architecture`, `open-design-integration` |
| Build de TanStack app | `tanstack-start-coolify-deploy`, `tanstack-template/tt-*` |
| Crear nueva app | `new-app-setup`, `create-app` |
| Build feature | `wave/wave-feature-builder`, `wave/wave-form-builder` |
| Audit de seguridad | `pnpm audit`, `security-and-hardening`, `owasp-security` |
| Code review | `code-review-and-quality`, `code-simplification` |
| Release | `release-it`, `shipping-and-launch` |