# Team Recipe: Running an Orchestrator-Minion Plan via the mavis Runtime

This document is the bridge between the abstract `orchestrator-minion` contract
and the actual mavis tool surface. It is the recipe the orchestrator (a model
session) follows when executing a plan end-to-end. The `scripts/team.mjs` script
generates the run plan (a JSON of `mavis({...})` tool calls) for any plan;
this doc explains what each call does and why.

## Why a recipe (and not a CLI)

A first-class `mavis team plan "<task>"` command would be ideal — single
command, plan → spawn → wait → verify → synthesize → log. The mavis core
is closed-source and ships in the desktop app bundle, so the
`mavis team` group is not (yet) part of the runtime. Until it is, the
orchestrator composes the existing `mavis` tool groups by hand — and the
`team.mjs` script turns the plan into the exact sequence of calls so the
orchestrator does not have to think about which primitive to call.

This is a deliberate trade-off. The mavis tool surface is rich enough to
implement the pattern; the only missing piece is the "wait for workers"
polling loop. The recipe documents the polling workaround explicitly so
the orchestrator knows when to retry, when to wait, and when to give up.

## The five phases

Every orchestrator-minion run goes through these five phases. The run plan
emits literal tool calls for phases 1-2 (plan, spawn), a polling loop for
phase 3 (poll), and literal calls for phases 4-5 (verify, synthesize) when
those flags are set.

### Phase 1 — Plan (literal)

The plan is the input. The orchestrator should have already run
`node plan.mjs validate --plan <plan.json> [--strict]` before generating
the run plan. The run plan emits a single note step that says "plan
loaded" so the orchestrator has a clear anchor.

### Phase 2 — Spawn (literal)

For each worker in `plan.workers`, the run plan emits two `mavis` calls:

1. **`mavis({ command: "agent get", args: { agent_name: <role> } })`** —
   check whether the worker agent template exists. If the orchestrator
   gets a "not found" response, it should follow up with
   `mavis({ command: "agent create", ... })` to create a one-off agent
   template (with the worker contract as the system prompt).
2. **`mavis({ command: "cron once", args: { ... } })`** — dispatch the
   worker as a one-shot scheduled task. The `prompt` is the full worker
   prompt built by `team.mjs`: the contract + the worker's specific scope
   + artifact format + acceptance criteria. `delete_after_run: true`
   cleans up the cron entry after firing.

The `cron once` step returns a `cron_id`. The orchestrator keeps a
`(worker_id, cron_id)` mapping for tracking.

### Phase 3 — Poll (dynamic loop)

This is the central gap in the runtime: there is no
`mavis team wait <run-id>` primitive. The orchestrator must poll to know
when workers finish.

The loop:

1. **`mavis({ command: "cron list", args: { ... } })`** — see all recent
   cron tasks. Identify the `cron_id`s from Phase 2.
2. For each pending worker, **`mavis({ command: "cron get", args: { cron_id } })`**
   to see its current status (`pending` / `running` / `ok` / `failed`).
3. When a worker is `ok` or `failed`, find the session it produced. The
   session id is not currently returned by `cron get` (this is a
   known gap); the orchestrator must look it up via
   `mavis({ command: "session list", ... })` and match by recency and
   agent name.
4. **`mavis({ command: "session messages", args: { session_id } })`** —
   read the worker's final reply. Per the worker contract, it contains
   one of:
   - `{"status": "ok", "artifact": "<path>", "summary": "..."}`
   - `{"status": "failed", "reason": "..."}`
   - `{"status": "blocked", "context_needed": [...]}`
   - `{"status": "ambiguous", "questions": [...]}`
5. Read the artifact file at `artifact.path` (via the orchestrator's
   `Read` tool). Run the mechanical acceptance checks (`file-exists`,
   `json-schema`, `render-check`, `min/max-count`) directly.
6. Repeat until every worker is in a terminal state.

The polling is dynamic. The run plan emits a single meta-step
(`phase: "poll"`, `tool: "loop"`) that documents the loop shape; the
orchestrator implements the actual loop.

### Phase 4 — Verify (literal, with `--include-verify`)

For each worker that has a `verifier-subagent` acceptance, the run plan
emits a `cron once` dispatch for a verifier sub-agent. The verifier's
prompt includes the artifact path and the explicit `rejects_if` list.
The verifier returns `{"verdict": "yes"|"no", "reasons": [...]}`.

If the verifier says "no", the orchestrator redispatches the original
worker with the verifier's specific feedback (not "try again") and
increments a retry counter. The cap is `budget.max_retries_per_worker`.

### Phase 5 — Synthesize and log (literal, with `--include-synth`)

The orchestrator itself is the synthesizer. The run plan emits two
final steps:

1. A `note` describing what to do: read all accepted artifacts, lead
   the answer with the user-facing response, quote evidence, name
   any gaps from failed workers, record mid-flight revisions in the
   run log.
2. A `Bash` call to append a one-line summary to
   `.mavis/plans/index.jsonl`:
   `{"plan_id": "...", "goal": "...", "worker_count": N, "started_at": "..."}`.

## The known gaps in the runtime

The recipe works around three gaps. They are documented honestly so the
orchestrator knows what to expect.

1. **No "wait for completion" primitive.** The orchestrator polls.
   Worst case: a worker finishes *after* a poll, and the next poll catches
   it. There is no race condition; there is a latency cost.
2. **No session-id returned from `cron once`.** The orchestrator must
   look up the new session via `session list` and match by recency +
   agent name. The match is heuristic; a more reliable primitive would
   return the session id directly.
3. **No run log writer.** The orchestrator must append to
   `.mavis/plans/index.jsonl` by hand (Phase 5 step 2 above).

A first-class `mavis team` runtime would close all three.

## Worked example: end-to-end use

```bash
# 1. write a plan (or use the template)
node ~/.claude/skills/orchestrator-minion/scripts/plan.mjs template --out /tmp/plan.json

# 2. fill in the placeholders, then validate
$EDITOR /tmp/plan.json
node ~/.claude/skills/orchestrator-minion/scripts/plan.mjs validate --plan /tmp/plan.json --strict

# 3. generate the run plan
node ~/.claude/skills/orchestrator-minion/scripts/team.mjs \
  /tmp/plan.json --include-verify --include-synth --out /tmp/run-plan.json

# 4. (in a model session) read /tmp/run-plan.json and execute each step
#    via the mavis tool. The orchestrator iterates through tool_calls
#    in step order; phases 1-2 are static, phase 3 is a loop,
#    phases 4-5 are static.
```

The orchestrator (a model session) reads the run plan and walks
`tool_calls` in order. For each step:
- If `tool: "mavis"` — call `mavis(args)` with the literal args.
- If `tool: "Read"` — call the `Read` tool with `args.path`.
- If `tool: "Bash"` — call the `Bash` tool with `args.command`.
- If `tool: "note"` — no action; this is a documentation step for the
  orchestrator's own bookkeeping.
- If `tool: "loop"` — implement the loop per the `description`.

The result is the same as a first-class `mavis team plan` command:
the pattern runs end-to-end, with the orchestrator doing the dispatch
and synthesis instead of a dedicated runtime.

## When this becomes unnecessary

When the mavis core ships a `team` group, this recipe is the spec for
the new runtime. The `team.mjs` script becomes a thin wrapper (or is
removed entirely; the CLI's `mavis team plan` reads the plan and
executes the recipe internally). Until then, the recipe is the
authoritative description of what the runtime should do.
