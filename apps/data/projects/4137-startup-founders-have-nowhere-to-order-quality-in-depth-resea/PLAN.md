---
id: "4137"
slug: startup-founders-have-nowhere-to-order-quality-in-depth-resea
title: "Startup founders have nowhere to order quality, in-depth research on specific projects or niches — existing services provide superficial and unreliable reports"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/h2y1qxkk71-startup-founders-have-nowhere-to-order-q"
  captured: "2026-01-06"
category: startups
date: "2026-01-06"
tags: [Startups, Research, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Startup founders have nowhere to order quality, in-depth research on specific projects or niches — existing services provide superficial and unreliable reports

## Tech Stack

- **Frontend:** React with TypeScript, single-page app served from Coolify.
- **Backend API:** Node.js (TanStack Start) handling brief intake, researcher matching, payment escrow, and delivery.
- **Database:** SQLite via Drizzle ORM (file-based, fits the Coolify + Docker one-VPS model).
- **Payments:** Stripe Connect with manual payout — platform holds the brief fee in escrow, releases on founder approval or 7-day auto-approve window.
- **Source-citation tooling:** A simple markdown pre-processor that flags every URL in a draft report and requires the reviewer to mark each one as "verified" before delivery.
- **Hosting:** Coolify on a single Hetzner CX22 (or equivalent), Docker Compose for app + reverse proxy.

## Architecture

```
Browser ─▶ TanStack Start (SSR + route handlers)
              │
              ├─▶ SQLite (Drizzle) — briefs, researchers, reports, reviews, payouts
              │
              ├─▶ Source-citation pre-processor — flags every URL, requires reviewer mark
              │
              └─▶ Stripe Connect (escrow + payouts)
```

The brief → report → review → delivery flow is a state machine: matched → drafting → reviewer-verified → delivered → founder-approved → payout. Each transition is an explicit state change, never an implicit jump, so the source-citation review step cannot be skipped.

## Milestones

1. **M0 — Brief intake + researcher pool.** First 20 vetted researchers, intake form, manual matching. End of week 2.
2. **M1 — Report template + source-citation tool.** Standard 5/15/30-page template, URL flagging, reviewer mark UI. End of week 5.
3. **M2 — 2-pass review + delivery.** Researcher draft → reviewer verify → founder delivery. End of week 8.
4. **M3 — Stripe Connect escrow + payouts.** $500/$1,500/$3,000 tiers wired, 7-day auto-approve. End of week 11.
5. **M4 — Opposing-view section.** Required template section before reviewer can mark "verified". End of week 14.
6. **M5 — Researcher growth.** Onboarding rubric + reviewer-vetted cohort expansion. Ongoing.

## Risks

- **Source-citation bypass** — researcher leaves URLs unflagged and reviewer marks them without checking. Mitigation: random spot-check of delivered reports by a separate reviewer; 1 confirmed bypass = researcher removed.
- **Researcher off-platform diversion** — researchers find founders directly and skip the platform fee. Mitigation: brief-intake data is on-platform only; researchers see the brief after matching, never the founder's contact details; payouts only via Stripe Connect on-platform.
- **Founder disappointment** — a $3,000 report doesn't land the answer the founder wanted. Mitigation: pre-brief call (charged separately) to align on the deliverable spec; explicit "this is research, not a decision" framing in the template.
- **Quality drift** — researcher quality drops as the cohort grows. Mitigation: per-researcher satisfaction rating + first-3-briefs probation with mandatory review.
