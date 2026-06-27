# Skills Locales

Skills específicas de este AI-OS. **No son globales** — viven aquí porque aplican solo al contexto `~/Projects/ai-os/`.

## Diferencia con skills globales

| Tipo | Path | Propósito |
|---|---|---|
| **Global** | `~/.claude/skills/<name>/SKILL.md` | Skills reutilizables en cualquier proyecto. Distribuidas a 5 CLIs via symlinks. |
| **Local (AI-OS)** | `~/Projects/ai-os/skills/<name>.md` | Skills que solo aplican a este AI-OS o al contexto de trabajo. |

## Cómo se cargan

Desde cualquier CLI:

```bash
# Claude Code / Codex / Gemini
# Pegar contenido en la conversación, o
# Si está en .claude/skills/, ya está cargada

# Hermes
--skills ai-os-karpathy
# o /skill ai-os-karpathy

# Manual
cat ~/Projects/ai-os/skills/<name>.md
```

## Convención de naming

- Una skill = un archivo `.md` con frontmatter.
- Nombre en kebab-case: `cargar-contexto.md`, `spec-rapida.md`.
- Si la skill es global → mover a `~/.claude/skills/<name>/SKILL.md` y distribuir.

## Cuándo crear una skill local

- Workflow específico del AI-OS (no aplica a otros proyectos).
- Convención propia que no quiero en skills globales.
- Helper para una tarea repetitiva específica.

## Cuándo promover a global

- Si la skill se usa en 2+ proyectos distintos.
- Si es genérica (no depende de `~/Projects/ai-os/`).
- Si vale para otros developers.

## Skills locales actuales

- `skill_template.md` — template para crear nuevas skills (este archivo es meta).

## Próximas skills candidatas

- `spec-rapida.md` — para tareas < 30 min sin entrevistar.
- `commit-message.md` — Conventional Commits sin pensar.
- `pr-description.md` — PR template automático.
- `release-notes.md` — generar changelog desde commits.

Si alguna de estas se usa 2+ veces → crearla siguiendo `skill_template.md`.