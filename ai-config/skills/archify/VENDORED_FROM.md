# Vendored from tt-a1i/archify

Third-party skill, vendored into `ai-config/skills/` so the install scripts propagate it to
every CLI with no change (flat skill — `SKILL.md` at the top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/tt-a1i/archify |
| Author | tt-a1i |
| License | MIT (see `LICENSE`, `LICENSE-UPSTREAM.md`) |
| Version | 3.0.1 (tag `v3.0.1`) |
| Commit | `2ab3cae7ac2c2a55d7386ca789d03c4fcd31816c` |
| Commit date | 2026-09-28 |
| Vendored | 2026-10-08 |
| Vendored subtree | upstream `archify/` only, minus `test/` and `node_modules/` |

## Source review (2026-10-08)

- No runtime dependencies; `devDependencies` are build-time only.
- Process spawning is limited to `node` itself, `git` (repository evidence), a browser (visual
  check) and the OS file opener (only when an immediate preview is requested).
- Network: one bounded update check (`scripts/check-update.mjs` fetches
  `tt-a1i.github.io/archify/skill-updates/.../stable.json`) and brand-mark capture from a
  user-supplied URL. The update check is disabled with `ARCHIFY_UPDATE_CHECK_DISABLED=1`.
  Its cache lives under the home/tmp directory, not in this repo.

## What was NOT vendored

- `test/` — upstream's own test suite (needs devDependencies and repo-root scripts).
- Repo-root files (`website/`, `docs/`, `viewer/`, `.agents/skills/archify-review`,
  `archify.zip`, marketplace manifests) — not part of the skill.

## Local deltas (a naive refresh reverts these)

1. `SKILL.md`: one "AI-OS delta" paragraph after the intro — update check disabled, no
   update notices relayed, and a pointer to `diagram-design` for branded deliverables.

## Refreshing

Clone the new tag, copy `archify/` over this directory (excluding `test/`), re-apply the delta
above, re-run the source review, update the table, then run
`ARCHIFY_UPDATE_CHECK_DISABLED=1 node bin/archify.mjs doctor`.
