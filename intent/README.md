# intent/ — AI-native SDLC intake

Version-controlled home for `intent.md` — the proto-spec that kicks off the loop.

```
intent.md  →  spec.md  →  plan.md  →  diff + tests  →  PR + review findings  →  incident  →  new intent.md
  (intent/)    (specs/)   (specs/)     (repo)           (github)                (prod)         (intent/)
```

- **Source:** Anthropic AI-native SDLC Playbook (Aug 21 2026, Louis Claxton) + Rob Shocks walkthrough `LoMOPj-lO8U` (chapters 0:00 paradigm shift / 1:08 intent discovery / 4:37 spec governance / 6:52 build-test loop / 13:46 autonomous maintenance).
- **What it is:** `intent.md` is human-readable and machine-actionable. The originator describes the problem in their own words; Claude brainstorms (scope, users, constraints, success) and writes the template. No formal language required.
- **Why git:** author + timestamp + full revision history are the audit trail. The product owner accepts (`merge`) or closes the intent; acceptance triggers `spec.md` via `ai-config/skills/intent-to-spec/`.
- **Single active spec rule:** `intent/` is the intake queue (many files, many ideas). `specs/current_spec.md` remains the single active pointer AI-OS executes against. Only one intent is promoted to `specs/current_spec.md` at a time.
- **Legacy coexistence:** if Jira/ServiceNow holds the record, declare one source of truth per artifact or at least link `record ID ↔ commit SHA` (playbook sidebar on legacy systems). For this repo, git is the source of truth.

## Lifecycle

1. Originator describes problem to Claude in own words (`intent-template.md`).
2. Brainstorm until concrete; ask Claude to write `intent/YYYY-MM-DD-<slug>.md`.
3. Originator corrects misunderstandings.
4. Commit to `intent/`; product owner reviews.
5. Accepted → `intent-to-spec` produces `spec.md` → promoted to `specs/current_spec.md` → plan mode → build → test → deploy → maintain. Breached control band in prod writes the next `intent.md`.

## Naming

`intent/YYYY-MM-DD-<slug>.md` — mirrors `archive/YYYY-MM-DD-<slug>.md`. Use `intent-template.md` as the template; never commit it as an intent itself.

## Governance

- Evidence is the committed `intent.md` (author, timestamp, history in git).
- Product owner approves scale-in; flagged concerns from `intent-to-spec` go to policy owners before engineering sees the spec.
- Metrics: leading — `git log intent/` time first conversation → `intent.md` commit (hours vs weeks); lagging — survival rate (intents accepted into spec), and `spec.md` churn after first `plan.md`.

## Communication & token layers

- **Code tokens:** `ponytail` (`full`, `~/.config/ponytail/config.json:1`) — ladder rung 2 encourages service extraction before new code; see `ai-config/skills/service-layer/SKILL.md:1`.
- **Prose tokens:** `caveman` (`ai-config/skills/caveman/SKILL.md:1`) — `/caveman lite|full|ultra`, complements ponytail (ponytail = code, caveman = prose, -75%).
- **Context window:** `strategic-compact` (`ai-config/skills/strategic-compact/SKILL.md:1`) — `PreToolUse` hook `~/.claude/scripts/hooks/suggest-compact.js` suggests `/compact` at phase boundaries; `/compact` after `intent-to-spec` and after plan keeps the window healthy. Wired by `setup/wire-compact-hook.mjs` (installer step 9d on mac, 7e on win), which symlinks the vendored suggester (`vendor/ecc/scripts/hooks/suggest-compact.js`) and merges the hook into `~/.claude/settings.json`. Two signals: context size read from the transcript (~160k on a 200k window, ~250k on 1M, re-arming every +60k) and, as a weak proxy, tool-call count (`COMPACT_THRESHOLD`, default 50, then every 25).
- **Visual proof (on-demand):** `@vercel/before-and-after` CLI (`pnpm add -g @vercel/before-and-after`, `before-and-after <before> <after> --markdown`) — not vendored (PolyForm Shield), use via `npx` for `plans-explorer` PRs. `vendor/shimeles/README.md:1` documents shimeles on-demand skills.

## Relation to prior spec

`archive/2026-09-02-frozen-community-submissions.md` was frozen when this home was introduced; its blocks 10-11 remain valid and restorable. Restoring means copying it back to `specs/current_spec.md` per `specs/spec_template.md`.
