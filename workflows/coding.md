# Coding

Workflow para tareas de código: feature nueva, bugfix, refactor.

> **Prerrequisito:** tener las 14 superpowers skills instaladas (ver `~/Projects/ai-os/CLAUDE.md` sección 16). Sin ellas, este workflow se ejecuta sin TDD, sin systematic-debugging, sin code-review-and-quality.

## Cuándo usar

- Implementar feature nueva.
- Fixear bug.
- Refactor con impacto > 1 archivo.
- Tests para código existente.
- Performance optimization.

**Si es trivial (< 30 min, 1-2 archivos)** → ejecutar sin Spec completa.

## Pasos

### 1. Spec o ejecución directa

**Spec completa** si:
- Toca > 3 archivos.
- Tiene impacto en arquitectura.
- Necesita decisiones de diseño.
- Hay riesgo de regresión.

**Spec mínima** si:
- 1-2 archivos.
- Cambio aislado.
- Bug específico con error conocido.

### 2. Cargar skills

| Tarea | Skills a cargar (orden) |
|---|---|
| React/TS feature | `using-superpowers` → `react-patterns` + `tanstack-patterns` + `typescript-advanced` + `test-driven-development` |
| Wave/Schilling feature | `wave-template-conventions` + `tanstack-patterns` + `shadcn-patterns` |
| Backend Node | `env-config-and-secrets` + `owasp-security` |
| Drupal | `drupal8-pattern` |
| **Bug** | **→ Load skill `systematic-debugging` PRIMERO** + `debugging-and-error-recovery` |
| Refactor | `code-review-and-quality` |
| **Tests** | **→ Load skill `test-driven-development`** |
| Performance | `performance-optimization` |
| Security | `owasp-security` + `code-review-and-quality` |
| Multi-file o paralelo | → load `dispatching-parallel-agents` + `subagent-driven-development` |
| Branch aislado | → load `using-git-worktrees` |

### 3. Explorar el codebase

Antes de tocar nada:

- Leer `AGENTS.md` / `CLAUDE.md` del proyecto si existe.
- Leer `package.json` / `composer.json` / equivalente.
- Identificar conventions (linter config, prettier, prettier config).
- Buscar archivos similares que ya resuelvan el problema (no reinventar).
- Si es un bug → reproducir primero (test mínimo que falla).

### 4. Planear los cambios

Para cada cambio, identificar:

- **Archivos a tocar** (path exactos).
- **Archivos a crear** (si son nuevos).
- **Archivos a NO tocar** (scope discipline).
- **Tests a actualizar o crear.**
- **Migrations si aplica** (DB, schema, types).
- **Documentación a actualizar** (README, docs, JSDoc).

**Si el plan toca > 5 archivos** → dividir en bloques antes de empezar.

### 5. Implementar

Por cada cambio:

#### 5a. Si es feature nueva

1. **→ Load skill `test-driven-development`** (TDD: test primero, código mínimo, refactor).
2. Escribir test que falla.
3. Código mínimo que pasa el test.
4. Refactor solo si está limpio y el test sigue pasando.
5. Verificar convenciones del proyecto (linter + prettier + commit hooks).

#### 5b. Si es bug

1. **→ Load skill `systematic-debugging`** PRIMERO.
2. Reproducir el bug con test mínimo.
3. Aplicar las 4 fases del debugging: reproducir → aislar → hipótesis → fix.
4. Verificar que el test ahora pasa y no rompiste otros.

#### 5c. Si es refactor

1. **→ Load skill `code-simplification`** (cubrir clean code patterns).
2. Hacer cambios atómicos (un cambio por commit si es posible).
3. Verificar que tests siguen pasando después de cada cambio.

**Reglas duras (siempre):**

- TypeScript estricto (no `any`).
- No secrets hardcoded.
- No swallow errors (catch + log + rethrow).
- Validar input en boundaries (API endpoints, form submissions).
- Manejar async correctamente (no Promise chains innecesarias, usar async/await).

### 6. Verificar

Antes de declarar terminado, **SIEMPRE** correr:

#### 6a. → Load skill `verification-before-completion`

Esta skill ejecuta los checks obligatorios:

```bash
# Lint
pnpm lint  # o npm run lint, eslint, etc.

# Typecheck
pnpm typecheck  # o tsc --noEmit

# Tests
pnpm test           # unit
pnpm test:integration
pnpm test:e2e       # si aplica

# Build
pnpm build

# Pre-flight checks (si deploy)
node scripts/deploy/preflight-deploy.mjs --app <name>
```

**Si algún check falla** → fix antes de declarar listo.

### 7. Aplicar verifiers

1. **Self-check** vs Spec.
2. **`verifiers/critic_prompt.md`** — sobre el diff generado.
3. **`verifiers/source_check_prompt.md`** — si el código usa APIs externas.
4. **→ Load skill `code-review-and-quality`** — checklist de review con prefijos 🔴/🟡/💡.

### 8. Branch y PR

#### 8a. → Load skill `using-git-worktrees`

**Cuando:** el cambio es > 1 sesión o toca código que no querés ensuciar.

Te da un workspace aislado en `../.worktrees/<branch>/`.

#### 8b. → Load skill `finishing-a-development-branch`

**Cuando:** terminaste el trabajo y querés mergear o abrir PR.

Cubre: rebase, push, merge vs PR, cleanup.

#### 8c. → Load skill `requesting-code-review`

**Cuando:** querés review antes de mergear.

#### 8d. → Load skill `receiving-code-review`

**Cuando:** recibiste feedback de review y querés aplicarlo bien.

### 9. Commit y reporte

**Commit:**

- Conventional Commits: `<type>(<scope>): <description>`.
- Tipos: feat, fix, refactor, docs, test, chore, perf.
- Scope: nombre del feature/módulo/área.
- Mensaje en inglés, body opcional con "why" + "what".

**Reporte:**

```
## Coding task completada

### Spec
<path a current_spec.md> o "Spec mínima inline"

### Skills usadas
- using-superpowers → test-driven-development + ...

### Archivos tocados
- `<path>`: <qué cambió>
- `<path>` (nuevo): <qué hace>

### Tests
- <cuántos agregados/modificados>
- <coverage change>

### Verificación
- Lint: ✅
- Typecheck: ✅
- Tests: ✅ (X passing)
- Build: ✅
- verification-before-completion: ✅
- Critic prompt: <score>
- code-review-and-quality: <score>

### Commit
`<mensaje del commit>`

### Branch / PR
<creado/mergeado/pendiente>

### Próximo paso
<sugerencia>
```

### 10. Archivar Spec

Mover `specs/current_spec.md` → `archive/YYYY-MM-DD-<slug>.md`.

---

## Anti-patterns

- ❌ Empezar a codear sin leer el codebase.
- ❌ "Refactor mientras estoy ahí" sin estar en scope.
- ❌ **Fixear sin test que reproduzca el bug** (sin systematic-debugging).
- ❌ Agregar dependencias sin justificar.
- ❌ Code style que rompa conventions del proyecto.
- ❌ TODOs en código de producción.
- ❌ Comentarios obvios (`// increment i` sobre `i++`).
- ❌ Funciones > 50 líneas o archivos > 300 líneas sin refactor.
- ❌ **Saltarse TDD** "porque el código es obvio".
- ❌ **No verificar antes de declarar listo** (sin verification-before-completion).

## Cuándo dividir en bloques explícitos

- Feature > 1 sesión → dividir.
- Bug con varios archivos afectados → dividir (repro → fix → tests → cleanup).
- Refactor > 200 líneas de diff → dividir (extract function → extract module → cleanup).

## Cuándo volver a Spec

- Descubres que el approach inicial no funciona.
- User cambia requirements mid-implementation.
- Encuentras que la feature ya existe parcialmente.
- El plan original era incorrecto sobre el codebase real.