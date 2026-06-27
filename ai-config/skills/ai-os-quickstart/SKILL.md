---
name: ai-os-quickstart
description: Bootstrap 1-línea del AI Operating System de Edd en cualquier CLI (Claude Code, Hermes, Codex, Gemini, Antigravity). Verifica que las 14 superpowers skills estén instaladas, carga el contexto persistente desde ~/Projects/ai-os/, y arranca el workflow daily_start. Usar al iniciar CUALQUIER sesión de trabajo con IA.
license: Internal
metadata:
  hermes:
    tags: [ai-os, bootstrap, karpathy, session-start, meta]
    related_skills: [ai-os-karpathy, using-superpowers]
---

# AI-OS Quickstart (Bootstrap 1-línea)

> **El primer paso de CUALQUIER sesión con IA.** Esta skill es la versión **ejecutable** del AI-OS. `ai-os-karpathy` describe QUÉ es el sistema; `ai-os-quickstart` ejecuta el bootstrap.

## ⚠️ Prerequisites check (primera acción)

Antes de cargar contexto, **verificar** que las 14 superpowers skills estén instaladas:

```bash
EXPECTED=14
ACTUAL=$(ls ~/.claude/skills/ 2>/dev/null | grep -cE "^(brainstorming|dispatching-parallel-agents|executing-plans|finishing-a-development-branch|receiving-code-review|requesting-code-review|subagent-driven-development|systematic-debugging|test-driven-development|using-git-worktrees|using-superpowers|verification-before-completion|writing-plans|writing-skills)$")

if [ "$ACTUAL" -ne "$EXPECTED" ]; then
  echo "❌ Solo $ACTUAL/$EXPECTED superpowers skills instaladas"
  echo ""
  echo "Este AI-OS REQUIERE las 14 superpowers. Correr setup:"
  echo "  bash ~/Projects/ai-os/promps/setup/03-required-skills.md"
  echo ""
  echo "O seguir instrucciones en:"
  echo "  https://github.com/obra/superpowers"
  exit 1
fi
echo "✅ $ACTUAL/$EXPECTED superpowers skills OK"
```

**Si la verificación falla:** workflow degradado. Informar al user y sugerir correr setup.

## Quick Start (5 pasos)

### 1. Verificar AI-OS existe

```bash
[ -d ~/Projects/ai-os ] || { echo "❌ ~/Projects/ai-os no existe. Clonar primero."; exit 1; }
[ -f ~/Projects/ai-os/CLAUDE.md ] || { echo "❌ CLAUDE.md no encontrado."; exit 1; }
echo "✅ AI-OS path: ~/Projects/ai-os"
```

### 2. → Load skill `using-superpowers`

**Siempre primero.** Esta skill es el router que decide qué otras superpowers skills cargar basándose en la fase de desarrollo (brainstorming, planning, TDD, code-review, etc.).

**Si la skill no carga** → avisar: "AI-OS quickstart sin router; dame la tarea directo."

### 3. Cargar contexto mínimo (en este orden)

Leer (no ejecutar, solo leer para tener contexto):

1. `~/Projects/ai-os/CLAUDE.md` — instrucciones maestras del sistema.
2. `~/Projects/ai-os/context/00_profile.md` — quién es Edd.
3. `~/Projects/ai-os/context/03_preferences.md` — estilo de respuesta.
4. `~/Projects/ai-os/rules/never_do.md` — reglas absolutas.
5. `~/Projects/ai-os/specs/current_spec.md` — Spec activa (si tiene contenido).

**Si la Spec está vacía** → workflow `daily_start` salta al paso "preguntar tarea".
**Si la Spec tiene contenido** → workflow `daily_start` salta al paso "continuar Spec".

### 4. → Load skill `workflows/daily_start.md` (interno)

El workflow `daily_start` de AI-OS tiene 7 pasos:

1. Cargar AI-OS (paso 3 de esta skill).
2. → Load `using-superpowers` (paso 2 de esta skill).
3. Verificar Spec activa.
4. Cargar skills relevantes según tabla del workflow.
5. Verificar entorno.
6. Preguntar la tarea.
7. Briefing final.

**Nota importante:** `daily_start.md` **no es una skill**, es un archivo markdown en `~/Projects/ai-os/workflows/`. Usar `read_file` para leerlo y seguir los pasos 4-7 manualmente (no hay auto-load de workflows como skills).

Esta skill ya ejecutó los pasos 1, 2 y 3. Continuar desde paso 4.

### 5. Briefing final

Reportar al user:

```
## Sesión AI-OS iniciada

- AI-OS: ~/Projects/ai-os (✅ CLAUDE.md presente)
- superpowers: 14/14 (✅ prerequisites OK)
- Spec activa: <sí/no, link si sí>
- Skills cargadas: <lista de skills según tarea>
- Workflow: daily_start.md (paso 4-7)

¿Empezamos?
```

Esperar confirmación antes de continuar.

---

## Examples

### Ejemplo 1: Arranque normal en Hermes

```bash
hermes chat --skills ai-os-quickstart
```

Output esperado del agente:
```
## Sesión AI-OS iniciada
- AI-OS: ~/Projects/ai-os (✅)
- superpowers: 14/14 (✅)
- Spec activa: no
- Skills cargadas: using-superpowers + (las que determine según tarea)
- Workflow: daily_start.md

Hola. Contexto cargado. ¿Qué tarea querés hacer hoy?
```

### Ejemplo 2: Arranque con Spec activa

```bash
hermes chat -q "continuar con Spec activa" --skills ai-os-quickstart
```

Output esperado:
```
## Sesión AI-OS iniciada
- AI-OS: ~/Projects/ai-os (✅)
- superpowers: 14/14 (✅)
- Spec activa: SÍ (specs/current_spec.md)
- Workflow: project_start.md (continuar desde paso 7)

Tengo la Spec activa. ¿Continuamos con el bloque N?
```

### Ejemplo 3: Setup fresh en Mac nueva

```bash
# 1. Clonar AI-OS (ajustar según donde esté el repo)
#    Por ahora, copiar manualmente o pushear a git primero:
#    git clone <repo-url> ~/Projects/ai-os
#    O inicializar fresh:
mkdir -p ~/Projects/ai-os
# (copiar el contenido del AI-OS manualmente o via tarball)

cd ~/Projects/ai-os

# 2. Instalar superpowers (REQUIRED)
bash promps/setup/03-required-skills.md

# 3. Verificar
hermes chat -q "test quickstart" --skills ai-os-quickstart
```

### Ejemplo 4: Uso desde Claude Code / Codex / Gemini

```bash
# En Claude Code:
/skill ai-os-quickstart

# En Codex o Gemini:
# La skill se carga automáticamente porque está en ~/.codex/skills/ y ~/.gemini/skills/
# (vía symlinks a ~/.claude/skills/)
```

---

## Related

- **Skill:** `ai-os-karpathy` — descripción del AI-OS (cuándo y por qué existe).
- **Skill:** `using-superpowers` — router principal de superpowers (REQUIRED).
- **Workflow:** `~/Projects/ai-os/workflows/daily_start.md` — bootstrap paso a paso.
- **Workflow:** `~/Projects/ai-os/workflows/project_start.md` — Spec + ejecución.
- **Spec:** `~/Projects/ai-os/specs/spec_template.md` — template para Specs.
- **Setup:** `~/Projects/ai-os/promps/setup/03-required-skills.md` — instalar superpowers en Mac nueva.

## Pitfalls

- ❌ **No saltar el prerequisites check.** Sin las 14 superpowers, los workflows degradan silenciosamente (TDD sin TDD, code-review sin code-review).
- ❌ **No usar solo `ai-os-karpathy`** si querés bootstrap automático. Karpathy es la descripción, quickstart es la acción.
- ❌ **No duplicar contexto.** Esta skill NO re-carga todo; delega a `daily_start.md`.
- ❌ **No inventar paths.** Si `~/Projects/ai-os/CLAUDE.md` no existe, **fallar** (no asumir).
- ❌ **No continuar sin Spec.** Si la Spec activa está vacía, preguntar al user qué hacer.

## Verification

Después de ejecutar esta skill, el agente debe haber:

- [ ] Verificado 14/14 superpowers skills instaladas.
- [ ] Verificado que `~/Projects/ai-os/CLAUDE.md` existe.
- [ ] Cargado `using-superpowers` (router).
- [ ] Leído los 5 archivos de contexto mínimo.
- [ ] Reportado briefing final con Spec activa + skills cargadas.
- [ ] Preguntado al user qué tarea hacer.

**Si falta algún paso** → el bootstrap está incompleto. Volver a ejecutar.

## Anti-patterns

- ❌ Empezar a trabajar sin ejecutar esta skill primero.
- ❌ Usar `ai-os-karpathy` como si fuera quickstart (no carga skills automáticamente).
- ❌ Cargar contexto pero no preguntar tarea (asumir = mala práctica).
- ❌ Asumir que "ya cargué el contexto ayer" — siempre verificar al inicio.
- ❌ Saltar la verificación de superpowers para "ahorrar tiempo" (degradación silenciosa).
