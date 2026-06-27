# Spec Template

Plantilla para `specs/current_spec.md`. Copiá esta estructura para cada tarea nueva.

---

## Metadata

- **Fecha:** YYYY-MM-DD
- **Status:** draft / approved / in-progress / completed / archived
- **Bloques estimados:** N (cada uno < 30 min)
- **Skills relevantes:** (lista de skills globales que aplican)

## 1. Objetivo real

¿Qué quiero conseguir realmente con esta tarea? (1-3 frases, sin jargon)

## 2. Resultado esperado

¿Qué artefactos/outputs concretos se entregan?

- [ ] Artefacto 1 (path + descripción)
- [ ] Artefacto 2 (path + descripción)

## 3. Usuario / audiencia

¿Quién va a usar o leer el resultado?

## 4. Contexto necesario

¿Qué partes de `~/Projects/ai-os/context/` aplican?

- `context/00_profile.md` — siempre
- `context/02_projects.md` — si toca proyecto específico
- `context/03_preferences.md` — siempre
- `context/04_tools.md` — si usa tools externas
- `context/05_sources.md` — si incluye claims externos

**Contexto adicional:**
- Path del proyecto
- Archivos relevantes a leer
- Skills globales a cargar

## 5. Restricciones

- **Técnicas:** versiones, OS, dependencias
- **De tiempo:** deadline, bloques disponibles
- **De usuario:** preferencias, idioma, formato
- **De seguridad:** secrets, permisos, accesos
- **De scope:** qué NO entra

## 6. Criterios de éxito (Definition of Done)

¿Cómo sabemos que está listo?

- [ ] Criterio 1 (medible)
- [ ] Criterio 2 (medible)
- [ ] Criterio 3 (medible)

## 7. Errores a evitar

¿Qué patrones/resultados anteriores son anti-ejemplos?

- ❌ Anti-pattern 1
- ❌ Anti-pattern 2

## 8. Decisiones a validar conmigo

¿Qué decisiones necesita mi input explícito?

1. Decisión 1 — opciones A/B/C, recomendación
2. Decisión 2 — opciones A/B/C, recomendación
3. ...

## 9. Subtareas / bloques

División en bloques < 30 min c/u:

- **Bloque 1:** <descripción> — <tiempo estimado> — <output esperado>
- **Bloque 2:** <descripción> — <tiempo estimado> — <output esperado>
- **Bloque N:** <descripción> — <tiempo estimado> — <output esperado>

## 10. Verificación

¿Qué se aplica al final?

- [ ] Self-check vs criterios de éxito
- [ ] `verifiers/critic_prompt.md` aplicado
- [ ] `verifiers/source_check_prompt.md` aplicado (si hay claims externos)
- [ ] Tests funcionales (si aplica)
- [ ] Reporte final con diagnóstico + errores + mejoras + versión

---

## Una vez aprobada

1. Mover este Spec a `specs/current_spec.md` (reemplazar contenido).
2. Cambiar status a `approved`.
3. Empezar ejecución en bloques.
4. Actualizar este Spec al completar cada bloque (status, learnings).
5. Al terminar → mover a `archive/YYYY-MM-DD-<slug>.md` y crear nuevo `current_spec.md` vacío.

## Plantilla mínima (cuando es tarea corta < 30 min)

```markdown
## Metadata
- Fecha: YYYY-MM-DD
- Status: draft
- Skills: <1-2 skills>

## Objetivo
<1 frase>

## Resultado esperado
- <1-2 outputs>

## Criterios de éxito
- [ ] <1 criterio medible>

## Verificación
- [ ] Self-check
- [ ] Critic prompt si > 5 min
```

Si la tarea cabe en este formato corto, **no hace falta entrevistar** — ejecutá directamente.