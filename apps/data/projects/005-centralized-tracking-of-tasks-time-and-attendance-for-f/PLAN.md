---
id: "005"
slug: centralized-tracking-of-tasks-time-and-attendance-for-f
title: "Centralized tracking of tasks, time, and attendance for field staff. No unified dashboard, manual entry leads to errors and wasted time. Ready to invest in a solution."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/tzvsp6sib1-centralized-tracking-of-tasks-time-and-a"
  captured: "2026-07-17"
category: productivity
date: "2026-07-17"
tags: [Productivity, Business, Other]
country: Andorra
tech: [Flutter, Firebase, Cloud Functions, BigQuery]
---
# Centralized tracking of tasks, time, and attendance for field staff. No unified dashboard, manual entry leads to errors and wasted time. Ready to invest in a solution.

## Tech Stack

- **Mobile:** Flutter (web build as PWA), SQLite for the offline queue.
- **Backend:** Firebase Auth + Firestore (EU region) for the live data plane; Cloud Functions for derived aggregates.
- **Analytics warehouse:** BigQuery (EU) for the dashboard and payroll exports.
- **Notifications:** FCM for the mobile app; email via SendGrid (EU residency) for managers.
- **Billing:** Stripe with EU tax handling.

## Architecture

A self-contained high-level architecture diagram lives at [`assets/field-staff-tracker-high-level.html`](assets/field-staff-tracker-high-level.html) (open in any browser; SVG rendered inline, no server required).

Two data planes: a Firestore hot path that field workers and the dashboard read in real time, and a BigQuery cold path that rolls up daily for payroll and BI. The Cloud Functions maintain the rollup.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + first customer's worker list. End of week 2.
2. **M1 — Mobile check-in.** GPS + manual pin-drop, offline queue, end-of-task photo upload. End of week 6.
3. **M2 — Manager dashboard.** Today's roster, per-worker hours, attendance exceptions. End of week 10.
4. **M3 — Payroll export.** BigQuery rollup, CSV with the agreed schema. End of week 14.
5. **M4 — Pilot with 3 Andorran SMEs.** End of week 20.

## Risks

- **EU-only data residency** — Firebase EU is available but BigQuery EU must be configured correctly; one mistake here is a GDPR breach.
- **GPS reliability indoors** — Andorran field sites include mountain hotels and underground parking; the manual pin-drop with a reason code is mandatory, not a fallback.
- **Worker adoption** — the mobile app must be no-thinker usable; if field workers need training, the SME churns in 30 days.
