# Current Spec: ai-os-quickstart

> **Spec activa.** Reemplazá su contenido con cada nueva Spec. Al terminar, mover a `archive/`.

## Metadata

- **Fecha:** 2026-06-27
- **Status:** in-progress
- **Bloques estimados:** 3
- **Skills relevantes:**
  - `using-superpowers` (router)
  - `writing-plans` + `executing-plans` (planning)
  - `test-driven-development` (TDD si aplica)
  - `verification-before-completion` (gates)
  - `code-review-and-quality` (review)
  - `using-git-worktrees` (workspace aislado)
  - `finishing-a-development-branch` (cerrar)

## 1. Objetivo real

Crear una skill global `ai-os-quickstart` que cualquier CLI (Claude Code, Hermes, Codex, Gemini, Antigravity) pueda invocar para arrancar sesión con AI-OS con **un solo comando**. Hoy hay que pegar manualmente el contenido de `CLAUDE.md` o usar `--skills ai-os-karpathy`; con `ai-os-quickstart` el agente recibe un bootstrap 1-línea que carga contexto, verifica superpowers, y arranca el workflow `daily_start`.

## 2. Resultado esperado

- [ ] Archivo `~/.claude/skills/ai-os-quickstart/SKILL.md` con frontmatter canónico + contenido completo.
- [ ] Skill propagada via symlinks a los 5 CLIs (codex, gemini, agents, hermes imported).
- [ ] `hermes skills list` la muestra como `imported` + `enabled`.
- [ ] Test end-to-end: `hermes chat -q "quickstart test" --skills ai-os-quickstart` arranca sesión correctamente.
- [ ] Spec archivada en `archive/2026-06-27-ai-os-quickstart.md`.

## 3. Usuario / audiencia

Edd (dev), usando cualquier CLI con AI agent. Quiere empezar una sesión sin tener que recordar paths de archivos.

## 4. Contexto necesario

- `context/00_profile.md` — quién es Edd, autonomía, tools.
- `CLAUDE.md` — estructura completa del AI-OS.
- `skills/skill_template.md` — formato canónico de skill (frontmatter + secciones).
- Skills existentes: `ai-os-karpathy` (router principal), 14 superpowers.

**No requiere** contexto de proyectos específicos (es agnóstico al proyecto).

## 5. Restricciones

- **Técnicas:** formato de skill canónico (ver `skills/skill_template.md`); compatible con el indexer de Hermes (frontmatter `name` debe matchear directorio).
- **De tiempo:** < 30 min total (3 bloques < 10 min c/u).
- **De usuario:** debe funcionar en Mac actual Y en otra Mac fresh.
- **Scope:** solo crear la skill. No modificar workflows ni CLAUDE.md (excepto si encuentro un gap real).

## 6. Criterios de éxito (DoD)

- [ ] Skill existe en `~/.claude/skills/ai-os-quickstart/SKILL.md` con frontmatter válido.
- [ ] El frontmatter `name` coincide con el nombre del directorio.
- [ ] El contenido cubre: prerequisites check, carga de contexto, decisión de Spec vs ejecución, decisión de skills a cargar.
- [ ] La skill NO duplica `ai-os-karpathy` (son complementarias, no redundantes).
- [ ] Symlinks creados en los 5 CLIs destinos.
- [ ] Verificación en Hermes: `imported:ai-os-quickstart` aparece en `hermes skills list`.
- [ ] Test end-to-end funciona (mensaje corto de prueba carga el flujo correcto).

## 7. Errores a evitar

- ❌ Duplicar el contenido de `ai-os-karpathy` (esta skill es la **acción** de bootstrap, no la descripción del AI-OS).
- ❌ Frontmatter con `name` distinto al directorio (rompe el indexer de Hermes).
- ❌ Hardcodear paths que cambian (ej: `~/Projects/ai-os/` es OK, pero `~/Projects/edd/foo` no).
- ❌ Contenido vago tipo "cargá el contexto" sin decir **qué** contexto.
- ❌ Olvidar la verificación de superpowers (la skill es el primer punto de entrada y debe fallar rápido si no están).

## 8. Decisiones a validar conmigo

Ninguna explícita. Defaults razonables:

- **Nombre:** `ai-os-quickstart` (consistente con `ai-os-karpathy`).
- **Propósito:** complementaria a `ai-os-karpathy`. Karpathy = descripción del AI-OS, Quickstart = acción de bootstrap.
- **Path en la skill:** `~/Projects/ai-os/` (matches CLAUDE.md).
- **Skills a cargar:** `using-superpowers` (router), `verification-before-completion` (gates), `writing-plans` (si Spec grande).

Si algo de estos no te gusta, decime antes de aprobar y ajusto.

## 9. Subtareas / bloques

**Bloque 1: Diseñar estructura** (< 10 min)

- Leer `skills/skill_template.md` (template) + `~/.claude/skills/ai-os-karpathy/SKILL.md` (referencia).
- Decidir: frontmatter, secciones, contenido único vs duplicar.
- Output: estructura definida (borrador mental o en chat).

**Bloque 2: Escribir contenido** (< 15 min)

- Crear `~/.claude/skills/ai-os-quickstart/SKILL.md`.
- Frontmatter con `name`, `description`, `license`, `metadata.hermes.tags`.
- Secciones: When to use, Prerequisites, Procedure, Quick start examples, Related.
- Output: archivo completo.

**Bloque 3: Distribuir y verificar** (< 5 min)

- Crear symlinks en los 4 CLIs restantes.
- `hermes skills list` → verificar.
- Test con `hermes chat -q "quickstart test" --skills ai-os-quickstart`.
- Commit en AI-OS repo.
- Output: skill funcional + commit.

## 10. Verificación

- [ ] Self-check vs criterios de éxito.
- [ ] `verifiers/critic_prompt.md` aplicado.
- [ ] `verifiers/source_check_prompt.md` aplicado (probablemente N/A — no hay URLs externas).
- [ ] `code-review-and-quality` aplicado (no hay código, pero el contenido es "código para LLM", aplica el checklist).
- [ ] `verification-before-completion` aplicado (gates: skill aparece, symlinks OK, no broken).
- [ ] Reporte final con diagnóstico + archivos tocados + skills creadas + comando para invocar.

---

## Plan ejecutable (writing-plans skill)

| Bloque | Acción                 | Output                                               | Tiempo   | Verificación                           |
| ------ | ---------------------- | ---------------------------------------------------- | -------- | -------------------------------------- |
| 1      | Diseñar estructura     | Definición inline de frontmatter + secciones         | < 10 min | Revisión con Eddy inline               |
| 2      | Escribir contenido     | `~/.claude/skills/ai-os-quickstart/SKILL.md`         | < 15 min | File exists + frontmatter válido       |
| 3      | Distribuir + verificar | Symlinks en 4 CLIs + Hermes la ve + test OK + commit | < 5 min  | `hermes skills list` + test end-to-end |

## Estado

- [x] Spec creada
- [x] Plan ejecutable
- [ ] Bloque 1: Diseñar estructura
- [ ] Bloque 2: Escribir contenido
- [ ] Bloque 3: Distribuir y verificar
- [ ] Verificación final
- [ ] Archivada
