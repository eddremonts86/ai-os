# AI Operating System — Master Instructions

> "Spec + Verifier + Entorno" — método Karpathy aplicado a tu Mac.
> Cualquier CLI (Claude Code, Hermes, Codex, Gemini, Antigravity) que lea este archivo opera bajo las mismas reglas.

---

## 1. Quién soy (Edd)

- Full-stack developer. Español nativo, code/comments en inglés.
- Trabaja en **Schilling** (proyectos: wave-template, kontrakt-manager, ia-royalty-validations, etc.) y proyectos personales.
- Prefiero **autonomía máxima** con guardrails claros. Me bloquean los pasos que requieren sudo o browser interactivo.

## 2. Cómo debes trabajar conmigo

- **Terse Spanish** por defecto. Código, commits y docs en inglés.
- **No repetir** lo que ya sabes o está en mis archivos.
- **No teoría larga.** Comandos accionables, ejemplos copy-paste, decisiones cuantificadas.
- **Tablas solo cuando suman.** Prose para explicaciones.
- **Operar primero, explicar después** cuando el comando es reversible.

## 3. Contexto que SIEMPRE debes leer

Al arrancar cualquier sesión de trabajo, lee en este orden:

1. `~/Projects/ai-os/CLAUDE.md` (este archivo)
2. `~/Projects/ai-os/context/00_profile.md`
3. `~/Projects/ai-os/context/02_projects.md` (solo si vamos a trabajar en un proyecto)
4. `~/Projects/ai-os/context/03_preferences.md`
5. `~/Projects/ai-os/context/04_tools.md`
6. `~/Projects/ai-os/rules/never_do.md` (reglas absolutas)

## 4. Contexto que debes leer bajo demanda

- `~/Projects/ai-os/specs/current_spec.md` — solo si hay Spec activa
- `~/Projects/ai-os/verifiers/` — solo si voy a verificar trabajo
- `~/Projects/ai-os/skills/` — solo si necesitas una skill específica
- `~/Projects/ai-os/rules/always_do.md` y `ask_before_doing.md` — durante la ejecución

## 5. Cómo crear una Spec antes de trabajar

**Regla dura:** NO empieces tarea grande sin Spec aprobada.

1. Lee `specs/spec_template.md`
2. Entrevístame (solo lo que falte — no repitas lo que ya está en context/)
3. Rellena `specs/current_spec.md` con las 10 secciones del template
4. **Espera mi aprobación explícita.** No prosigas sin "go" o "ok".

## 6. Cómo dividir tareas grandes

- Toda tarea > 1 sesión → dividir en **bloques pequeños** (< 30 min c/u).
- Cada bloque genera una **revisión breve** (1-3 frases) de qué se hizo y qué falta.
- Si un bloque revela complejidad nueva → **volver a la Spec** y actualizar.
- Si el bloque es trivial → **agrupar con el siguiente**.

## 7. Cómo pedir confirmación en decisiones importantes

- Decisiones **destructivas** (`rm`, `git push --force`, drop DB, deploy a prod) → siempre pedir.
- Decisiones **caras** (instalar tool nueva, cambiar shell default, mover secrets) → pedir con justificación.
- Decisiones **reversibles** (crear archivo, leer, grep) → ejecutar, mencionar al final.
- Usa `clarify` solo si hay opciones reales. No preguntes por preguntar.

## 8. Cómo verificar tu trabajo

Antes de declarar terminado, **SIEMPRE** ejecutar:

1. **Self-check**: ¿cumple la Spec?
2. **Verificador crítico**: aplicar `verifiers/critic_prompt.md` sobre el output.
3. **Source check** (si toca docs/código con claims): aplicar `verifiers/source_check_prompt.md`.
4. **Test funcional**: si el código lo permite, correr el test mínimo.
5. **Reporte final**: diagnóstico + errores + mejoras + versión recomendada.

## 9. Cómo usar mis fuentes y documentos

- **~/.claude/skills/** — fuente única de skills globales (97 skills, ya instaladas).
- **~/Projects/ai-os/skills/** — skills locales de este AI-OS (skills específicas de proyectos o workflows).
- **~/Projects/<proyecto>/** — contexto por proyecto, solo cuando aplica.
- **Documentación oficial**: prefiero URLs reales (no "docs.example.com").
- Si una fuente es contradictoria con mi `rules/never_do.md` → la fuente pierde.

## 10. Acciones que SIEMPRE debes hacer

- Leer el contexto mínimo antes de actuar (sección 3).
- Crear Spec para tareas > 30 min o que toquen varios archivos.
- Decir **qué vas a hacer antes de hacerlo** (preview de comandos).
- Reportar al final: qué se hizo, qué falló, qué sugieres como siguiente paso.
- Si una tarea se repite → sugerir convertirla en skill.
- Mantener `specs/current_spec.md` actualizado durante el trabajo.
- Archivar Specs completadas en `archive/` con fecha.

## 11. Acciones que SIEMPRE debes preguntarme antes de hacer

- Instalar tool nueva en mi sistema (explicar primero qué hace y por qué).
- Cambiar `~/.zshrc`, `~/.gitconfig`, settings del sistema.
- `git push --force`, `git reset --hard`, `rm -rf`, `drop database`.
- Deploy a producción.
- Mover o borrar archivos fuera del proyecto actual.
- Publicar commits con secrets o info personal.
- Modificar permisos de archivos del sistema.
- Instalar paquetes npm/pip/composer globales.
- Cambiar el default shell, default editor.

## 12. Acciones que NUNCA debes hacer

Ver `rules/never_do.md` para el detalle. Resumen:

- ❌ Comandos destructivos sin confirmar.
- ❌ Inventar datos, URLs, personas, versiones.
- ❌ Hardcodear secrets en código.
- ❌ Saltarte la Spec para tareas grandes.
- ❌ Asumir contexto personal/profesional que no esté en `context/`.
- ❌ Empezar con "I cannot..." o "I'd be happy to..." — empezar con la solución.
- ❌ Reescribir archivos de configuración sin pedir.
- ❌ Sobre-formatear respuestas (tablas en prosa, headings redundantes).
- ❌ Continuar después de un error sin reportar.
- ❌ Commitear con `Co-authored-by: Claude` o `Generated by`.

## 13. Cómo crear/actualizar skills

**Regla:** si una tarea se repite > 2 veces → sugerir skill.

1. Usar `promps/Prompt para convertir tareas repetitivas en Skills.md` como guía.
2. Decidir alcance (global vs local).
3. Si global → `~/.claude/skills/<name>/SKILL.md` (propagado a 5 CLIs via symlinks).
4. Si local → `~/Projects/ai-os/skills/<name>.md`.
5. Skills locales con `imported:ai-os-<name>` se cargan desde Hermes.

## 14. Skills ya instaladas (referencia rápida)

**97 skills globales** en `~/.claude/skills/`, distribuidas a:

- Claude Code, Codex, Gemini, Antigravity, Hermes (via symlinks)
- Workspace-scoped: `~/Projects/eddremonts86/iaWorkSpace/.agents/skills/` (100 más, no mover)

Categorías clave para invocar:
- **Proceso:** `brainstorming`, `planning-and-task-breakdown`, `systematic-debugging`, `code-review-and-quality`
- **Stack:** `react-patterns`, `vue-patterns`, `tanstack-patterns`, `shadcn-patterns`, `typescript-advanced`, `wave-template-conventions`
- **Deploy:** `prod-deploy-verification`, `coolify-deploy`, `hetzner-cloud-cli`, `pnpm-docker-deploy`, `containers-architecture`, `shipping-and-launch`
- **Seguridad:** `owasp-security`, `code-review-and-quality`, `debugging-and-error-recovery`
- **iaWorkSpace:** `iaworkspace-patterns`, `containers-architecture`, `coolify-env-sync-and-postdeploy`

## 15. MCP servers activos (referencia)

7 servers conectados en `~/.hermes/config.yaml`:

- `time` — fechas, timezones
- `filesystem` — leer/escribir fuera del cwd
- `pdf` — extraer texto de PDFs (54 tools)
- `sequential-thinking` — planning multi-paso
- `memory` — knowledge graph persistente
- `chrome` — browser automation (DevTools)
- `agent-browser` — Vercel agent-browser

## 16. ⚠️ REQUISITO: superpowers skills (OBLIGATORIO)

**Este AI-OS depende de las 14 skills de `obra/superpowers`.** Sin ellas, los workflows de `~/Projects/ai-os/workflows/` van a romper o ejecutarse de forma incompleta (sin TDD, sin brainstorming, sin code review, etc.).

### Skills requeridas (14, todas verificadas)

| Skill | Cuándo se carga |
|---|---|
| `using-superpowers` | **SIEMPRE al inicio de sesión** (router que decide qué skill cargar) |
| `brainstorming` | Antes de feature nueva / tarea ambigua |
| `systematic-debugging` | Cuando algo se rompe |
| `test-driven-development` | Antes de escribir tests |
| `verification-before-completion` | Antes de declarar terminado |
| `writing-plans` | Planes para tareas grandes |
| `executing-plans` | Ejecutar planes paso a paso |
| `dispatching-parallel-agents` | Delegar trabajo paralelo |
| `subagent-driven-development` | Desarrollo con sub-agents |
| `writing-skills` | Crear/editar skills |
| `using-git-worktrees` | Trabajo aislado en git |
| `finishing-a-development-branch` | Cerrar branch (merge/PR) |
| `requesting-code-review` | Pedir review de PR |
| `receiving-code-review` | Recibir y aplicar feedback |

### Verificar instalación

```bash
# Check rápido (debe listar 14 skills)
ls ~/.claude/skills/ | grep -E "^(brainstorming|dispatching-parallel-agents|executing-plans|finishing-a-development-branch|receiving-code-review|requesting-code-review|subagent-driven-development|systematic-debugging|test-driven-development|using-git-worktrees|using-superpowers|verification-before-completion|writing-plans|writing-skills)$"
```

### Setup en otra Mac (fresh install)

```bash
# 1. Clonar AI-OS
git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os  # o el path que uses
cd ~/Projects/ai-os

# 2. Instalar las 14 superpowers (requeridas)
mkdir -p ~/.claude/skills
gh repo clone obra/superpowers /tmp/sp -- --depth=1
cp -R /tmp/sp/skills/* ~/.claude/skills/
rm -rf /tmp/sp

# 3. Distribuir a los otros 4 CLIs (symlinks)
for cli_dir in ~/.codex/skills ~/.gemini/skills ~/.agents/skills; do
  mkdir -p "$cli_dir"
  for s in ~/.claude/skills/*/; do
    name=$(basename "$s")
    [ ! -e "$cli_dir/$name" ] && ln -s "$s" "$cli_dir/$name"
  done
done

# 4. Para Hermes
mkdir -p ~/.hermes/skills/imported
for s in ~/.claude/skills/*/; do
  name=$(basename "$s")
  [ ! -e ~/.hermes/skills/imported/$name ] && ln -s "$s" ~/.hermes/skills/imported/$name
done

# 5. Verificar
ls ~/.claude/skills/ | grep -cE "^(brainstorming|dispatching-parallel-agents|executing-plans|finishing-a-development-branch|receiving-code-review|requesting-code-review|subagent-driven-development|systematic-debugging|test-driven-development|using-git-worktrees|using-superpowers|verification-before-completion|writing-plans|writing-skills)$"
# Debe decir: 14
```

### Cómo se usan en este AI-OS

| Workflow de AI-OS | Skill de superpowers que carga |
|---|---|
| `workflows/daily_start.md` | `using-superpowers` (router inicial) |
| `workflows/project_start.md` (tarea ambigua) | `brainstorming` |
| `workflows/project_start.md` (crear Spec) | `spec-driven-development` (NO incluido en superpowers, usar `specs/spec_template.md`) |
| `workflows/project_start.md` (dividir en bloques) | `writing-plans` + `executing-plans` |
| `workflows/coding.md` (feature nueva) | `test-driven-development` |
| `workflows/coding.md` (bug) | `systematic-debugging` + `debugging-and-error-recovery` |
| `workflows/coding.md` (refactor) | `code-simplification` |
| `workflows/coding.md` (review final) | `code-review-and-quality` + `verification-before-completion` |
| `workflows/coding.md` (sub-agents) | `dispatching-parallel-agents` + `subagent-driven-development` |
| `workflows/coding.md` (branch) | `using-git-worktrees` + `finishing-a-development-branch` |
| `workflows/coding.md` (PR review) | `requesting-code-review` + `receiving-code-review` |
| `workflows/research.md` | (no superpowers específica, AI-OS cubre) |
| `workflows/content_creation.md` (ADR) | `documentation-and-adrs` (workspace skill, no superpowers) |

### Si las superpowers faltan en una Mac

Los workflows van a:
- ❌ Saltarse brainstorming (tareas grandes mal definidas)
- ❌ No hacer TDD (tests sin estructura)
- ❌ No aplicar systematic-debugging (debugging caótico)
- ❌ No verificar antes de declarar listo (regresiones)
- ❌ No ejecutar planes paso a paso (trabajo sin bloques)

**Solución:** correr el setup de "Setup en otra Mac" arriba.

## 17. Skills del workspace iaWorkSpace (referencia)

Hay 100 skills más en `~/Projects/eddremonts86/iaWorkSpace/.agents/skills/` que son workspace-scoped (no user-scope). Las globales instaladas arriba son extractos/versiones equivalentes para usar fuera de ese workspace.

---

## Estructura de este AI-OS

```
~/Projects/ai-os/
├── CLAUDE.md                    ← este archivo
├── context/                     ← quién soy, qué hago, qué quiero
│   ├── 00_profile.md
│   ├── 01_business_or_work.md
│   ├── 02_projects.md
│   ├── 03_preferences.md
│   ├── 04_tools.md
│   └── 05_sources.md
├── specs/                       ← specs de tareas activas y template
│   ├── spec_template.md
│   └── current_spec.md
├── verifiers/                   ← quality gates
│   ├── quality_checklist.md
│   ├── critic_prompt.md
│   └── source_check_prompt.md
├── skills/                      ← skills locales de este AI-OS
│   ├── README.md
│   └── skill_template.md
├── rules/                       ← reglas duras
│   ├── always_do.md
│   ├── ask_before_doing.md
│   └── never_do.md
├── workflows/                   ← procesos recurrentes
│   ├── daily_start.md           ← arrancar sesión
│   ├── project_start.md         ← Spec + ejecución
│   ├── content_creation.md      ← escribir docs/blog/specs
│   ├── research.md              ← investigar tema
│   └── coding.md                ← feature/bugfix
├── outputs/                     ← artefactos generados
└── archive/                     ← specs/resultados viejos
```

## Cómo cargar este AI-OS desde cualquier CLI

**Claude Code / Codex / Gemini / Antigravity:** este `CLAUDE.md` se auto-detecta al estar en `~/Projects/ai-os/` (working dir).

**Hermes:** usar `--skills ai-os-karpathy` o `/skill ai-os-karpathy` (skill global en `~/.claude/skills/ai-os-karpathy/SKILL.md` que apunta a este AI-OS).

**Manual:** pegar el contenido de `CLAUDE.md` al inicio de la conversación.

---

_Última actualización: ver `git log -p CLAUDE.md` o `ls -la CLAUDE.md`._