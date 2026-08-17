---
name: ci-cd-pipeline
description: Use this skill when building, auditing or optimising a CI/CD pipeline — GitHub Actions workflows, a local pre-push gate, deploy automation. Triggers when a pipeline is slow, when local passes and CI fails, when a green check turns out to mean nothing, or when setting one up for a new app.
license: MIT
metadata:
  hermes:
    tags: [ci, cd, github-actions, testing, deploy, e2e]
    related_skills: []
---

# CI/CD pipeline

A pipeline is worth exactly what its green means. Most of the work is making that green honest, and only then making it fast.

## When to Use

- Setting up CI/CD for a new app
- "It passes locally but fails in CI" (or the reverse)
- A pipeline that takes long enough that people avoid pushing
- Auditing an existing pipeline for checks that cannot fail
- Deploy automation that reports success

## When NOT to Use

- A one-off script or a repo with no deploy
- Tuning a single test's runtime — that is a testing problem, not a pipeline one

---

## The one principle

**A local gate is only evidence while it runs the same program as CI.** Everything below follows from it.

Two failures make it stop being true, and both are silent:

1. **The environment differs.** The local runner inherits `.env`; the CI job inherits only its own `env:` block. Apps refuse *politely* when a credential is missing — `503 ai_unconfigured`, `400 invalid_input`, `CRON_SECRET must be set` — so the specs assert against the refusal instead of the feature. They pass locally, fail in CI, and read as flake.

2. **The list of checks differs.** A step CI runs and the local gate does not is a step the local green cannot speak for.

Build a gate for each, run them first because they are cheap, and make every exemption carry a written reason:

- **Environment fidelity**: every key `.env` sets non-empty, that the source reads, must appear in the CI job's env or be listed as a deliberate absence. Compare **values against the app's declared defaults**, not just presence — *absent is not the same as off*. And read the schema's conditional requirements: turning one flag on often makes three more variables mandatory, and the job then dies at import before a single assertion.
- **Step parity**: every command the workflows run must exist in the local runner or be declared runner plumbing. Scan **every job in every workflow** — a check escapes a narrower scope simply by moving, and then the gate reports parity on something it no longer sees.

> An exemption list is a decision log. It forces the claim to be written down, and it cannot verify it. Expect to be wrong: on the pipeline this came from, four exemptions were written from assumption and each had to be corrected against the code.

---

## Structure

**Trigger CI on the deploy branch only; guard every other branch locally.** A private repo bills every runner minute, and running the same commit two or three times on its way to master buys nothing. What replaces it is a `pre-push` hook running the full gate on any branch — wired through `core.hooksPath` by a `prepare` script so a fresh clone inherits it. This trade is only safe with the two parity gates above; without them it is a hole.

**Split by concern, then shard the slowest.** One serial job means a lint error is discovered after everything expensive has already run. Shard the dominant suite across jobs with `fail-fast: false` — a run that reports only the first failing shard costs another full cycle to find the second.

**Sharding costs a guarantee. Buy it back on a schedule.** A strictly serial suite catches specs leaking into each other's `process.env`; shard it and two specs in different shards can no longer collide, so they can no longer be caught colliding. Keep `--workers=1` *within* each shard, and run the whole suite unsharded nightly. The property is not traded away — it arrives a few hours after the deploy.

**Non-blocking means a separate workflow, not `continue-on-error`.** Deploy triggers usually fire on *workflow run completed*, and a run completes only when every job does — so `continue-on-error` keeps a slow check out of the conclusion and not out of the critical path. Worse, in its new home the flag reports green on a check that failed. Move the job; drop the flag.

**Every job gets `timeout-minutes`.** The default is six hours.

---

## A check that cannot fail is not a check

The most expensive bugs in a pipeline are the checks that are quietly not running.

- A job whose every step is conditional reports **success in four seconds** with nothing executed. Gate the whole *job* on the condition so it shows as **skipped** — grey, with the reason one click away. `secrets` is not available in `jobs.<id>.if`, so a tiny job reads it into an output and the real job gates on that.
- A step that "checks whether X is configured" must test the same variable it names *and* the same one the steps are gated on. Two names for one secret is enough to make the guard announce a certification it is skipping.
- Ask of any long-quiet check: *when did this last actually run?* On the pipeline this came from, three checks in a row failed the first time they were reached, each for a reason unrelated to what they test — scaffolding rots while nobody is looking.

---

## Verify the deploy

An orchestrator reporting `finished` means the container started. That is not the claim you want.

Poll the app's health endpoint until it answers, then request a real page. A process that answers a constant and nothing else is exactly the failure mode worth catching: on this pipeline a deploy reported finished against a Postgres image without `pgvector`, `CREATE EXTENSION vector` rolled back every migration in its transaction, tables vanished, sign-in answered 500 — and the pipeline stayed green.

---

## Optimising: measure, then cut

Take per-step timings from a real run before changing anything. The intuition is usually wrong.

Numbers from one mature pipeline (2-core runner, ~1000 e2e tests), as a sense of scale:

| | |
|---|---|
| e2e suite | 47 min — **71 %** of the run |
| unit suite | 10 min |
| everything else | ~9 min |
| `pnpm build` | 22 s |
| container pulls | 23 s |
| browser install | 21 s |
| DB migrate + fixture | 2 s |

**Cache what pays.** Measured: eslint `--cache` took lint from **28 s to 2 s**; `tsc --incremental` to 3 s. Key such caches on the lockfile *with a rotating suffix* — a cache that never refreshes is how a checker starts reporting on code that is no longer there.

**Measured and rejected**, so nobody repeats them:

- *Building once and passing the artifact between jobs*: the `needs:` edge makes every shard wait on a job whose own setup costs ~40 s, trading ~56 s of billed time for ~40 s of wall clock. Building inline is cheaper.
- *Caching container images*: the pull is ~23 s and the cache entry ~600 MB. Not obviously faster than the registry.
- *A browserless project for API specs*: **Playwright's browser fixtures are lazy.** Measured against a baseline of zero, a spec using only `request` peaked at zero browser processes. There is no browser to remove.

**Sharding raises billed minutes while lowering wall clock.** Four shards repeat the job's setup four times. State the trade in the commit: on this pipeline, 67 → 16 min wall, 67 → 83 min billed.

---

## Serve the build, not the dev server

An e2e harness that runs a dev server tests a bundle no user receives, and pays to compile routes on demand — which shows up as mysterious timeouts and screenshots full of skeletons.

Serving a production build is faster *and* more honest. Measured on one batch: dev 188 s, preview 144 s, both green.

**The blocker to expect:** a client that bakes its own origin at build time. `import.meta.env.VITE_*` is statically replaced, so a client calling *its own backend* carries a fixed host for the life of the build — one build then cannot be served from two origins, and every request becomes cross-origin the moment the port changes. A same-origin client should ask for `window.location.origin`, keeping the build-time value only for the server-rendering pass. Fixing that is what unblocks serving a build at all, and it removes the reason the test config had to override the app URL in the first place.

Watch the arithmetic when comparing: a first attempt read 189 s vs 188 s and looked like no gain — that number was twelve failing specs burning their retries, not the server mode.

---

## Checklist for a new pipeline

1. CI triggers on the deploy branch only; a `pre-push` hook runs the full gate on every branch.
2. Environment-fidelity gate, comparing values against declared defaults and reading conditional requirements.
3. Step-parity gate, scanning every job in every checking workflow.
4. `timeout-minutes` on every job.
5. Fast static checks in their own job; slowest suite sharded with `fail-fast: false`; `--workers=1` inside each shard.
6. Nightly unsharded serial run of the sharded suite.
7. Advisory checks in a separate workflow, allowed to fail, never `continue-on-error`.
8. Optional jobs gated at the job level so they show as skipped, never as a four-second success.
9. Deploy verifies the app answers — health endpoint *and* a real page.
10. `paths-ignore` for documentation.
11. Cache lockfile-keyed browsers, eslint and tsc fingerprints; measure anything else before adding it.
