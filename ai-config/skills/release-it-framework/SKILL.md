---
name: release-it-framework
description: Framework production-ready inspirado en "Release It!" 2nd Edition (Michael Nygard). Cubre stability patterns (circuit breaker, bulkhead, timeout, retry), capacity planning, deployment strategies (blue-green, canary, feature flags), health/observability, chaos engineering.
license: MIT
---

# Release-It Framework

Referencia compacta del libro "Release It! 2nd Edition" de Michael Nygard. Patrones de estabilidad para sistemas production-ready.

## Estructura del framework (6 áreas)

1. Stability Anti-patterns
2. Stability Patterns
3. Capacity & Availability
4. Deployment Strategies
5. Health & Observability
6. Chaos Engineering

## 1. Stability Anti-patterns

| Anti-pattern | Síntoma |
|---|---|
| **Integration points are the #1 cause of outages** | Llamadas a APIs externas, DBs, services. Fallan, son lentas, cambian formato. |
| **Cascading failures** | Un componente lento hace que otros esperen → thread pool exhaustion → todo se cae. |
| **Slow responses** | 1000ms en lugar de 100ms → users hacen más clicks → más requests → overload. |
| **Unbounded result sets** | Query sin LIMIT → 10M records → OOM. |
| **Blocked threads** | Sockets esperando, threads blocked → throughput cae a 0. |
| **Self-denial attacks** | Tu propio código DoS-ea tu sistema (N+1 queries, recursive calls, hot loops). |
| **Scaling effects** | Load balancer con sticky sessions → un nodo saturado. |
| **Unbalanced capacities** | Frontend 100 RPS, backend 10 RPS. |
| **Untested recovery** | Restart nunca probado, failover solo en disaster. |

## 2. Stability Patterns

### Circuit Breaker (3 estados)

```
CLOSED (normal) ──failures > threshold──> OPEN (block all)
   ↑                                       │
   │                                       │ after timeout
   │                                       ↓
   └──────── HALF_OPEN (test) ◀──────────┘
        ↑
        └── if test request succeeds → CLOSED
        └── if test fails → OPEN (reset timeout)
```

```typescript
import CircuitBreaker from 'opossum';

const options = {
  timeout: 3000,           // request timeout
  errorThresholdPercentage: 50,  // % failures to open
  resetTimeout: 30000,     // wait before half-open
};

const breaker = new CircuitBreaker(callExternalAPI, options);
breaker.fallback(() => ({ cached: true, data: getFromCache() }));

// Use
const result = await breaker.fire(params);
```

### Bulkhead

Aislar recursos para que un fallo no drene todo.

```typescript
// Thread pool separate per integration
const pools = {
  payments: new ThreadPool(10),
  shipping: new ThreadPool(10),
  inventory: new ThreadPool(10),
};

// Connection pool per DB
const dbPools = {
  users: new Pool({ max: 20 }),
  orders: new Pool({ max: 20 }),
  analytics: new Pool({ max: 5 }),
};
```

### Timeout

```typescript
// Connect timeout (más corto)
const connectTimeout = 1000;

// Read timeout (más largo)
const readTimeout = 3000;

// NUNCA sin timeout
const response = await fetch(url);  // ❌ puede colgarse forever

// SIEMPRE con timeout
const response = await fetch(url, { 
  signal: AbortSignal.timeout(readTimeout) 
});
```

### Retry con backoff

```typescript
async function retry<T>(fn: () => Promise<T>, opts = {}): Promise<T> {
  const {
    maxAttempts = 3,
    initialDelay = 100,
    maxDelay = 5000,
    backoffFactor = 2,
    jitter = true,
    retryOn = () => true,
  } = opts;

  for (let attempt = 1; attempt <= maxAttempts; attempt++) {
    try {
      return await fn();
    } catch (e) {
      if (attempt === maxAttempts || !retryOn(e)) throw e;
      
      const delay = Math.min(initialDelay * Math.pow(backoffFactor, attempt - 1), maxDelay);
      const jittered = jitter ? delay * Math.random() : delay;
      await new Promise(r => setTimeout(r, jittered));
    }
  }
  throw new Error('unreachable');
}

// Retry budget: max retries en ventana de tiempo
class RetryBudget {
  private remaining: number;
  
  constructor(private maxPerMinute: number) {
    this.remaining = maxPerMinute;
    setInterval(() => { this.remaining = this.maxPerMinute; }, 60000);
  }
  
  tryAcquire(): boolean {
    if (this.remaining > 0) {
      this.remaining--;
      return true;
    }
    return false;
  }
}
```

### Steady State

Asegurar que cada operación deja el sistema en estado consistente.

```typescript
// Saga pattern para distributed transactions
async function createOrderSaga(data) {
  try {
    const order = await orders.create(data);
    await inventory.reserve(order.items);
    await payment.charge(order);
    await shipping.schedule(order);
    await orders.update(order.id, { status: 'confirmed' });
  } catch (e) {
    // Compensating transactions
    await shipping.cancel(order);
    await payment.refund(order);
    await inventory.release(order.items);
    await orders.update(order.id, { status: 'failed' });
    throw e;
  }
}
```

### Let It Crash

Aceptar que van a fallar. Reiniciar rápido en vez de intentar recover.

```typescript
// Erlang-style supervisor
process.on('uncaughtException', (err) => {
  logger.fatal({ err }, 'uncaught exception, restarting');
  // Graceful shutdown
  server.close(() => process.exit(1));
  // Force exit after 30s
  setTimeout(() => process.exit(1), 30000);
});
```

### Handshaking

El receiver le dice al sender "estoy listo para más".

```typescript
// Client signals "I'm overwhelmed" via 503 + Retry-After header
app.use((req, res, next) => {
  if (isOverloaded()) {
    res.status(503).set('Retry-After', '30').json({ error: 'overloaded' });
    return;
  }
  next();
});
```

## 3. Capacity & Availability

### Tipos de tests

| Tipo | Propósito | Duración |
|---|---|---|
| **Load test** | Medir performance bajo carga esperada | 30 min |
| **Stress test** | Encontrar punto de quiebre | 1h |
| **Soak test** | Detectar memory leaks, slow degradation | 24-72h |
| **Spike test** | Validar respuesta a picos súbitos | 15 min |
| **Capacity test** | Determinar max throughput sostenible | 1-2h |

### Universal Scalability Law (USL)

```
Throughput(N) = N / (1 + α(N-1) + βN(N-1))
```

- N = número de nodos
- α = contention (locks, shared resources)
- β = coherence (overhead de coordinación)

Lección: doblar nodos NO duplica throughput. Hay punto óptimo.

### Connection pools

```typescript
// Pool size basado en throughput, no en CPU cores
// Regla: pool = (target_throughput × avg_query_time) × 1.5

// PostgreSQL
const pool = new Pool({
  max: 20,                    // calculado, no default
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
});

// HTTP keep-alive agent
const agent = new http.Agent({
  keepAlive: true,
  maxSockets: 50,             // limitar concurrencia
  maxFreeSockets: 10,
});
```

## 4. Deployment Strategies

### Blue-Green

```
[Load Balancer]
       │
       ├─→ [Blue = current v1] (100% traffic)
       └─→ [Green = new v2] (0% traffic)

# Deploy:
1. Deploy v2 to Green
2. Test Green
3. Switch LB to Green
4. Blue stays as rollback option
5. After confidence, destroy Blue
```

### Canary

```
[Load Balancer]
       │
       ├─→ [Stable v1] (95% traffic)
       └─→ [Canary v2] (5% traffic)

# Ramp up: 5% → 25% → 50% → 100%
```

### Rolling

```
[v1.1] [v1.2] [v1.3] [v1.4]  → all v2
            ↓
[v2.1] [v1.2] [v1.3] [v1.4]  → mixed
            ↓
[v2.1] [v2.2] [v1.3] [v1.4]  → mixed
            ↓
[v2.1] [v2.2] [v2.3] [v1.4]  → mixed
            ↓
[v2.1] [v2.2] [v2.3] [v2.4]  → all v2
```

### Feature Flags

Ver skill `shipping-and-launch` para detalle completo.

### Schema migrations (expand-contract)

```
# Phase 1: EXPAND (deploy app code)
ALTER TABLE users ADD COLUMN new_email VARCHAR(255);
# App can read both old + new columns

# Phase 2: BACKFILL (background job)
UPDATE users SET new_email = email WHERE new_email IS NULL;

# Phase 3: SWITCH (deploy app code)
# App reads/writes new_email
# Old email column still exists

# Phase 4: CONTRACT (deploy migration)
ALTER TABLE users DROP COLUMN email;
```

**Nunca** deployes destructive schema change en el mismo release que el código que la usa.

## 5. Health & Observability

### Deep vs Shallow health checks

```typescript
// Shallow: solo "el proceso está vivo"
app.get('/health', (req, res) => res.json({ status: 'ok' }));

// Deep: verifica dependencias
app.get('/health/deep', async (req, res) => {
  const checks = {
    app: { ok: true },
    db: { ok: false },
    redis: { ok: false },
    queue: { ok: false },
  };
  
  try {
    await db.ping();
    checks.db.ok = true;
  } catch (e) {
    checks.db.error = e.message;
  }
  
  try {
    await redis.ping();
    checks.redis.ok = true;
  } catch (e) {
    checks.redis.error = e.message;
  }
  
  // ...
  
  const allOk = Object.values(checks).every(c => c.ok);
  res.status(allOk ? 200 : 503).json(checks);
});
```

### Three Pillars

1. **Logs** — eventos discretos con timestamp + correlation ID
2. **Metrics** — counters, gauges, histograms (Prometheus, Datadog)
3. **Traces** — request flow across services (OpenTelemetry, Jaeger)

### RED Method (request-focused)

- **Rate** — requests/sec
- **Errors** — rate of failed requests
- **Duration** — latency (p50, p95, p99)

### USE Method (resource-focused)

- **Utilization** — % time resource busy
- **Saturation** — queue depth
- **Errors** — error count

### SLIs, SLOs, SLAs

```yaml
# SLI (Service Level Indicator) — la métrica
availability_sli: "successful_requests / total_requests"

# SLO (Service Level Objective) — el target
availability_slo: 0.999   # 99.9% (three nines)

# SLA (Service Level Agreement) — el contrato con consecuencias
availability_sla: 0.99    # 99% (menor que SLO = headroom)
```

**Error budget:**
- SLO = 99.9% → budget = 0.1% = 43.2 min downtime/month
- Si se gasta el budget, freeze deploys hasta el próximo mes

### Alert on symptoms, not causes

```yaml
# ✅ BIEN: alertar sobre user-facing
- alert: high_error_rate
  condition: 5xx_rate > 5% for 5min
  severity: page
  
- alert: high_latency
  condition: p95_latency > 2s for 10min
  severity: page

# ❌ MAL: alertar sobre causas internas
- alert: high_cpu
  condition: cpu > 80%
  severity: page  # causa, no síntoma
```

## 6. Chaos Engineering

### Principios (Principles of Chaos)

1. **Build a hypothesis** around steady state behavior
2. **Vary real-world events** (server crash, network latency, disk full)
3. **Run experiments in production** (or production-like)
4. **Automate experiments** to run continuously
5. **Minimize blast radius** (start small, canary the chaos)

### Proceso

```markdown
## Experiment: kill -9 one API node during peak load

### Hypothesis
- Steady state: p95 latency < 200ms, error rate < 0.1%
- Expected: with 3 nodes, killing 1 should not increase latency > 50ms
- Max blast radius: 33% capacity loss for 5 min

### Method
1. Start with 3 API nodes (current prod)
2. Run baseline load test for 5 min, capture metrics
3. At T+5min, kill -9 one node
4. Run load test for another 10 min
5. Capture metrics during failure
6. At T+15min, restore node
7. Capture recovery metrics

### Abort conditions
- Error rate > 5%
- p95 latency > 2s
- Customer complaints

### Rollback
- Restart killed node
- Should auto-recover via process supervisor
```

### Tools

- **Gremlin** — paid, full-featured
- **Litmus** — Kubernetes-native, open-source
- **AWS Fault Injection Service (FIS)** — AWS-native
- **Chaos Monkey** — Netflix original, simple

### GameDays

Scheduled chaos experiments con todo el equipo presente para aprender y mejorar respuesta.

## Quick diagnostic table

| Síntoma | Probable causa | Fix |
|---|---|---|
| Sudden slowdown | Memory leak, GC pressure, DB slow query | Heap snapshot, slow query log |
| Errors spiking | External API down, DB connection issues | Circuit breaker, check integration points |
| Throughput plateaus | Connection pool exhaustion, thread blocking | Pool size, async I/O |
| Crashes on deploy | Bad config, missing dependency | Smoke tests, health check |
| Data inconsistency | Race condition, no transaction | Pessimistic lock, transaction |

## Recursos

- [Release It! 2nd Edition — Michael Nygard](https://pragprog.com/titles/mnee2/release-it-second-edition/)
- [USL公式](https://en.wikipedia.org/wiki/Universal_scalability_law)
- [Opossum (Node circuit breaker)](https://nodeshift.dev/opossum/)
- [Gremlin docs](https://www.gremlin.com/docs/)
- [Google SRE Book](https://sre.google/sre-book/table-of-contents/)
- Skill relacionada: `shipping-and-launch` (deploy + rollback)
- Skill relacionada: `ci-cd-and-automation` (pipeline)
- Skill relacionada: `prod-deploy-verification` (pre-deploy checks)
- Skill relacionada: `owasp-security` (security patterns)