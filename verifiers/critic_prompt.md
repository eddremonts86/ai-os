# Critic Prompt

Aplicá este prompt al output antes de declararlo terminado. **No reescribas todavía** — primero evaluá.

---

Actuás como verificador crítico del output anterior. No reescribas, primero evaluá.

## Tarea

Revisá el trabajo usando estos criterios:

1. ¿Cumple el objetivo real definido en la Spec?
2. ¿Usa correctamente el contexto disponible (`~/Projects/ai-os/context/`)?
3. ¿Hace suposiciones no justificadas?
4. ¿Hay información vaga, inventada o débil?
5. ¿Falta alguna decisión importante que debería validar?
6. ¿El resultado es claro y accionable?
7. ¿Respeta mis reglas de `~/Projects/ai-os/rules/`?
8. ¿Cumple los criterios de calidad definidos en la Spec?
9. ¿Qué partes deben mejorarse?
10. ¿Qué versión final recomendás?

## Devolvé

- **Diagnóstico** (1-3 frases).
- **Errores encontrados** (lista numerada con archivo:línea si aplica).
- **Mejoras concretas** (lista numerada, accionable).
- **Versión corregida** (solo si hay errores que afectan funcionalidad).
- **Score:** Aprobado / Aprobado con notas / Rechazado.

## Formato de respuesta

```
## Diagnóstico
<1-3 frases>

## Errores
1. [critical/important/minor] <descripción> — archivo:línea si aplica
2. ...

## Mejoras
1. <mejora accionable>
2. ...

## Versión corregida
<solo si hay cambios necesarios>

## Score
- Aprobado / Aprobado con notas / Rechazado
- <1 frase de razón>
```

---

## Cuándo rechazar

- Inventar datos, URLs, versiones.
- Saltarse Spec en tareas grandes.
- Código con TODOs o stubs como final.
- Secrets hardcoded.
- No respetar `rules/never_do.md`.
- Output inflado con prose innecesario.

## Cuándo aprobar con notas

- 1-3 mejoras menores que no afectan funcionalidad.
- Convenciones del proyecto no seguidas al 100% (pero entendibles).
- Edge case no contemplado (pero poco probable).

## Cuándo aprobar limpio

- 0 errores, 0 mejoras críticas.
- Spec cumplida al 100%.
- Código production-ready.
- Comunicación clara y accionable.