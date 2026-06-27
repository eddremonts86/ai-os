# Project Start

Workflow para arrancar una tarea nueva, creando Spec y dividiendo en bloques.

> **Prerrequisito:** tener las 14 superpowers skills instaladas (ver `~/Projects/ai-os/CLAUDE.md` sección 16). Sin ellas, este workflow se ejecuta sin brainstorming, sin writing-plans, sin executing-plans.

## Cuándo usar

- Tarea > 30 min estimada.
- Tarea que toca varios archivos.
- Feature nueva, refactor grande, o bug complejo.
- Cualquier cosa que no entre en "comando rápido".

**Si la tarea es < 30 min y cabe en una Spec mínima** → usar `spec_template.md` versión corta y ejecutar directamente, sin entrevistar.

## Pasos

### 1. Recibir la tarea

El user describe lo que quiere (en español, terse).

### 2. Decidir: ¿entrevistar o ejecutar?

| Situación | Acción |
|---|---|
| Tarea clara, scope conocido | Spec mínima, ejecutar |
| Tarea ambigua, varias formas posibles | **→ Load skill `brainstorming`** primero |
| Feature nueva sin precedente | **→ Load skill `brainstorming`** primero |
| Bug con error específico | Spec mínima, ejecutar |
| Refactor grande con impacto unclear | **→ Load skill `brainstorming`** primero |

### 3. Entrevistar (si aplica)

> **Si aplicaste `brainstorming` en paso 2:** seguir sus pasos hasta tener una dirección clara, luego continuar acá.

Preguntas necesarias (no repetir info que ya está en `context/`):

1. **Objetivo real:** ¿qué querés conseguir con esto? (no el cómo, el qué)
2. **Para qué sirve:** ¿quién lo usa o lee? ¿qué problema resuelve?
3. **Contexto adicional:** ¿hay algo de proyectos/users/situación que no esté en `context/`?
4. **Restricciones:** ¿hay deadlines, versiones específicas, cosas que NO puedo tocar?
5. **Criterios de éxito:** ¿cómo sabemos que está listo?
6. **Anti-ejemplos:** ¿hay algo que NO querés que pase (regresiones, patrones viejos)?
7. **Scope:** ¿qué NO entra? (importante definirlo)

**NO preguntar:**
- Info personal/profesional que ya está en `context/`.
- Preferences que ya están en `03_preferences.md`.
- Qué tecnología usar si ya está claro del proyecto.

### 4. Crear Spec

> **→ Load skill `writing-skills` o usar `specs/spec_template.md` directamente.**

Copiar `spec_template.md` a `specs/current_spec.md` y rellenar.

Si la tarea es simple, usar la **versión corta del template** (última sección).

### 5. → Load skill `writing-plans`

**Cuando:** la Spec está aprobada y tiene más de 2-3 bloques de trabajo.

La skill `writing-plans` toma la Spec y genera un **plan ejecutable** con bloques numerados, dependencias, y criterios de éxito por bloque.

Si la Spec cabe en 1-2 bloques → skip esta skill, ejecutar directo.

### 6. Validar Spec conmigo

```
"Spec + plan listos. Resumen:
- Objetivo: <X>
- Output: <Y>
- Tiempo estimado: <Z>
- Bloques: N (del plan)

¿Aprobás? Si sí, arranco con bloque 1."
```

### 7. → Load skill `executing-plans`

**Esta skill guía la ejecución bloque por bloque.** Sus pasos reemplazan los de abajo — seguí su flujo.

Si la skill no está disponible → usar el flujo manual de abajo.

#### Flujo manual (si executing-plans no carga)

Por cada bloque:

1. **Anunciar:** "Bloque N: <qué voy a hacer>"
2. **Ejecutar** (comandos, código, etc.)
3. **Review breve:** "Hecho: <qué>. Output: <path>. Siguiente: bloque N+1."

Si un bloque toma > 30 min → dividirlo retroactivamente.

Si descubro complejidad nueva → volver a Spec, no improvisar.

### 8. Verificación final

Al terminar todos los bloques:

#### 8a. → Load skill `verification-before-completion`

**Esta skill es OBLIGATORIA** antes de declarar terminado. Cubre los checks que el agente tiende a skipear (lint, typecheck, tests, build).

#### 8b. Aplicar verifiers de AI-OS

1. Aplicar `verifiers/critic_prompt.md`.
2. Si hay claims externos → aplicar `verifiers/source_check_prompt.md`.
3. Self-check vs criterios de éxito de la Spec.

#### 8c. → Load skill `code-review-and-quality`

**Si el output incluye código**, aplicar esta skill para revisar el diff con checklist completo.

#### 8d. Reporte final

```
## Tarea completada

### Qué se hizo
- Bloque 1: <output>
- Bloque 2: <output>
- Bloque N: <output>

### Verificación
- Spec cumplida: ✅ / ⚠️ / ❌
- verification-before-completion: ✅
- critic prompt: <score>
- source check: <clean/con advertencias>
- code-review-and-quality: <score>

### Output final
- <path 1>: <descripción>
- <path 2>: <descripción>

### Sugerencias
- Próximo paso: <X>
- Tarea repetitiva detectada → considerar skill
```

### 9. Archivar Spec

Mover `specs/current_spec.md` → `archive/YYYY-MM-DD-<slug>.md`.

Crear nuevo `specs/current_spec.md` vacío.

### 10. → Load skill `writing-skills` (si aplica)

Si hubo tareas repetitivas durante el flujo:

```
"Detecté 2 tareas repetitivas:
1. <X> → candidata a skill `~/.claude/skills/<name>/SKILL.md`
2. <Y> → candidata a skill local `~/Projects/ai-os/skills/<name>.md`

¿Querés que las cree? Puedo cargar `writing-skills` para hacerlo bien."
```

---

## Anti-patterns a evitar

- ❌ Entrevistar cuando la tarea es obvia.
- ❌ Spec de 500 líneas para una feature de 50.
- ❌ Dividir bloques de 5 min en 20 pedazos.
- ❌ Volver a la Spec cada 2 minutos.
- ❌ Reporte final de 200 líneas cuando cabe en 30.
- ❌ Saltarse `verification-before-completion` "porque es trivial".
- ❌ No aplicar `code-review-and-quality` después de escribir código.

## Cuándo volver a la Spec

- Cambio de scope mid-execution.
- Bloque revela dependencia inesperada.
- User cambia requirements.
- Output diverge significativamente de lo planeado.

## Cuándo NO volver a la Spec

- Pequeño ajuste de un bloque.
- Decisión técnica que no afecta scope.
- Color/naming/style detail.