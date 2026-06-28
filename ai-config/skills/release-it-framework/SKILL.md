---
name: release-it-framework
description: Production-ready framework inspired by "Release It!" 2nd Edition (Michael Nygard). Covers stability patterns (circuit breaker, bulkhead, timeout, retry), capacity planning, deployment strategies (blue-green, canary, feature flags), health/observability, chaos engineering.
license: MIT
---

# Release-It Framework

Compact reference of the book "Release It! 2nd Edition" by Michael Nygard. Stability patterns for production-ready systems.

## Framework structure (6 areas)

1. Stability Anti-patterns
2. Stability Patterns
3. Capacity & Availability
4. Deployment Strategies
5. Health & Observability
6. Chaos Engineering

## 1. Stability Anti-patterns

| Anti-pattern | Symptom |
|---|---|
| **Integration points are the #1 cause of outages** | Calls to external APIs, DBs, services. They fail, are slow, change format. |
| **Cascading failures** | One slow component makes others wait → thread pool exhaustion → everything falls over. |
| **Slow responses** | 1000ms instead of 100ms → users click more → more requests → overload. |
| **Unbounded result sets** | Query without LIMIT → 10M records → OOM. |
| **Blocked threads** | Sockets waiting, threads blocked → throughput drops to 0. |
| **Self-denial attacks** | Your own code DoS-es your system (N+1 queries, recursive calls, hot loops). |
| **Scaling effects** | Load balancer with sticky sessions → one saturated node. |
| **Unbalanced capacities** | Frontend 100 RPS, backend 10 RPS. |
| **Untested recovery** | Restart never tested, failover only during disaster. |

## 2. Stability Patterns

### Circuit Breaker (3 states)

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

Isolate resources so one failure doesn't drain everything.

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
// Connect timeout (shorter)
const connectTimeout = 1000;

// Read timeout (longer)
const readTimeout = 3000;

// NEVER without a timeout
const response = await fetch(url);  // ❌ can hang forever

// ALWAYS with a timeout
const response = await fetch(url, { 
  signal: AbortSignal.timeout(readTimeout) 
});
```

### Retry with backoff

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

// Retry budget: max retries in a time window
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

Ensure every operation leaves the system in a consistent state.

```typescript
// Saga pattern for distributed transactions
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

Accept that things will fail. Restart fast instead of trying to recover.

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

The receiver tells the sender "I'm ready for more".

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

### Types of tests

| Type | Purpose | Duration |
|---|---|---|
| **Load test** | Measure performance under expected load | 30 min |
| **Stress test** | Find the breaking point | 1h |
| **Soak test** | Detect memory leaks, slow degradation | 24-72h |
| **Spike test** | Validate response to sudden spikes | 15 min |
| **Capacity test** | Determine max sustainable throughput | 1-2h |

### Universal Scalability Law (USL)

```
Throughput(N) = N / (1 + α(N-1) + βN(N-1))
```

- N = number of nodes
- α = contention (locks, shared resources)
- β = coherence (coordination overhead)

Lesson: doubling nodes does NOT double throughput. There is an optimal point.

### Connection pools

```typescript
// Pool size based on throughput, not CPU cores
// Rule: pool = (target_throughput × avg_query_time) × 1.5

// PostgreSQL
const pool = new Pool({
  max: 20,                    // calculated, not default
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
});

// HTTP keep-alive agent
const agent = new http.Agent({
  keepAlive: true,
  maxSockets: 50,             // limit concurrency
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

See skill `shipping-and-launch` for full detail.

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

**Never** deploy a destructive schema change in the same release as the code that uses it.

## 5. Health & Observability

### Deep vs Shallow health checks

```typescript
// Shallow: only "the process is alive"
app.get('/health', (req, res) => res.json({ status: 'ok' }));

// Deep: verifies dependencies
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

1. **Logs** — discrete events with timestamp + correlation ID
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
# SLI (Service Level Indicator) — the metric
availability_sli: "successful_requests / total_requests"

# SLO (Service Level Objective) — the target
availability_slo: 0.999   # 99.9% (three nines)

# SLA (Service Level Agreement) — the contract with consequences
availability_sla: 0.99    # 99% (lower than SLO = headroom)
```

**Error budget:**

- SLO = 99.9% → budget = 0.1% = 43.2 min downtime/month
- If the budget is spent, freeze deploys until next month

### Alert on symptoms, not causes

```yaml
# ✅ GOOD: alert on user-facing
- alert: high_error_rate
  condition: 5xx_rate > 5% for 5min
  severity: page
  
- alert: high_latency
  condition: p95_latency > 2s for 10min
  severity: page

# ❌ BAD: alert on internal causes
- alert: high_cpu
  condition: cpu > 80%
  severity: page  # cause, not symptom
```

## 6. Chaos Engineering

### Principles of Chaos

1. **Build a hypothesis** around steady state behavior
2. **Vary real-world events** (server crash, network latency, disk full)
3. **Run experiments in production** (or production-like)
4. **Automate experiments** to run continuously
5. **Minimize blast radius** (start small, canary the chaos)

### Process

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

Scheduled chaos experiments with the whole team present to learn and improve response.

## Quick diagnostic table

| Symptom | Probable cause | Fix |
|---|---|---|
| Sudden slowdown | Memory leak, GC pressure, slow DB query | Heap snapshot, slow query log |
| Errors spiking | External API down, DB connection issues | Circuit breaker, check integration points |
| Throughput plateaus | Connection pool exhaustion, thread blocking | Pool size, async I/O |
| Crashes on deploy | Bad config, missing dependency | Smoke tests, health check |
| Data inconsistency | Race condition, no transaction | Pessimistic lock, transaction |

## Resources

- [Release It! 2nd Edition — Michael Nygard](https://pragprog.com/titles/mnee2/release-it-second-edition/)
- [USL formula](https://en.wikipedia.org/wiki/Universal_scalability_law)
- [Opossum (Node circuit breaker)](https://nodeshift.dev/opossum/)
- [Gremlin docs](https://www.gremlin.com/docs/)
- [Google SRE Book](https://sre.google/sre-book/table-of-contents/)
- Related skill: `shipping-and-launch` (deploy + rollback)
- Related skill: `ci-cd-and-automation` (pipeline)
- Related skill: `prod-deploy-verification` (pre-deploy checks)
- Related skill: `owasp-security` (security patterns)