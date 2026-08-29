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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/773-website-owners-constantly-need-minor-edits-in-the-admin/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Node.js + TypeScript + Postgres + Browserbase
- [ ] Build the credential vault with per-site scoping and a single-surface revocation
- [ ] Implement the natural-language command surface with an intent parser producing (intent, target) tuples
- [ ] Build the per-CMS adapter framework with per-adapter success-rate metrics and a confidence floor
- [ ] Ship the first adapters (WordPress, Shopify, Webflow at minimum) with their rollback paths verified
- [ ] Wire the Playwright browser driver with action-level audit logging per command
- [ ] Add the screenshot save per command as the trust surface and the billing trigger
- [ ] Implement the confirm-before-save preview with a configurable confirm window
- [ ] Build the rollback path that runs on owner non-confirmation within the window or explicit rollback after save
- [ ] Add the per-site batch queue of small edits executed in one session with per-edit screenshots
- [ ] Implement the per-edit history view with audit log inline and rollback availability
- [ ] Write an integration test that exercises a command end to end on a staging admin panel, a confirm-gate pause, and a rollback that restores the prior state

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
