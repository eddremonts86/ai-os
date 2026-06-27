---
name: debugging-and-error-recovery
description: Debugging sistemático en 4 fases — reproducir → aislar → hipótesis → fix → verificación. Cubre logs, breakpoints, profiling, network inspection, root cause analysis. Aplica a cualquier bug que no se resuelve a la primera.
license: MIT
---

# Debugging & Error Recovery

## Mentalidad

> "El bug no está donde pensás. Está donde no miraste."

El 80% del tiempo de debugging se va en:
- Asumir la causa antes de reproducir.
- Mirar el código equivocado.
- Fixear síntomas, no causas.
- No verificar el fix.

## Fase 1: Reproducir (10-20% del tiempo)

### Objetivo
Poder ejecutar el bug on-demand. Sin reproducción, no hay fix.

### Preguntas clave
- ¿Cuándo aparece? (siempre, a veces, race condition)
- ¿Qué input lo dispara? (datos específicos, tamaño, encoding)
- ¿Qué ambiente? (dev, staging, prod, browser, OS)
- ¿Es determinístico o probabilístico?
- ¿Cambió algo recientemente? (deploy, config, deps)

### Checklist
- [ ] Obtener steps exactos para reproducir
- [ ] Verificar que el bug ocurre consistentemente
- [ ] Documentar condiciones (browser, OS, data)
- [ ] Crear test mínimo que reproduce el bug
- [ ] Si es aleatorio: identificar correlación (timing, load, data shape)

```typescript
// Test mínimo de reproducción
test('bug: login fails when email has uppercase', async () => {
  const result = await login('User@Example.com', 'password123');
  expect(result).toEqual({ success: true });
});
```

## Fase 2: Aislar (30-40% del tiempo)

### Objetivo
Identificar el componente/línea exacta responsable.

### Técnicas

#### Binary search (bisect)
Reducir el espacio de búsqueda a la mitad cada vez.

```bash
# Encontrar commit que introdujo el bug
git bisect start
git bisect bad HEAD
git bisect good <commit-where-it-worked>
# Probar cada commit sugerido
git bisect run pnpm test
# Cuando encuentra el bad commit:
git bisect reset
```

#### Divide and conquer
Comentar/deshabilitar mitades del código hasta encontrar el bug.

```typescript
// Comentar secciones para aislar
async function complexFunction(input) {
  // const step1 = await doStep1(input);
  const step2 = await doStep2(input);  // ¿funciona sin step1?
  // const step3 = await doStep3(step2);
  return step2;
}
```

#### Minimal reproduction
Reducir a la mínima cantidad de código que muestra el bug.

#### Rubber duck debugging
Explicar el código línea por línea a otro (o a un pato). A veces el problema se revela al verbalizar.

### Herramientas

```bash
# Logs
console.log('checkpoint A', { var1, var2 });
console.trace('call stack here');

# Node debugger
node --inspect-brk=0.0.0.0:9229 script.js
# Chrome → chrome://inspect

# pdb (Python)
import pdb; pdb.set_trace()

# Strace / ltrace (Linux)
strace -f -e trace=open,read,write node app.js

# Network
curl -v https://api.example.com/endpoint
# Browser DevTools → Network tab
```

#### Browser DevTools

| Tab | Uso |
|---|---|
| Console | Logs, errors, eval expressions |
| Network | Requests, response, headers, timing |
| Sources | Breakpoints, step through, watch expressions |
| Performance | Profile CPU, identify bottlenecks |
| Memory | Heap snapshots, detect leaks |
| Application | localStorage, cookies, IndexedDB |

#### Backend debugging

```typescript
// Logger estructurado con contexto
import pino from 'pino';
const logger = pino();

logger.info({
  userId: req.user.id,
  endpoint: req.path,
  method: req.method,
  body: req.body,  // ← sospechoso si crash
}, 'request received');

// Trace async flow
logger.debug({ step: 'before_db_query', params: { id, filters } }, 'starting query');
const result = await db.query(...);
logger.debug({ step: 'after_db_query', rowCount: result.length }, 'query done');
```

## Fase 3: Hipótesis y verificación (30-40% del tiempo)

### Objetivo
Formar hipótesis falsificables, no "intuir".

### Estructura de hipótesis

```markdown
## Hipótesis 1
**Creo que:** el bug es causado por X.
**Porque:** observé Y cuando Z.
**Predicción:** si es cierto, entonces al cambiar W debería dejar de fallar.
**Test:** [cómo verifico]
**Resultado:** [verificado | refutado]
```

### Heurísticas comunes

| Síntoma | Hipótesis probable |
|---|---|
| Funciona en dev, falla en prod | Env vars, CORS, HTTPS, build config |
| Funciona solo a veces | Race condition, async ordering, cache stale |
| Crash después de N requests | Memory leak, connection pool exhaustion |
| UI muestra data vieja | Cache invalidation missing, optimistic update sin rollback |
| Auth falla aleatoriamente | Token expiry, clock skew, session storage |
| API lento | N+1 query, missing index, large payload |
| Build local pasa, CI falla | Cache stale, node version diff, missing env |

### "5 Whys" — root cause analysis

```
Problema: API devuelve 500 en POST /api/users
Por qué? → DB query falla con "unique constraint"
Por qué? → Dos requests simultáneos crean mismo email
Por qué? → No hay unique constraint a nivel DB
Por qué? → Schema se generó sin índice único
Por qué? → Migración inicial no especificó constraint
→ Root cause: schema design oversight
```

## Fase 4: Fix y verificación (10-20% del tiempo)

### Principio: fixear la causa raíz, no el síntoma

```typescript
// ❌ MAL: fixea el síntoma
try {
  await db.users.create(data);
} catch (e) {
  if (e.code === 'UNIQUE_VIOLATION') {
    return res.status(409).json({ error: 'Email exists' });
  }
  // Sigue fallando con otros errors
}

// ✅ BIEN: previene el problema desde el origen
// 1. Validar antes de query
if (!isValidEmail(data.email)) return res.status(400).json({ error: 'Invalid email' });

// 2. Usar transacción con lock
await db.transaction(async (tx) => {
  const existing = await tx.users.findByEmail(data.email);
  if (existing) throw new ConflictError('Email exists');
  await tx.users.create(data);
});

// 3. Schema correcto
// migration: email VARCHAR(255) UNIQUE NOT NULL
```

### Checklist post-fix
- [ ] El test de reproducción ahora pasa
- [ ] No rompí tests existentes (run full suite)
- [ ] Logs/metrics muestran el fix funcionando
- [ ] Edge cases contemplados
- [ ] Documentar en commit message: qué era + por qué + cómo se fixea
- [ ] Si es bug de seguridad: agregar test que prevenga regresión

## Errores comunes

1. ❌ **Fixear sin reproducir** — "creo que es X" → fix → "no era X" → tiempo perdido.
2. ❌ **Fixear el síntoma** — error 500 → try/catch → "resuelto" hasta el próximo crash.
3. ❌ **Asumir la causa** — sin investigar, "debe ser X".
4. ❌ **No leer el error completo** — stack trace truncado, mensaje ignorado.
5. ❌ **Un fix a la vez sin verificar** — múltiples cambios, ninguno verificado individualmente.
6. ❌ **Borrar el código que "no sirve"** — sin entender por qué estaba.
7. ❌ **Console.log sin remover** — debugging en prod = log noise.
8. ❌ **No escribir test de regresión** — bug vuelve en 3 meses.
9. ❌ **Merge fix sin review** — bugs críticos merecen review aunque sean urgentes.
10. ❌ **No documentar root cause** — team repite el mismo debugging después.

## Logging best practices

```typescript
// ✅ Estructurado
logger.info({
  event: 'user_login',
  userId: user.id,
  duration: 234,
  success: true,
}, 'user logged in');

// ❌ Unstructured (imposible de query/parse)
logger.info(`User ${user.id} logged in in 234ms successfully`);
```

```typescript
// ✅ Niveles apropiados
logger.debug('detailed flow', { step: 'parsing input' });
logger.info('significant events', { event: 'user_login' });
logger.warn('recoverable issues', { retry: 2, error: 'timeout' });
logger.error('failures', { err, context });
logger.fatal('app-crashing issues');

// ❌ Todo como console.log o logger.error
console.log('everything');  // imposible filtrar
```

```typescript
// ✅ Correlation IDs para tracing
const correlationId = crypto.randomUUID();
req.correlationId = correlationId;

logger.info({ correlationId, userId }, 'request start');
// ... scattered logs all include correlationId
logger.info({ correlationId }, 'request end');
```

```typescript
// ✅ NUNCA loguear secrets
logger.info({ apiKey, password, ssn });  // NUNCA

// ✅ Redact automático
const REDACT_KEYS = ['password', 'token', 'apiKey', 'ssn'];
function redact(obj) {
  // ... redaction logic
}
logger.info(redact(sensitiveObject));
```

## Performance debugging

### CPU profile (Node)

```bash
# Built-in profiler
node --prof app.js
# Process signal: kill -SIGUSR2 <pid>
# Process profile: node --prof-process isolate-*.log > processed.txt

# Clinic.js (más legible)
clinic doctor -- node app.js
clinic flame -- node app.js
clinic heap -- node app.js

# Chrome DevTools
node --inspect app.js
# → chrome://inspect → record
```

### Memory leak detection

```bash
# Heap snapshot
node --inspect app.js
# DevTools → Memory → Take snapshot → compare

# heapdump
npm install heapdump
const heapdump = require('heapdump');
heapdump.writeSnapshot('/tmp/heap-' + Date.now() + '.heapsnapshot');
```

```typescript
// Common leaks:
// 1. Event listeners no removidos
emitter.on('event', handler);  // ❌ never removed
emitter.on('event', handler);  // ✅ with cleanup
//   return () => emitter.off('event', handler);

// 2. Closures sobre variables grandes
function outer() {
  const huge = new Array(1e6);
  return () => huge.length;  // ❌ huge queda en memoria
}

// 3. Timers no clear
setInterval(() => {...}, 1000);  // ❌ nunca cleared
const id = setInterval(...); clearInterval(id);  // ✅

// 4. Cache sin eviction
cache.set(key, value);  // ❌ crece sin límite
//   usar LRU: new LRU({ max: 1000 });
```

## Async debugging

```typescript
// Race conditions
// ❌ MAL: asume orden
let data;
fetchA().then(a => { data = a; });
fetchB().then(b => { console.log(data, b); });  // data puede ser undefined

// ✅ BIEN: usar Promise.all o await
const [a, b] = await Promise.all([fetchA(), fetchB()]);

// Async stack traces
node --async-stack-traces app.js  # (default in modern Node)

// Named async functions para mejor stack
async function loginUser(email) {  // ✓ nombre claro
  // ...
}
const loginUser = async (email) => {  // ✗ anonymous en stack
  // ...
};
```

## Post-mortem template

```markdown
# Post-mortem: <bug title>

## Summary
One-paragraph description of what happened, when, and impact.

## Timeline (UTC)
- 14:23 — User reports issue
- 14:31 — Engineer acknowledges
- 14:45 — Reproduction confirmed
- 15:12 — Root cause identified
- 15:34 — Fix deployed to staging
- 15:50 — Fix verified in staging
- 16:05 — Fix deployed to prod
- 16:08 — Monitoring confirms resolution

## Root cause
Detailed technical explanation of WHY the bug happened.

## Resolution
What was done to fix it.

## Impact
- Duration: 45 minutes
- Users affected: 234 (3% of daily active)
- Data loss: none
- Revenue impact: $0 (no payments involved)

## Detection
How was it detected? (user report, monitoring, alert)

## Response
What went well? What could be improved?

## Action items
- [ ] Add test that reproduces bug (preventive)
- [ ] Add monitoring/alert for similar conditions
- [ ] Document the root cause in code comments
- [ ] Update runbook with this scenario
```

## Recursos

- [Debug It! (Paul Butcher)](https://pragprog.com/titles/pdbg/debug-it/)
- [Node debugging guide](https://nodejs.org/en/docs/guides/debugging-getting-started/)
- [Chrome DevTools docs](https://developer.chrome.com/docs/devtools/)
- Skill relacionada: `systematic-debugging` (workspace)
- Skill relacionada: `prod-deploy-verification` (pre-deploy checks)