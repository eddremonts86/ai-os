---
id: "834"
slug: protection-against-fraudulent-schemes-in-trading-and-cr
title: Protection against fraudulent schemes in trading and cryptocurrency investments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/lux1195af1-protection-against-fraudulent-schemes-in"
category: finance
date: "2025-11-18"
tags: [Finance, Legal, Other]
country: Madagascar
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Protection against fraudulent schemes in trading and cryptocurrency investments

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/834-protection-against-fraudulent-schemes-in-trading-and-cr/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Source the known-schemes database from public regulator and consumer-protection lists, versioned by date.
- [ ] Build the check surface that takes a description or platform name and returns a verdict.
- [ ] Build the per-match explainer with the regulator name and the warning date.
- [ ] Add the honest "not in the database" path with an explanation of what the database does not cover.
- [ ] Add the "report a scheme" intake for cases not yet in the database.
- [ ] Add the explicit "detection aid, not legal advice" disclaimer before the verdict renders.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
