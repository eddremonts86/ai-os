# Debugging Toolbox

Concrete techniques for Phases 1-3 of systematic debugging. None of these replace the Iron Law: gather evidence first, fix the root cause second.

## Find the introducing commit (git bisect)

When "it used to work", bisect instead of reading diffs:

```bash
git bisect start
git bisect bad HEAD
git bisect good <last-known-good-commit>
git bisect run pnpm test path/to/repro.test.ts   # exit 0 = good, non-zero = bad
git bisect reset
```

The repro test must fail only for the bug, or bisect will chase unrelated failures.

## Symptom → first hypothesis

Starting points for Phase 3, not conclusions. Each still needs a falsifiable test.

| Symptom | Likely hypothesis |
|---|---|
| Works in dev, fails in prod | Env vars, CORS, HTTPS, build config |
| Works only sometimes | Race condition, async ordering, stale cache |
| Crash after N requests | Memory leak, connection pool exhaustion |
| UI shows stale data | Missing cache invalidation, optimistic update without rollback |
| Auth fails randomly | Token expiry, clock skew, session storage |
| API slow | N+1 query, missing index, large payload |
| Local passes, CI fails | Stale cache, runtime version diff, missing env (see `ci-cd-pipeline`) |

## Writing the hypothesis down

```markdown
**I believe:** the bug is caused by X.
**Because:** I observed Y when Z.
**Prediction:** if true, changing W stops the failure.
**Result:** verified | refuted
```

If the "because" line is empty, you are guessing. Go back to Phase 1.

## 5 Whys

Keep asking why past the first technical cause until you reach a decision or a missing guard:

```
500 on POST /api/users
→ insert fails with unique-constraint error
→ two concurrent requests create the same email
→ app-level "exists?" check is not atomic
→ root cause: uniqueness enforced in app code, not as a DB constraint + handled conflict
```

## Instrumentation

- **Structured logs** with a correlation ID per request, so scattered lines can be joined. Never log secrets; redact `password`, `token`, `apiKey` keys.
- **Node debugger:** `node --inspect-brk app.js`, then `chrome://inspect`.
- **Python:** `breakpoint()`.
- **Syscalls (Linux):** `strace -f -e trace=open,read,write <cmd>`.
- **Network:** `curl -v <url>`; DevTools Network tab for headers, timing, response bodies.

## Performance and memory

- **CPU:** `node --cpu-prof app.js` (open the `.cpuprofile` in DevTools), or `node --prof` + `node --prof-process`.
- **Memory leaks:** take two heap snapshots (DevTools → Memory) under the same load and compare retained objects. Usual suspects: listeners never removed, intervals never cleared, unbounded caches (use an LRU), closures holding large objects.

## Async

- Code that reads a value set by another unawaited promise is a race. Use `await` or `Promise.all`, not ordering assumptions.
- Prefer named async functions; anonymous arrows make async stack traces unreadable.

## Post-mortem (production incidents)

After the fix ships, record: summary and impact, UTC timeline (report → ack → repro → root cause → fix → verified), root cause (the *why*), detection (how it surfaced), and action items: regression test, alert for the same condition, runbook update.
