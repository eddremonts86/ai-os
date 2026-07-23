---
name: orchestrator-minion
description: "Use when a task is large enough to be worth decomposing into independent sub-tasks, AND the sub-tasks can run with fresh context (no shared state, no mid-flight coordination). Applies the Orchestrator-Workers / Supervisor-Worker pattern (Anthropic, 2024): one strong model plans, delegates, and synthesizes; many lightweight minions execute atomic tasks in isolated context and return one artifact each. Covers CLI-agnostic planning, fan-out budget, the 7 invariants, verification gates, and the menu of when to reach for this pattern vs. a single agent, agent teams, or a dynamic workflow. Not for trivial tasks (overhead exceeds benefit), tightly coupled tasks (workers would step on each other), or work that needs cross-worker messaging (use agent teams instead)."
argument-hint: "<task description>"
user-invocable: true
allowed-tools:
  - Bash(node {{scripts_path}}/*)
  - Read
  - Glob
  - Grep
license: Apache 2.0
---

# Orchestrator-Minion Pattern

A global pattern for AI-OS. One model (the **orchestrator**) plans a task into N independent
sub-tasks, dispatches them to N **minion** sub-agents in fresh isolated contexts, verifies the
artifacts, and synthesizes the final answer. CLI-agnostic: works on Claude Code, Codex, Gemini,
or any other harness that supports isolated sub-agents or session spawning.

> The Spanish term *Orquestador-Minion* (popularized by Gentleman Programming, gentle-ai, 2026)
> names the same pattern Anthropic documents as **Orchestrator-Workers** in
> *Building Effective Agents* (December 2024).

## When to use this skill

Load it (or its references) when **all four** are true:

1. The task is large enough that a single model would either run out of context, lose the plot,
   or produce shallow work because the prompt is doing too many jobs.
2. The decomposition is **data-dependent** (you cannot enumerate the sub-tasks until you see the
   input) — *not* a fixed pipeline. If the pipeline is fixed, sequential beats orchestrator.
3. The sub-tasks are **genuinely independent**: no shared mutable state, no mid-flight
   coordination between workers, no need for one worker to wait for another.
4. Verification is **possible and cheap**: you can write a concrete check for whether a worker's
   output is good enough (a test, a JSON schema, a render check, a deterministic diff).

If any of those is false, **do not** use this pattern. See `reference/decision-menu.md` for the
full menu of when to reach for what (single agent / sequential / parallel / orchestrator / agent
teams / dynamic workflow).

## The 7 invariants

These are not guidelines. They are the contract. Violating any of them makes the pattern
degenerate into a worse version of a single agent.

1. **Orchestrator plans and synthesizes. Minions execute.** No minion ever spawns another minion.
   No minion dispatches work. No minion "coordinates" with peers. All coordination is a single
   point: the orchestrator.
2. **Each minion starts with clean context.** The orchestrator constructs the prompt the minion
   receives; the minion does **not** inherit the orchestrator's conversation history. If a
   minion needs context, the orchestrator writes it into the minion's prompt verbatim.
3. **Each minion returns one artifact.** A markdown report, a JSON file, a code patch, a test
   result, a rendered screenshot — something concrete, inspectable, and rerunnable. A minion
   never returns prose like "here is what I found"; it returns a structured finding the
   orchestrator can compose.
4. **Workers do not talk to each other.** Not via shared memory, not via message bus, not via
   "just a quick check with worker B". If two workers need to reconcile, the orchestrator
   reconciles them in a synthesis pass.
5. **There is a verification gate between dispatch and synthesis.** For each minion output
   (or batch of outputs) the orchestrator (or a dedicated verifier sub-agent) checks the
   artifact against concrete acceptance criteria before promoting it to the final answer. A
   "looks good" check is not a gate.
6. **Fan-out is capped and explicit.** Before spawning, the orchestrator commits to a hard
   cap on the number of workers and a per-worker token / time budget. The cap is logged in
   the plan. The orchestrator never spawns unbounded workers, even if the task "feels" like it
   wants more.
7. **The plan is a first-class artifact.** Before any worker is spawned, the orchestrator
   writes the plan to a file (or the plan lives in the conversation as a structured block)
   that names every worker, its scope, its expected artifact, and its acceptance criteria.
   The plan is the unit of review. Without a plan, there is no pattern — only vibes.

A pattern that breaks an invariant is not a degraded version of the pattern; it is a single
agent with extra steps and worse cost.

## The orchestrator's role

When this skill is loaded and the task matches, the orchestrator's job is to:

### Phase 0 — Decide if the pattern applies

Run the four conditions from "When to use this skill" against the incoming task. If any fails,
say so explicitly and fall back to the right primitive (see `reference/decision-menu.md`).
Do not silently downgrade.

### Phase 1 — Plan

Produce a **plan** (see `reference/plan-schema.md`) with:

- A 1–3 sentence statement of the goal the workers are collectively serving.
- A list of N **workers**, each with: id, role, scope (one atomic thing), expected artifact
  format, acceptance criteria (the verifier can check), tools/permissions needed.
- A **budget**: max workers, max tokens per worker, max wall-clock, model tier per worker
  (the orchestrator model is *not* required for every worker — a cheaper model can execute
  while the orchestrator model plans and synthesizes).
- A **fan-out shape**: are workers independent (all in parallel), staged (parallel then merge),
  or a dependency graph? Default is independent parallel.
- A **verification strategy**: which outputs are gated, and by what.

Write the plan to `.mavis/plans/<task-id>.json` (or the closest equivalent the host CLI
supports) so it is a first-class artifact. If the host does not have a plans directory,
print the plan as a structured block in the orchestrator's reply.

Run the plan through `node {{scripts_path}}/plan.mjs validate --plan <path>` to catch
schema errors before spawning anything.

### Phase 2 — Spawn

For each worker, dispatch a sub-agent whose system prompt is built from:

- The minion contract (see `reference/worker-contract.md`).
- The role description from the plan.
- The atomic scope (one sentence: the worker does exactly this, not "and also...").
- The acceptance criteria, copied verbatim.
- The artifact format, copied verbatim.
- Nothing else. No orchestrator history. No "by the way, here is the whole project context".
  If the worker needs project context, the orchestrator pastes the relevant slice.

Spawning primitive is **CLI-dependent** (see `reference/mavis-binding.md` for the
mavis-runtime path and per-CLI notes). The skill does not hard-code one primitive; the
`allowed-tools` of the host harness decide. The contract is the same regardless.

Track each worker as `(id, status, started_at, finished_at, artifact_path, tokens_used)`.
Append to a `run.json` log so the orchestrator can recover after a pause.

### Phase 3 — Verify

For each returned artifact:

- Run the acceptance criteria mechanically if possible (`node`, `curl`, `jq`, `git diff`,
  render, lint, type-check). Promote the artifact to "accepted" only if it passes.
- For subjective criteria, dispatch a verifier sub-agent with a tight prompt:
  "Answer YES or NO with a one-sentence reason. Is this artifact good enough to ship
  for the stated scope? Reject if it has [list concrete failure modes]." Do not let the
  verifier be a vibes-checker.
- If a worker fails verification, **redispatch the same scope with the verifier's
  specific feedback** (not "try again") and increment a retry counter. Hard cap retries
  at 2 per worker to bound cost. After 2 retries, mark the worker as failed and let the
  orchestrator decide (decompose, escalate to user, or partial-synthesize).

### Phase 4 — Synthesize

Combine the accepted artifacts into the final answer. The synthesizer is the orchestrator
(or a dedicated sub-agent with a different prompt). Rules:

- Lead with the answer the user actually asked for. Do not lead with a meta-summary of
  "what the minions did".
- Quote or attach artifacts inline; do not summarize them out of existence.
- If any worker failed and was not retried, say so explicitly and name the gap.
- If the plan had to be revised mid-flight (e.g., a worker came back with "actually
  the task is different"), the revision goes in the run log, not silently.

### Phase 5 — Log and clean

Append a one-line summary per run to `.mavis/plans/index.jsonl` (id, goal, worker count,
success/failure, tokens, duration). Plans older than 30 days are trimmable; the user can
opt in or out via the mavis runtime.

## What this skill explicitly does NOT do

- **It does not dispatch a multi-agent run by itself.** It defines the contract; the host
  harness decides whether dispatching is via Claude Code's `Task` tool, Codex agents,
  Gemini's equivalents, the mavis `team` runtime (if/when it ships), or a shell-out
  to another CLI.
- **It does not replace `dispatching-parallel-agents`.** That skill covers the
  "should I run these in parallel at all?" question. This one covers the full
  plan → spawn → verify → synthesize cycle when the answer to that question is "yes,
  and there's a real decomposition to do".
- **It does not replace `subagent-driven-development`.** That one is about executing an
  already-written plan via sub-agents. This one is about *producing* the plan and
  *verifying* the work.
- **It does not invent its own dispatch primitive.** Spawning is a host-harness concern.
  The skill is portable across harnesses precisely because it does not couple to one.

## Quick start

1. **Plan** — produce the JSON plan, validate it: `node {{scripts_path}}/plan.mjs validate --plan .mavis/plans/<id>.json`.
   For CI or production runs, pass `--strict` to promote the actionable warnings
   (file-exists-only acceptance, multi-verb scope, and-also scope, scopes over
   50 words, budget over the Anthropic dynamic-workflow caps, missing isolation
   field) to errors. Default validation stays permissive so one-off plans aren't
   painful.
2. **Spawn** — dispatch each worker with the minion contract + scope + acceptance criteria.
3. **Verify** — run the gate per artifact.
4. **Synthesize** — combine accepted artifacts.
5. **Log** — append the run summary to `.mavis/plans/index.jsonl`.

For a worked example of a plan, see `reference/examples/code-audit-plan.md`. For the
anti-patterns and known failure modes, see `reference/pitfalls.md`. For the menu of
when to reach for this vs. other patterns, see `reference/decision-menu.md`.
