# Skills globales instalados (Edd)

Base de comportamiento para **todo desarrollo e interacción con IA** en esta máquina. Aplican a **cualquier agente** que las lea (Claude Code, Codex CLI, Gemini CLI, GitHub Copilot CLI, Hermes, Antigravity).

## Total: 97 skills

### Fuentes oficiales
- **superpowers** (obra/superpowers) — 13 skills de proceso: TDD, debugging sistemático, brainstorming, planes, code review, sub-agents, worktrees, etc.
- **taste-skill** (Leonxlnx/taste-skill) — 13 skills de taste: brandkit, brutalist, minimalist, soft, stitch, redesign, image-to-code, etc.
- **impeccable** (pbakaus/impeccable) — 1 skill de diseño frontend
- **anthropics/skills** — 6 oficiales: frontend-design, mcp-builder, webapp-testing, pdf, claude-api, skill-creator
- **secondsky/claude-skills** — 18 community plugins: react-*, tanstack-*, shadcn-vue, tailwind-v4-shadcn, typescript-mcp, vitest-testing, playwright, fastmcp, mcp-*, etc.
- **antfu/skills** (Anthony Fu, 5.4k⭐) — 19 skills del ecosistema Vue/Vite/Nuxt: antfu-meta, antfu-design-patterns, antfu-nitro, antfu-nuxt, antfu-pinia, antfu-pnpm, antfu-slidev, antfu-tsdown, antfu-turborepo, antfu-unocss, antfu-vite, antfu-vitepress, antfu-vitest, antfu-vue, antfu-vue-best-practices, antfu-vue-router, antfu-vue-testing, antfu-vueuse, antfu-web-design

### Skills custom (Edd — basadas en proyectos reales)
- **wave-template-conventions** — convenciones reales del template Wave (Schilling), incluyendo FormContainer+IData[], TanStack, MSW, Playwright, Sentry, Tailwind v4
- **hermes-mcp-pattern** — patrones reales de hermes-agent (tools registry, MCP manifest v1, plugins, skills frontmatter, scripts/run_tests.sh)
- **iaworkspace-patterns** — convenciones del meta-repo iaWorkSpace (apps/, .agents/skills committed, preflight-deploy, container architecture, seguridad)
- **hetzner-cloud-cli** — hcloud CLI patterns para VPS Hetzner (CX/CCX/CPX/CAX, networks, firewalls, floating IPs, snapshots)
- **coolify-deploy** — deploy a Coolify (compose multi-service, env sync, Traefik labels, healthchecks)
- **coolify-env-sync-and-postdeploy** — sync-env.mjs (deny-list, idempotente) + set-post-deploy.mjs (post_deployment_command nativo)
- **tanstack-start-coolify-deploy** — deploy TanStack Start con wrapper server.prod.mjs, Dockerfile multi-stage target=prod, fqdn bug fix, server-only imports con subpath
- **prod-deploy-verification** — 12 checks pre-flight (lockfile, deps, Dockerfile, env, compose, health, db-migrations, secrets, headers, cors, build, size)
- **prod-fleet-register** — registrar apps en fleet Traefik + mkcert + /etc/hosts + certs wildcard local
- **pnpm-docker-deploy** — fix pnpm v11 ERR_PNPM_IGNORED_BUILDS (onlyBuiltDependencies, enable-pre-post-scripts, lockfile settings, Dockerfile pattern)
- **containers-architecture** — 3 agent containers (openclaw, opencode, open-design) + LLM runtimes (ollama, llama-cpp, lmstudio) + storage (postgres+postgis, chromadb)
- **open-design-integration** — open-design daemon (127.0.0.1:7456) para DESIGN.md + design tokens + 5 escuelas visuales + flujo ProblemHunt Scraper→SPEC→DESIGN→PLAN→TASKS
- **shipping-and-launch** — pre-launch checklist 6 secciones + feature flag lifecycle completo + staged rollouts + monitoring post-deploy + rollback plan ANTES
- **ci-cd-and-automation** — pipeline GitHub Actions con 8 quality gates + preview deployments + size limit + cache optimization
- **owasp-security** — Top 10 OWASP 2021 con mitigaciones code-first (XSS, SQL injection, CSRF, auth, secrets, deps, logging)
- **debugging-and-error-recovery** — 4 fases sistemático (reproducir → aislar → hipótesis → fix) + bisect + DevTools + post-mortem
- **code-review-and-quality** — comentarios con prefijos (🔴/🟡/💡/❓/🎓) + tamaño PR + checklist detallado
- **release-it-framework** — production-ready patterns (circuit breaker, bulkhead, retry+backoff, schema expand-contract, RED/USE, chaos engineering)
- **env-config-and-secrets** — gestión de .env, type-safe loading (zod + varlock), sync a Coolify, rotation policy, detección de leaks
- **env-config-iaworkspace** — Port Allocation Map + AUTH_MODE local/clerk/hybrid + 7 secciones canónicas de .env (Application→Database→Auth→Admin→AI Local→AI Cloud→Observability)
- **drupal8-pattern** — Drupal 8/9/10 (custom modules, services, plugins, hooks, forms, theming, Drush)
- **react-patterns** — React 19+ unificado (hooks, Suspense, RSC, composición, performance)
- **vue-patterns** — Vue 3 unificado (Composition API, Pinia, composables, Nuxt 3)
- **tanstack-patterns** — TanStack ecosystem unificado (Query, Router, Table, Form)
- **shadcn-patterns** — shadcn/ui + Radix + Tailwind + cva + theming + forms
- **typescript-advanced** — generics, conditional types, satisfies, branded types

### Skills del workspace iaWorkSpace (committed, no instaladas aquí)

Hay 100 skills más en `/Users/edd/Projects/eddremonts86/iaWorkSpace/.agents/skills/` que son workspace-scoped (no user-scope). Las globales instaladas arriba son extractos/versiones equivalentes para usar fuera de ese workspace.

### Nota sobre Hermes resolver

Hermes tiene un bug donde el resolver `inspect` puede no encontrar skills recien instaladas aunque aparezcan en `list`. Solución: `/reload-skills` o reiniciar el gateway (los symlinks ya están bien, es solo refresh del manifest).

## Ubicaciones (todas son symlinks al mismo origen)

- `~/.claude/skills/` — source of truth (60 skills)
- `~/.codex/skills/` — Codex CLI (60 symlinks)
- `~/.gemini/skills/` — Gemini CLI (60 symlinks)
- `~/.agents/skills/` — Antigravity, Copilot CLI (60 symlinks)
- `~/.hermes/skills/imported/` — Hermes (60 symlinks, invocar como `imported:<skill>`)

Una sola fuente de verdad. Actualizar en `~/.claude/skills/` propaga a las demás.

## Cómo añadir una skill nueva

```bash
# Bajar SKILL.md a ~/.claude/skills/<nombre>/SKILL.md
# Luego propagar via symlinks:
for d in ~/.codex/skills ~/.gemini/skills ~/.agents/skills ~/.hermes/skills/imported; do
  ln -s ~/.claude/skills/<nombre> "$d/<nombre>"
done
```

## Cómo invocar

- **Claude Code:** `/skill <name>` o auto-load por description
- **Hermes:** `--skills <name>` o `/skill <name>` o auto-load
- **Codex/Copilot/Gemini:** auto-load al inicio de sesión

## Meta-skill

**using-superpowers** define cómo descubrir y aplicar las demás. Es la primera que cualquier agente debe cargar.

## Actualización

```bash
cd /tmp && gh repo clone obra/superpowers -- --depth=1
cd superpowers/skills && for d in */; do cp -R "$d" ~/.claude/skills/"${d%/}"; done
rm -rf /tmp/superpowers
```

Para secondsky y anthropics:
```bash
cd /tmp && gh repo clone secondsky/claude-skills -- --depth=1
cd claude-skills/plugins && for d in */; do cp -R "$d" ~/.claude/skills/"${d%/}"; done
rm -rf /tmp/claude-skills
```

