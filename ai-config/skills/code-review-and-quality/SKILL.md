---
name: code-review-and-quality
description: Code review efectivo — qué mirar, cómo comentar, tamaño de PR, checklist de calidad. Aplica a PR reviews en cualquier lenguaje, especialmente TypeScript/React/Node.
license: MIT
---

# Code Review & Quality

## Mentalidad

> "El review no es para demostrar que sabés más. Es para mejorar el código juntos."

Tres objetivos del review:
1. **Catch bugs** antes de prod
2. **Improve design** a largo plazo
3. **Share knowledge** across the team

NO es para:
- Mostrarte superior
- Discutir preferencias de estilo (eso lo hace el linter)
- Bloquear sin razón

## Cuándo pedir review

- PR < 400 líneas de diff (ideal < 200)
- CI pasa (lint, typecheck, tests)
- Self-review hecho (leíste tu propio PR)
- Descripción completa (qué, por qué, cómo probar)

## Cuándo hacer review

- **< 4 horas** desde que se asignó
- Si vas a tardar > 24h, avisa y reasigna
- **< 30 min** por sesión (PRs grandes en chunks)

## Estructura del review

### 1. Overall (1 min)

Lee la descripción del PR primero. Entendé el "qué" y el "por qué" antes de mirar código.

### 2. High-level (5 min)

- ¿La solución tiene sentido?
- ¿Hay un approach más simple?
- ¿Encaja con la arquitectura del proyecto?
- ¿Hay issues de seguridad obvios?

### 3. Detail (15-20 min)

- Bugs potenciales
- Edge cases no contemplados
- Performance issues
- Tests apropiados

### 4. Nitpicks (2-3 min)

- Naming
- Comentarios
- Style (si el linter no lo cubre)

## Comentarios — el lenguaje importa

### Categorías con prefijo

```
🔴 BLOCKING — debe resolverse antes de merge
🟡 IMPORTANT — debería resolverse, pero podés explicar por qué no
💡 NIT — preference, no blocker
❓ QUESTION — necesito entender el código
🎓 LEARNING — contexto educativo, no request de cambio
```

### Ejemplos

```
🔴 This will throw when user.email is null (no DB constraint). Add a null check or schema validation.

🟡 Consider using a Map instead of object for O(1) lookup. Performance only matters at scale, but it's cleaner.

💡 Could rename `data` → `userInput` for clarity. Up to you.

❓ Why is this Promise.race instead of Promise.all? Both would work, but I'm not sure of the intent.

🎓 In TypeScript 5.0+, you can use `const` type parameters for better inference. See: <link>
```

### Tono

**Sí:**
- "Consider..."
- "What do you think about...?"
- "I'm wondering if..."
- "Could we...?"

**No:**
- "This is wrong"
- "You should..."
- "Why didn't you...?"
- "This is bad"

## Checklist de review

### Funcionalidad
- [ ] El código hace lo que dice la descripción del PR
- [ ] Edge cases contemplados (null, undefined, empty, max, race conditions)
- [ ] Error handling apropiado (no swallow errors)
- [ ] No hay lógica de negocio faltante

### Diseño
- [ ] Sigue los patrones del proyecto (chequear skills/AGENTS.md)
- [ ] No acoplamiento innecesario
- [ ] Single responsibility
- [ ] Nombres claros (variables, funciones, tipos)
- [ ] No "clever" code que requiera comentario para entenderse

### Seguridad
- [ ] No secrets hardcoded
- [ ] Input validation (especialmente user input)
- [ ] Auth/authz en endpoints
- [ ] SQL/NoSQL parameterized
- [ ] XSS sanitization
- [ ] CSRF protection
- [ ] CORS configurado correctamente

Ver skill `owasp-security` para checklist completo.

### Performance
- [ ] N+1 queries evitadas
- [ ] No loops innecesarios sobre data grande
- [ ] No render loops en React (useMemo/useCallback solo si vale)
- [ ] Bundle size no explotó (verificar size-limit)
- [ ] No memory leaks (event listeners, timers, closures)
- [ ] DB queries con índices

### Testing
- [ ] Tests para nueva funcionalidad
- [ ] Tests para bug fixes (regresión)
- [ ] Edge cases testeados
- [ ] Tests no flaky
- [ ] Coverage no bajó

### Legibility
- [ ] Funciones < 50 líneas (idealmente < 20)
- [ ] Archivos < 300 líneas
- [ ] Sin comentarios redundantes ("// increment i" sobre `i++`)
- [ ] Magic numbers extraídos a constantes con nombre

### Tipos (TypeScript)
- [ ] No `any` (usar `unknown` + narrowing)
- [ ] Interfaces/types específicos, no genéricos
- [ ] `as` solo cuando es inevitable
- [ ] Generics bien aplicados

## Tamaños de PR

| Líneas diff | Categoría | Tiempo review |
|---|---|---|
| < 50 | Trivial | 5 min |
| 50-200 | Ideal | 15-30 min |
| 200-400 | Grande | 30-60 min (splitear si se puede) |
| 400-800 | Muy grande | dividir en múltiples PRs |
| > 800 | Refactor masivo | requiere design doc previo |

Si tu PR es > 400 líneas, probablemente se puede dividir.

```bash
# Splitear con git
git checkout -b feat/part-1
git add <files-for-part-1>
git commit -m "feat: part 1 of X"
git checkout main
git checkout -b feat/part-2
# resto de archivos
```

## Self-review

Antes de pedir review, revisar tu propio PR:

```bash
# 1. Ver el diff completo
gh pr diff

# 2. Releer la descripción
gh pr view

# 3. Correr tests local
pnpm test
pnpm typecheck
pnpm lint

# 4. Verificar CI
gh pr checks

# 5. Self-review en GitHub
# Add comments to your own PR explaining non-obvious choices
```

## Patrones comunes a rechazar

### 1. "Fix" que esconde el problema

```typescript
// ❌ MAL
try {
  await db.users.create(data);
} catch (e) {
  return null;  // silencio = bug difícil de debuggear
}

// ✅ BIEN
try {
  return await db.users.create(data);
} catch (e) {
  if (e.code === 'UNIQUE_VIOLATION') throw new ConflictError('Email exists');
  logger.error({ err, data: redact(data) }, 'failed to create user');
  throw e;
}
```

### 2. "I'll fix it later" comments

```typescript
// ❌ MAL
// TODO: add proper validation
function processInput(input: any) {
  return doStuff(input);
}

// ✅ BIEN
// Sin el TODO, o con ticket reference:
// TODO(SCH-12345): add proper validation
function processInput(input: unknown) {
  if (!validateSchema(input)) throw new ValidationError();
  return doStuff(input);
}
```

### 3. Over-engineering

```typescript
// ❌ MAL: abstracción prematura
class AbstractUserFactoryBuilderFactory { ... }

// ✅ BIEN: KISS
function createUser(data) { ... }
```

### 4. God components/classes

```typescript
// ❌ MAL: 500-line component doing everything
function Dashboard() {
  // fetch data, handle auth, render charts, manage state, handle routes
}

// ✅ BIEN: dividido
function Dashboard() {
  return (
    <DashboardLayout>
      <DashboardHeader />
      <DashboardCharts />
      <DashboardTable />
    </DashboardLayout>
  );
}
```

### 5. Magic strings/numbers

```typescript
// ❌ MAL
if (user.role === 'admin') { ... }
setTimeout(callback, 86400000);

// ✅ BIEN
const ROLES = { ADMIN: 'admin', USER: 'user' };
if (user.role === ROLES.ADMIN) { ... }
const ONE_DAY_MS = 24 * 60 * 60 * 1000;
setTimeout(callback, ONE_DAY_MS);
```

## Aprobación

### Aprobar

```markdown
LGTM! Ship it 🚀

(or "Looks Good To Me" + emoji)

Or with detail:
Nice work. Two nits but I'll let you decide.

### Approved with suggestions
[suggestion 1]
[suggestion 2]

### Comments addressed
[link to comments]
```

### Request changes

```markdown
### Blocking
1. [critical issue]

### Suggestions (non-blocking)
1. [improvement]
```

Si el cambio es blocking, sé específico sobre QUÉ cambiar y POR QUÉ.

### Comentario vacío en aprobación
Si no hay nada que decir → aprobar con "LGTM" y emoji. No requieras 5 párrafos de aprobación.

## Cuando NO aprobar

- CI falla (lint, tests, build)
- Descripción del PR está vacía
- Diff > 800 líneas sin justificación
- Cambios fuera del scope del PR
- Mezcla fix + refactor + feat (pedir split)
- Sin tests para cambio funcional
- Regresión de bug sin test que prevenga

## Tooling

```bash
# GitHub CLI
gh pr list                    # ver PRs abiertos
gh pr view <num>              # ver detalle
gh pr diff <num>              # ver diff
gh pr review --approve         # aprobar
gh pr review --request-changes --body "..."
gh pr review --comment --body "..."

# Conventional comments
# https://conventionalcomments.org/
# Prefijos: praise (🎓), nit (💡), suggestion (🟡), issue (🔴), question (❓)

# Danger.js (auto-comments)
# https://danger.systems/
# Auto-flag: PRs > 500 líneas, sin tests, etc.
```

## Recursos

- [Conventional Comments](https://conventionalcomments.org/)
- [Google Engineering: Code Review](https://google.github.io/eng-practices/review/)
- [GitHub code review docs](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests)
- Skill relacionada: `requesting-code-review` (cómo pedir)
- Skill relacionada: `receiving-code-review` (cómo recibir)
- Skill relacionada: `owasp-security` (security checklist)
- Skill relacionada: `code-simplification` (cómo simplificar)