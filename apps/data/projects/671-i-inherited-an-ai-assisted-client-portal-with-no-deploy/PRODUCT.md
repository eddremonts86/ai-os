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

> Product brief for the two-phase containment + stabilization playbook described in the source post.

## Value Proposition

An engineering lead can take an undocumented AI-built production service from "we cannot prove what is running" to a verified inventory, a tested rollback, and a written handoff in a bounded engagement — without becoming the permanent owner of the service.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Engineering leads | Inherited undocumented service from a former teammate; need an off-ramp. |
| VPs of Engineering | Need a defensible audit trail before a customer security review. |
| CTOs | Need to consolidate AI-assisted work into the normal controls before SOC 2. |
| Customer Success managers | Need to know the portal they depend on will not break during cleanup. |

## Jobs To Be Done

1. **Functional job** — Produce a verified inventory, a credential-rotation plan, a migration history, and a tested rollback for an undocumented service.
2. **Functional job** — Transfer permanent ownership of the service to a named team via written exit criteria.
3. **Emotional job** — Stop being the only person who knows what is running.
4. **Social job** — Survive the next customer security review without scrambling.

## Success Metrics

- **Containment:** every credential and external connection is inventoried and rotated; every personal AI account is removed from the production path.
- **Stabilization:** a clean build reproduces the running artifact; every schema change is in a migration history; a rollback drill succeeds; monitoring routes to a named team.
- **Handoff:** a written exit-criteria document is signed by both the inheriting engineer and the receiving team; the service has a named permanent owner.
- **Customer impact:** zero unplanned downtime for customer-facing flows during containment and stabilization.

## Pricing & Monetization

Engagement-based: $8,000-15,000 per containment phase, $15,000-30,000 per stabilization phase, depending on the size of the service. Recurring annual retainer for the "next-time" playbook updates and the next SOC 2 cycle.

## Competitive Landscape

- **Big-4 consultancies** — expensive (>$100K), slow (weeks to mobilize), over-scoped for a mid-sized SaaS.
- **Freelance DevOps consultants** — variable quality, no playbook, no exit criteria discipline.
- **Internal-only playbooks** — exist in pockets but rarely survive the engineer who wrote them.
- **No comparable product** — the closest analogues are incident-response retainers, but those assume a working service; this one assumes the opposite.

## Risks & Open Questions

- [ ] The customer security review timeline is the external clock; if it arrives before containment is complete, the engagement has already failed.
- [ ] The personal AI accounts in the production path may have left artifacts the inventory cannot surface (cached keys, browser session tokens); the playbook needs a "what we cannot verify" section.
- [ ] The receiving team may not exist yet; the exit-criteria document is a forcing function for org design as much as it is for engineering.
