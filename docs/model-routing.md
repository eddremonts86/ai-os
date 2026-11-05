# Model Routing & Platform Support Matrix

> Draft reference derived from `outputs/2026-07-12-ai-os-full-audit.md` (multi-source,
> read-only audit dated 2026-07-12). Not eye-balled defaults: the audit explicitly says
> routing must be eval-driven, so treat the tiers below as a starting hypothesis, not
> a final answer. See "How to validate this" at the bottom before wiring it into
> automation.

## Why tier by role instead of picking one default model

A single global default model optimizes for none of: instruction recall under a
large always-on prompt, approval-boundary judgment for destructive actions, skill
selection accuracy, multi-agent delegation, MCP tool-call correctness, or cost at
scale. AI-OS's own bridge already asks every CLI to route work by role (research vs.
implementation vs. verification) — the model choice should follow the same logic.

## Capability tiers

| Tier | Role                                           | Candidate models                                       | Why                                                                                                                                                                                                     |
| ---- | ---------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1    | Architecture, security review, final synthesis | Claude Opus-class, GPT frontier-class                  | Highest reasoning depth for decisions that are expensive to get wrong (this remediation's Task 1/P0 findings are exactly this tier)                                                                     |
| 2    | Primary implementation and code review         | Claude Sonnet-class, GPT mid-tier                      | Best quality/cost/latency balance for the bulk of day-to-day coding work                                                                                                                                |
| 3    | Exploration, indexing, routine subagents       | Claude Haiku-class, GPT small-tier, Gemini Flash-class | Cheap, fast, parallelizable — used for `dispatching-parallel-agents` fan-out (research, file search, mechanical edits)                                                                                  |
| 4    | Long local/vendor-flexible runs                | MiniMax-class (or other locally-hosted models)         | For long-running loops (`ai-os-loop`) where cost matters more than peak reasoning; pair with explicit verifier roles and a small fixed prompt so the smaller model isn't asked to hold too much context |

### Tier 4 implementation: `llm/`

Two layers, both documented in full in `llm/README.md`:

- **`llm/router.mjs`** — a provider-swappable OpenAI-compatible *chat* client (no
  tool use), reused by any app via the `AI_LLM_PROVIDER` / `AI_OLLAMA_NATIVE_*` /
  `MINIMAX_*` variables in `dev-env/env-config/.env.example` section 6. `local`
  (default) hits the native Ollama daemon AI-OS already runs for memory-stack
  embeddings (`ai.os.ollama`, launchd, `:11500`), now also carrying the local chat
  model named in `llm/router.mjs` alongside `nomic-embed-text`. `minimax` is the explicit opt-in cloud fallback.
  CLI: `ai-os llm ask "<prompt>" [--provider local|minimax]`, `ai-os llm test`.
- **`opencode`** (npm `opencode-ai`) — an actual tool-use harness (read/write files,
  run shell) on top of the same local model, persisted as a password-protected
  service (`llm/launchd/install-opencode.sh` on macOS, `llm/systemd/` on Linux —
  see `llm/README.md`'s security model before pointing a session at a real project).
  Verified working end to end across 3 repeated identical trials: the tool-calling
  protocol, permission gate, and file I/O all work with `qwen3:8b-q4_K_M` (the local model at the time) — every
  trial emitted a real tool call (checked via full session/message history, not
  just terminal output). 2/3 called `read` with the right path and answered
  correctly; 1/3 called `glob` instead of `read` for a literal path, found 0
  matches, and gave up instead of retrying. The real, confirmed gap is *precise*
  tool use (wrong tool or wrong argument, ~1 in 3 in this small sample) — not a
  failure to act, which an earlier, flawed raw-API-only probe (missing the `tools`
  schema the CLI actually sends) had wrongly suggested. See `llm/README.md` for
  the full repro and the correction; it directly informs the risk assessment
  below.

**What this does not fix — tested directly, not just assumed:** the plans pipeline's
(now in the plansmith repo: `apps/data/tools/plans-pipeline`) 35-40M-token runs are still
Task-tool / `delegate_task` subagent dispatch, per plansmith's `apps/data/progress/LOOP_INSTRUCTIONS.md`. Whether a local model could actually do
the enrichment work was tried for real (2026-09-19): one draft plan, isolated
sandbox, 4 model/flag combinations (`qwen3:8b`, `llama3-groq-tool-use:8b`,
`qwen3:14b`, `qwen3:14b --pure`). **All four failed to complete the task** — each
fix solved the specific derailment the previous attempt hit and the model found a
new way to avoid finishing. See `llm/README.md`'s "Plan-enrichment trial" section
for the full matrix and the three untried levers (disable the skill tool, decompose
the task, try a coder-specialized model) that could still change this. Until one of
those closes the loop, don't route real enrichment through a local model — the
cheap triage sub-task (meta-vs-buildable classification, dedup) remains a
reasonable local-model bet; the multi-file rewrite is what failed four times.

**Do not hardcode specific model version strings here.** Model names and
capabilities change fast enough that a pinned table goes stale within weeks; point
at your CLI's own model-selection docs for the current lineup in each tier, and only
promote a model to "default" after it clears the eval suite below.

## Platform / CLI capability matrix

Verify each row against the CLI's own current docs before relying on it — this
matrix reflects what the 2026-07-12 audit found, and several of these CLIs are
moving fast (e.g. the Gemini CLI → Antigravity CLI transition).

| Capability                                      | Claude Code                         | Codex                                                  | Antigravity                                                                                                                                                                                                                                           | Gemini CLI (legacy)                                              | Hermes                                                                                                      | MiniMax             |
| ----------------------------------------------- | ----------------------------------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ------------------- |
| Native parallel subagents                       | ✅                                  | ✅                                                     | ✅                                                                                                                                                                                                                                                    | ✅ (legacy)                                                      | ✅ (`delegate_task`)                                                                                        | Varies by build     |
| Global skill directory (this repo's convention) | `~/.claude/skills`                  | `~/.codex/skills` (also has native `~/.agents/skills`) | `~/.agents/skills` (workspace-scoped path, populated for compatibility with several other agents) + `~/.gemini/config/skills` (Antigravity's real GLOBAL path per https://antigravity.google/docs/skills, confirmed 2026-07-12; optional/best-effort) | `~/.gemini/skills`                                               | reads `~/.agents/skills` via `skills.external_dirs` (config.yaml) — no symlinked copy, confirmed 2026-07-12 | `~/.minimax/skills` |
| Native MCP config from AI-OS                    | ❌ (not generated by this repo yet) | ❌                                                     | ❌                                                                                                                                                                                                                                                    | ❌                                                               | ✅ (`~/.hermes/config.yaml`)                                                                                | ❌                  |
| Status per Google's 2026-06-18 announcement     | n/a                                 | n/a                                                    | Current consumer target                                                                                                                                                                                                                               | Being sunset for consumer use; enterprise/API-key access remains | n/a                                                                                                         | n/a                 |

Two gaps this matrix makes explicit (tracked in `specs/current_spec.md` "Remaining
work"):

1. MCP config is generated only for Hermes. Claude Code, Codex, Antigravity, and
   MiniMax don't get native MCP wiring from this repo yet (P1-6 in the audit).
2. Antigravity's real global-skill path was confirmed against its own docs
   (2026-07-12) and is now also deployed to (`ai-config/manifest.yaml`'s
   `antigravity-global` client, `~/.gemini/config/skills`), additive to the
   existing `~/.agents/skills` deployment. Marked optional/best-effort since
   it has not been field-verified against a real Antigravity install.

## How to validate this before trusting it

The audit's own recommendation, not yet built:

1. Add a small AI-OS benchmark suite covering: instruction recall, approval-boundary
   judgment, skill selection, project routing, multi-agent delegation, MCP
   invocation, memory retrieval, and verification honesty (i.e., does the model
   correctly report partial failure instead of claiming success).
2. Run every candidate model per tier through the suite.
3. Compare quality, latency, token use, and cost — pick defaults from the results,
   not from vendor marketing tiers.
4. Re-run the suite whenever a CLI ships a new default model or this repo changes
   the always-on bridge content (prompt size changes routing sensitivity).

Until that suite exists, treat the tiers above as a documented hypothesis: good
enough to route work deliberately today, not good enough to hardcode into
automation that silently switches models.
