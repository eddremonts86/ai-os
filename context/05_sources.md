# 05 — Sources

## Documentación oficial (preferir URLs reales)

### Lenguajes / Frameworks

- **TypeScript:** https://www.typescriptlang.org/docs/handbook/
- **React:** https://react.dev/
- **Vue 3:** https://vuejs.org/guide/
- **Nuxt:** https://nuxt.com/docs
- **Next.js:** https://nextjs.org/docs
- **Svelte:** https://svelte.dev/docs
- **Node.js:** https://nodejs.org/en/docs
- **Python:** https://docs.python.org/3/
- **PHP:** https://www.php.net/docs.php
- **Drupal:** https://www.drupal.org/docs

### Tooling

- **Vite:** https://vitejs.dev/
- **TanStack:** https://tanstack.com/
- **shadcn/ui:** https://ui.shadcn.com/
- **Tailwind:** https://tailwindcss.com/docs
- **Playwright:** https://playwright.dev/docs/intro
- **Vitest:** https://vitest.dev/
- **MSW:** https://mswjs.io/docs/
- **Percy:** https://docs.percy.io/
- **Sentry:** https://docs.sentry.io/

### Infra / DevOps

- **Homebrew:** https://docs.brew.sh/
- **Docker:** https://docs.docker.com/
- **Traefik:** https://doc.traefik.io/traefik/
- **Coolify:** https://coolify.io/docs
- **Hetzner Cloud:** https://docs.hetzner.cloud/
- **Nginx:** https://nginx.org/en/docs/
- **Postgres:** https://www.postgresql.org/docs/
- **Redis:** https://redis.io/docs/

### AI / Hermes

- **Hermes Agent docs:** https://hermes-agent.nousresearch.com/docs/
- **Hermes repo:** https://github.com/NousResearch/hermes-agent
- **MCP spec:** https://modelcontextprotocol.io/
- **Claude Code:** https://docs.claude.com/en/docs/claude-code
- **Codex CLI:** https://github.com/openai/codex

## Skills globales (source of truth)

- **Path:** `~/.claude/skills/`
- **READMEDD:** `~/.claude/skills/READMEDD.md` (índice completo)
- **Distribución:** symlinks a `~/.codex/`, `~/.gemini/`, `~/.agents/`, `~/.hermes/skills/imported/`
- **Total:** 97 skills

## Documentación interna por proyecto

- **wave-template:** `~/Projects/ei-schilling/wave-template/web-docs/` (Docusaurus oficial).
- **hermes-agent:** `~/Projects/eddremonts86/hermes-agent/website/docs/`.
- **iaWorkSpace:** `~/Projects/eddremonts86/iaWorkSpace/README.md` + `SPEC.md` + `AGENTS.md`.
- **Hermes docs site:** https://hermes-agent.nousresearch.com/docs/

## Repos de referencia (open source skills)

- **anthropics/skills:** https://github.com/anthropics/skills (oficial)
- **obra/superpowers:** https://github.com/obra/superpowers (proceso)
- **pbakaus/impeccable:** https://github.com/pbakaus/impeccable (frontend design)
- **Leonxlnx/taste-skill:** https://github.com/Leonxlnx/taste-skill (taste)
- **antfu/skills:** https://github.com/antfu/skills (Vue/Vite ecosystem, 19 skills)
- **secondsky/claude-skills:** https://github.com/secondsky/claude-skills (community plugins)

## Skills marketplaces

- **https://skills.sh/** — `npx skills find <query>`
- **https://skillsmp.com/** — directorio

## Reglas sobre fuentes

1. **Preferir documentación oficial** sobre tutoriales random.
2. **Verificar versión** — React 18 vs 19 cambia mucho.
3. **Si contradice mi contexto** → mi contexto gana, documentar la diferencia.
4. **URLs verificadas** — no "docs.example.com" placeholders.
5. **Si una fuente no responde** → no inventar, decir "no pude verificar".

## Cuándo buscar vs cuándo ya sé

| Ya sé (consultar memoria) | Buscar en fuentes |
|---|---|
| Patrones generales del stack | Versiones específicas |
| Mis preferences | Breaking changes recientes |
| Skills instaladas | APIs deprecadas |
| Config de mi Mac | Nuevas features de tools |
| Proyectos activos | Comandos específicos de una tool |