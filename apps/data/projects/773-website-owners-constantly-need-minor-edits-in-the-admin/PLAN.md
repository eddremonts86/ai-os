---
id: "773"
slug: website-owners-constantly-need-minor-edits-in-the-admin
title: Website owners constantly need minor edits in the admin panel. They are forced to pay specialists for 5-minute tasks. We need an AI agent that does this on command in the browser.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/smpdtt9zc1-website-owners-constantly-need-minor-edi"
category: ai
date: "2026-01-28"
tags: [AI, No-Code, Freelance, Other]
country: USA
tech: [TypeScript, Node.js, Playwright (browser-use MCP), Anthropic Claude API (browser tools), Browserbase, Postgres]
---
# Website owners constantly need minor edits in the admin panel. They are forced to pay specialists for 5-minute tasks. We need an AI agent that does this on command in the browser.

## Tech Stack

- **TypeScript** for the agent service, because the per-CMS adapter layer and the natural-language command parser are easier to keep typed across the agent's run paths.
- **Node.js** as the runtime, because the workload is a long-running browser driver and Node's async model fits the per-adapter IO.
- **Playwright (via the browser-use MCP)** as the browser-driving surface, because Playwright's CDP-level control is the right layer for an agent that drives real admin panels reliably.
- **Anthropic Claude API (browser tools)** as the language-understanding and tool-calling surface, because the source names 'AI agent' and Claude's tool-use shape is well suited to a browser-driving loop.
- **Browserbase** as the hosted browser environment, because the source names no browser-hosting preference and Browserbase is a hosted Chromium-and-recording surface that provides session isolation and replay.
- **Postgres** as the primary store, because the per-edit history, the per-site credential reference, and the per-adapter configuration are relational and audit-friendly.

## Architecture

The owner signs up, connects a site by selecting the CMS / admin panel type and providing credentials, and lands in a command surface. Each command is a single natural-language sentence ('change the headline on the home page to ...'). A small command parser extracts the intent and the target, the agent opens the admin panel using the stored credentials, performs the edit through the corresponding adapter, and saves the screenshot of the changed state. The screenshot is the trust surface and is also the billing trigger; a command that produces no successful screenshot is not a billable edit.

The adapter layer is per CMS / admin panel. Each adapter maps a high-level intent to the panel's actual UI steps and is owned by an explicit owner name rather than inferred. New adapters are added when the platform decides it has the test surface to keep them reliable, not on customer demand, because an adapter that breaks silently is the worst kind of failure for a billing-on-success product. The adapter success rate is a per-adapter metric, and an adapter that drops below a confidence floor is removed from the supported list rather than left to fail.

The credential vault stores site credentials encrypted at rest, scoped per site, with consent recorded per session. The owner can revoke a credential from a single surface that invalidates the stored credential immediately. The audit log records every admin-panel action the agent took in a command — every click, every keystroke, every save — so the owner can replay the action list and a specialist used to have nothing equivalent.

The confirm-before-save step is the structural trust gate. By default the agent shows the change in a preview state and asks the owner to confirm; an opt-in 'just save it' mode is available for owners who trust the agent fully, but the default is the safer one. A rollback path restores the prior state if the owner does not confirm within the window or explicitly rolls back after saving, and every supported panel's edit type has a known rollback path before the adapter is shipped.

## Milestones

1. **M1 — Sites and credentials** — Owner connects a site by CMS type and credentials; credential vault with revocation from a single surface.
2. **M2 — Command ingest and intent parser** — Natural-language command surface with an intent parser that produces (intent, target) tuples.
3. **M3 — First adapters** — Adapters for the chosen launch CMS / admin panels with per-adapter success-rate metrics and confidence-floor enforced.
4. **M4 — Browser driver** — Playwright-driven browser session via Browserbase, with action-level audit logging per command.
5. **M5 — Screenshot and confirm gate** — Screenshot saved per command; confirm-before-save preview; rollback path on owner non-confirmation.
6. **M6 — Batch queue** — Per-site batch queue of small edits executed in one session with a per-edit screenshot.
7. **M7 — Audit and history** — Per-edit history view with screenshots, rollback availability, and the audit log readable inline.

## Risks

- **Adapter breakage** — CMS / admin panel UIs change without warning; an adapter that breaks silently is unfit for a billing-on-success product, and the per-adapter confidence floor must be enforced.
- **Credential leak** — a credential leak is the worst possible outcome of an agent with admin access; the credential vault has to be audited and the revocation path tested.
- **Irreversible edit** — a publish-and-cannot-revert action must not exist in an adapter's repertoire without an explicit confirm gate; the supported edit types list per adapter is part of the contract.
- **Half-applied edit** — an edit that saves in some places and fails in others is the source of owner mistrust; the audit log must surface the half-applied case as a distinct failure.
- **Confirm-window edge cases** — a confirm window that is too short removes the trust gate; a window that is too long delays the edit. The default must be tested against real owner behaviour.
- **CAPTCHA and bot detection** — an admin panel that detects a non-human driver is a panel where the agent must pause for the owner, not bypass the check.
- **Adapter coverage honesty** — an adapter list that includes panels where the adapter is unreliable is the same as no adapter; an adapter is shipped only when its confidence floor holds.
- **Rollback correctness** — a rollback path that does not actually restore the prior state is a trust-surface failure even if the save succeeded; the rollback path is tested per edit type before launch.
