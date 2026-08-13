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

## Problem

Small Andorran businesses with field staff (cleaning crews, maintenance teams, delivery drivers) track tasks in WhatsApp groups, time in a paper notebook, and attendance in a spreadsheet the manager retypes at the end of the week. Payroll falls out wrong; clients get invoiced for work that was never actually done; the manager spends Friday afternoon reconciling three sources of truth.

## Objective

Ship a single mobile-and-web product where each field worker checks in/out from a phone, attaches a task to each block of time, and the manager sees a unified dashboard for tasks completed, hours logged, and attendance anomalies — without anyone retyping data at the end of the week.

## Target Users

- Primary: operations managers at 10–200 person Andorran and Pyrenean SMEs with field crews (cleaning, maintenance, last-mile delivery, small-construction trades).
- Secondary: the field workers themselves, who only need a phone and one or two screens.

## MVP Scope

- Mobile PWA (Flutter web) for field staff: check-in with GPS, task picker, end-of-task with notes and a photo.
- Web dashboard for managers: today's roster, per-worker hours, per-task completion, attendance exceptions.
- Payroll export to a CSV that any Spanish/Andorran payroll provider can ingest.
- Offline-first: the mobile PWA queues events and syncs when connectivity returns.
- No invoicing, no client portal, no scheduling in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must work on Android 9+ devices, including low-end models common among field staff.
- GPS accuracy is unreliable indoors; check-ins must accept a manual pin-drop with a reason code.
- All data must be stored in EU regions (Firebase EU + BigQuery EU) for GDPR compliance.
- Payroll export format must be agreed with at least one Andorran payroll provider before launch.