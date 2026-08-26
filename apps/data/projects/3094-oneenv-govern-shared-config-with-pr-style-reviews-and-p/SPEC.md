---
id: "3094"
slug: oneenv-govern-shared-config-with-pr-style-reviews-and-p
title: OneEnv – Govern shared config with PR-style reviews and per-service approval
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/oneenv?utm_campaign=startup-184259&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# OneEnv – Govern shared config with PR-style reviews and per-service approval

## Problem

OneEnv brings governance to shared configuration across your services. It stages changes to environment values, database structure, API routes, and validation rules on branches, then routes a single review and merge before fanning out per-service approvals so nothing goes live without consent. It scores impact and risk, tracks an auditable history, and exports configuration in your formats for deployment. Teams see workspace health, import services from GitHub, and search everything from one place. View startup

---

## Objective

Move shared service configuration off ad-hoc `.env` files and into a single workspace where every change is staged on a branch, reviewed once at the workspace level, then approved per service before deploy. The BetaList post frames the whole product as a governance layer over cross-service config — environment values, database structure, API routes, and validation rules — with impact scoring, an audit log, and a format-flexible export so downstream tooling can consume the result without re-keying.

## Target Users

1. **Platform / infra teams at small-to-mid B2B SaaS** — the team that owns the shared `.env`, the cross-service schema, and the on-call pager when one team's bad config breaks another. The BetaList post describes "teams" importing services from GitHub and searching one place, so the primary seat is whoever maintains that shared surface today.
2. **Engineering managers who own deploy approvals** — the reviewer the post names in "a single review and merge before fanning out per-service approvals." This seat needs the audit trail and per-service consent flow more than the editing surface.

## MVP Scope

- Workspace + branch model: every config change lands on a branch, with a single workspace-level review and merge step before any service fans out.
- Per-service approval gate: each downstream service has its own consent step; nothing goes live without it. This is the novel shape vs. Doppler/Infisical, which stop at audit logs.
- Impact / risk scoring on a pending change: surface "this affects N services, changes DB schema, hits a validation rule" before the reviewer clicks merge.
- Audit log with full history and per-change rollback target.
- GitHub import so a team can drop in their existing repos and pull service topology automatically.
- Workspace search across all services, envs, and rules.
- Config export in the team's own formats so downstream deploy tooling consumes the merged config without a re-key step.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Self-hostable first: the listed tech (TanStack Start, SQLite via Drizzle, Coolify, Docker) puts the MVP inside the customer's own infra, so the product cannot depend on a managed control-plane round trip to work.
- "Single review + per-service approval" must be a real two-step gate, not a UI decoration — the post sells governance, so the approval enforcement is the value, not the editor.
- GitHub import has to work on the first run without manual topology mapping, because the post frames it as a "drop the repo in" moment.
