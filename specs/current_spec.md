# Current Spec: Framework token/communication improvements (service-layer + evidence + compact)

## Metadata

- **Date:** 2026-09-02
- **Status:** approved / in-progress
- **Blocks:** 4 (each <= 30 min)
- **Author:** Edd
- **Source:** user request 2026-09-02 — install/configure everything from https://github.com/michaelshimeles/skills that improves framework without breaking it, plus token/communication optimizations identified in analysis.
- **Prior spec:** `archive/2026-09-02-ponytail-intent.md` (ponytail global + intent.md home, completed)

## Objective

Add the minimal set of shimeles skills that actually improve ai-os (service-layer) as first-class skills, wire the existing token-saving skills (caveman, strategic-compact, ponytail) for daily use, and make before-and-after/greploop available on-demand without polluting the global skill set, keeping `bash setup/verify.sh` green and `CLAUDE.md` bridge intact.

## Context

Analysis of `michaelshimeles/skills` (462 stars, 26 commits, 6 skills + AGENTS.md workflow isolate→build→prove→ship) vs ai-os (206 flat skills + ponytail):

- `new-feature` duplicates `using-git-worktrees` (14 superpowers required) — both create `git worktree -b agent/<task> origin/main` with scope check `gh pr list`. Reusing would fork the worktree convention and break `setup/install-mac.sh:7` propagation.
- `AGENTS.md` workflow (isolate/build/prove/ship) collides with `CLAUDE.md` master (Spec→Verifier→Environment, `using-superpowers` router, `intent/`→`spec`→`plan`). Overwriting `~/.agents/AGENTS.md -> ~/.ai-os/adapters/global-bridge.md` is load-bearing (`docs/repo-layout.md:69`).
- `code-structure` is the only net-new pattern: service-layer (actions own why/when, service owns how, composable blocks, explicit I/O). No ai-os skill covers it; useful in `apps/data/tools/*` where operational logic duplicates.
- `evidence-driven-testing` (recorder `scripts/evidence.py`, ffmpeg/libx264/ass, X11/Wayland `wf-recorder`, mac Screen Recording, `python3 scripts/evidence.py doctor`) is heavy and platform-fragile — headless alternative is Playwright, which `webapp-testing` already covers.
- `before-and-after` is `@vercel/before-and-after` (PolyForm Shield 1.0.0, not MIT) — upload defaults to 0x0.st (public). Useful for `plans-explorer` PRs but not as vendored MIT skill.
- `greploop`/`greploop-apps` require Greptile 5/5 + `gh` auth — ai-os has no Greptile; we have `code-review-and-quality`, `babysit-pr`.

Token/communication stack already present: `caveman` (-75% prose), `ponytail` (-54% LOC), `strategic-compact` (compact at phase boundaries), `context-budget`, `token-budget-advisor`. Gaps are wiring, not missing skills.

## Acceptance criteria

- [ ] `ai-config/skills/service-layer/SKILL.md` exists (adapted from shimeles `code-structure`, English, ai-os style) and is propagated to all CLIs; `bash setup/verify.sh` lists it under `Source of truth: 190 expected`.
- [ ] `~/.claude/settings.json` has `strategic-compact` hook (`PreToolUse` on `Edit|Write` → `node .../suggest-compact.js` with `COMPACT_THRESHOLD=50`) or documents that compaction is handled via `strategic-compact` skill without hook; no duplicate hooks.
- [ ] `caveman` is documented as the chat compression layer ( ponytail = code, caveman = prose ) in `intent/README.md` or `docs/repo-layout.md`; `ponytail` remains at `full`.
- [ ] `before-and-after` available via `npx @vercel/before-and-after` (or global `pnpm add -g @vercel/before-and-after`) — no vendored copy, no MIT violation, `which before-and-after` or `npx --yes --package=@vercel/before-and-after` works.
- [ ] `greploop` not installed globally; documented as on-demand `vendor/shimeles/greploop` reference with Greptile prerequisite, `verify.sh` does not require it.
- [ ] `bash setup/verify.sh` → `Required: 19 passed, 0 failed`; new optional checks for `service-layer` are `OPT_OK`; no `AGENTS.md` overwrite; `new-feature` not present as global skill.

## Non-goals (explicit)

- No global install of `new-feature` (duplicates `using-git-worktrees`).
- No overwrite of `AGENTS.md`/`CLAUDE.md` bridge with shimeles workflow.
- No vendoring of `before-and-after` (PolyForm Shield) or `evidence-driven-testing` recorder as global skill (ffmpeg+wf-recorder fragility).
- No auto-enable of `greploop` without Greptile on repo.
- No changes to production pipelines/Coolify in this slice.

## Plan (blocks)

### Block 1: service-layer skill (estimated: 15 min)

- [ ] Create `ai-config/skills/service-layer/SKILL.md` (English, frontmatter `name: service-layer`, description trigger-focused, adapted from shimeles `code-structure`: two-layer separation, composable blocks, explicit I/O, migration checklist 1→6, anti-patterns god/leaky/inconsistent/over-abstraction, example).
- [ ] Propagate via existing `setup/install-mac.sh:7` loop (no manifest change needed — flat skill auto-counted); verify `ls ~/.claude/skills/service-layer`.
- [ ] **Verify:** `grep -l service-layer ai-config/skills/service-layer/SKILL.md`, `bash setup/verify.sh 2>&1 | grep "Source of truth"` increments to 190.

### Block 2: wire token-saving hooks (estimated: 15 min)

- [ ] Inspect `~/.claude/settings.json` for `hooks.PreToolUse` — if `suggest-compact.js` missing, add it with `COMPACT_THRESHOLD=50` per `strategic-compact/SKILL.md:41`; ensure no duplicate.
- [ ] Document `caveman` vs `ponytail` split in `intent/README.md` (one line) or keep as skill description only; ensure `~/.ai-os/env.sh` still exports `PONYTAIL_DEFAULT_MODE=full`.
- [ ] **Verify:** `cat ~/.claude/settings.json | python3 -m json.tool | grep -A2 suggest-compact`, `cat ~/.config/ponytail/config.json`, `bash setup/verify.sh 2>&1 | grep -E "caveman|compact|ponytail"` shows present.

### Block 3: before-and-after on-demand + greploop reference (estimated: 15 min)

- [ ] `pnpm add -g @vercel/before-and-after` or verify `npx --yes --package=@vercel/before-and-after before-and-after --help` works; do not vendor `before-and-after/SKILL.md` globally (license). Add one-line reference to `docs/repo-layout.md` or `intent/README.md` for on-demand usage.
- [ ] Create `vendor/shimeles/README.md` referencing `greploop` upstream (`greptileai/skills`, MIT) and shimeles `evidence-driven-testing` as on-demand, not global; do not symlink to `~/.claude/skills`.
- [ ] **Verify:** `which before-and-after` or `npx @vercel/before-and-after --help`, `ls vendor/shimeles/`, `bash setup/verify.sh` still green, no new global skill for `new-feature`/`greploop`.

### Block 4: docs + final verify (estimated: 10 min)

- [ ] `docs/repo-layout.md` — add `service-layer` to skill guidance (global vs product) if needed.
- [ ] Run `bash setup/verify.sh` full; confirm `Required: 19 passed, 0 failed`, `service-layer` counted.
- [ ] Smoke: new session sees `service-layer` in `~/.claude/skills`, `ponytail full` still active, `caveman` toggle works.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| `service-layer` name collides with existing skill | low | low | Checked `ls ai-config/skills` — no `service-layer`; if collision, rename to `service-layer-pattern` |
| `strategic-compact` hook duplicates existing hook | med | low | Inspect `~/.claude/settings.json` first, merge not append |
| `before-and-after` global install pollutes `pnpm` globals | low | low | Prefer `npx` on-demand; global install is optional and idempotent |
| License violation vendoring PolyForm Shield | low | high | Do not vendor `before-and-after`; reference only |

## Verification (end-to-end)

- [ ] `ls ai-config/skills/service-layer/SKILL.md && ls ~/.claude/skills/service-layer`
- [ ] `bash setup/verify.sh 2>&1 | grep "Source of truth: 190"`
- [ ] `cat ~/.claude/settings.json | grep suggest-compact` and `cat ~/.config/ponytail/config.json | grep full`
- [ ] `npx --yes --package=@vercel/before-and-after before-and-after --help` exits 0

## References

- `https://github.com/michaelshimeles/skills` — 6 skills + AGENTS.md, README, `code-structure/SKILL.md`, `new-feature/SKILL.md`, `evidence-driven-testing/SKILL.md`, `before-and-after/SKILL.md` (PolyForm), `greploop/SKILL.md` (MIT)
- `ai-config/skills/caveman/SKILL.md:1`, `ai-config/skills/strategic-compact/SKILL.md:1`, `setup/install-mac.sh:858`, `setup/verify.sh:310`, `docs/repo-layout.md:1`, `intent/README.md:1`
- `ai-config/manifest.yaml:5` — components, `setup/install-mac.sh:7` — skill propagation loop
