# Plan Schema

The plan is the unit of review for an orchestrator-minion run. A plan is a single JSON object
that an orchestrator writes before any worker is spawned. It is consumed by the verifier, the
run log, and any future replay or audit.

This file defines the **canonical schema**. The plan is also the input to
`node {{scripts_path}}/plan.mjs validate` (see `scripts/plan.mjs`).

## Top-level shape

```json
{
  "id": "string",                  // unique, kebab-case
  "goal": "string",                // 1–3 sentences: the user-facing outcome
  "created_at": "iso-8601",        // when the orchestrator wrote the plan
  "orchestrator": { ... },         // who is running this
  "budget": { ... },                // hard caps
  "fan_out": "independent|staged|graph",
  "verification": "mechanical|subjective|both",
  "workers": [ { ... } ],           // 1..N workers
  "exit_criteria": "string",       // when is the whole run considered done
  "notes": "string?"               // optional, free-form
}
```

## Orchestrator block

```json
"orchestrator": {
  "model": "string",               // e.g. "opus-4-1", "sonnet-4", "haiku-4-5"
  "role": "plan+verify+synthesize|plan+synthesize|plan-only"
}
```

`role` clarifies what the orchestrator itself does. Most runs use `plan+verify+synthesize`.
Use `plan+synthesize` when a separate verifier sub-agent handles verification (recommended for
high-stakes runs). Use `plan-only` when synthesis is delegated to a different model (rare).

## Budget block (hard caps, not goals)

```json
"budget": {
  "max_workers": 8,                // hard cap; orchestrator commits to ≤ this
  "max_tokens_per_worker": 200000, // per-worker output budget
  "max_wallclock_minutes": 30,     // total run wall-clock
  "max_retries_per_worker": 2,     // per-worker retry cap on verification failure
  "model_tiers": {
    "default": "sonnet-4",         // default tier for workers
    "by_role": {                   // optional overrides per role
      "verifier": "opus-4-1",
      "executor": "haiku-4-5"
    }
  }
}
```

The orchestrator MUST set these and not exceed them. If a plan needs more workers than the cap
allows, decompose differently, escalate, or refuse the pattern — do not silently inflate the
cap.

## Fan-out shape

- `"independent"` — workers run in parallel, no inter-worker dependencies. Most common.
- `"staged"` — wave 1 runs in parallel, results merge, then wave 2 runs. Use when later
  workers genuinely need the output of earlier ones (e.g., wave 1 audits files, wave 2 fixes
  the ones flagged). Note: this is *not* the same as sequential pipeline (where the order
  is fixed in advance); staged means wave 2 cannot start until wave 1 finishes, but wave 2's
  scope is still data-dependent on wave 1.
- `"graph"` — full dependency graph. Rare. If you reach for this, you probably want a
  dynamic workflow script instead.

## Worker entry

```json
{
  "id": "w-1",                     // unique within plan
  "role": "string",                // human-readable, e.g. "frontend-auditor"
  "scope": "string",               // ONE atomic thing. not "audit and fix"
  "artifact": {
    "format": "markdown|json|patch|code|image|screenshot|test-result",
    "path": "string",              // where the worker writes the artifact
    "schema": "string?"            // optional: JSON schema or similar contract
  },
  "acceptance": [                  // list of concrete checks (verifier runs these)
    { "type": "string-eq", "field": "result", "value": "ok" },
    { "type": "json-schema", "path": ".mavis/schemas/audit-finding.schema.json" },
    { "type": "file-exists", "path": "<artifact.path>" },
    { "type": "regex", "field": "summary", "pattern": "^.{20,500}$" },
    { "type": "render-check", "command": "node scripts/render.mjs <path>" },
    { "type": "verifier-subagent", "prompt_ref": ".mavis/prompts/verifier.md" }
  ],
  "depends_on": ["w-0"],           // optional, only for staged/graph
  "model_tier": "sonnet-4",        // optional override of budget.model_tiers.default
  "tools": ["Read", "Bash(node *)"],  // optional tool allowlist
  "isolation": "fresh-context"     // always; reserved for future variants (e.g. git-worktree)
}
```

`acceptance` is the **heart of the plan**. A worker without acceptance criteria is not a
minion — it is a vibe check wearing a contract. The orchestrator MUST reject any plan where
a worker has zero or vacuous acceptance.

## Exit criteria

A single string that names the condition under which the run is considered done. Example:
"All 5 files audited AND 0 P0 findings OR all P0 findings redispatched and still failing."

Bad: "looks good". Good: see above.

## Minimal valid example

```json
{
  "id": "audit-2026-07-23-foo",
  "goal": "Audit the 4 foo service files for missing auth checks and report P0/P1/P2 findings.",
  "created_at": "2026-07-23T11:00:00Z",
  "orchestrator": { "model": "sonnet-4", "role": "plan+verify+synthesize" },
  "budget": {
    "max_workers": 4,
    "max_tokens_per_worker": 100000,
    "max_wallclock_minutes": 15,
    "max_retries_per_worker": 2,
    "model_tiers": { "default": "haiku-4-5" }
  },
  "fan_out": "independent",
  "verification": "both",
  "workers": [
    {
      "id": "w-1",
      "role": "audit-foo-handler",
      "scope": "Audit src/foo/handler.ts for missing auth checks; output a JSON finding list.",
      "artifact": {
        "format": "json",
        "path": ".mavis/plans/audit-2026-07-23-foo/w-1.findings.json",
        "schema": ".mavis/schemas/audit-finding.schema.json"
      },
      "acceptance": [
        { "type": "file-exists", "path": ".mavis/plans/audit-2026-07-23-foo/w-1.findings.json" },
        { "type": "json-schema", "path": ".mavis/schemas/audit-finding.schema.json" }
      ]
    }
  ],
  "exit_criteria": "All 4 worker files exist, validate against schema, and synthesize a P0/P1/P2 list."
}
```

## What the schema does NOT cover

- **The orchestrator's reasoning for the decomposition.** Capture that in `notes`. Plans are
  for execution, not for design journals.
- **Retry context.** When a worker is redispatched after a failure, the *plan* is the same;
  the *run log* records the retry with the verifier's feedback. Plans are immutable; runs
  are append-only.
- **Cross-run state.** A plan is single-run. If you want a reusable team definition, store it
  in a higher-level config (e.g. a project-level `teams/` directory) and instantiate as plans.
