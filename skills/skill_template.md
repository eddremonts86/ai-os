---
name: skill-template
description: Template canónico para crear skills locales del AI-OS. Aplica cuando necesites documentar un workflow recurrente que solo aplica a ~/Projects/ai-os/.
license: Internal
---

# Skill Template — AI-OS Local

> **⚠️ Este es el template, no una skill real.** Usalo como base para crear skills nuevas en `~/Projects/ai-os/skills/`.
>
> Para skills globales, usar `~/.claude/skills/<existing-skill>/SKILL.md` como referencia (ej: `frontend-design`, `debugging-and-error-recovery`).

---

## Cuándo crear una skill local

- Workflow recurrente **dentro del AI-OS** (ej: cargar contexto, crear Spec).
- Tarea repetitiva **específica de Edd** (no aplica a otros developers).
- Convención propia del AI-OS que no quiero en skills globales.

## Cuándo NO crear

- Si la skill aplica a 2+ proyectos distintos → promover a global.
- Si es una tarea < 5 min → no vale la pena documentar.
- Si es una task única → poner en `promps/` o `outputs/`.

---

## Template

Reemplazar este bloque con tu contenido:

```markdown
---
name: kebab-case-name
description: "When to use this skill. Be specific — drives auto-loading by CLI agents."
license: Internal
---

# Skill Title

## When to Use

Describe los trigger conditions específicas. Cuándo debe cargarse esta skill.

## Inputs (si aplica)

Qué necesita esta skill para funcionar:
- Input 1 (formato)
- Input 2 (formato)

## Procedure

Pasos numerados, accionables. Cada paso en una línea o dos.

1. **Paso 1:** descripción.
2. **Paso 2:** descripción.
3. **Paso N:** descripción.

## Pitfalls

Errores comunes. Cosas que NO hacer.

- ❌ Anti-pattern 1
- ❌ Anti-pattern 2

## Verification

Cómo confirmar que la skill funcionó:

- [ ] Output esperado 1
- [ ] Output esperado 2

## Examples (opcional)

Ejemplos concretos de uso:

```bash
# Ejemplo 1
<comando o flujo>
```

```bash
# Ejemplo 2
<otro caso>
```

## Related (opcional)

- Skill: `<nombre>` — para qué se complementa
- Workflow: `<nombre>` — cuándo se invoca
- File: `<path>` — archivos relacionados en el AI-OS
```

---

## Reglas duras

- **Frontmatter obligatorio** — sin él, la skill no se auto-carga.
- **`name` en kebab-case** y único en el directorio.
- **`description` específica** — es el trigger para auto-loading.
- **Pasos accionables** — no teoría.
- **Ejemplos copy-paste ready** — bash blocks completos.
- **Sin emojis decorativos** — solo cuando resumen status.

## Distribución

Después de crear la skill:

1. Validar el frontmatter con `skill_view --validate <path>` (si aplica).
2. Commitear en git del AI-OS.
3. Si la skill es global → copiar a `~/.claude/skills/<name>/SKILL.md` (se distribuye auto).

## Naming conflicts

Si el nombre choca con una skill global:

- Agregar prefijo: `ai-os-<name>.md` o `aios-<name>.md`.
- O usar namespace: `skill-<area>-<name>.md`.
- Verificar con `ls ~/.claude/skills/ | grep <name>` antes.