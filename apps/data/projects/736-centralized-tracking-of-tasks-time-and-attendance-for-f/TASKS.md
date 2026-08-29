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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md tokens (admin console chrome, operative row, capture-button states)
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Resend email-link auth (single admin per workspace)
- [ ] Decide Drizzle schema: `workspaces`, `operatives`, `events` (append-only), `current_state`, `daily_rollups`, `audit_exports`

## Phase 1: Core

- [ ] Operative roster CRUD (name, role, active flag) — no per-operative login
- [ ] Capture endpoints: `/api/events/start-shift`, `/api/events/end-shift`, `/api/events/start-task`, `/api/events/end-task`; all server-stamped UTC, no client time
- [ ] Live dashboard: per-operative row with current state (on shift / on task / off shift) and elapsed timer since last event
- [ ] Roll-call mode: one-click "roll call now" marks every active operative present at the captured timestamp; downloadable attendance audit
- [ ] Append-only `events` table with `admin_id`, `operative_id`, `action`, `created_at_utc`, optional `note`
- [ ] Nightly cron into `daily_rollups` keyed on `(workspace_id, operative_id, local_date)` to keep DST rollovers sane
- [ ] Reports: tasks-per-shift, average response time (time between `start-task` and `end-task`), attendance-minutes per operative per day / week / month
- [ ] CSV export streamed from a TanStack Start server function, with optional anonymisation flag
- [ ] Workspace status gating: read-only after Stripe trial ends without subscription
- [ ] End-to-end test: simulate one 8-hour shift with 4 operatives and 20 tasks, confirm dashboard, roll-call, and CSV export round-trip

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 5 pilot admin workspaces
- [ ] Set up status page + capture-endpoint monitoring
- [ ] Post-mortem after week 12 with pilot cohort; calibrate price tiers against observed ROI
