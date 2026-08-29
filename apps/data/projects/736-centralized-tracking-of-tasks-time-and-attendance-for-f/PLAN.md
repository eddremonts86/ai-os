---
id: "736"
slug: centralized-tracking-of-tasks-time-and-attendance-for-f
title: "Centralized tracking of tasks, time, and attendance for field staff. No unified dashboard, manual entry leads to errors and wasted time. Ready to invest in a solution."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/tzvsp6sib1-centralized-tracking-of-tasks-time-and-a"
category: productivity
date: "2026-06-02"
tags: [Productivity, Business, Other]
country: Andorra
wtp:
  raw: willing to invest whatever is necessary
  currency: USD
  period: one-shot
  note: "Author stated an open-ended willingness to pay but did not name a specific amount. Pricing must therefore be calibrated by ROI, not by a stated ceiling."
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Centralized tracking of tasks, time, and attendance for field staff

## Tech Stack

- **Frontend:** React + TypeScript SPA served by TanStack Start, single admin view optimised for keyboard shortcuts (Shift = start shift, T = start task, etc.) and one-click capture.
- **Backend:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM, all hosted on a single Coolify instance behind Docker.
- **Time authority:** server-side `Date.now()` (UTC); the client displays the admin's IANA timezone via `Intl.DateTimeFormat`. The API never accepts a client-supplied timestamp for capture events in v1.
- **Auth:** email-link via Resend (passwordless), single admin per workspace in v1.
- **Reports:** server-side aggregation over the audit log into a daily-rollup table; CSV export streamed from a TanStack Start server function.
- **Billing:** Stripe Checkout on the workspace plan; webhook updates `Workspace.subscriptionStatus` and gates the trial-to-paid transition.

## Architecture

A single TanStack Start app serves both the marketing site and the authenticated console (route group `(authed)`). Every capture endpoint stamps the event with the server's UTC time and the admin's user id, then writes an append-only row to `events` and updates the operative's denormalised `current_state` row for the live dashboard. A nightly cron rolls events up into `daily_rollups` keyed by `(workspace_id, operative_id, date)` so the reports endpoint reads a small precomputed table instead of scanning the audit log every request.

```
Browser (admin only) ─▶ TanStack Start (marketing + console)
                              │
                              ├─▶ /api/events/start-shift  ──┐
                              ├─▶ /api/events/end-shift    ──┤
                              ├─▶ /api/events/start-task   ──┤──▶ Drizzle/SQLite
                              ├─▶ /api/events/end-task     ──┤        │
                              ├─▶ /api/events/roll-call    ──┘        │
                              │                                         ▼
                              │                              events (append-only)
                              │                              current_state (live)
                              │                              daily_rollups (nightly)
                              │
                              ├─▶ /api/reports/...        ──▶ CSV export
                              │
                              └─▶ Stripe webhook          ──▶ Workspace.subscriptionStatus
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md approved; Drizzle schema (operatives, events, current_state, daily_rollups) approved. End of week 1.
2. **M1 — Capture + live dashboard.** Start / end shift and start / end task per operative; live dashboard with elapsed timers; server-stamped timestamps. End of week 3.
3. **M2 — Roll-call mode + audit log.** One-click "roll call now" marks every active operative as present; downloadable attendance audit. End of week 4.
4. **M3 — Daily rollups + reports.** Nightly cron into `daily_rollups`; tasks-per-shift, average response time, attendance-minutes reports; CSV export. End of week 6.
5. **M4 — Stripe + trial.** 14-day free trial, Stripe Checkout, workspace status gating. End of week 8.
6. **M5 — Pilot.** 5 admin workspaces onboarded; weekly review of audit-trail integrity for the first month. End of week 12.

## Risks

- **Manual time entry is forbidden by design.** Operators sometimes need to back-fill an event reported by radio. If the strict no-back-fill rule frustrates real workflows, the system loses trust; mitigation is a flagged back-fill flow with a mandatory reason field, deferred to v1.x.
- **Single admin = single point of failure.** If the admin is unavailable, no one captures events. Mitigation: support a delegated "acting admin" mode in v1.x, not v1.
- **Timezone rollover at DST.** Storing UTC and displaying local time means the boundary shifts twice a year; daily rollups must key on the admin's local date, not UTC date, to avoid splitting a shift across two "days". Mitigation: rollup key is `(workspace_id, operative_id, local_date)`.
- **Pricing calibration.** The author did not name a price; the proposed €19/€49 tiers are anchored on comparable tools (Buddy Punch, TimeClock Plus) and on ROI math, not on a stated ceiling. Mitigation: A/B-test price points during pilot.
- **GDPR-style privacy.** The audit log stores per-operative attendance even though no operative logs in. Mitigation: documented redaction procedure and a config flag to anonymise operative names in exports for sensitive deployments.
- **SQLite at scale.** A 100-operative team logging 200 events per shift × 3 shifts per day ≈ 180k rows per month. Comfortable for SQLite; mitigation is the `daily_rollups` pre-aggregation that keeps the reports endpoint cheap.
