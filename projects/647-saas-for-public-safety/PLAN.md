---
id: "647"
slug: saas-for-public-safety
title: SaaS for Public safety?
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Web app (Next.js), Postgres + per-agency tenancy, mobile-first responsive UI (dispatchers rarely sit at a desk), audit-log table with append-only semantics, SSO suitable for public-sector IT.

## Architecture

Per-agency tenant in Postgres → role-based access → shift-handoff record + audit log → optional CAD/records integration hooks. Read-heavy audit query path; write path is the handoff event itself.

## Milestones

- [ ] Handoff record schema + audit log
- [ ] Web UI for outgoing/incoming dispatcher
- [ ] Mobile-responsive layout for desktop and tablet
- [ ] SSO + role-based access
- [ ] Per-agency admin (user provisioning, retention policy)
- [ ] Pilot reference program (poster's agency → sister agency)

## Risks

- GTM risk dominates technical risk; the product may be fine while sales stall.
- Compliance bar (CJIS, records retention) is non-negotiable and expensive to retrofit.
- One-customer references do not generalise; second-customer learning loop is the unlock.
