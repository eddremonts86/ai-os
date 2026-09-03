# Current Spec: Ponytail global install + AI-native SDLC (intent.md) adoption

## Metadata

- **Date:** 2026-09-02
- **Status:** approved / in-progress
- **Blocks:** 5 (each <= 30 min)
- **Author:** Edd
- **Source:** user request 2026-09-02 — install Ponytail for every AI interaction/CLI on this machine and make it portable (mac/win/linux); summarize https://www.youtube.com/watch?v=LoMOPj-lO8U (Rob Shocks, AI-native SDLC) and integrate into daily workflow. Research-only phase completed 2026-09-02, `go` authorized implementation.
- **Prior spec:** `archive/2026-09-02-frozen-community-submissions.md` (frozen, blocks 10-11 remain, not discarded)

## Objective

Every agent/CLI on this machine (and any future mac/linux/win clone via `setup/install-*`) runs with Ponytail's lazy-senior-dev ruleset at `full` by default, and the AI-native SDLC loop (`intent.md → spec.md → plan.md → diff/tests → review → maintain`) from the video/playbook is operational as `intent/` + template + skill in this repo.

## Context

Ponytail (`DietrichGebert/ponytail`, 121k stars, v4.9.0, MIT) is not an LLM gateway — it is a 7-rung minimality ladder (`Does it need to exist? → reuse → stdlib → native platform → installed dep → one line → minimum that works`) plus 6 skills (`/ponytail`, `/ponytail-review`, `/ponytail-audit`, `/ponytail-debt`, `/ponytail-gain`, `/ponytail-help`) and lifecycle hooks that keep safety (validation/security/a11y/data-loss) off the chopping block. Benchmarks on real Claude Code sessions: -54% LOC, -22% tokens, -20% cost, -27% time, 100% safe vs 95% for a raw YAGNI prompt. Supports 20+ hosts (Claude Code, Codex, Copilot CLI, OpenCode, Gemini/Antigravity, Hermes, Cursor/Windsurf/Cline/Kiro/Qoder, etc.) via plugins or by copying `AGENTS.md`/rules files.

AI-OS already distributes flat skills via symlinks from `ai-config/skills` to `~/.claude/skills`, `~/.codex/skills`, `~/.gemini/skills`, `~/.agents/skills` (`setup/install-mac.sh:428`, `ai-config/manifest.yaml:23`) and renders bridge adapters from `ai-config/templates/global-bridge.md.tmpl:9`. The portable pattern is therefore: add a ponytail step to both installers, pin the version, write `~/.config/ponytail/config.json` (analogous to `~/.ai-os/env.sh:321` — per-machine, untracked), and teach `verify.sh` to check it.

The video (Rob Shocks, Sep 1 2026, chapters 0:00 paradigm shift / 1:08 intent.md / 4:37 spec governance / 6:52 build-test loop / 13:46 autonomous maintenance) is a walkthrough of Anthropic's AI-native SDLC Playbook (claude.com/blog/the-ai-native-sdlc-playbook, Aug 21 2026, Louis Claxton). Core idea: code is no longer the bottleneck — plan/review/deploy are — so each stage must commit an artifact the next stage reads (`intent.md`, `spec.md`, `plan.md`, diff+tests, review findings, incident → new `intent.md`). This maps 1:1 to AI-OS's Karpathy loop (`specs/current_spec.md`, `CLAUDE.md`, `using-superpowers`, `verifiers/`). Missing piece is the `intent/` home before `specs/current_spec.md`.

## Acceptance criteria

- [ ] `intent/` exists with `intent-template.md` and `README.md`; `ai-config/skills/intent-to-spec/` skill exists and is propagated to all CLIs via `manifest.yaml` + installers.
- [ ] Ponytail is installed and active at `full` for every detected CLI on this Mac (Claude Code, Codex, Hermes, Gemini/Antigravity, Cursor/Windsurf compat via AGENTS.md). `~/.config/ponytail/config.json` contains `{"defaultMode":"full"}` and `node` lifecycle hooks are trusted where required.
- [ ] `setup/install-mac.sh` and `setup/install-windows.ps1` each contain an idempotent ponytail step; `setup/verify.sh` and `setup/verify-windows.ps1` report ponytail status; `ai-config/manifest.yaml` documents the ponytail component. A fresh clone can reproduce the state with `bash setup/install-mac.sh` / `pwsh -File setup/install-windows.ps1` on mac/win/linux.
- [ ] `bash setup/verify.sh` passes (no new required failures). Ponytail can be toggled per-session with `/ponytail lite|full|ultra|off` and subagent scope via `PONYTAIL_SUBAGENT_MATCHER`.
- [ ] One real `intent/2026-09-02-example-ponytail-adoption.md` → `specs/current_spec.md` → `intent-to-spec` dry run is demonstrated; `intent-to-spec` produces `spec.md` with flagged concerns and respects the `AGENTS.md` ponytail rules.
- [ ] Previous spec (`archive/2026-09-02-frozen-community-submissions.md`) remains restorable; this spec archives to `archive/2026-09-02-ponytail-intent.md` on completion with 1-line summary.

## Non-goals (explicit)

- No forced `ultra` default; `full` is the safe default, `ultra` is opt-in per repo/session.
- No vendoring of the entire ponytail repo as flat skills under `ai-config/skills/ponytail/` — ponytail ships its own 6 skills and `AGENTS.md`; we distribute via its native plugin/rules mechanism, not by re-skinning.
- No migration of existing `specs/current_spec.md` history beyond the freeze; community-submissions spec remains frozen, not rewritten.
- No changes to production pipelines/Coolify deploys in this spec.
- No commitment to auto-trigger `intent.md` → `spec.md` via cron/MCP in this slice; manual `/intent-to-spec` is sufficient, automation is follow-up.

## Plan (blocks)

### Block 1: intent/ home + template + intent-to-spec skill (estimated: 25 min)

- [ ] Create `intent/README.md` (AI-native SDLC mapping, lifecycle, git is the audit trail, linkage vs source-of-truth note).
- [ ] Create `intent/intent-template.md` (Problem / Proposed outcome / Affected users+systems / Constraints / Open questions / Author+timestamp, per playbook example).
- [ ] Create `intent/2026-09-02-example-ponytail-adoption.md` as the first real intent for this very work (dogfooding).
- [ ] Create `ai-config/skills/intent-to-spec/SKILL.md` (reads attached `intent.md`, applies `ai-config/skills/*` and project `CLAUDE.md`, produces `spec.md` with flagged concerns, ready for `specs/current_spec.md`).
- [ ] Register skill in `ai-config/manifest.yaml` or via existing skill propagation (no new manifest entry needed — flat skill auto-propagates); ensure `setup/install-mac.sh:428` loop will pick it up.
- [ ] **Verify:** `ls intent/`, `cat intent/intent-template.md`, skill appears in `~/.claude/skills/intent-to-spec/SKILL.md` after next install step; dry-run: simulate `intent-to-spec` on the example intent.

### Block 2: ponytail installer integration — portable (estimated: 30 min)

- [ ] Pin version constant: `PONYTAIL_VERSION="4.9.0"` in both installers; `PONYTAIL_DEFAULT_MODE="full"` (env-overridable).
- [ ] `setup/install-mac.sh`: new section `7e. Ponytail` after `7d` (idempotent): for each detected CLI, run marketplace add + plugin install (`claude plugin add ponytail@ponytail`, `codex plugin add ponytail@ponytail`, `hermes plugins install DietrichGebert/ponytail --enable`, `gemini extensions install`, `agy plugin install`), fallback: copy ponytail's `AGENTS.md`/rules to `~/.agents/AGENTS.md` append, `~/.codex/AGENTS.md`, `.cursor/rules/ponytail.md` template, `~/.config/ponytail/config.json` with `{"defaultMode":"full"}`. Handle `node` on non-interactive PATH note (README requirement). Use `PRESERVE_OR_REPLACE` guards.
- [ ] `setup/install-windows.ps1`: mirror `5f. Ponytail` with pwsh equivalents, `%APPDATA%\ponytail\config.json`, junction fallback already in `New-DirLink:55`.
- [ ] `ai-config/manifest.yaml`: add `components.ponytail: {required:false, version: 4.9.0, description: "lazy senior dev ruleset — portable plugin/rules"}` documentation block (non-breaking).
- [ ] `setup/generate-mcp-config.py` / `setup/sync-ide-mcp-servers.py` — no change needed (ponytail is not MCP).
- [ ] **Verify:** `bash -n setup/install-mac.sh`, `pwsh -NoProfile -Command "Get-Help"` syntax check, `yq '.components.ponytail' ai-config/manifest.yaml`.

### Block 3: ponytail verify + bridge wiring (estimated: 20 min)

- [ ] `setup/verify.sh`: new section `3c. Ponytail` (optional checks via `opt_ok/opt_miss`): presence of `~/.config/ponytail/config.json`, plugin list checks (`claude plugin list`, `codex plugin list`, `hermes plugins list`), and `~/.agents/AGENTS.md` contains ponytail marker or `AGENTS.md` fallback.
- [ ] `setup/verify-windows.ps1`: mirror section.
- [ ] `ai-config/templates/global-bridge.md.tmpl`: no hard ponytail injection (ponytail already injects per-turn) — add one-line note referencing ponytail as active layer, or keep bridge untouched per decision to avoid coupling. Document choice in spec.
- [ ] **Verify:** `bash setup/verify.sh 2>&1 | grep -A5 -i ponytail` shows section.

### Block 4: live install on this Mac (estimated: 25 min)

- [ ] Run `setup/install-mac.sh` ponytail step (or targeted commands): install ponytail plugin for each detected CLI, create `~/.config/ponytail/config.json`, ensure `PONYTAIL_DEFAULT_MODE` in `~/.ai-os/env.sh` (append if missing, analogous to `setup/install-mac.sh:321`).
- [ ] For Codex: open `/hooks` trust step is manual — document and verify `codex plugin list` shows ponytail, start new thread to confirm injection.
- [ ] Smoke: new Claude session shows startup mode text; `/ponytail` reports `full`; `/ponytail-review` on a test diff returns a delete-list.
- [ ] **Verify:** `cat ~/.config/ponytail/config.json`, `ls -la ~/.claude/skills/ | grep ponytail` or `claude plugin list`, `hermes plugins list`, `cat ~/.ai-os/env.sh | grep PONYTAIL`.

### Block 5: docs, archive, demo (estimated: 20 min)

- [ ] `docs/repo-layout.md` — add `intent/` to tree with one-line description.
- [ ] `intent/README.md` — cross-link to `specs/current_spec.md` frozen history.
- [ ] `archive/2026-09-02-ponytail-intent.md` — 1-line summary on completion, reset `specs/current_spec.md` to template.
- [ ] Dogfood demo: run `intent-to-spec` on `intent/2026-09-02-example-ponytail-adoption.md` to produce `spec-draft.md`, show flagged concerns.
- [ ] **Verify:** `bash setup/verify.sh` full pass, `intent-to-spec` dry run artifact exists.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Codex `/hooks` trust is manual, install appears done but not active | high | med | Document manual step, verify with `codex plugin list` + new thread injection check; fallback `~/.codex/AGENTS.md` ensures rules still load |
| Ponytail `ultra` over-minimizes needed abstraction | med | med | Default `full`, `ultra` only per-repo/session; README warns "you don't need the 120-line cache class" — respect explicit override |
| Marketplace install fails offline / `node` not on non-interactive PATH | med | low | Idempotent `|| true`, fallback to `AGENTS.md` rules copy; verify.sh reports `opt_miss` not `req_fail` |
| `intent/` and `specs/current_spec.md` dual-home confusion | med | low | `intent/` is the intake, `specs/current_spec.md` remains the single active spec pointer; README maps lifecycle explicitly |
| Nightly `verify.sh` break on new ponytail section | low | low | New checks are optional (`opt_*`), not required — never gate exit code |

## Verification (end-to-end)

- [ ] `bash setup/verify.sh` → no new `REQ_FAIL`, ponytail section reports `OPT_OK` for detected CLIs
- [ ] `/ponytail` in a fresh Claude session reports `full`; toggle `lite/full/ultra/off` works; `PONYTAIL_SUBAGENT_MATCHER` filters subagents
- [ ] `ls intent/ && cat intent/intent-template.md` and skill `~/.claude/skills/intent-to-spec/SKILL.md` present
- [ ] `intent-to-spec` dry run on the example intent produces a `spec.md` with flagged concerns and respects ponytail ladder
- [ ] Fresh-clone portability: docs describe `git clone + bash setup/install-mac.sh` (mac/linux) and `pwsh -File setup/install-windows.ps1` (win) reproducing the same state

## References

- `DietrichGebert/ponytail` README + `opencode.json:1`, `gemini-extension.json:1`, `AGENTS.md:1` (plugin/rules mapping)
- `claude.com/blog/the-ai-native-sdlc-playbook` (Aug 21 2026, Louis Claxton) — AI-native SDLC, 6 stages, `intent.md` proto-spec
- `https://www.youtube.com/watch?v=LoMOPj-lO8U` — Rob Shocks walkthrough (chapters 0:00/1:08/4:37/6:52/13:46)
- `setup/install-mac.sh:428`, `setup/install-windows.ps1:55`, `ai-config/manifest.yaml:23`, `setup/verify.sh:1`, `ai-config/templates/global-bridge.md.tmpl:9` — existing distribution mechanism
- `specs/spec_template.md:1` — template; `archive/2026-09-02-frozen-community-submissions.md` — frozen prior spec

## Notes

- Prior spec frozen with status Phase A done; Blocks 10-11 remain valid and restorable. This spec does not cancel it — it is archived as a file.
- Bridge file `ai-config/templates/global-bridge.md.tmpl` intentionally not hardwired to ponytail — ponytail injects per-turn itself; coupling them would duplicate source of truth.
