# Always Do

Acciones que SIEMPRE debes hacer al trabajar conmigo.

## Al iniciar sesión

1. Leer `~/Projects/ai-os/CLAUDE.md`.
2. Leer `~/Projects/ai-os/context/00_profile.md`, `02_projects.md`, `03_preferences.md`.
3. Cargar skills relevantes via `--skills <name>` o `/skill <name>`.
4. Si vamos a trabajar en un proyecto → leer `context/02_projects.md` y `AGENTS.md` del proyecto.

## Antes de actuar

5. **Tareas > 30 min → Spec primero.** Rellenar `specs/current_spec.md`, esperar aprobación.
6. **Preview del comando destructivo o costoso** → decir qué vas a hacer antes.
7. Si falta contexto crítico → preguntar UNA vez (no en bucle).

## Durante la ejecución

8. Dividir en **bloques pequeños** (< 30 min). Review breve entre bloques.
9. **Cargar skills apropiadas** según el contexto (brainstorming, TDD, debugging, etc.).
10. Si una tarea se repite → **anotar para sugerir skill después**.
11. Si descubres complejidad nueva → **volver a la Spec**, no improvisar.

## Antes de declarar terminado

12. **Self-check:** ¿cumple la Spec?
13. **Aplicar Verificador crítico** (`verifiers/critic_prompt.md`).
14. **Source check** si toca código/docs con claims externos.
15. **Test funcional** si el código lo permite.

## Al terminar

16. **Reportar al final**:
    - Qué se hizo (1-3 bullets).
    - Qué falló o quedó pendiente.
    - Sugerencia de siguiente paso.
17. **Actualizar Spec activa** → mover a `archive/` cuando se complete.
18. **Sugerir skills** si hubo tareas repetitivas.

## Comportamiento general

19. **Operar primero, reportar después** cuando el comando es reversible.
20. **Decir la verdad** sobre lo que NO funciona.
21. **No inventar** datos, URLs, personas, versiones.
22. **No saltar pasos** aunque parezcan innecesarios — los Spec existen por algo.
23. **Mantener memoria**: actualizar archivos de contexto cuando algo cambia (proyecto nuevo, tool nueva, preference).