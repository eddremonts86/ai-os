---
id: "809"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-pa
title: "Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/u3yh16ty81-startup-teams-have-nowhere-to-find-relev"
  captured: "2026-01-03"
category: startups
date: "2026-01-03"
tags: [Startups, Research, Other]
country: Russia
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Tech Stack

- **Frontend:** React with TypeScript, bilingual (Russian + English) via i18next.
- **Backend API:** Node.js (TanStack Start) handling screener builder, respondent pool, interview booking, and escrow.
- **Database:** SQLite via Drizzle ORM (file-based, fits the Coolify + Docker one-VPS model).
- **Consistency check:** A small heuristic service that scores open-text answers for plausibility (length, vocabulary diversity, named-tool references) before releasing the payout.
- **Payments:** Stripe Connect with manual payout — platform holds the interview fee in escrow, releases on consistency-pass.
- **Hosting:** Coolify on a single Hetzner CX22 (or equivalent), Docker Compose for app + reverse proxy.

## Architecture

```
Browser ─▶ TanStack Start (SSR + route handlers)
              │
              ├─▶ SQLite (Drizzle) — screeners, respondents, interviews, ratings, payouts
              │
              ├─▶ Consistency check service — heuristic + LLM-assisted scoring
              │
              └─▶ Stripe Connect (escrow + payouts)
```

The interview lifecycle is a state machine: screener live → respondent applies → booked → completed → consistency-checked → payout released (or rebook on inconsistency). Each transition is explicit so the consistency check cannot be skipped.

## Milestones

1. **M0 — Screener builder + first 50 vetted respondents.** Persona fields, 3-question consistency screen, identity verification. End of week 2.
2. **M1 — Booking + escrow.** Calendar invite, $25–$150 tiered payout, Stripe Connect escrow. End of week 5.
3. **M2 — Consistency check.** Heuristic + LLM-assisted scoring; auto-release on pass, manual review on flag. End of week 8.
4. **M3 — Post-interview ratings.** Both sides rate; low-rating respondents drop out of the pool. End of week 11.
5. **M4 — Bilingual launch.** Russian + English UI live. End of week 14.

## Risks

- **Professional-respondent gaming** — a respondent passes verification and then games the consistency check. Mitigation: per-respondent pattern detector (answer text similarity across interviews, suspiciously fast completion times); manual review on flag.
- **Screener-design asymmetry** — a team writes a screener so loose that any respondent matches. Mitigation: per-screener quality rubric enforced before going live; review queue for first-100 screeners.
- **Rebook cliff** — a consistency-flag triggers a rebook, but the team has already spent the interview slot. Mitigation: explicit "consistency flags trigger rebook, not refund" policy surfaced before booking; team-side credit for the rebook slot.
- **Respondent-side churn** — payouts feel too low to keep non-professional respondents coming back. Mitigation: per-persona payout floor adjusted quarterly; bonus for high team-side ratings.