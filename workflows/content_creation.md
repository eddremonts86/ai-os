# Content Creation

Workflow para crear contenido: docs, ADRs, blogs, READMEs, specs, tutoriales.

> **Prerrequisito:** tener las 14 superpowers skills instaladas (ver `~/Projects/ai-os/CLAUDE.md` sección 16). Sin ellas, este workflow se ejecuta sin documentation-and-adrs, sin code-review-and-quality.

## Cuándo usar

- Crear/actualizar README, AGENTS.md, CLAUDE.md.
- Escribir ADR (Architecture Decision Record).
- Crear docs de skills, tutorials, runbooks.
- Blog posts, artículos técnicos.
- Specs, propuestas, RFCs.

## Pasos

### 1. Cargar contexto

- `context/03_preferences.md` — estilo.
- `rules/never_do.md` — qué evitar.
- Si es para un proyecto específico → leer su `AGENTS.md` o `README.md`.

### 2. Definir el output

Antes de escribir, tener claro:

| Pregunta | Respuesta |
|---|---|
| ¿Para quién es? | (audiencia) |
| ¿Qué debe lograr el lector? | (objetivo) |
| ¿Qué sabe ya? | (asumir vs explicar) |
| ¿Qué NO entra? | (scope) |
| ¿Cuándo se vuelve obsoleto? | (mantenimiento) |

Si la respuesta no es clara → Spec primero.

### 3. Elegir estructura

| Tipo | Estructura |
|---|---|
| **README** | Title → one-liner → install → usage → config → troubleshooting → license |
| **ADR** | Status → Context → Decision → Consequences → Alternatives considered |
| **Tutorial** | Prereqs → step-by-step (numbered) → verify → next steps |
| **Runbook** | When to use → diagnostic steps → fix steps → escalation |
| **Skill (SKILL.md)** | Frontmatter → When to use → Quick reference → Procedure → Pitfalls → Verification |
| **Spec** | Ver `specs/spec_template.md` |
| **Blog post** | Hook → problem → solution → code → conclusion → CTA |

### 4. → Load skill `documentation-and-adrs` (si es un ADR)

**Cuando:** el output es un ADR formal.

Esta skill te da el template canónico (Status → Context → Decision → Consequences → Alternatives Considered).

Para otros tipos (README, tutorial, etc.) → seguir las estructuras de la tabla de arriba sin cargar skill extra.

### 5. Escribir el contenido

**Reglas duras:**

- **Ejemplos reales**, no pseudo-código o "lorem ipsum".
- **Comandos copy-paste ready** (bash blocks con todas las flags).
- **Links verificados** (URLs reales, no placeholders).
- **Conventions del proyecto** si aplica (frontmatter, formato, etc.).
- **Sin emojis decorativos** en exceso.
- **Sin "Hope this helps" / "Let me know if..."**.

**Tono:**

- Directo, accionable.
- Imperativo para instrucciones ("Run X", "Create Y").
- Descriptivo para conceptos ("X is a Y that...").
- No condescendiente ni paternalista.

### 6. → Load skill `code-review-and-quality` (si incluye código)

**Cuando:** el documento tiene ejemplos de código o snippets ejecutables.

Su checklist de prefijos (🔴/🟡/💡/❓/🎓) aplica también a ejemplos en docs.

### 7. Aplicar verifiers

Para todo contenido generado:

1. **Self-check** vs la Spec/objetivo.
2. **Source check** si hay URLs/comandos/API claims:
   ```bash
   # Verificar URLs
   curl -I <url>
   
   # Verificar comandos
   <command> --version
   which <command>
   
   # Verificar paths
   ls -la <path>
   ```
3. **Critic prompt** para revisar:
   - ¿Cumple el objetivo?
   - ¿Tono consistente?
   - ¿Sin claims inventados?
   - ¿Comandos copy-paste?
   - ¿Sin fluff?

### 8. Output y archivado

- Guardar en el path apropiado (`README.md`, `docs/<topic>.md`, `archive/`, etc.).
- Si fue parte de una Spec → archivar Spec al terminar.
- Si generó skill nueva → archivar skill al final.

### 9. Reporte

```
## Contenido creado/actualizado

### Path
<path>

### Tipo
<README|ADR|tutorial|skill|spec|...>

### Audiencia
<audiencia>

### Cambios principales
- <bullets de qué se hizo>

### Verificación
- Source check: ✅ / ⚠️ / ❌
- Critic: <score>
- documentation-and-adrs: <usado/no aplica>
- code-review-and-quality: <usado/no aplica>

### Próximo paso
<sugerencia>
```

---

## Templates rápidos

### README mínimo

```markdown
# <Project Name>

<One-liner de qué hace>

## Install

```bash
<comando de install>
```

## Usage

```bash
<uso básico>
```

## Config

<variables/env vars necesarios>

## Troubleshooting

- **<problema común>**: <fix>
```

### ADR mínimo (usar skill `documentation-and-adrs`)

```markdown
# ADR-NNN: <Título>

**Status:** Proposed / Accepted / Deprecated
**Date:** YYYY-MM-DD

## Context

<qué problema estamos resolviendo>

## Decision

<qué decidimos hacer>

## Consequences

- ✅ <beneficios>
- ⚠️ <trade-offs>

## Alternatives Considered

1. <opción A> — rechazada porque <razón>
2. <opción B> — rechazada porque <razón>
```

### Skill (SKILL.md)

Ver `~/.claude/skills/<existing-skill>/SKILL.md` para el formato canónico. Frontmatter obligatorio:

```yaml
---
name: kebab-case-name
description: "When to use this skill. Be specific — drives auto-loading by CLI agents."
license: MIT|Internal
---
```

---

## Anti-patterns

- ❌ Tutoriales con pseudo-código que no corren.
- ❌ Documentación que requiere leer 5 archivos previos para entender.
- ❌ "Lorem ipsum" en ejemplos.
- ❌ Tablas de 20 columnas en lugar de prosa + tabla corta.
- ❌ Empezar con "En este documento vamos a..."
- ❌ Sections "Resumen ejecutivo" + "Introducción" + "Conclusión" en docs cortos.