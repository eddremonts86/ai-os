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

## Problem

The author is the administrator of an operational team (Andorra) whose field staff communicate over radio, phone, and messages. Every shift, the author has to log start and end times of tasks by hand from his station because the staff never touches the platform directly. There is no single dashboard for automated time tracking, no reliable record of when each operative was marked present during a roll call, and no way to generate statistics on completed tasks or average response times. Existing project / task management tools require each worker to have their own login — infeasible because only the administrator centralizes the data. Today the workaround is spreadsheets, paper notebooks, and chat logs, with the author watching the clock to write down timestamps by hand, accepting that information is routinely lost or manipulated. The author says they will pay whatever is necessary for a system that centralises control, automates activity timers, and generates statistical reports on its own, so the headline cost is the manual labour hours plus the risk of inaccurate payroll / attendance evidence.

## Objective

Ship a one-admin, many-operatives attendance-and-activity console where the administrator is the only person who logs in, captures every task start / stop and every roll-call attendance in real time, and gets automatic statistical reports (tasks per shift, average response time, attendance hours, frequency of activity types) without per-worker onboarding. The MVP must (1) be operable from a single workstation, (2) never require each operative to hold an account, (3) auto-stamp timestamps at the moment of capture, (4) produce shift-level and team-level reports the author can export.

## Target Users

- Primary: shift administrators / dispatchers in operations teams (security, logistics, cleaning, field maintenance, on-call IT) who personally log every event from a single console because their operatives cannot or will not log in themselves.
- Secondary: small operations managers (≤ 20 staff) who currently rely on paper notebooks or Excel and want a tamper-resistant digital trail for payroll and audit.
- Tertiary: compliance or HR reviewers who need timestamped evidence of attendance and task completion for payroll disputes or incident reviews.

## MVP Scope

- Single-admin web console (browser-only, no per-operative app), authenticated by email-link or local credentials.
- Quick-capture UI: a roster of named operatives, each row exposing `Start shift`, `End shift`, `Start task`, `End task`, `Mark present at HH:MM`. Every click stamps the current server time; no manual time entry in v1.
- Live dashboard: current shift state per operative (on shift / on task / off shift / present at last roll call) with elapsed timers.
- Roll-call mode: a one-click "roll call now" that marks every active operative as present at the captured timestamp, with a downloadable attendance audit.
- Automatic reports: tasks per shift, average response time, total on-shift minutes per operative per day / week / month; exportable to CSV.
- Audit log: every admin action (start / end / roll call) recorded with admin id, operative id, action, timestamp; append-only.
- Multi-workspace support is out of scope in v1: one deployment serves one admin's team.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The only logged-in user is the administrator; no per-operative accounts, no operative-side apps, no operative-side web pages. Operative data is captured by the admin, never self-asserted.
- Server-stamped timestamps (UTC, with display in admin's timezone); the admin must never be able to type a custom time in v1 to keep the audit trail honest.
- Must run on a single Coolify instance with SQLite so a small operator can self-host without DBA work or external SaaS dependence.
- Reporting data must survive shift boundaries (midnight rollover) without losing the original `created_at` UTC stamp.
- The author did not name a specific price; pricing must be calibrated against ROI (hours of admin time saved per week), not a stated ceiling.
