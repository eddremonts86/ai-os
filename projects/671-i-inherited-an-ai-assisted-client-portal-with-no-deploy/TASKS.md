---
tags: ["saas", "incident-response", "ai-governance", "devops"]
tech: ["Next.js", "TypeScript", "PostgreSQL", "Drizzle ORM", "Docker", "1Password CLI"]
id: "671"
slug: i-inherited-an-ai-assisted-client-portal-with-no-deploy
title: I inherited an AI-assisted client portal with no deployment history. Where should the cleanup end and ownership begin?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpur3q/i_inherited_an_aiassisted_client_portal_with_no/"
category: saas
date: "2026-08-16"
---## Phase 0: Scaffold

- [ ] Create `apps/671-i-inherited-an-ai-assisted-client-portal-with-no-deploy/` from the playbook template
- [ ] Initialize git with `.gitignore` excluding customer engagement data
- [ ] Write SPEC.md and the matching DESIGN.md tokens (audit-document visual identity)
- [ ] Wire PostgreSQL + Drizzle ORM to the per-engagement workspace
- [ ] Provision the 1Password CLI integration and the credential-rotation tracker
- [ ] Build the structured intake questionnaire renderer (Next.js + TypeScript)
- [ ] Set up the signed-JSON audit-document export pipeline (PDF + JSON)

## Phase 1: Core

- [ ] Structured intake questionnaire (data flow, credentials, personal AI accounts, build artifacts)
- [ ] Inventory generator (credentials, external connections, schema, migrations)
- [ ] Credential-rotation tracker with pre/post verification hashes
- [ ] Migration-history capture (pg_dump + schema diff + git history)
- [ ] Rollback drill reproducer (docker-compose + `make rollback`)
- [ ] Monitoring routing config (named on-call team, runbooks)
- [ ] Exit-criteria checklist with concrete artifacts, tests, and owners
- [ ] Audit-document export (PDF + signed JSON)

## Phase 2: Deploy

- [ ] Coolify deployment of the playbook web app
- [ ] First paid engagement (a B2B SaaS in the $8K-15K containment range)
- [ ] Post-mortem and template refinement after the first engagement
