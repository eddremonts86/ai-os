---
name: debugging-and-error-recovery
description: Systematic debugging in 4 phases — reproduce → isolate → hypothesis → fix → verification. Covers logs, breakpoints, profiling, network inspection, root cause analysis. Applies to any bug that does not resolve on the first attempt.
license: MIT
---

# Debugging & Error Recovery

## Mindset

> "The bug is not where you think it is. It is where you didn't look."

80% of debugging time is spent on:
- Assuming the cause before reproducing.
- Looking at the wrong code.
- Fixing symptoms, not causes.
- Not verifying the fix.

## Phase 1: Reproduce (10-20% of time)

### Objective
Be able to run the bug on-demand. Without reproduction, there is no fix.

### Key Questions
- When does it appear? (always, sometimes, race condition)
- What input triggers it? (specific data, size, encoding)
- Which environment? (dev, staging, prod, browser, OS)
- Is it deterministic or probabilistic?
- Did something change recently? (deploy, config, deps)

### Checklist
- [ ] Get exact steps to reproduce
- [ ] Verify the bug occurs consistently
- [ ] Document conditions (browser, OS, data)
- [ ] Create minimum test that reproduces the bug
- [ ] If random: identify correlation (timing, load, data shape)

```typescript
// Minimum reproduction test
test('bug: login fails when email has uppercase', async () => {
  const result = await login('User@Example.com', 'password123');
  expect(result).toEqual({ success: true });
});
```

## Phase 2: Isolate (30-40% of time)

### Objective
Identify the exact component/line responsible.

### Techniques

#### Binary search (bisect)
Reduce the search space by half each time.

```bash
# Find the commit that introduced the bug
git bisect start
git bisect bad HEAD
git bisect good <commit-where-it-worked>
# Test each suggested commit
git bisect run pnpm test
# When it finds the bad commit:
git bisect reset
```

#### Divide and conquer
Comment/disable halves of the code until you find the bug.

```typescript
// Comment sections to isolate
async function complexFunction(input) {
  // const step1 = await doStep1(input);
  const step2 = await doStep2(input);  // does it work without step1?
  // const step3 = await doStep3(step2);
  return step2;
}
```

#### Minimal reproduction
Reduce to the minimum amount of code that shows the bug.

#### Rubber duck debugging
Explain the code line by line to someone else (or to a rubber duck). Sometimes the problem reveals itself when you verbalize it.

### Tools

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

| Tab | Use |
|---|---|
| Console | Logs, errors, eval expressions |
| Network | Requests, response, headers, timing |
| Sources | Breakpoints, step through, watch expressions |
| Performance | Profile CPU, identify bottlenecks |
| Memory | Heap snapshots, detect leaks |
| Application | localStorage, cookies, IndexedDB |

#### Backend debugging

```typescript
// Structured logger with context
import pino from 'pino';
const logger = pino();

logger.info({
  userId: req.user.id,
  endpoint: req.path,
  method: req.method,
  body: req.body,  // ← suspicious if crash
}, 'request received');

// Trace async flow
logger.debug({ step: 'before_db_query', params: { id, filters } }, 'starting query');
const result = await db.query(...);
logger.debug({ step: 'after_db_query', rowCount: result.length }, 'query done');
```

## Phase 3: Hypothesis and verification (30-40% of time)

### Objective
Form falsifiable hypotheses, not "intuition".

### Hypothesis structure

```markdown
## Hypothesis 1
**I believe:** the bug is caused by X.
**Because:** I observed Y when Z.
**Prediction:** if true, then changing W should stop the failure.
**Test:** [how I verify]
**Result:** [verified | refuted]
```

### Common heuristics

| Symptom | Likely hypothesis |
|---|---|
| Works in dev, fails in prod | Env vars, CORS, HTTPS, build config |
| Works only sometimes | Race condition, async ordering, cache stale |
| Crash after N requests | Memory leak, connection pool exhaustion |
| UI shows stale data | Cache invalidation missing, optimistic update without rollback |
| Auth fails randomly | Token expiry, clock skew, session storage |
| API slow | N+1 query, missing index, large payload |
| Local build passes, CI fails | Cache stale, node version diff, missing env |

### "5 Whys" — root cause analysis

```
Problem: API returns 500 on POST /api/users
Why? → DB query fails with "unique constraint"
Why? → Two simultaneous requests create the same email
Why? → No unique constraint at DB level
Why? → Schema was generated without unique index
Why? → Initial migration did not specify constraint
→ Root cause: schema design oversight
```

## Phase 4: Fix and verification (10-20% of time)

### Principle: fix the root cause, not the symptom

```typescript
// ❌ WRONG: fixes the symptom
try {
  await db.users.create(data);
} catch (e) {
  if (e.code === 'UNIQUE_VIOLATION') {
    return res.status(409).json({ error: 'Email exists' });
  }
  // Still fails with other errors
}

// ✅ RIGHT: prevents the problem at the source
// 1. Validate before query
if (!isValidEmail(data.email)) return res.status(400).json({ error: 'Invalid email' });

// 2. Use transaction with lock
await db.transaction(async (tx) => {
  const existing = await tx.users.findByEmail(data.email);
  if (existing) throw new ConflictError('Email exists');
  await tx.users.create(data);
});

// 3. Correct schema
// migration: email VARCHAR(255) UNIQUE NOT NULL
```

### Post-fix checklist
- [ ] The reproduction test now passes
- [ ] I did not break existing tests (run full suite)
- [ ] Logs/metrics show the fix working
- [ ] Edge cases considered
- [ ] Document in commit message: what it was + why + how it's fixed
- [ ] If it's a security bug: add test to prevent regression

## Common mistakes

1. ❌ **Fixing without reproducing** — "I think it's X" → fix → "it wasn't X" → wasted time.
2. ❌ **Fixing the symptom** — 500 error → try/catch → "resolved" until next crash.
3. ❌ **Assuming the cause** — without investigating, "it must be X".
4. ❌ **Not reading the full error** — truncated stack trace, message ignored.
5. ❌ **One fix at a time without verifying** — multiple changes, none verified individually.
6. ❌ **Deleting code that "doesn't work"** — without understanding why it was there.
7. ❌ **Console.log without removing** — debugging in prod = log noise.
8. ❌ **Not writing a regression test** — bug comes back in 3 months.
9. ❌ **Merge fix without review** — critical bugs deserve review even if urgent.
10. ❌ **Not documenting root cause** — team repeats the same debugging later.

## Logging best practices

```typescript
// ✅ Structured
logger.info({
  event: 'user_login',
  userId: user.id,
  duration: 234,
  success: true,
}, 'user logged in');

// ❌ Unstructured (impossible to query/parse)
logger.info(`User ${user.id} logged in in 234ms successfully`);
```

```typescript
// ✅ Appropriate levels
logger.debug('detailed flow', { step: 'parsing input' });
logger.info('significant events', { event: 'user_login' });
logger.warn('recoverable issues', { retry: 2, error: 'timeout' });
logger.error('failures', { err, context });
logger.fatal('app-crashing issues');

// ❌ Everything as console.log or logger.error
console.log('everything');  // impossible to filter
```

```typescript
// ✅ Correlation IDs for tracing
const correlationId = crypto.randomUUID();
req.correlationId = correlationId;

logger.info({ correlationId, userId }, 'request start');
// ... scattered logs all include correlationId
logger.info({ correlationId }, 'request end');
```

```typescript
// ✅ NEVER log secrets
logger.info({ apiKey, password, ssn });  // NEVER

// ✅ Automatic redaction
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

# Clinic.js (more readable)
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
// 1. Event listeners not removed
emitter.on('event', handler);  // ❌ never removed
emitter.on('event', handler);  // ✅ with cleanup
//   return () => emitter.off('event', handler);

// 2. Closures over large variables
function outer() {
  const huge = new Array(1e6);
  return () => huge.length;  // ❌ huge stays in memory
}

// 3. Timers not cleared
setInterval(() => {...}, 1000);  // ❌ never cleared
const id = setInterval(...); clearInterval(id);  // ✅

// 4. Cache without eviction
cache.set(key, value);  // ❌ grows without limit
//   use LRU: new LRU({ max: 1000 });
```

## Async debugging

```typescript
// Race conditions
// ❌ WRONG: assumes order
let data;
fetchA().then(a => { data = a; });
fetchB().then(b => { console.log(data, b); });  // data may be undefined

// ✅ RIGHT: use Promise.all or await
const [a, b] = await Promise.all([fetchA(), fetchB()]);

// Async stack traces
node --async-stack-traces app.js  # (default in modern Node)

// Named async functions for better stack
async function loginUser(email) {  // ✓ clear name
  // ...
}
const loginUser = async (email) => {  // ✗ anonymous in stack
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

## Resources

- [Debug It! (Paul Butcher)](https://pragprog.com/titles/pdbg/debug-it/)
- [Node debugging guide](https://nodejs.org/en/docs/guides/debugging-getting-started/)
- [Chrome DevTools docs](https://developer.chrome.com/docs/devtools/)
- Related skill: `systematic-debugging` (workspace)
- Related skill: `prod-deploy-verification` (pre-deploy checks)