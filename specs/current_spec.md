# AI-OS Remediation — Round 7 (continuation, closing pass)

**Date:** 2026-07-12
**Status:** 🔄 In progress — essentially complete; 1 item genuinely blocked (needs a real secret), 2 items lower-priority/optional
**Owner:** Edd
**See:** `outputs/2026-07-12-ai-os-full-audit.md` (original findings), `archive/2026-07-12-ai-os-remediation-rounds-1-6.md` (rounds 1-6 history).

> This continues the remediation branch (`codex/task-3-mcp-memory-remediation`) after rounds 1-6 were archived. Two commits landed after that archive point, before this spec file was written (the branch was briefly borrowed by an unrelated task — `eaea1a6`/`26c8509` — which has since completed and archived cleanly):
> - `7ef0636` — Antigravity's real global-skill path (`~/.gemini/config/skills`, confirmed via official docs), added as an additive optional manifest client.
> - `030d1ab` — 2 real bugs from the audit's medium-severity findings: duplicate skill name (`frontend-design-alt` frontmatter collided with `frontend-design`), and silent-success-after-failure in `install-mac.sh`/`install-windows.ps1`'s Ollama/Docker/Go install steps.

## Re-verified this session (status check before deciding what's actually left)

Re-checked every item in the archived "Remaining work" list against the current file contents (not just the archived note, which was written before some of it was fixed):

1. **P1-3 (always-on prompt too large)**: re-read `ai-config/templates/global-bridge.md.tmpl` (9 lines, 421 bytes) and `ai-config/templates/hermes-soul-block.md.tmpl` (6 lines) — both are already minimal identity/language/safety/routing pointers, not the 14.7 KB inventory dump the audit described. **Already fixed**, contrary to the archived note's implication that Phase 2 work here was still pending.
2. **P1-8 (operational instructions mixed into identity surfaces)**: same two template files confirm `SOUL.md`/bridge content is identity-only; the skill directory is registered natively via Hermes's `skills.external_dirs` (Round 4, P1-2). **Already fixed.**
3. **P1-1 (platform capability matrix)**: `docs/model-routing.md` exists, is linked from README, and was updated this round with the resolved Antigravity path. **Already fixed** (Round 3 + this round).
4. **Antigravity's real global-skill path**: **Fixed this round** (`7ef0636`) — confirmed via https://antigravity.google/docs/skills that the true global path is `~/.gemini/config/skills`; wired as an additive optional manifest client (`ai-config/manifest.yaml`), propagated through `install-mac.sh`/`install-windows.ps1` (already manifest-driven), `install-mac.dry-run.sh`, `install-windows.dry-run.ps1`, `verify.sh`, `verify-windows.ps1`, `install-ecc.sh`, `install-claude-tools.sh`. Verified end-to-end with real installer runs on this machine (161→164→370 skills at each stage, matching every other CLI dir).
5. **Graphiti MCP real functional test**: **Structural smoke test passed** (Round 6, `050958b`) — real Docker deployment verified (FalkorDB connection, HTTP health check). `enabled: true`. **Genuinely still blocked**: an actual `add_memory`/`search` call needs a real `OPENAI_API_KEY`, which is not available in this agent session. This is the one item that cannot be closed autonomously — it needs the user (or a session with the real key) to run the activation steps documented in `memory/graphiti/docker-compose.yml`'s header comment.
6. **Medium-severity #4 (duplicate skill name)**: **Fixed this round** (`030d1ab`).
7. **Medium-severity #2 (silent success after failed ops)**: **Fixed this round** (`030d1ab`), verified in isolation (success→ok, failure→warn) and via a real end-to-end `install-mac.sh` run.
8. **Medium-severity #1 (unsafe YAML fallback parser)**, **#5** (nonexistent workflow/verifier references), **#7** (`daily_use/prompt.md` reference), **#8** (`docs/architecture.md` link depth): all checked this round via direct grep/read — **already fixed** in earlier rounds, no stale references found.
9. **Medium-severity #3 (FalkorDB unauthenticated ports)**: partially addressed — both Redis and Web UI ports are already bound to `127.0.0.1` only (not exposed to the network), which is the primary risk the audit called out. Explicit Redis `requirepass` on top of loopback-only binding was NOT added — left as a genuine, low-priority remaining item (defense-in-depth on an already-non-networked service).
10. **Medium-severity #6 (workflow commit/push authorization language)**: NOT reviewed this round — lower priority, broader scope (touches wording across multiple workflow docs), left for a future round if the user wants it.

## Final re-verification (this session)

- `bash -n` on `install-mac.sh`, `install-mac.dry-run.sh`, `install-ecc.sh`, `install-claude-tools.sh`, `verify.sh` — all pass.
- `pwsh` parser on all 3 `setup/*.ps1` files — 0 errors.
- `install-mac.dry-run.sh` — full pass, `MCP config: 10 servers generated`, all 6 skill destinations (including the new `.gemini/config/skills`) show matching counts.
- `python3 -m unittest discover -s setup/tests` — 5/5 passing.
- Real `bash setup/verify.sh` on this machine — `Required: 17 passed, 0 failed`.

## Remaining work (genuinely open, in priority order)

1. **Graphiti real functional test** — blocked on a real `OPENAI_API_KEY`. Cannot be closed by an agent session without that secret. Activation steps are fully documented in `memory/graphiti/docker-compose.yml`.
2. **FalkorDB Redis `requirepass`** — optional defense-in-depth; loopback-only binding already mitigates the actual risk the audit flagged.
3. **Workflow commit/push authorization language review** — broader wording pass across `workflows/*.md`, lower priority, not attempted this round.

Everything else from the original audit (`outputs/2026-07-12-ai-os-full-audit.md`) that was tractable without a live secret has been addressed and re-verified as of this round.
