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

## Reusable workflow for OS-agnostic test jobs

When two or more GitHub Actions workflows share >80 % of their steps (typical: a Linux job and a macOS job that both run the same DRY_RUN installer + the same lint/test/--check sequence), extract a single `reusable-*.yml` driven by `workflow_call` inputs instead of duplicating the body. The wrappers stay as `name:` + trigger set + a thin `uses:` block; the shared body lives in one place and every future fix propagates.

**Pattern that works** (verified in `ai-os/.github/workflows/`):

```yaml
# reusable-test.yml
on:
  workflow_call:
    inputs:
      os:           { required: true, type: string }   # 'linux' | 'macos'
      install_node: { required: false, type: string, default: "false" }
jobs:
  test:
    runs-on: ${{ inputs.os == 'macos' && 'macos-latest' || 'ubuntu-latest' }}
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: "3.11" }
      - if: ${{ inputs.install_node == 'true' }}
        uses: actions/setup-node@v4
        with: { node-version: "22" }
      - if: ${{ inputs.os == 'linux' }}
        run: sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 && sudo chmod +x /usr/local/bin/yq
      - if: ${{ inputs.os == 'macos' }}
        run: brew install yq
      # ... rest is identical across OSes
```

```yaml
# test-linux.yml  (90 -> 24 lines)
jobs:
  test:
    uses: ./.github/workflows/reusable-test.yml
    with: { os: linux, install_node: "false" }
```

**When NOT to extract.** A reusable workflow with PowerShell-style steps does not help a bash/Linux caller and vice versa — if every step diverges between callers (typical: Linux vs Windows where yq install path, `[ -d ]` vs `Test-Path`, and `pip` vs `pip3` all differ in *every* step), the maintenance burden shifts rather than shrinks. Keep per-OS workflows and add a one-line comment naming the OS condition.

**Quote any step name containing `:`** — GitHub Actions tolerates them in the `name:` field, but the YAML parser rejects unquoted colons in flow-mapping values. Default to `"Step name (with: detail)"` from the start; do not retrofit.

**Verify before commit.** Always run three checks locally before the PR: `python3 -c "import yaml; yaml.safe_load(open(p))"` on every workflow you touched, `shellcheck -S warning` on any shell scripts the workflow calls, and the existing unit-test step the workflow gates (`python3 -m unittest discover -s <test-dir>`). A green CI run is not evidence that the workflow parses — actions runners fail the job with a confusing syntax error instead of a parse error.

---

## Shellcheck warning triage

`shellcheck -S warning` is the right lint level for CI scripts. Not every warning is a bug; defaulting to "fix them all" wastes time on UI strings, and defaulting to "ignore them all" loses the real catches. The split, applied in `ai-os/setup/*.sh`:

| Code | Class | Action | Example |
| --- | --- | --- | --- |
| SC2227 | Real bug (redirect scope wrong) | Fix | `find ... 2>/dev/null -exec basename {} \; \| sort` — the `2>/dev/null` only silences `find`'s stderr, not `basename`'s. Move to end of pipeline. |
| SC2086 | Real bug (unquoted expansions) | Fix | `$var` in `[ ... ]` — split on IFS, breaks on spaces. Always quote. |
| SC2155 | Style / minor | Fix (cheap) | `local foo=$(cmd)` masks `cmd`'s exit; split the declaration from the assignment. |
| SC2034 | Cosmetic (unused var) | Leave | `read -r a b c` columns often flow into another function; shellcheck is per-function. |
| SC2088 | UI noise | Leave | `"~/.hermes/config.yaml ..."` inside an `echo` to a user — tilde is literal in quotes, but the message is for a human. The "fix" (`"$HOME/hermes..."`) is uglier and conveys less. |

Rule of thumb: a warning is a bug if the script's *output* or *exit code* changes. A warning is UI noise if only the *appearance* of the lint log changes.

---

## Drift remediation: regenerate from the source-of-truth script

When `verify.sh` (or any post-install check) reports that a previously-passing state has drifted — a config file lost a required block, a dotfile symlink vanished, a permissions check failed — the right move is almost always to re-invoke the script that `install*.sh` itself called to produce that state, not to hand-edit the config. Hand-fixing one symptom while the install pipeline is still the canonical source guarantees the drift returns next time the installer runs.

Concrete case from `ai-os/`: `~/.hermes/config.yaml` reported `external_dirs: []` after a manual editor session. The block is produced by step 9 of `setup/install-mac.sh`, which delegates to `setup/generate-mcp-config.py ai-config/mcp <dest> <agents_dir>`. Re-running just that generator restored `verify.sh` from 18/19 → 19/19 required pass, with no need to re-run the whole installer. Always identify the producing script first; it has the right flags, the right backups (`*.pre-aios.bak`), and the right idempotency.

**Pitfall:** don't substitute a full `DRY_RUN=1 bash setup/install-mac.sh` as a smoke test inside an automated maintenance loop. The script reaches `generate-mcp-config.py` which can trigger interactive auth checks or hang on first-run probes — timed out after ~90 s in one AI-OS cron run. Verify the unit-test slice (`python3 -m unittest discover -s setup/tests`) instead; that exercises the same code path without touching the network.

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
