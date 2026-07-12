# AI-OS Remediation Implementation Plan

> **For agentic workers:** Use `subagent-driven-development` for independent tasks and verify every claim with a fresh command.

**Goal:** Turn the audit findings into a truthful, secure, and platform-native AI-OS installation.

**Architecture:** Keep `ai-config/` as the repository source of truth, but generate a compact bridge and platform-specific adapter locations from one manifest. Make setup fail only for required capabilities, report optional capabilities honestly, and remove broken memory integrations until they have executable smoke tests.

**Constraints:** All repository files in English. Preserve user configuration and existing non-AI-OS files. Never execute downloads, Docker startup, package installation, or external writes from verification. Do not claim support that is not configured and tested.

## Task 1: Safety and canonical policy

**Files:** `rules/ask_before_doing.md`, `rules/always_do.md`, `CLAUDE.md`, `context/01_business_or_work.md`, `context/02_projects.md`, `.gitignore`, `workflows/*.md`, `docs/*.md*`.

- [ ] Make `go` reversible-only and preserve action-specific approval.
- [ ] Correct stale subagent, workflow, archive, project-status, language, and path references.
- [ ] Version completed specs and reserve `current_spec.md` for one active task.

## Task 2: Manifest, native adapters, and skill validation

**Files:** `ai-config/manifest.yaml`, `ai-config/templates/*`, `setup/install-mac.sh`, `setup/install-windows.ps1`, `setup/verify.sh`, `setup/verify-windows.ps1`, dry-run scripts.

- [ ] Define platform locations and required/optional components once.
- [ ] Generate bridges from the discovered AI-OS root rather than committing a user path.
- [ ] Deploy skills to native client locations and verify exact expected sets.
- [ ] Add duplicate skill-name validation.

## Task 3: Secure and correct MCP/memory stack

**Files:** `ai-config/mcp/*.yaml`, `setup/generate-mcp-config.py`, `memory/*.sh`, `memory/falkordb/docker-compose.yml`, setup and verifier scripts, tests.

- [ ] Remove or disable unverified Graphiti integration.
- [ ] Correct grepai contracts and make unimplemented session sync unavailable.
- [ ] Require PyYAML for merge-preserving MCP generation; test config preservation.
- [ ] Pin versions/digests, validate checksums where binaries are downloaded, and bind local services to loopback.

## Task 4: Test and documentation gates

**Files:** `.github/workflows/*`, `setup/tests/*`, `README.md`, `docs/*`.

- [ ] Add unit/integration tests for MCP generation and adapter rendering.
- [ ] Make required CI checks fail closed; retain explicit optional skips.
- [ ] Generate or validate counts and paths instead of documenting snapshots.
- [ ] Publish the model-routing and platform-support matrix based on official current capabilities.

## Acceptance Tests

1. `bash setup/install-mac.dry-run.sh` exits 0 in an isolated home and validates every generated adapter.
2. `python3 -m unittest discover -s setup/tests -v` passes.
3. `bash setup/verify.sh` distinguishes required failures from optional missing CLIs/services and does not report a false all-green state.
4. `python3 -S setup/generate-mcp-config.py ...` fails clearly rather than producing a lossy config.
5. Markdown/path and skill-name checks pass in CI.
