---
name: ai-os-karpathy
description: AI Operating System local de Edd basado en el método "Spec + Verifier + Entorno" de Andrej Karpathy. Carga contexto persistente (perfil, proyectos, preferencias, tools) desde ~/Projects/ai-os/ y aplica workflows de Spec/verifier antes de cualquier tarea grande. Aplica al arrancar sesión en Claude Code, Hermes, Codex, Gemini o Antigravity.
license: Internal
---

# AI Operating System (Karpathy Method)

## Cuándo invocar

- **Al iniciar cualquier sesión de trabajo** en cualquier CLI.
- Cuando vas a hacer una tarea grande (> 30 min, varios archivos).
- Cuando necesitás contexto persistente entre sesiones.
- Cuando querés Spec → ejecución → verificación como flujo estándar.

## Path del AI-OS

`~/Projects/ai-os/` — repo local con CLAUDE.md, context/, rules/, workflows/, specs/, verifiers/, skills/, outputs/, archive/.

**Cargar al inicio de sesión:**

1. `~/Projects/ai-os/CLAUDE.md` — instrucciones maestras (siempre).
2. `~/Projects/ai-os/context/00_profile.md` — quién soy.
3. `~/Projects/ai-os/context/02_projects.md` — proyectos activos (si vas a tocar uno).
4. `~/Projects/ai-os/context/03_preferences.md` — estilo de respuesta.
5. `~/Projects/ai-os/context/04_tools.md` — qué tools hay instaladas.
6. `~/Projects/ai-os/rules/never_do.md` — reglas absolutas.

## Cargar bajo demanda

- `specs/current_spec.md` — si hay Spec activa.
- `verifiers/critic_prompt.md` — antes de declarar terminado.
- `verifiers/source_check_prompt.md` — si hay claims externos (URLs, versiones, APIs).
- `rules/always_do.md` + `rules/ask_before_doing.md` — durante ejecución.
- `workflows/` — el workflow que aplique (`daily_start`, `project_start`, `coding`, etc.).

## Workflow principal (resumen)

### Tarea grande (> 30 min)

1. **Cargar AI-OS** (pasos arriba).
2. **Cargar skills relevantes** según el área (ver tabla abajo).
3. **Entrevistar** si la tarea es ambigua (`workflows/project_start.md`).
4. **Crear Spec** en `specs/current_spec.md` usando `specs/spec_template.md`.
5. **Esperar aprobación explícita** antes de ejecutar.
6. **Ejecutar en bloques** < 30 min c/u.
7. **Aplicar verifiers** al final.
8. **Reportar** + archivar Spec.

### Tarea pequeña (< 30 min)

1. Cargar AI-OS (contexto mínimo).
2. Spec mínima inline (objetivo + criterios de éxito).
3. Ejecutar.
4. Verifier si > 5 min.
5. Reportar breve.

## Skills relevantes por área

| Área | Skills a cargar |
|---|---|
| Frontend React/TS | `react-patterns`, `tanstack-patterns`, `shadcn-patterns`, `typescript-advanced`, `frontend-design` |
| Wave/Schilling | `wave-template-conventions`, `tanstack-patterns`, `react-patterns`, `shadcn-patterns` |
| Backend Node | `env-config-and-secrets`, `debugging-and-error-recovery`, `code-review-and-quality`, `owasp-security` |
| Drupal | `drupal8-pattern`, `debugging-and-error-recovery` |
| Vue/Nuxt | `vue-patterns`, `antfu-nuxt`, `antfu-vue`, `antfu-vite` |
| Deploy/Coolify | `coolify-deploy`, `coolify-env-sync-and-postdeploy`, `prod-deploy-verification`, `shipping-and-launch` |
| Hetzner | `hetzner-cloud-cli`, `prod-fleet-register` |
| Debugging | `debugging-and-error-recovery`, `systematic-debugging` |
| Code review | `code-review-and-quality`, `owasp-security` |
| Setup nuevo proyecto | `wave-template-conventions`, `pnpm-docker-deploy`, `tanstack-start-coolify-deploy` |
| Diseño/UX | `frontend-design`, `taste-skill`, `impeccable` |
| Open-design | `open-design-integration`, `frontend-design` |
| Containers/Docker | `containers-architecture`, `pnpm-docker-deploy` |
| Multi-CLI routing | `using-superpowers` (cargar primero si hay múltiples skills relevantes) |

## Reglas absolutas (resumen)

### ALWAYS DO

- Leer contexto mínimo antes de actuar.
- Spec para tareas grandes, esperar aprobación.
- Preview de comandos destructivos.
- Aplicar verifiers antes de declarar terminado.
- Reportar al final (qué hice + qué falló + siguiente paso).

### ASK BEFORE

- Instalar tools globales nuevas.
- Cambiar `~/.zshrc`, `~/.gitconfig`, configs del sistema.
- `git push --force`, `rm -rf`, `DROP DATABASE`.
- Deploy a producción.
- Modificar archivos del AI-OS (`~/Projects/ai-os/`).

### NEVER

- Comandos destructivos sin confirmar.
- Inventar datos, URLs, versiones.
- Hardcodear secrets.
- Saltarse Spec en tareas grandes.
- "I'd be happy to...", "I cannot...", "As you can see...".
- Modificar AI-OS sin pedir.

(Ver `~/Projects/ai-os/rules/never_do.md` para el detalle completo.)

## Idiomas

- **Chat:** Español (Edd prefiere terse Spanish).
- **Código, commits, docs:** inglés.
- **Mensajes de error / logs:** inglés.

## Cómo invocar desde cada CLI

### Claude Code

```bash
# Auto: este archivo se carga si está en ~/.claude/skills/
# Manual: pegar contenido de CLAUDE.md al inicio de conversación
```

### Hermes

```bash
hermes chat --skills ai-os-karpathy
# o
hermes chat -q "tu tarea" --skills ai-os-karpathy
```

### Codex / Gemini / Antigravity

```bash
# Mismo: skill se carga desde ~/.codex/skills/, ~/.gemini/skills/, ~/.agents/skills/
# (vía symlinks a ~/.claude/skills/)
```

### Manual (cualquier CLI)

Pegar este prompt al inicio:

```
Trabaja bajo ~/Projects/ai-os/. Primero lee:
1. ~/Projects/ai-os/CLAUDE.md
2. ~/Projects/ai-os/context/00_profile.md
3. ~/Projects/ai-os/context/03_preferences.md
4. ~/Projects/ai-os/rules/never_do.md

Luego carga skills relevantes y pregunta qué tarea hacer hoy.
```

## ⚠️ Requisito: superpowers skills

**Este AI-OS requiere las 14 superpowers skills de `obra/superpowers`** instaladas en `~/.claude/skills/`. Sin ellas, los workflows se ejecutan incompletos (sin TDD, sin brainstorming, sin code-review).

**Setup en otra Mac:**

```bash
gh repo clone obra/superpowers /tmp/sp -- --depth=1
cp -R /tmp/sp/skills/* ~/.claude/skills/
for cli_dir in ~/.codex/skills ~/.gemini/skills ~/.agents/skills; do
  for s in ~/.claude/skills/*/; do
    name=$(basename "$s")
    [ ! -e "$cli_dir/$name" ] && ln -s "$s" "$cli_dir/$name"
  done
done
mkdir -p ~/.hermes/skills/imported
for s in ~/.claude/skills/*/; do
  name=$(basename "$s")
  [ ! -e ~/.hermes/skills/imported/$name ] && ln -s "$s" ~/.hermes/skills/imported/$name
done
```

**Verificar:**

```bash
ls ~/.claude/skills/ | grep -cE "^(brainstorming|dispatching-parallel-agents|executing-plans|finishing-a-development-branch|receiving-code-review|requesting-code-review|subagent-driven-development|systematic-debugging|test-driven-development|using-git-worktrees|using-superpowers|verification-before-completion|writing-plans|writing-skills)$"
# Debe decir: 14
```

**Mapeo AI-OS → superpowers:**

| Workflow | Superpowers skill |
|---|---|
| `daily_start.md` | `using-superpowers` |
| `project_start.md` (ambiguo) | `brainstorming` |
| `project_start.md` (plan) | `writing-plans` + `executing-plans` |
| `coding.md` (feature) | `test-driven-development` |
| `coding.md` (bug) | `systematic-debugging` |
| `coding.md` (refactor) | `code-simplification` |
| `coding.md` (final) | `verification-before-completion` + `code-review-and-quality` |
| `coding.md` (branch) | `using-git-worktrees` + `finishing-a-development-branch` |
| `coding.md` (PR) | `requesting-code-review` + `receiving-code-review` |
| `coding.md` (paralelo) | `dispatching-parallel-agents` + `subagent-driven-development` |
| `content_creation.md` (ADR) | `documentation-and-adrs` |
| `research.md` (decisión) | `verification-before-completion` + `documentation-and-adrs` |

Ver `~/Projects/ai-os/CLAUDE.md` sección 16 para detalle completo + `~/Projects/ai-os/promps/setup-required-skills.md` para setup paso a paso.

## Distribución

Esta skill está en `~/.claude/skills/ai-os-karpathy/SKILL.md` y se distribuye via symlinks a:

- `~/.codex/skills/`
- `~/.gemini/skills/`
- `~/.agents/skills/`
- `~/.hermes/skills/imported/` (invocable como `imported:ai-os-karpathy`)

Total: 5 CLIs cubiertos.

## Estructura del AI-OS

```
~/Projects/ai-os/
├── CLAUDE.md                    ← instrucciones maestras
├── context/                     ← contexto persistente
│   ├── 00_profile.md
│   ├── 01_business_or_work.md
│   ├── 02_projects.md
│   ├── 03_preferences.md
│   ├── 04_tools.md
│   └── 05_sources.md
├── specs/                       ← Specs de tareas
│   ├── spec_template.md
│   └── current_spec.md          ← Spec activa
├── verifiers/                   ← Quality gates
│   ├── quality_checklist.md
│   ├── critic_prompt.md
│   └── source_check_prompt.md
├── skills/                      ← Skills locales
│   ├── README.md
│   └── skill_template.md
├── rules/                       ← Reglas
│   ├── always_do.md
│   ├── ask_before_doing.md
│   └── never_do.md
├── workflows/                   ← Procesos recurrentes
│   ├── daily_start.md
│   ├── project_start.md
│   ├── content_creation.md
│   ├── research.md
│   └── coding.md
├── outputs/                     ← Artefactos generados
└── archive/                     ← Specs/resultados viejos
```

## Anti-patterns a evitar

- ❌ Cargar AI-OS solo para tareas triviales (overhead).
- ❌ Saltarse Spec en tareas grandes.
- ❌ No aplicar verifiers al final.
- ❌ Modificar archivos del AI-OS sin pedir.
- ❌ Inventar contenido de `context/` (siempre verificar antes de escribir).
- ❌ Asumir que el user ya leyó los archivos (recordar paths relevantes).
- ❌ **Ejecutar workflows sin superpowers skills** instaladas (degradación silenciosa).

## Cuándo NO usar AI-OS

- Tareas triviales (`ls -la`, `git status`, "qué dice este comando").
- Cuando el user explícitamente dice "no cargues AI-OS".
- Cuando hay conflicto con un proyecto específico que tiene su propio AGENTS.md (prioridad al del proyecto).
- En una Mac donde **no se haya corrido `setup-required-skills.md`** (workflows rotos).

## Recursos

- **Path:** `~/Projects/ai-os/`
- **Setup requerido:** `~/Projects/ai-os/promps/setup-required-skills.md`
- **READMEDD de skills globales:** `~/.claude/skills/READMEDD.md`
- **Skills count:** 14 superpowers (REQUIRED) + 84 community/custom (opcional) = 98 totales + 1 AI-OS = 99
- **Método:** "Spec + Verifier + Entorno" — Andrej Karpathy (2025) + superpowers workflow