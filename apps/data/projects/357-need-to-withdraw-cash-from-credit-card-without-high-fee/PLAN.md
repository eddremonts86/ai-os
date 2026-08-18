---
id: "357"
slug: need-to-withdraw-cash-from-credit-card-without-high-fee
title: Need to withdraw cash from credit card without high fees
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/tp6dgyysf1-need-to-withdraw-cash-from-credit-card-safe"
category: finance
date: "2025-10-10"
tags: [Finance]
country: Portugal
---
# Need to withdraw cash from credit card without high fees

## Tech Stack

SvelteKit (TypeScript) on the front and server, because the form is a single linear intake and the UI is web-first with a Portugal-only user base. PostgreSQL with Drizzle ORM for the audit log of routes the user has picked. Stripe for the partner-ATM top-up leg (recording the fee, not the cash itself). Playwright hosted in a sandboxed worker for the rare case where the partner bank's portal is the only way to surface the user's actual fee — used only where the partner bank's terms permit automated access. Twilio for the SMS confirmation step that lets the user link the platform to their bank account. The stack is chosen for the *form* of the problem: low-volume, route-comparison-heavy, with a clean audit trail.

## Architecture

- **Public intake** — issuer picker, amount field, deadline picker.
- **Route-explainer service** — fetches the fee schedule for the selected issuer (either from a manually maintained catalogue or from a partner-bank API), ranks the routes by total cost, returns the timeline for each.
- **Booking service** — a thin wrapper that, for the chosen route, prepares the next step (e.g., a deep link to the issuer's instalment portal, or a partner-ATM code).
- **Settlement service** — captures the actual fee the user paid, the actual timeline, and the route ID for the audit log.
- **Audit log** — a table of (user, route, fee, date) so the user can re-open and repeat.

## Milestones

1. **Phase 0 — Scaffold**: SvelteKit + TypeScript + Drizzle skeleton, design tokens, public intake route.
2. **Phase 1 — Core**: route-explainer for the top 5 Portuguese issuers, booking step, settlement confirmation, audit log.
3. **Phase 2 — Pilot**: sign the first partner-ATM agreement, run a 100-user pilot in Lisbon and Porto, measure repeat usage.
4. **Phase 3 — Coverage**: extend the issuer catalogue to 12 issuers, add the partner-bank balance-transfer route.

## Risks

- The fee schedule for a Portuguese issuer is updated silently; the team must monitor the partner's pricing page and refresh the catalogue on a fixed cadence.
- The partner-bank portal scraping is brittle; a redesign by the bank breaks the explainer until the team pushes a fix.
- The platform is a routing layer, not a lender; if the user interprets the platform as a lender and the route fails, the platform bears a complaint it cannot answer.
- The "cheapest route" sometimes means the longest timeline; the MVP must show the timeline prominently or the user will pick the cheapest route and then complain about the wait.
- The partner-ATM route requires a real commercial agreement; without it, the MVP is a static explainer and the user walks away after one comparison.
