---
name: iaworkspace-patterns
description: Conventions of the iaWorkSpace workspace (multi-root VS Code meta-repo, not a monorepo) — independent apps in apps/, skills committed in .agents/skills/, pre-deploy verification, container architecture (openclaw/opencode/open-design), OWASP security, fleet deployment via Coolify/Traefik.
license: Internal
---

# iaWorkSpace Patterns

Repo: `/Users/edd/Projects/eddremonts86/iaWorkSpace/`. NOT a monorepo — it is a multi-root VS Code workspace with independent apps.

## Critical structure

```
iaWorkSpace/
├── apps/<app>/              # gitignored, each app is an independent repo
├── .agents/
│   ├── skills/
│   │   ├── globals/         # 60+ cross-cutting skills
│   │   ├── wave/            # wave-specific
│   │   ├── schilling/       # sch-*
│   │   ├── tanstack-template/
│   │   ├── accesPoint/
│   │   ├── eddremonts/
│   │   └── workspace/       # open-design
│   ├── instructions/        # workspace.md (canonical)
│   └── AGENTS.md
├── .github/
│   ├── copilot-instructions.md   # ADAPTER (sync with .agents/instructions/workspace.md)
│   ├── instructions/
│   └── workflows/
├── docker/
│   ├── openclaw/
│   ├── opencode/
│   └── open-design/
├── prod/
│   ├── docker-compose.fleet.yml   # full fleet
│   ├── compose.d/                 # one per app
│   ├── traefik/                   # reverse proxy
│   └── stack.config.mjs           # central config
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

## Hard rules (from AGENTS.md)

1. **English only** — all generated content (code, comments, docs, commits, files). Even if the user chats in Spanish.
2. **No hardcoded secrets** — `.env` (gitignored) + `.env.example` (placeholders). Frontend reads `import.meta.env.VITE_*`.
3. **CORS:** never `Access-Control-Allow-Origin: *` in prod; never `credentials: true` + wildcard origin. Vite proxy is dev-only.
4. **HTTP headers** — CSP, X-Frame-Options, X-Content-Type-Options, Referrer-Policy, Permissions-Policy are mandatory.
5. **React XSS** — sanitize with DOMPurify before `dangerouslySetInnerHTML`. No `eval`, `document.write`, raw `innerHTML`.
6. **Pre-release gate** — `pnpm audit` with 0 Critical and 0 High.
7. **Skills/MCP committed to the workspace** — DO NOT install in `~/.agents/skills/`. PR in `.agents/skills/<scope>/<name>/SKILL.md`.

## Root commands

```bash
pnpm install            # root tooling (no app deps); also installs git hooks
pnpm doctor          # verify integrity (folders, scripts, .gitignore, skills index)
pnpm audit           # cross-app security audit
pnpm audit:<app>     # single app
pnpm suggest         # audit + suggested diffs
pnpm fix             # audit + auto-apply LOW/MEDIUM fixes
pnpm check:cors|secrets|headers|deps|xss|noir
pnpm lint            # eslint + markdownlint-cli2
pnpm format          # prettier --write

# Containers
pnpm containers:up
pnpm containers:status
pnpm od:provider     # configure open-design provider
pnpm od:link         # refresh designs/<slug>/ symlinks
pnpm od:migrate      # one-time migrate legacy

# Deploy
node scripts/deploy/preflight-deploy.mjs --app <name>
node scripts/deploy/preflight-deploy.mjs --all
```

**App-specific** (build/test/dev) → `cd apps/<name>/`, never from root.

## Container architecture

3 containers + shared infra (see `containers-architecture` skill):

- **openclaw** — port 8080, mounts `.:/workspace/repo` (upstream owns `/workspace`).
- **opencode** — port 3000, mounts `.:/workspace`.
- **open-design** — port 8081, mounts `.:/workspace`.

Persistence: `docker/openclaw/config/`, `docker/opencode/config/`, `docker/open-design/data/` (gitignored, host-visible).

Pre-commit hook in `.githooks/pre-commit` rejects commits to `docker/*/data/`.

## Skills organization

Skills committed to the workspace, NOT user-scope:

```
.agents/skills/
├── globals/<name>/SKILL.md         # cross-cutting
├── <app-scope>/<prefix>-<name>/SKILL.md  # specific
└── workspace/<name>/SKILL.md      # open-design integration
```

**Naming convention:**
- `globals/` — no prefix: `hetzner-cloud`, `coolify-env-sync`, `clean-architecture`
- `<app>/` — app prefix: `wave-form-builder`, `sch-coding-standard`, `tt-docker-stack`, `ap-deployment`, `edd-ui-components`

**Index files** (update when adding a skill):
- `globals-index.md`
- `project-skills-index.md`

## Adding a new app

1. Clone the app repo into `apps/<name>/` (stays gitignored at the root).
2. Register in `projects.code-workspace` `folders[]`.
3. `pnpm doctor` — validates folder + script paths + per-app `.gitignore`.
4. Commit only workspace-level changes (`projects.code-workspace`, skills index). Never `apps/<name>/` from root.

## Conventional commits (English)

```
feat: add new endpoint for user export
fix(cli): prevent crash in save_config when model is missing
docs: update AGENTS.md with new preflight check
chore: bump dependencies
test: add e2e test for login flow
refactor: extract user validation into shared module
```

Common scopes: `cli, gateway, tools, skills, agent, install, api, ui, db, deploy`.

## Pre-commit hooks (Husky)

```bash
# .husky/pre-commit (in each app)
pnpm lint-staged
node ../../scripts/deploy/preflight-deploy.mjs --app $(basename $PWD)
```

`lint-staged`: prettier + eslint --fix on staged files.

## Deploy workflow

```bash
# 1. Branch and PR
git checkout -b feat/my-feature
git commit -m "feat: ..."
git push origin feat/my-feature
gh pr create

# 2. Pre-merge: CI passes (lint + test + audit + preflight)

# 3. Merge to main → trigger webhook → Coolify auto-deploy

# 4. Post-deploy verification
node scripts/prod/status.sh
curl https://my-app.example.com/health
ssh hetzner "docker logs --tail 100 my-app-app-1"

# 5. If it fails → rollback via Coolify dashboard or:
node scripts/prod/exec.sh my-app pnpm db:migrate:rollback
```

## Security baseline

Each app must have:

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
// _headers file (if Caddy) or middleware
{
  'Content-Security-Policy': [
    "default-src 'self'",
    "script-src 'self' 'unsafe-inline'",  // only if you use inline scripts
    "style-src 'self' 'unsafe-inline'",
    "img-src 'self' data: https:",
    "connect-src 'self' https://api.example.com",
    "frame-ancestors 'none'",
    "base-uri 'self'",
    "form-action 'self'",
  ].join('; '),
}
```

## Available scripts (summary)

| Script | Purpose |
|---|---|
| `scripts/prod/up.sh` | Bring up the full fleet |
| `scripts/prod/down.sh` | Bring down the fleet |
| `scripts/prod/status.sh` | Status of all services |
| `scripts/prod/setup.sh` | Initial setup (create networks, volumes) |
| `scripts/prod/logs.sh [service]` | Tail logs |
| `scripts/prod/exec.sh <svc> <cmd>` | Exec into container |
| `scripts/prod/psql.sh` | Connect to prod Postgres |
| `scripts/prod/open.sh <svc>` | Open service URL |
| `scripts/prod/urls.sh` | List active URLs |
| `scripts/prod/verify.sh` | Verify health checks |
| `scripts/prod/reseed.sh <svc>` | Reset + seed DB |
| `scripts/prod/register-app.mjs --name X --domain Y` | Register a new app |
| `scripts/prod/generate-compose.mjs` | Compile fleet + compose.d/ → docker-compose.fleet.yml |
| `scripts/coolify/sync-env.mjs --app X` | Sync .env → Coolify dashboard |
| `scripts/coolify/set-post-deploy.mjs --app X --command "..."` | Set post-deploy hook |
| `scripts/coolify/add-deploy-key.sh <repo>` | Add SSH deploy key |
| `scripts/deploy/preflight-deploy.mjs` | 12 pre-deploy checks |
| `scripts/deploy/preflight-apply.sh` | Legacy bash version |
| `scripts/containers/backup.sh` | Tarball container state |
| `scripts/containers/open-openclaw.sh` | Open OpenClaw UI |
| `scripts/workspace/init.mjs` | Init workspace |
| `scripts/workspace/doctor.mjs` | Verify workspace integrity |
| `scripts/workspace/install-git-hooks.sh` | Install pre-commit hook |
| `scripts/workspace/setup-git-credentials.sh` | Setup git identity |
| `scripts/workspace/sync-pnpm-builds.mjs` | Sync cross-app builds |

## Common errors (from AGENTS.md "Things agents commonly get wrong")

1. ❌ Building/testing/linting an app from root → `cd apps/<name>`.
2. ❌ Editing `apps/<name>/` expecting root `git status` to show it.
3. ❌ Treating README "6 apps" as ground truth → read `projects.code-workspace`.
4. ❌ Writing non-English because the user chats in another language.
5. ❌ Adding skills to `~/.agents/skills/` instead of committing in `.agents/skills/`.
6. ❌ Forgetting to update the skills index when adding a skill.
7. ❌ `docker compose up` from root → does not work; root compose is containers-only.

## Package management

- **pnpm 9.0.0+** (lockfile: `pnpm-lock.yaml`)
- **Node >= 18** (`.nvmrc` pins it)
- Plain `node`/`bash` scripts, no wrappers
- Prettier 2-space TS/JS/JSON
- markdownlint-cli2

## Typical stack per app

| App | Stack |
|---|---|
| wave / wave1 | Vite + React 19 + TanStack + shadcn |
| schilling | TBD (legacy) |
| accesPoint | TBD (legacy) |
| royaltyValidator | TBD |
| confluence-md | TBD |
| tanstack-template | TanStack Start + Drizzle |
| eddremonts/* | Vite + React + Vite |

## When to use each skill

| Task | Skill |
|---|---|
| Deploy to VPS | `hetzner-cloud`, `coolify-deploy`, `prod-deploy-verification` |
| Multi-service compose | `coolify-deploy`, `prod-deploy-verification` |
| Sync env | `coolify-deploy`, `env-config` |
| Configure containers | `containers-architecture` |
| OpenClaw/OpenCode/OpenDesign | `containers-architecture`, `open-design-integration` |
| Build a TanStack app | `tanstack-start-coolify-deploy`, `tanstack-template/tt-*` |
| Create a new app | `new-app-setup`, `create-app` |
| Build feature | `wave/wave-feature-builder`, `wave/wave-form-builder` |
| Security audit | `pnpm audit`, `security-and-hardening`, `owasp-security` |
| Code review | `code-review-and-quality`, `code-simplification` |
| Release | `release-it`, `shipping-and-launch` |