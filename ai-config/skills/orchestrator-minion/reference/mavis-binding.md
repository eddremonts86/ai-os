# Mavis Runtime Binding

How the orchestrator-minion pattern actually spawns workers when the host harness is
the mavis runtime (or a CLI built on top of it). This file is the bridge between the
abstract contract in `SKILL.md` and the concrete `mavis` tool surface available to
agents.

If you are using a different harness (Claude Code's `Task` tool, Codex `.agents/`, etc.),
read the appropriate section at the bottom of this file. The contract is the same;
the primitives differ.

## Why this file exists

The pattern's contract (see `SKILL.md` and `reference/worker-contract.md`) is
harness-agnostic. The *spawn* step, however, is not. The mavis runtime is the
"global" runtime for AI-OS — every agent, every session, every skill ultimately goes
through it — so this is the canonical binding. CLIs that wrap mavis (Claude Code,
Codex, Gemini) inherit the same primitives.

## The mavis tool surface (what the orchestrator actually has)

The orchestrator interacts with the runtime through the native `mavis` tool, which
exposes three groups of operations:

- **`mavis agent`** — agent roster: list, get, create, update, delete. Each agent has
  a `system_prompt`, a `persona`, an optional `default_workspace_dir`, and a list of
  visible skills.
- **`mavis session`** — session lifecycle: list, get, update (rotate, archive),
  delete, messages. Note: there is no `session create` directly — sessions are created
  implicitly when a worker is dispatched (see below).
- **`mavis cron`** — scheduled tasks: list, get, create, self (self-reminders), once
  (one-shot), update, delete, trigger. The `cron once` primitive is the cheapest way
  to spawn a one-shot worker without blocking the orchestrator.

There is no `mavis team` group yet. Today, the orchestrator-minion pattern is realized
by composing the three existing groups. The future `mavis team` runtime is a planned
unification (see "Roadmap" at the bottom).

## The spawn-and-collect loop

In mavis terms, an orchestrator-minion run looks like this:

```text
Phase 1: Plan
  - Write plan to .mavis/plans/<id>.json
  - Run: node {{scripts_path}}/plan.mjs validate --plan .mavis/plans/<id>.json

Phase 2: Spawn workers (in parallel, as much as possible)
  For each worker w in plan.workers:
    - mavis agent get --agent_name <role-template-for-w>     # if reusing a template
      OR
      mavis agent create --name <id> --system_prompt <contract+scope> \
                         --persona <short> --description <one-line>
    - mavis cron once --after 0s --prompt <full-prompt-for-w> \
                        --session { mode: "new" } --delete_after_run true
      (this fires off the worker as a one-shot, non-blocking scheduled task;
       when it finishes, mavis deletes the cron entry)

Phase 3: Verify
  - For each worker output, read the artifact at plan.workers[i].artifact.path
  - Run the mechanical checks (node, jq, etc.) per plan.workers[i].acceptance
  - If a verifier sub-agent is needed:
      mavis agent create --name "verifier-<id>" --system_prompt <verifier-contract>
      mavis cron once --prompt <verifier-prompt-pointing-at-artifact> \
                      --session { mode: "new" } --delete_after_run true

Phase 4: Synthesize
  - The orchestrator itself reads all accepted artifacts and writes the final answer
  - Append run summary to .mavis/plans/index.jsonl

Phase 5: Clean
  - The cron entries are auto-deleted (delete_after_run: true)
  - Verifier agents can be deleted with mavis agent delete if they were one-off
  - The plan and run log stay (for audit); trim policy is per-user
```

## What this binding gives you for free

- **Isolation**: each worker is a fresh session, fresh context, fresh model invocation.
  No cross-worker state.
- **Observability**: every worker run is a `session` with a `messages` history you can
  read back. Every dispatch is a `cron once` entry you can inspect. The plan is a JSON
  file in `.mavis/plans/`.
- **Cost caps**: budget fields in the plan are explicit; the orchestrator commits to
  them and the run log records the actual spend. Future mavis versions may enforce
  caps in the runtime.
- **Resumability**: if the orchestrator pauses (e.g., for a user prompt), the
  in-flight cron workers continue; when the orchestrator returns, it can read the
  artifacts that landed while it was away.

## What this binding does NOT do for you (yet)

- **No hard cap enforcement at the runtime layer.** The orchestrator must honor its
  own budget. A future `mavis team` runtime would enforce fan-out caps and per-worker
  token budgets. Until then, the budget is a contract, not a wall.
- **No automatic verification dispatch.** The orchestrator must explicitly schedule
  verifier sub-agents. A future `mavis team verify` would run the plan's
  `acceptance` array mechanically.
- **No run log writer.** The orchestrator must append to `.mavis/plans/index.jsonl`.
  A future `mavis team log` would handle this.

## Per-CLI quick notes

### Claude Code

Claude Code has the `Task` tool built in. The orchestrator can use it directly to spawn
sub-agents within the current session. This is faster than the mavis round-trip (no
separate session, no cron entry) but it shares the orchestrator's permission mode and
session, which is a tradeoff against the strict isolation invariant. Use `Task` when
the worker is short and you want low overhead; use `mavis cron once` when isolation
or durability matters.

### Codex / OpenCode

These harnesses use `.agents/skills/` to discover agents. The orchestrator can:
- Write a worker spec to `.agents/skills/<role>/SKILL.md` and invoke via the agent
  registry, OR
- Use the mavis `cron once` path (works from any harness that can shell out).

### Gemini

Gemini CLI has limited multi-agent primitives. The mavis path is the cleanest — use
`cron once` to spawn workers, read artifacts at synthesis. No `Task`-style equivalent
in Gemini today.

### Other harnesses (OpenCode, Cursor, etc.)

All of them go through mavis when the AI-OS setup script installs the bridge. The
canonical binding is the one above. CLIs that have their own primitives (Claude
Code's `Task`, etc.) are optimizations on top of the canonical binding.

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

Until then, the orchestrator composes `agent` + `cron once` + plan files + `index.jsonl`
as described above. The pattern is fully usable; it just costs the orchestrator a bit
of bookkeeping. When `mavis team` lands, the binding becomes one command and the
orchestrator stops writing the loop by hand.
