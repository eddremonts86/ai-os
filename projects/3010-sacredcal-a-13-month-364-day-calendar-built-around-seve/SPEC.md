---
id: "3010"
slug: sacredcal-a-13-month-364-day-calendar-built-around-seve
title: "SacredCal – A 13-month, 364-day calendar built around seven-day cycles"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49340221"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# SacredCal – A 13-month, 364-day calendar built around seven-day cycles

## Problem

The captured post is a Show HN submission pointing only at `https://sacredcal.one`, a calendar built around a 13-month, 364-day structure. Each month has exactly 28 days, which means every month is precisely four seven-day weeks — the same day-of-week pattern repeats month after month. The one-day gap to a normal 365-day year is acknowledged as a structural feature. The source post itself contains no narrative about a problem; it just announces the site. The product idea — a calendar where months are perfectly uniform — is well-known historically (the Cotsworth / International Fixed Calendar tradition) and the source title confirms the implementer is reviving it as a web product.

## Objective

Build a web-first calendar app that lets a user navigate dates using a 13-month, 364-day structure where every month is 28 days and every month starts on a Monday. The MVP lets a user view any year in the new structure, see today's date highlighted, convert Gregorian dates to and from SacredCal dates, and add personal events that recur on the same day-of-week across months because the structure guarantees it. It does not attempt to replace a full calendar ecosystem (no invites, no group scheduling in v1); it is a personal calendar built for the people who find the uniform structure useful.

## Target Users

- A reader of the SacredCal Show HN submission who wants to use the calendar daily, not just look at it once.
- People who already organize their lives around seven-day cycles (religious practice, training programs, payroll schedules) and want a calendar that mirrors the cycle rather than forcing them to read across variable-month boundaries.
- Historically-minded users curious about the Cotsworth / International Fixed Calendar tradition who want a working implementation rather than a museum exhibit.

## MVP Scope

- A year-view screen showing 13 months of 28 days each, with a "Year Day" or leap-day slot outside the months. Every month starts on Monday.
- A month-view screen that highlights today and shows the weekday column at the same offset every month.
- A Gregorian-to-SacredCal date converter (bidirectional, both directions).
- Personal event creation with simple recurring rules (every week, every month on day N, every year).
- Local-only storage of events in the browser (IndexedDB).
- A printable PDF export of any year in the new structure for users who want a paper wall calendar.

## Design Direction

Design direction for the MVP at `https://sacredcal.one` follows the constraints in `3010-.../SPEC.md`. The visual language is calm and grid-forward: thirteen columns of equal width, one per month, no decoration that breaks the symmetry.

**Color** — neutral background, one accent reserved for "today," one muted accent for the Year Day slot to mark that it is outside the cycle.

**Type** — one display family for the year header, one text family for month and day names, one mono family for ISO-ish date codes.

**Density** — high in the year view (13 columns × 4 rows of weeks), generous in the month view.

**Motion** — none beyond month/year transitions. The grid is the interface.

## Constraints

- The MVP does not sync with Google Calendar, Apple Calendar, or any external calendar provider.
- The MVP does not handle group scheduling, invites, or shared events.
- Date math is local to the SacredCal structure; the converter exists only as a utility, not as a bridge to a normal calendar workflow.
- The MVP does not ship a mobile-app shell; the web app should be responsive but is not packaged as a native app in v1.
