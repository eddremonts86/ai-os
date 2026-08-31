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

## Problem

Planiflow starts from a coordination failure: tasks live in Asana and meetings live in Google Calendar, so when a new brief arrives nobody sees the real hours left per person. The overload only shows up after the commitment is made. The BetaList capture describes the fix: one weekly view combining tasks, synced calendar meetings and each person's daily capacity, where a green bar means room and a red bar means stop assigning. Day-level granularity matters — someone can hit 130% on a Tuesday even when the week averages fine. Meeting hours count automatically because Google Calendar and Outlook sync both ways.

## Objective

Make the workload visible before the commitment: a weekly per-person view that merges Asana tasks with two-way-synced calendar meetings, compares both against daily capacity, and flags overload days — like a 130% Tuesday — at the moment a new brief is being considered.

## Target Users

- Team leads and project managers who assign incoming briefs and need to see who has room.
- Delivery teams that live in Asana and Google Calendar or Outlook and want their meetings counted automatically.
- Agencies and consultancies where over-committing is the default failure mode before a deadline.

## MVP Scope

- Asana task import with effort or duration mapped per person.
- Two-way sync with Google Calendar and Outlook so meeting hours count as workload.
- Per-person daily capacity settings.
- A weekly view with green and red capacity bars and day-level overload flags (the 130% Tuesday case).

## Constraints

- The capture names only Asana as the task source and Google Calendar and Outlook for meetings; other tools are out of scope for the MVP.
- Two-way calendar sync must not corrupt user calendars; conflict and write-back rules need care.
- Capacity bars depend on honest capacity settings and task estimates; garbage in, garbage out.
- The value is pre-commitment visibility, so the view must answer "who has room" in seconds, not after configuration effort.

## Design Direction

See `DESIGN.md` for this project's design tokens.
