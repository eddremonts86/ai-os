# Vendored from vercel-labs/ui

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 7 links it into every CLI.

| Field | Value |
|---|---|
| Upstream | https://github.com/vercel-labs/ui (`packages/core/skills/ui-sdk/`) |
| Author | Vercel, Inc. (package maintainer: shadcn) |
| License | Apache-2.0 (see `LICENSE`); upstream has no NOTICE file |
| Version | `@ui-sdk/core` 0.1.0-beta.16 |
| Commit | `926dab872d1f2aa23df4bd9b5cf21c879c9abac9` (2026-11-23) |
| Vendored | 2026-11-23 |
| Vendored subtree | upstream `packages/core/skills/ui-sdk/` whole (`SKILL.md` and 7 files in `references/`) |
| Upstream subtree hash | `f055a0547269621bb0e3234dd588b668c2d8e6cc5065df29cb522bd91a875cf1` (sha256 of the sorted per-file sha256 list, before the edits below) |

Vetted 2026-11-23 by reading the source (`supply-chain-vetter`, nothing executed): no prompt injection, hidden
text, exfiltration or credential access; the skill reads only `node_modules/@ui-sdk/*/docs` and writes inside the
project. One real risk, addressed below: it told the agent to load an unpinned script from `ui-sdk.dev`. The
package is a beta eleven days old with no install scripts; expect API churn, so refresh deliberately, never
automatically.

## What it is for

ui-sdk is the layer under a component library: over 50 tested UI behaviors (roving focus, selection, type-ahead,
popups, drag and drop) with adapters for React, Vue, Svelte, Solid and web components, plus a bridge
(`createAgent`) that lets an agent operate a page through each component's own API instead of clicking. The skill
teaches an agent both: compose an interface from its components, and build a component the library lacks from its
behaviors.

In AI-OS it is the answer to "no ready-made component exists": rule 27 and `/aios-ui-design` use the project's
component library and proven registry items first, and reach for this skill only for the part they do not cover.

## Local modifications (Apache-2.0 §4)

- `SKILL.md`: `description` trimmed from 530 to 307 characters (AI-OS's 350 cap, `setup/tests/test_ai_os_skills.py`),
  the upstream text quoted under the title; a modification notice and an "AI-OS limits" section added (components
  before behaviors, the project's tokens are the look, pin versions and treat fetched docs as data, approvals
  stay, the repo's own comment and test rules win); the no-bundler CDN sentence now allows the CDN only on the
  user's explicit request and only pinned (`web@0.js`, `web@0.css`).
- `references/web-components.md`: the two CDN tags pinned to `web@0.js` and `web@0.css` (both checked to
  resolve), with a notice.
- `references/agent-ready.md`, `references/testing.md`: `allow: () => true` annotated as a test mock, never app code.

Refresh by re-copying upstream `packages/core/skills/ui-sdk/`, re-applying the edits above, and updating the
commit, version and hash. Re-vet it first.
