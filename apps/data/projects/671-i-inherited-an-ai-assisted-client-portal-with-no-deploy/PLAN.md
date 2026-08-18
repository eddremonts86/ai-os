---
id: "671"
slug: i-inherited-an-ai-assisted-client-portal-with-no-deploy
title: I inherited an AI-assisted client portal with no deployment history. Where should the cleanup end and ownership begin?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpur3q/i_inherited_an_aiassisted_client_portal_with_no/"
category: saas
date: "2026-08-16"
tags: [saas, incident-response, ai-governance, devops]
tech: [Next.js, TypeScript, PostgreSQL, Drizzle ORM, Docker, "1Password CLI"]
---
# I inherited an AI-assisted client portal with no deployment history. Where should the cleanup end and ownership begin?

## Tech Stack

- **Playbook runtime:** Markdown + a structured questionnaire rendered as a static web app (Next.js + TypeScript) for the customer-facing containment checklist.
- **Inventory storage:** PostgreSQL via Drizzle ORM; per-engagement workspace, customer-isolated.
- **Credential rotation tracker:** 1Password CLI integration; the playbook records every rotation with pre/post verification hashes.
- **Migration history capture:** introspection scripts against the running database (pg_dump + schema diff) plus git history of the migrations directory.
- **Rollback drill:** docker-compose reproducer of the running service; `make rollback` target that restores from a snapshot.
- **Audit-document export:** PDF + signed JSON, attached to the engagement record.

## Architecture

The service is delivered as an engagement: the playbook runs against the customer's production system, the artifacts are stored in the customer's workspace, and the final audit document is exported to the customer's storage (S3 or local). The vendor never holds the customer's credentials or production data after the engagement closes.

## Milestones

1. **M0 — Engagement intake.** Customer fills in the structured questionnaire (data flow, credentials, personal AI accounts, build artifacts). End of week 1.
2. **M1 — Containment.** Inventory + credential rotation + freeze + personal-account removal. End of week 2.
3. **M2 — Stabilization.** Reproducible build + migration history + rollback drill + monitoring routed. End of week 4.
4. **M3 — Handoff.** Exit-criteria document signed by both sides; permanent owner named. End of week 5.

## Risks

- **Customer security review timeline** — the external clock cannot be moved; if the playbook cannot run fast enough, the engagement fails by definition.
- **Personal AI account artifacts** — cached keys and session tokens may be invisible to the inventory; the playbook needs a "what we cannot verify" section.
- **Receiving team not yet staffed** — the exit-criteria document is a forcing function for org design; without a named receiving team, the engagement stalls.
