---
id: "870"
slug: need-a-simple-alternative-to-meta-ads-after-andromeda-u
title: Need a simple alternative to Meta Ads after Andromeda update
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-meta-ads-af"
  captured: "2025-10-29"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: USA
wtp:
  raw: $29.99/month
  currency: USD
  min: 29.99
  max: 29.99
  period: month
  mrrMid: 29.99
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Need a simple alternative to Meta Ads after Andromeda update

## Tech Stack

- **Frontend:** React + TypeScript SPA served by TanStack Start.
- **Backend API:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM, all hosted on a single Coolify instance behind Docker.
- **DSP integrations:** The Trade Desk API (OAuth2 + REST) and StackAdapt API (API-key + REST). Each wrapped behind an internal `DSPAdapter` interface so a third DSP can be added later.
- **Auth:** email-link via Resend (passwordless), single workspace per account.
- **Billing:** Stripe Checkout on a single $29.99/month price; webhook updates the `Workspace.subscriptionStatus`.

## Architecture

A single TanStack Start app serves both the marketing site and the authenticated dashboard (route group `(authed)`). The cron runner lives in the same Node process and ticks every 15 minutes: it loads active rules, evaluates each rule against the latest DSP metrics, and posts the resulting bid adjustment via the matching `DSPAdapter`. SQLite stores workspaces, DSP credentials (encrypted at rest), campaigns, rules, and a daily-rollup KPI table that backs the dashboard's charts.

```
Browser ─▶ TanStack Start (marketing + dashboard)
                │
                ├─▶ /api/dsp/connect ──▶ OAuth/API-key handshake ──▶ Drizzle/SQLite
                │
                ├─▶ cron (every 15 min) ──▶ DSPAdapter(s) ──▶ read metrics
                │                          │                  │
                │                          └─▶ apply bid rules│
                │                                             ▼
                │                                          Drizzle/SQLite
                │
                └─▶ Stripe webhook ──▶ Drizzle/SQLite (subscription status)
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + DSP-Adapter interface contracts approved. End of week 1.
2. **M1 — Connect + import.** Connect The Trade Desk via OAuth, list active campaigns, show KPIs. End of week 3.
3. **M2 — StackAdapt adapter.** Same import and KPI surface for StackAdapt; cross-DSP rollup view. End of week 5.
4. **M3 — Bid rules.** Rule builder + 15-minute cron executor; rule dry-run before apply. End of week 7.
5. **M4 — Stripe + trial.** 14-day free trial, Stripe Checkout, workspace status gating. End of week 9.
6. **M5 — Pilot.** 5 agency workspaces onboarded; weekly rule-effectiveness review for the first month. End of week 13.

## Risks

- **DSP API access tier.** The Trade Desk and StackAdapt both have partner programs that gate SMB-tier access. If the launch cannot secure partner status, the MVP cannot talk to real DSP accounts and the only path is a manual CSV import (degrades the time-saved promise).
- **DSP terms-of-service on automated bidding.** Some platforms prohibit fully-automated bid changes without a human-in-the-loop. The rule engine should require explicit user approval on first apply per campaign to stay inside the policy.
- **Cost of cross-DSP analytics at $29.99/month.** Pulling daily KPI rollups from both DSPs is cheap; storing long-retention per-impression data is not. The Drizzle schema must aggregate at write time, not at query time, or the SQLite file grows past what Coolify can back up comfortably.
- **Meta as the original pain surface.** The author's stated trigger was Meta's Andromeda update; if the MVP does not include any Meta surface, the headline claim "alternative to Meta Ads" is partially unfulfilled. Phase-2 Meta adapter should be planned from the start so the v1 architecture does not paint itself into a corner.
