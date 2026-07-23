# Mavis Runtime Binding

How the orchestrator-minion pattern actually spawns workers when the host harness is
the mavis runtime. This file is the bridge between the abstract contract in
`SKILL.md` and the concrete `mavis` tool surface available to agents.

> **Important**: the mavis tool is a **model tool**, not a shell CLI. Earlier versions
> of this document described it as `mavis agent list`, which is misleading — there is
> no shell binary at this surface. The orchestrator invokes the tool by emitting a
> tool call; the runtime then executes it. This file uses the correct form.

## What this binding actually does (and doesn't)

The pattern's **contract** is harness-agnostic (see `SKILL.md` and
`reference/worker-contract.md`). The **spawn** step, however, is not — it depends on
what the host harness exposes.

What the mavis runtime **gives you** today:

- agent configs (CRUD on agent templates) — for the orchestrator to register worker
  agents
- cron one-shot tasks (fire-and-forget scheduled prompts) — for the orchestrator to
  dispatch workers
- session list/get/messages — for the orchestrator to read what a worker produced

What the mavis runtime **does NOT give you** today:

- a `session create` action (sessions are created implicitly when a worker is
  dispatched, but there is no documented API for the orchestrator to capture the
  session id, wait for completion, or know when to read)
- a "team" group that would unify the spawn-and-collect loop into a single command
  (this is on the roadmap — see below)

In practice, the orchestrator composes the primitives that exist. Where the
composition is awkward, this file documents the awkwardness rather than papering
over it. The future `mavis team` runtime is meant to remove the awkwardness.

## The mavis tool surface (what the orchestrator actually has)

The orchestrator interacts with the runtime through the **native `mavis` tool** —
a model-side tool the orchestrator calls as part of its reply, not a shell command.
The tool exposes three groups of operations:

- **`agent`** — agent roster: `list`, `get`, `create`, `update`, `delete`, `help`.
  Each agent has a `system_prompt`, a `persona`, an optional
  `default_workspace_dir`, and a list of visible skills.
- **`session`** — session lifecycle: `list`, `get`, `update` (rotate, archive),
  `delete`, `messages`, `help`. There is no `session create` directly — sessions
  come into being when a worker is dispatched (see "The gap" below).
- **`cron`** — scheduled tasks: `list`, `get`, `create`, `self` (self-reminders),
  `once` (one-shot), `update`, `delete`, `trigger`, `help`. The `cron once`
  primitive is the cheapest way to spawn a one-shot worker without blocking the
  orchestrator.

There is no `team` group yet. Today, the orchestrator-minion pattern is realized by
composing the three existing groups. The future `mavis team` runtime is a planned
unification (see "Roadmap" at the bottom).

## The spawn-and-collect loop (in tool-call form)

In mavis terms, an orchestrator-minion run looks like this. The orchestrator emits
each block as a tool call; it does not type shell commands.

### Phase 1 — Plan (in the orchestrator's own context)

Write the plan to disk (the orchestrator uses its `Write` tool), then validate it
via the bash tool. The plan file is the unit of review.

```text
# the orchestrator writes the plan
Write("/tmp/orch-minion-demo/plan.json", <plan-json>)

# the orchestrator validates it
Bash("node <skill-base-dir>/scripts/plan.mjs validate --plan /tmp/orch-minion-demo/plan.json --strict")
```

If validation fails, fix and re-validate. Do not dispatch with a broken plan.

### Phase 2 — Spawn workers (one tool call per worker)

For each worker in `plan.workers`, the orchestrator emits:

```text
mavis({ command: "cron once", args: {
  agent_name: "<worker-role-template-or-name>",
  after: "0s",
  prompt: <the full worker prompt — the contract, the scope, the acceptance>,
  session: { mode: "new" },
  delete_after_run: true
} })
```

Each call returns a `cron_id`. The orchestrator keeps the `(worker_id, cron_id)`
mapping for tracking. The `delete_after_run: true` flag tells the runtime to
remove the cron entry once it fires (no leftover schedule entries).

If the orchestrator wants the worker to use a *specific* agent template that
isn't yet registered, it must `mavis agent create` first. (In the future, the
team runtime will inline this.)

```text
mavis({ command: "agent create", args: {
  name: "verifier-<id>",
  system_prompt: <verifier contract>,
  persona: "strict verifier",
  description: "one-shot verifier for run <id>"
} })
```

### Phase 3 — Wait + read (the gap)

**This is the central gap in the current runtime.** The orchestrator has no
first-class way to "wait until all cron-once workers are done and then read their
outputs." It has to poll or sleep and then read.

Today, the working pattern is:

```text
# 1. sleep an empirical amount (the worst worker's expected duration)
#    (this is the part that makes the orchestrator hate the runtime)
Bash("sleep 60")  # or any heuristic

# 2. list recent sessions and find the ones for this run
sessions = mavis({ command: "session list", args: { ... } })

# 3. for each worker session, read its messages
mavis({ command: "session messages", args: { session_id: "<id>" } })
```

Reading the session messages gives you the worker's final reply — which, per the
worker contract, contains the `{"status": "ok", "artifact": "<path>", "summary": ...}`
structured block. The orchestrator parses that block, then reads the artifact
file at `artifact.path` (via `Read`).

This is the manual "I'm polling the run" loop. It works, but it is not the
single-command experience the future `mavis team` runtime promises.

### Phase 4 — Verify

For each returned artifact:

- Run the mechanical checks (e.g., `Bash("node .../scripts/render.mjs <path>")`).
  Promote the artifact to "accepted" only if it passes.
- For subjective criteria, dispatch a verifier sub-agent (another `mavis cron once`
  with a tighter prompt) and read its result the same way as a worker.

If a worker fails verification, redispatch the same scope with the verifier's
specific feedback (not "try again") and increment a retry counter. Hard-cap
retries at the `budget.max_retries_per_worker` value.

### Phase 5 — Synthesize

The orchestrator itself reads all accepted artifacts and writes the final answer.
Rules:

- Lead with the answer the user actually asked for. Do not lead with a meta-
  summary of "what the minions did".
- Quote or attach artifacts inline; do not summarize them out of existence.
- If any worker failed and was not retried, say so explicitly and name the gap.
- If the plan had to be revised mid-flight, the revision goes in the run log, not
  silently.

### Phase 6 — Log and clean

Append a one-line summary per run to `.mavis/plans/index.jsonl`
(id, goal, worker count, success/failure, tokens, duration). Plans older than 30
days are trimmable; the user can opt in or out via the mavis runtime.

The `delete_after_run: true` flag on `cron once` calls already cleans up the
cron entries. The orchestrator can `mavis agent delete` any one-off verifier
agents that it created.

## What this binding gives you for free

- **Isolation**: each worker is a fresh session, fresh context, fresh model
  invocation. No cross-worker state.
- **Observability**: every worker run is a `session` with a `messages` history
  you can read back. Every dispatch is a `cron once` entry you can inspect.
  The plan is a JSON file.
- **Cost caps**: budget fields in the plan are explicit; the orchestrator
  commits to them. The run log records the actual spend.

## What this binding does NOT do for you (yet)

- **No hard cap enforcement at the runtime layer.** The orchestrator must honor
  its own budget. A future `mavis team` runtime would enforce fan-out caps
  and per-worker token budgets.
- **No "wait for completion" primitive.** The orchestrator must poll, sleep,
  or guess when workers are done. A future `mavis team` runtime would provide
  a `mavis team status <run-id>` that reports ready/running/failed counts.
- **No automatic verification dispatch.** The orchestrator must explicitly
  schedule verifier sub-agents.
- **No run log writer.** The orchestrator must append to
  `.mavis/plans/index.jsonl`.

## The gap (P0-3 in the v0.1 audit)

The current runtime has no `mavis team` command. The orchestrator composes
`agent` + `cron once` + polling + `session messages` as documented above. This
is functional but:

- The orchestrator has to guess the wait time (a `sleep 60` heuristic).
- The orchestrator has to match cron_ids to worker_ids manually.
- A worker that finishes *before* the sleep is wasted latency.
- A worker that finishes *after* the sleep is missed (the orchestrator sees an
  empty result).

A first-class team runtime would close these gaps. Until then, the
orchestrator's bookkeeping in the run log is the only place that
`(worker_id, cron_id, session_id, status)` mappings live.

## Per-CLI quick notes

### Claude Code

Claude Code has the `Task` tool built in. The orchestrator can use it directly
to spawn sub-agents within the current session. This is faster than the mavis
round-trip (no separate session, no cron entry) but it shares the orchestrator's
permission mode and session, which is a tradeoff against the strict isolation
invariant. Use `Task` when the worker is short and you want low overhead; use
`mavis cron once` when isolation or durability matters.

### Codex / OpenCode

These harnesses use `.agents/skills/` to discover agents. The orchestrator can:
- Write a worker spec to `.agents/skills/<role>/SKILL.md` and invoke via the
  agent registry, OR
- Use the mavis `cron once` path (works from any harness that can shell out).

### Gemini

Gemini CLI has limited multi-agent primitives. The mavis path is the cleanest —
use `cron once` to spawn workers, read artifacts at synthesis. No `Task`-style
equivalent in Gemini today.

### Other harnesses (OpenCode, Cursor, etc.)

When the AI-OS setup script installs the bridge, mavis is the canonical runtime
and the recommended spawn primitive for cross-CLI portability. CLIs also have
native skill/agent mechanisms that can be used directly (Codex's `.agents/`,
OpenCode's `.opencode/`, etc.) — the orchestrator's plan and validation work
the same way regardless of which primitive you pick. The mavis binding is the
default; CLI-native primitives are an optimization, not a replacement.

## Roadmap (planned, not shipped)

A future `mavis team` runtime is on the AI-OS roadmap. When it ships, the
orchestrator-minion pattern will get a first-class binding:

```text
mavis team plan "<task>"                  # plan + spawn + verify + synthesize
mavis team plan "<task>" --budget N       # cap fan-out
mavis team plan "<task>" --model-tier haiku-4-5
mavis team status <run-id>                # inspect in-flight runs
mavis team cancel <run-id>                # stop a runaway
mavis team log <run-id>                   # read the run log
mavis team replay <run-id>                # rerun with the same plan
```

Until then, the orchestrator composes `agent` + `cron once` + plan files +
`index.jsonl` as described above. The pattern is fully usable; it just costs
the orchestrator a bit of bookkeeping. When `mavis team` lands, the binding
becomes one command and the orchestrator stops writing the loop by hand.
