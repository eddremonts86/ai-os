# Prompts originales de Karpathy

> Los 6 prompts originales del video "AI Operating System" de Andrej Karpathy + 1 prompt de setup adicional que creé. **Reorganizados por categoría** (en lugar de la numeración original 1-6).

## Estructura

| Categoría | Archivo | Para qué sirve |
|---|---|---|
| `setup/` | `01-create-structure.md` | Comando bash que crea la estructura de directorios del AI-OS. |
| `setup/` | `02-master-prompt.md` | Prompt maestro para implementar el AI-OS completo (entrevista inicial + crear archivos). |
| `setup/` | `03-required-skills.md` | **Setup obligatorio** de las 14 superpowers skills antes del primer uso. |
| `daily-use/` | `01-daily-start.md` | Prompt corto para arrancar sesión — lee contexto y crea Spec. |
| `verifiers-specs/` | `02-create-spec.md` | Prompt para crear una Spec antes de cualquier tarea grande. |
| `verifiers-specs/` | `03-verifier.md` | Prompt para que el agente se autocritique antes de declarar listo. |
| `skill-creation/` | `04-convert-to-skill.md` | Prompt para convertir tareas repetitivas en skills reutilizables. |

## Orden de uso típico

1. **Setup único (primera vez):** `setup/01` + `setup/02` + `setup/03` en orden.
2. **Cada sesión:** `daily-use/01`.
3. **Tarea grande (>30 min):** `verifiers-specs/02` antes, `verifiers-specs/03` al final.
4. **Tarea repetitiva detectada:** `skill-creation/04`.

## Notas

- Los prompts originales eran "para Claude Code" específicamente. Los workflows del AI-OS (`~/Projects/ai-os/workflows/`) son la **implementación** de estos prompts para funcionar en **cualquier CLI** (Claude Code, Hermes, Codex, Gemini, Antigravity).
- Si necesitás los prompts originales exactos, están preservados aquí. Si querés el flujo moderno, usá los workflows.
- Los archivos están numerados con prefijo (`01-`, `02-`, etc.) para mantener orden lógico al listar.
