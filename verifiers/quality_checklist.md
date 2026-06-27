# Quality Checklist

Checklist que el Verificador aplica a todo output. **Pasar todas las casillas** para considerar la entrega aceptable.

## Spec Compliance

- [ ] ¿Cumple el objetivo real definido en la Spec?
- [ ] ¿Cubre todos los criterios de éxito listados?
- [ ] ¿Respeta las restricciones explícitas?
- [ ] ¿No excede el scope (no agregó features no pedidas)?
- [ ] ¿Las decisiones tomadas coinciden con las validadas en la Spec?

## Context Usage

- [ ] ¿Usó correctamente el contexto de `context/`?
- [ ] ¿No asumió info personal/profesional no documentada?
- [ ] ¿Respetó las preferences de `03_preferences.md`?
- [ ] ¿Usó las tools correctas según `04_tools.md`?

## Source Quality

- [ ] ¿Hay claims externos sin verificar?
- [ ] ¿Las URLs citadas son reales (no placeholders)?
- [ ] ¿Las versiones mencionadas son correctas?
- [ ] ¿Los ejemplos de código funcionan (no pseudo-código)?
- [ ] ¿Las APIs mencionadas existen?

## Code Quality (si aplica)

- [ ] ¿Sin TODOs, stubs, o "fix later" sin razón?
- [ ] ¿Sigue los patterns del proyecto (ver skill del proyecto)?
- [ ] ¿TypeScript estricto (si aplica)?
- [ ] ¿No `any` sin justificación?
- [ ] ¿Tests apropiados (si aplica)?
- [ ] ¿Sin secrets hardcoded?
- [ ] ¿Manejo de errores apropiado (no swallow)?

## Documentation Quality (si aplica)

- [ ] ¿Ejemplos reales, no "lorem ipsum"?
- [ ] ¿Comandos copy-paste ready?
- [ ] ¿Troubleshooting section cuando es complejo?
- [ ] ¿Links a referencias externas verificadas?
- [ ] ¿Frontmatter correcto (si es skill)?

## Spec Verification

- [ ] ¿Pasó por `verifiers/critic_prompt.md`?
- [ ] ¿Pasó por `verifiers/source_check_prompt.md`?
- [ ] ¿Resultado final incluye diagnóstico + errores + mejoras + versión recomendada?

## Communication

- [ ] ¿Respuesta en idioma correcto (español para chat, inglés para code)?
- [ ] ¿Tono directo sin ceremonias?
- [ ] ¿Reporta qué hizo + qué falló + qué sigue?
- [ ] ¿Sin "I'd be happy to", "As you can see", etc.?

## Security

- [ ] ¿Sin secrets en código o logs?
- [ ] ¿Sin URLs con tokens hardcoded?
- [ ] ¿Sin PII expuesta?
- [ ] ¿Cumple `rules/never_do.md`?

## Final Score

- **Aprobado:** 0 casillas críticas fallidas.
- **Aprobado con notas:** 0 críticas + 1-3 menores.
- **Rechazado:** 1+ crítica, o 5+ menores.