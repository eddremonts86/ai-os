---
id: "826"
slug: regular-loss-of-tax-credits-among-immigrants-in-the-us
title: Regular loss of tax credits among immigrants in the US
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/unnnxi3m71-regular-loss-of-tax-credits-among-immigr"
category: other
date: "2025-11-26"
tags: [Immigration, Legal, Finance, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Regular loss of tax credits among immigrants in the US

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/826-regular-loss-of-tax-credits-among-immigrants-in-the-us/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the status intake flow (residency, ITIN vs SSN, dependents) with no identifier storage by default.
- [ ] Encode the US federal credit ruleset affected by residency status, versioned by tax year.
- [ ] Render the per-credit "at risk" list and the documents required for each one.
- [ ] Show a clear "rules version" / "as of" date on every result.
- [ ] Add the optional preparer hand-off surface with a vetted list per market.
- [ ] Document the data-handling story explicitly in the UI.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
