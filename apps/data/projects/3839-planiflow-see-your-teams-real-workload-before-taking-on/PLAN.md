---
id: "3839"
slug: planiflow-see-your-teams-real-workload-before-taking-on
title: "Planiflow – See your team's real workload before taking on new projects"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/planiflow?utm_campaign=startup-180134&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-30"
tags: [BetaList, Beta, Product]
tech: [Asana task sync, Google Calendar two-way sync, Outlook two-way sync, Per-person daily capacity model, Weekly capacity view, Overload detection with green and red bars]
---
# Planiflow – See your team's real workload before taking on new projects

## Tech Stack

- **Asana task sync:** imports tasks with assignee, dates and effort fields.
- **Google Calendar two-way sync:** reads events and writes back so meeting hours count automatically.
- **Outlook two-way sync:** the same contract through the Microsoft Graph calendar APIs.
- **Per-person daily capacity model:** capacity per day, not per week, so a 130% Tuesday is visible.
- **Weekly capacity view:** one screen per team with green and red bars per person per day.
- **Overload detection:** day-level thresholds that flag over-assignment even when the week averages fine.

## Architecture

- **Sync workers:** poll Asana and both calendars; reconcile into a unified person-day workload model.
- **Workload store:** tasks and meeting hours per person per day, with change history.
- **Capacity engine:** compares load versus capacity per day, producing green and red signals.
- **Web app:** the weekly view; briefs can be checked against capacity before commitment.
- **Write-back:** calendar edits applied via two-way sync with conflict rules.

## Milestones

1. **M0 — Asana in, capacity out.** Import tasks, set daily capacity, render the weekly green and red view.
2. **M1 — Calendar sync.** Two-way Google Calendar and Outlook sync so meetings count automatically.
3. **M2 — Overload detection.** Day-level flags like the 130% Tuesday, with per-day drill-down.
4. **M3 — Pre-commitment workflow.** Check incoming briefs against the view and record the decision.

## Risks

- **Sync staleness:** a meeting booked 30 seconds ago must appear fast or the view loses trust.
- **Two-way sync conflicts** (double-booked, deleted events) need explicit resolution rules.
- **Narrow integrations** limit the addressable audience to Asana-plus-Google-or-Microsoft shops.
- **Behavioral risk:** teams may treat bars as performance dashboards rather than planning signals.
