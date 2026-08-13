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
---

# Centralized tracking of tasks, time, and attendance for field staff. No unified dashboard, manual entry leads to errors and wasted time. Ready to invest in a solution.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (manager-first, dense dashboard)
- [ ] Provision Firebase EU project + BigQuery EU dataset
- [ ] Stripe Connect application + EU VAT registration
- [ ] Agree payroll export schema with one Andorran payroll provider

## Phase 1: Core

- [ ] Flutter PWA shell, Auth via Firebase, role-based routing (worker vs manager)
- [ ] Worker: check-in (GPS + manual pin-drop), task picker, end-of-task with photo + note
- [ ] Offline queue: SQLite-backed event log, sync on connectivity
- [ ] Manager dashboard: today's roster, per-worker hours, attendance exceptions
- [ ] Cloud Functions: daily rollup of hours + tasks + attendance into BigQuery
- [ ] Payroll CSV export with the agreed schema
- [ ] Notifications: FCM to workers (reminders), email to managers (exceptions)
- [ ] End-to-end test: 5 workers, 1 manager, 1 week of data, 1 payroll run

## Phase 2: Deploy

- [ ] Production deployment (Cloud Run for the SPA, Firebase for the data plane)
- [ ] Recruit 3 pilot SMEs (cleaning crew, maintenance team, last-mile delivery)
- [ ] Onboarding playbook: 30-min setup per SME, 5-min per worker
- [ ] Privacy policy + DPA signed with each pilot SME
- [ ] Public launch in Andorra + immediate Pyrenees region
- [ ] Post-mortem at week 20