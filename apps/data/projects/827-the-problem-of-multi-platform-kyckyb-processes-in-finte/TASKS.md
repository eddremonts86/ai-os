---
id: "827"
slug: the-problem-of-multi-platform-kyckyb-processes-in-finte
title: The problem of multi-platform KYC/KYB processes in fintech leading to specialist burnout
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/u4jsvhe931-the-problem-of-multi-platform-kyckyb-pro"
category: ai
date: "2025-11-26"
tags: [AI, Finance, Business, Other]
country: France
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The problem of multi-platform KYC/KYB processes in fintech leading to specialist burnout

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/827-the-problem-of-multi-platform-kyckyb-processes-in-finte/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Choose the first two KYC / KYB vendors from interviews, not from the source.
- [ ] Build the case model that identifies one customer or business across vendors.
- [ ] Implement the case view fanning out to each connected vendor for status.
- [ ] Add the routing rule that selects the next vendor based on what has already been collected.
- [ ] Build the audit trail per case with vendor and timestamp per result.
- [ ] Add the specialist dashboard showing the queue, the blockers, and the vendor wait times.
- [ ] Document the data-residency story for France and the EU explicitly in the UI.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
