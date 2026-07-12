# AI-OS Remediation Implementation Plan

**Date:** 2026-07-12
**Status:** 🔄 In progress — Tasks 1-4 done; Windows memory-stack parity (P1-5) done; Hermes skills.external_dirs (P1-2) done; Graphiti MCP architecture decision made and wired, activation smoke test still pending real Docker + OPENAI_API_KEY
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
- [x] Reconciled `context/02_projects.md` vs `context/01_business_or_work.md` (P1 medium #11): moved `hermes-agent` and `iaWorkSpace` into the Active table in `02_projects.md` to match `01_business_or_work.md`, with a note explaining why an older mtime doesn't mean unused.

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
- [x] Bind local services to loopback (`memory/falkordb/docker-compose.yml` already updated in this branch; also fixed a stale comment in `install-mac.sh` still claiming the image was `:latest` when it's pinned to `v4.18.11`).
- [x] Graphiti MCP launch configuration (P0-3): fetched the official `mcp_server/README.md` and confirmed the previous config (`uv run --with graphiti-core[falkordb] python -m graphiti_mcp_server`) was definitely wrong — no such installable module exists. Rewrote `ai-config/mcp/graphiti.yaml` with the real launch shape (`uv run main.py` from inside a `graphiti` checkout, or the `zepai/knowledge-graph-mcp` Docker image over HTTP) and a detailed comment. Still `enabled: false` — actually enabling it needs a real architecture decision (vendor the repo vs. Docker HTTP transport) plus HTTP transport support in `generate-mcp-config.py`, which doesn't exist yet. Not attempted this session; tracked below.
- [x] Pin versions/digests and validate checksums where binaries are downloaded (P1-4):
  - `setup/install-mac.sh`: Oh My Zsh now installs from a pinned commit SHA instead of `master`; Powerlevel10k and the 3 zsh plugins (`zsh-autosuggestions`, `zsh-syntax-highlighting`, `zsh-completions`) clone pinned tags instead of the default branch; `grepai` installs a pinned `go install ...@v0.35.0` instead of `@latest`; `codebase-memory-mcp` now downloads `checksums.txt` from the same pinned release tag and verifies the tarball's sha256 before extracting (refuses to install on mismatch).
  - `ai-config/mcp/*.yaml`: pinned `chrome-devtools-mcp@1.5.0`, `agent-browser-mcp-server@0.14.2`, `@modelcontextprotocol/server-filesystem@2026.7.10`, `@modelcontextprotocol/server-memory@2026.7.4`, `@modelcontextprotocol/server-sequential-thinking@2026.7.4`, `mcp-pdf==2.3.0`, `mcp-server-time==2026.7.10` (all previously `@latest` or unversioned).
  - Not pinned yet: `install-windows.ps1` doesn't install Oh My Zsh/grepai/memory stack at all (separate cross-platform-parity gap, P1-5, not attempted this session).

## Task 4: Test and documentation gates

**Files:** `.github/workflows/*`, `setup/tests/*`, `README.md`, `docs/*`.

- [x] Add unit/integration tests for MCP generation (`setup/tests/test_generate_mcp_config.py`, 3 tests, all passing).
- [x] Make required CI checks fail closed; retain explicit optional skips — replaced the `bash setup/verify.sh || true` / `pwsh ... || true` steps in `test-mac.yml`, `test-linux.yml`, `test-windows.yml` with a required `python -m unittest discover -s setup/tests` gate (verify.sh/verify-windows.ps1 validate a live installed machine and are documented as not meaningful against a bare CI runner; the dry-run installers already cover the structural/adapter/MCP logic and fail closed with no suppression).
- [x] Generate or validate counts and paths instead of documenting snapshots (README/docs finding #10): confirmed the "271 ECC skills" and "12 claude.tools/gstack skills" badges/claims are accurate against the real source directories. Found and fixed one genuinely stale count: "7 declarative MCP servers" (actual: 10 total, 9 enabled) across `README.md` (4 places), `docs/architecture.md`, `ai-config/skills/ai-os-karpathy/SKILL.md`, and `prompts/daily-use/01-daily-start.md`.
- [ ] Publish the model-routing and platform-support matrix based on official current capabilities (P1-1, roadmap Phase 2/3 item) — **done**: `docs/model-routing.md` added and linked from README, explicitly framed as an eval-driven hypothesis (per the audit's own recommendation) rather than a hardcoded default, with the two known platform gaps (MCP config Hermes-only, Antigravity's real skill path unresolved) called out instead of glossed over.

## Acceptance Tests

1. `bash setup/install-mac.dry-run.sh` exits 0 in an isolated home and validates every generated adapter. **Verified this session** (was failing with `CLI_DIRS[@]: unbound variable`; fixed; re-ran to a clean full pass including MCP generation, both before and after the P1-4 pinning edits).
2. `python3 -m unittest discover -s setup/tests -v` passes. **Verified this session: 3/3 passing**, including after all the MCP-pinning edits.
3. `bash setup/verify.sh` distinguishes required failures from optional missing CLIs/services and does not report a false all-green state. **Verified this session** against this real machine: it caught a real gap (2 skills not deployed to any CLI), reported exit 1 with `Required: 12 passed, 5 failed`; after re-syncing skills it reported `Required: 17 passed, 0 failed` / exit 0 with optional gaps still visible as warnings (npm/pip packages, Docker/Ollama, VS Code bridge).
4. `python3 -S setup/generate-mcp-config.py ...` fails clearly rather than producing a lossy config. **Verified this session** (`test_requires_pyyaml_without_writing_output` passes; direct run without PyYAML on `PATH` prints a clear error and exits 1, no partial file written).
5. Markdown/path and skill-name checks pass in CI. **Not independently re-verified this session** beyond what `install-mac.dry-run.sh` step 7 already covers (frontmatter `name:`/`description:` presence for all flat + gstack skills).

## Remaining work (not done yet, in priority order)

1. Graphiti MCP activation smoke test: the architecture decision is now made and wired (see Round 5 below) — `memory/graphiti/docker-compose.yml` runs `zepai/knowledge-graph-mcp:1.0.2-standalone` against the existing FalkorDB over the shared `aios-memory` Docker network. **Not yet started on any machine** (this session had no running Docker daemon and no `OPENAI_API_KEY`). Someone with both needs to run the 4 activation steps in that compose file's header comment and confirm `curl -sf http://127.0.0.1:8021/health` before flipping `ai-config/mcp/graphiti.yaml`'s `enabled: false` to `true`.
2. P1-1/P1-3/P1-8 remainder (Phase 2 in the audit roadmap): native per-platform adapters beyond the shared bridge, tiered/reduced always-on context, operational rules out of Hermes `SOUL.md` (research in Round 4 found `AGENTS.md`/`.hermes.md` are Hermes's project-scoped context mechanism, cwd-based; `SOUL.md` remains the only *global, cwd-independent* mechanism Hermes has, so the current minimal pointer block there is likely staying).
3. Antigravity's real global-skill path (`~/.gemini/config/skills` per the audit) — deliberately NOT changed, same reasoning as before: would risk breaking every machine currently relying on `~/.agents/skills` without a first-party doc check first.

## Round 3 additions (continuing "todo lo pendiente")

- **P1-5 Windows memory-stack parity**: `setup/install-windows.ps1` now installs the same memory stack as Mac (Ollama + nomic-embed-text, FalkorDB via Docker Compose, `codebase-memory-mcp` with sha256 checksum verification against the same pinned release, `grepai` via a pinned `go install`), gated by the new `$env:SKIP_MEMORY`. Added `ollama` and `golang` to the chocolatey package list.
- **Real bug found and fixed via `pwsh` parser** (installed via `brew install powershell` specifically to get real syntax validation, since the prior session's verify-windows.ps1 bug was only caught by manual review): `setup/verify-windows.ps1` had 4 instances of `"$label: ..."` inside double-quoted strings, which PowerShell parses as an ambiguous drive/scope reference (`':' was not followed by a valid variable name character`) — a real parse error, not a style nit. Fixed with `${label}:`. All 3 `setup/*.ps1` files now parse cleanly with `[System.Management.Automation.Language.Parser]::ParseFile`.
- **New CI gate**: `.github/workflows/test-windows.yml` now parses every `setup/*.ps1` file with the real PowerShell parser as a required, fail-closed step — this is exactly what would have caught the bug above before it shipped, and nothing else in that workflow exercises `verify-windows.ps1`'s syntax at all.
- **Stale skill doc fixed**: `ai-config/skills/ai-os-memory/SKILL.md` advertised a `sync-sessions` subcommand that was removed from `memory/ai-os-memory.sh` in an earlier fix (P0-2) but never removed from the skill doc; also missing the real `visualize`/`search` subcommands, presenting Graphiti as a working layer instead of disabled, and pointing at the pre-archive spec path. All fixed.
- **`docs/model-routing.md`** added (see Task 4 above) and linked from README.

## Round 4 additions (continuing "todo lo pendiente"): Hermes skills.external_dirs (P1-2, real bugs found)

Researched Hermes's actual current capabilities against its official docs
(`hermes-agent.nousresearch.com/docs`, 2026-07-12) instead of guessing, per the
audit's own P1-8 recommendation. Confirmed, current findings:

- **`skills.external_dirs` is real and current** (`~/.hermes/config.yaml`), and
  Hermes's own docs use `~/.agents/skills` as the literal example path. This
  directly resolves P1-2 ("duplicating all skills under `imported/`"): Hermes
  can scan `~/.agents/skills` (already populated for Antigravity/VS Code)
  natively instead of getting its own symlinked copy.
- **`SOUL.md` is confirmed identity/personality-only by Hermes's own design**
  (loaded only from `HERMES_HOME`, never probes cwd). `AGENTS.md`/`.hermes.md`
  are Hermes's project-context mechanism, but they're cwd-based/per-project,
  not a global always-on mechanism the way `SOUL.md` is — so there is currently
  no idiomatic way to make AI-OS's bridge apply in every Hermes session
  regardless of working directory other than the existing minimal SOUL.md
  pointer block. Not changed; documented as a real constraint, not an oversight.
- **Implemented the external_dirs fix**: `setup/generate-mcp-config.py` now
  takes an optional 3rd arg (`external_skills_dir`) and merges it into
  `skills.external_dirs` (dedup, preserves existing user entries, idempotent;
  2 new unit tests). `ai-config/manifest.yaml`, `setup/install-mac.sh`,
  `setup/install-windows.ps1`, `setup/install-ecc.sh`,
  `setup/install-claude-tools.sh` no longer symlink into
  `~/.hermes/skills/imported/`; both installers now clean up that superseded
  tree on next run (only if every entry is still an AI-OS-made symlink — never
  touches real user content). `setup/verify.sh` / `verify-windows.ps1` check
  `~/.hermes/config.yaml` for the `external_dirs` entry instead of a symlink
  count. **Verified end-to-end on this real machine**: old `imported/` tree
  removed, `~/.hermes/config.yaml` correctly gained `external_dirs: [~/.agents/skills]`
  while preserving the pre-existing `template_vars: true` setting.
- **Real bug found: bash 3.2 incompatibility.** The first attempt used
  `declare -A` (associative arrays, bash 4+) for the zsh plugin tag lookup
  added in Round 2. macOS ships bash 3.2.57 as `/bin/bash` (last GPLv2
  release; Apple never upgraded) and this script's `#!/usr/bin/env bash`
  shebang resolves to it on any Mac without a newer bash earlier on PATH —
  confirmed this is genuinely the case on this machine. bash 3.2 has no
  associative arrays; it silently falls back to arithmetic indexed-array
  subscripts, so `[zsh-autosuggestions]` parsed as `zsh - autosuggestions` and
  crashed with `zsh: unbound variable` under `set -u`. Fixed with a `case`
  statement (works on every bash version). **This meant `install-mac.sh` was
  broken on stock macOS bash from Round 2 until this session** — caught only
  because I ran the real (non-dry-run, non-venv-only) installer end-to-end.
- **Real bug found: count-based skill verification breaks with optional
  bundles installed.** After fixing the above and running `install-ecc.sh` +
  `install-claude-tools.sh` for real (needed to test the Hermes fix
  end-to-end), `setup/verify.sh` started reporting `370/164 skills — MISMATCH`
  as a **required failure** for every core CLI, because ECC (271 skills) and
  claude.tools/gstack legitimately add more names on top of the flat+gstack
  baseline, and symlink name collisions make the net delta unpredictable. The
  exact-count check from Round 2 never anticipated this common, documented,
  supported configuration. Rewrote section 3 in both `verify.sh` and
  `verify-windows.ps1` to check the exact **set of expected skill names**
  (not a count) is present, regardless of what else is also deployed —
  verified this both passes correctly with ECC+claude.tools installed *and*
  still catches a real gap (tested by hiding one required skill; correctly
  reported `missing 1 expected skill(s): brainstorming` and failed).
- All changes verified with real command execution on this machine: `bash -n`
  on every edited shell script, `pwsh` parser on every edited `.ps1` file (0
  errors), 5/5 unit tests (2 new), `install-mac.dry-run.sh` and
  `install-windows.dry-run.ps1` (run for real via `pwsh` on macOS with `$env:TEMP`
  set manually, since that var is Windows-only) both exit 0 end-to-end
  including the new `skills.external_dirs` check, and `verify.sh` on this real
  machine: `Required: 17 passed, 0 failed`.
- Also fixed while in these files: a regex-scoping bug in
  `install-mac.dry-run.sh`'s MCP-server counter (the new `skills:` block's
  `external_dirs:` line matched the same 2-space-indent `key:` pattern used to
  count MCP servers, inflating the count by 1 — rescoped to only count lines
  between `mcp_servers:` and the next top-level key). Updated ~15 stale doc/
  comment references to `~/.hermes/skills/imported/` across `CLAUDE.md`,
  `docs/*.md`, `ai-config/skills/READMEDD.md`, `ai-config/skills/ai-os-quickstart/SKILL.md`,
  `prompts/setup/03-required-skills.md`, and `docs/model-routing.md`.

## Round 5 additions (continuing "todo lo pendiente"): Graphiti MCP architecture decision

- **Decision made**: run the pre-built `zepai/knowledge-graph-mcp:1.0.2-standalone`
  Docker image (pinned tag, not `:latest`) over HTTP transport against the
  FalkorDB container AI-OS already manages, rather than vendoring
  `getzep/graphiti` under `vendor/graphiti/`. Rationale: vendoring would add a
  second language toolchain (uv/Python) and a git-submodule-style dependency
  just to run one MCP server; the versioned Docker image is pinned exactly the
  same way FalkorDB itself already is (checked available tags on Docker Hub —
  `1.0.2-standalone` is the current stable "no bundled database" variant meant
  for exactly this "bring your own FalkorDB/Neo4j" case).
- **Implemented**: `memory/falkordb/docker-compose.yml` now declares a shared
  `aios-memory` Docker network (was previously using an implicit
  project-default network, unreachable-by-name from other compose projects).
  New `memory/graphiti/docker-compose.yml` runs `aios-graphiti-mcp` on that
  network, reaching FalkorDB at `redis://aios-falkordb:6379` (container name,
  not the loopback-only published port), HTTP published on
  `127.0.0.1:8021` → `/mcp/`, requires `OPENAI_API_KEY` (fails fast via
  Compose's `${VAR:?message}` syntax if unset — cannot silently start
  half-configured). `ai-config/mcp/graphiti.yaml` updated to
  `transport: http`, `url: http://127.0.0.1:8021/mcp/`; confirmed
  `setup/generate-mcp-config.py`'s existing HTTP-transport branch renders this
  correctly with no code changes needed. `memory/ai-os-memory.sh`'s `status`
  subcommand now also reports the Graphiti container/health passively (never
  starts or stops it — stays out of `ai-os memory start`/`stop` since it needs
  a secret and hasn't been smoke-tested).
- **Explicitly NOT done**: actually starting the container. This session had
  Docker not running and no `OPENAI_API_KEY` available — starting it blind
  would violate this plan's own constraint ("Do not claim support that is not
  configured and tested"). `enabled: false` stays until someone runs the 4
  documented activation steps and confirms the health check for real.
- **Verified this session**: both edited/new YAML files parse cleanly with
  PyYAML; `bash -n memory/ai-os-memory.sh` passes; re-ran
  `install-mac.dry-run.sh` end-to-end (with PyYAML available via a throwaway
  venv on `PATH`, matching what the real installer already ensures via
  `pip-packages.txt`) — full pass, `MCP config: 9 servers generated` (Graphiti
  correctly excluded while disabled); 5/5 unit tests still passing.
