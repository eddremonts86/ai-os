# AI-OS Remediation Implementation Plan

**Date:** 2026-07-12
**Status:** 🔄 In progress — Task 1 mostly done, Task 2 verifier truthfulness done, Task 3/4 partially done
**Owner:** Edd
**See:** `outputs/2026-07-12-ai-os-full-audit.md` for the full audit findings this plan resolves.

> **For agentic workers:** Use `subagent-driven-development` for independent tasks and verify every claim with a fresh command.

**Goal:** Turn the audit findings into a truthful, secure, and platform-native AI-OS installation.

**Architecture:** Keep `ai-config/` as the repository source of truth, but generate a compact bridge and platform-specific adapter locations from one manifest. Make setup fail only for required capabilities, report optional capabilities honestly, and remove broken memory integrations until they have executable smoke tests.

**Constraints:** All repository files in English. Preserve user configuration and existing non-AI-OS files. Never execute downloads, Docker startup, package installation, or external writes from verification. Do not claim support that is not configured and tested.

## Task 1: Safety and canonical policy

**Files:** `rules/ask_before_doing.md`, `rules/always_do.md`, `CLAUDE.md`, `context/01_business_or_work.md`, `context/02_projects.md`, `.gitignore`, `workflows/*.md`, `docs/*.md*`.

- [x] Make `go` reversible-only and preserve action-specific approval (already correct in `rules/ask_before_doing.md`).
- [x] Correct stale subagent, workflow, archive, project-status, language, and path references (`CLAUDE.md`, `docs/ai-os-overview.mdx` bridge references fixed this session).
- [x] Version completed specs and reserve `current_spec.md` for one active task (archived `2026-07-02-persistent-memory-research.md` and `2026-07-03-persistent-memory-phase-1.md`; this file is now the single active spec).
- [ ] Re-check `context/02_projects.md` vs `context/01_business_or_work.md` for the "disagree about active personal projects" finding (P1 medium #11) — not yet reconciled.

## Task 2: Manifest, native adapters, and skill validation

**Files:** `ai-config/manifest.yaml`, `ai-config/templates/*`, `setup/install-mac.sh`, `setup/install-windows.ps1`, `setup/verify.sh`, `setup/verify-windows.ps1`, dry-run scripts.

- [x] Define platform locations and required/optional components once (`ai-config/manifest.yaml`).
- [x] Generate bridges from the discovered AI-OS root rather than committing a user path (`~/.ai-os/adapters/global-bridge.md`, rendered from `ai-config/templates/global-bridge.md.tmpl`). Removed the stale, hardcoded-path `ai-config/clis/GLOBAL_BRIDGE.md` that was no longer used by install but still committed.
- [x] Deploy skills to native client locations and verify exact expected sets — rewrote `setup/verify.sh` section 3 to do an exact skill-count comparison per client instead of existence-only (this caught and we fixed a real gap: `ai-os-loop` and `ai-os-memory` were not deployed to any CLI's skills dir).
- [x] Add duplicate skill-name validation (already present in `install-mac.dry-run.sh` step 5).
- [x] `setup/verify.sh` now distinguishes required vs. optional checks (separate counters, exit code depends only on required failures) and no longer double-checks the bridge wiring (removed the duplicate "section 12").
- [x] `setup/verify-windows.ps1`: fixed a real parenthesis-mismatch syntax bug in the dotfiles check, added the same required/optional split, exact skill-count comparison, and CLI executable checks, and fixed the bridge check to match the templated-adapter architecture.
- [x] Fixed a real bug in `setup/install-mac.dry-run.sh` (step 5b referenced an undefined `CLI_DIRS` array — `unbound variable` under `set -u`, made the dry-run always exit 1). Now iterates the manifest-driven client list like step 5.

## Task 3: Secure and correct MCP/memory stack

**Files:** `ai-config/mcp/*.yaml`, `setup/generate-mcp-config.py`, `memory/*.sh`, `memory/falkordb/docker-compose.yml`, setup and verifier scripts, tests.

- [x] Correct grepai contracts and make unimplemented session sync unavailable (already done in this branch — `ai-config/mcp/grepai.yaml`, `memory/ai-os-memory.sh`, `memory/cron-reindex.sh`).
- [x] Require PyYAML for merge-preserving MCP generation; test config preservation (`setup/generate-mcp-config.py` rewritten, `setup/tests/test_generate_mcp_config.py` added, 3/3 passing).
- [x] Bind local services to loopback (`memory/falkordb/docker-compose.yml` already updated in this branch).
- [ ] Graphiti MCP launch configuration (P0-3): `ai-config/mcp/graphiti.yaml` was edited in this branch but not independently re-verified this session against the official `mcp_server` entrypoint — needs a real smoke test before trusting it.
- [ ] Pin versions/digests and validate checksums where binaries are downloaded (P1-4) — not started; `setup/install-mac.sh` still installs Oh My Zsh from `master`, extracts a binary without checksum verification, and several MCP configs use `@latest`/unpinned `npx -y`.

## Task 4: Test and documentation gates

**Files:** `.github/workflows/*`, `setup/tests/*`, `README.md`, `docs/*`.

- [x] Add unit/integration tests for MCP generation (`setup/tests/test_generate_mcp_config.py`, 3 tests, all passing).
- [x] Make required CI checks fail closed; retain explicit optional skips — replaced the `bash setup/verify.sh || true` / `pwsh ... || true` steps in `test-mac.yml`, `test-linux.yml`, `test-windows.yml` with a required `python -m unittest discover -s setup/tests` gate (verify.sh/verify-windows.ps1 validate a live installed machine and are documented as not meaningful against a bare CI runner; the dry-run installers already cover the structural/adapter/MCP logic and fail closed with no suppression).
- [ ] Generate or validate counts and paths instead of documenting snapshots (README/docs still have some manually-duplicated counts per audit finding #10) — not reconciled this session.
- [ ] Publish the model-routing and platform-support matrix based on official current capabilities (P1-1, roadmap Phase 2/3 item) — not started.

## Acceptance Tests

1. `bash setup/install-mac.dry-run.sh` exits 0 in an isolated home and validates every generated adapter. **Verified this session** (was failing with `CLI_DIRS[@]: unbound variable`; fixed; re-ran to a clean pass through skill/adapter/gstack simulation — MCP generation step requires PyYAML present for whichever `python3` runs it, same as a real Mac would need per `dev-env/packages/pip-packages.txt`).
2. `python3 -m unittest discover -s setup/tests -v` passes. **Verified this session: 3/3 passing.**
3. `bash setup/verify.sh` distinguishes required failures from optional missing CLIs/services and does not report a false all-green state. **Verified this session** against this real machine: it caught a real gap (2 skills not deployed to any CLI), reported exit 1 with `Required: 12 passed, 5 failed`; after re-syncing skills it reported `Required: 17 passed, 0 failed` / exit 0 with optional gaps still visible as warnings (npm/pip packages, Docker/Ollama, VS Code bridge).
4. `python3 -S setup/generate-mcp-config.py ...` fails clearly rather than producing a lossy config. **Verified this session** (`test_requires_pyyaml_without_writing_output` passes; direct run without PyYAML on `PATH` prints a clear error and exits 1, no partial file written).
5. Markdown/path and skill-name checks pass in CI. **Not independently re-verified this session** beyond what `install-mac.dry-run.sh` step 7 already covers (frontmatter `name:`/`description:` presence for all flat + gstack skills).

## Remaining work (not done this session, in priority order)

1. P1-4 supply-chain pinning: checksums/digests for downloaded binaries, pin Oh My Zsh installer, replace `@latest`/unpinned `npx -y` in MCP configs.
2. P0-3 Graphiti MCP: verify the real `mcp_server` launch path against the upstream repo with an actual smoke test, not just a YAML edit.
3. P1-1/P1-2/P1-3/P1-8 (Phase 2 in the audit roadmap): native per-platform adapters beyond the shared bridge, tiered/reduced always-on context, Antigravity's real skill path (`~/.gemini/config/skills`), operational rules out of Hermes `SOUL.md`.
4. context/02_projects.md vs context/01_business_or_work.md reconciliation.
5. README/docs count reconciliation (audit finding #10).
