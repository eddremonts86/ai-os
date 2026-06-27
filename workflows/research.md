# Research

Workflow para investigar un tema nuevo y resumir findings accionables.

> **Prerrequisito:** tener las 14 superpowers skills instaladas (ver `~/Projects/ai-os/CLAUDE.md` sección 16). Sin ellas, este workflow se ejecuta sin code-review-and-quality final.

## Cuándo usar

- Investigar una librería/framework nuevo.
- Comparar opciones antes de decidir (ej: Hetzner vs DO, Coolify vs CapRover).
- Entender un bug o comportamiento antes de fixear.
- Evaluar una decisión técnica con tradeoffs reales.

## Pasos

### 1. Definir la pregunta de research

Tener claro:

- ¿Qué quiero saber exactamente?
- ¿Para qué decisión? (output debe ser accionable)
- ¿Qué nivel de profundidad? (overview vs deep dive)
- ¿Hay deadline? (si no, mejor quality > speed)

### 2. Cargar contexto relevante

- `context/05_sources.md` — fuentes preferidas.
- Si es para un proyecto → `context/02_projects.md`.
- Skills relevantes (ej: `debugging-and-error-recovery` para entender un bug).

### 3. Buscar fuentes

**Prioridad de fuentes:**

1. **Documentación oficial** del producto/framework.
2. **GitHub repo** (issues, discussions, releases).
3. **Blog posts oficiales** del maintainer.
4. **Skills conocidas** instaladas (pueden tener el resumen).
5. **Comunidades** (Reddit, HN, Discord) — solo para validar consenso.
6. **AI search** (Perplexity, Exa, Tavily via MCP) — para validación cruzada.

**Reglas:**

- Preferir **documentación oficial** sobre tutoriales random.
- **Verificar versión** — confirmar que la doc aplica a la versión actual.
- **URLs reales** — no placeholders. Si no podés verificar, decir "no pude verificar".
- **No inventar** features que no existen.

### 4. Validar fuentes

Para cada claim importante:

```bash
# Verificar URL
curl -fsSL --max-time 10 "<url>" 2>&1 | head -20

# Verificar package version
npm view <package> version
brew info <formula>

# Verificar que existe
gh repo view <owner/repo>
```

Si una fuente no responde o no se puede verificar → marcar como "no verificada" y buscar alternativa.

### 5. Sintetizar

**Output esperado:**

- Resumen ejecutivo (1-3 bullets con la conclusión principal).
- Comparativa si aplica (tabla con criterios objetivos).
- Pros/contras de cada opción (con números cuando posible).
- Recomendación con justificación.
- Links a fuentes verificadas.
- Open questions o "no pude verificar X".

**Formato:**

```markdown
## Research: <Título>

### TL;DR
<conclusión principal en 1-2 frases>

### Contexto
<qué se preguntó y por qué>

### Comparativa
| Criterio | Opción A | Opción B | Opción C |
|---|---|---|---|
| Precio | $X | $Y | $Z |
| ... | | | |

### Recomendación
<Opción X> porque <razones objetivas>.

### Trade-offs
- ✅ <beneficios>
- ⚠️ <costos>

### Sources
- <url 1> — verified
- <url 2> — verified
- <url 3> — not verified, <razón>

### Open questions
- <lo que no pude resolver>
```

### 6. → Load skill `verification-before-completion`

**Cuando:** el research incluye verificación de claims o comparativas.

Cubre los checks finales antes de reportar.

### 7. → Load skill `code-review-and-quality`

**Si el research resultó en una decisión técnica**, aplicar esta skill para validar la calidad del output (no inventar, fuentes verificadas, etc.).

### 8. → Load skill `documentation-and-adrs` (si la decisión merece ADR)

**Cuando:** la conclusión del research guía una decisión arquitectural significativa.

Crea un ADR con el formato canónico para documentar la decisión.

### 9. Reporte y archivado

- Si el research es para una decisión → guardarlo en `outputs/YYYY-MM-DD-<slug>.md`.
- Si es para una Spec → linkearlo desde la Spec.
- Si reveló conocimiento reusable → sugerir skill (ej: `<topic>-overview`).

### 10. Sugerir próximos pasos

```markdown
### Próximos pasos sugeridos
1. <acción concreta basada en la recomendación>
2. <validar con POC si aplica>
3. <documentar decisión en ADR>
```

---

## Anti-patterns

- ❌ Resumir sin haber leído (copy-paste de snippets random).
- ❌ "Documentación oficial dice X" sin haber verificado.
- ❌ Lista de features sin contexto de qué problema resuelven.
- ❌ Comparativas con criterios subjetivos ("fácil de usar", "moderno").
- ❌ Decidir por el user — el research informa, la decisión es del user.

## Criterios objetivos para comparativas

| Criterio | Tipo |
|---|---|
| Precio | Cuantitativo ($/mes, $/GB) |
| Performance | Cuantitativo (req/s, ms latency) |
| Comunidad | Cuantitativo (GitHub stars, npm downloads, contributors) |
| Licencia | Categórico (MIT, Apache, GPL) |
| Madurez | Cuantitativo (años en prod, versión actual) |
| Breaking changes | Categórico (none, minor, major) |
| Soporte | Categórico (community, paid, none) |
| Self-hosted vs SaaS | Categórico |
| Lock-in | Categórico (low, medium, high) |
| Docs quality | Cualitativo pero descriptivo |

## Skills útiles para research

- `debugging-and-error-recovery` — entender bugs.
- `<stack>-patterns` — comparar patrones del stack.
- `wave-template-conventions` — decisiones en proyectos Schilling.
- `prod-deploy-verification` — comparar deploy options.
- `release-it-framework` — production readiness.

## Cuándo NO hacer research

- La respuesta ya está en mi memoria (skills, context).
- El user ya decidió (no necesita validación).
- El tema es well-known y obvio para el stack (ej: "¿React o Vue?" → usar lo del proyecto).