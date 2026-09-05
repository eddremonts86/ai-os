---
id: "4194"
slug: that-works-find-a-time-that-works-for-the-whole-group
title: "That works - Find a time that works for the whole group"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509567"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# That works - Find a time that works for the whole group

## Problem

Group scheduling tools ask every invitee to mark themselves busy before they can show you a free slot. That works flips the script: the organiser shares a link, every person adds when they are free, and the page shows the day that fits everyone in a single shared view. The site (thatworks.ca) opens with the line "Find a day that works for everyone" and shows a three-step flow — create a calendar, share the link, everyone adds their availability, the page returns the date that fits. The example shown is a 6-person Italian Night scheduled on Saturday the 3rd, with each person logged (Jay is free 6–10 pm). The intent is to invert Doodle's "when are you busy" flow into a "when are you free" flow so the first proposal usually lands without a follow-up round.

## Objective

Make picking a group date feel like writing a poll that already answers itself: the organiser shares one link, invitees mark when they are free, and the page shows the date that fits everyone on first open.

## Target Users

- Friend groups planning dinners, game nights, weekend trips, and small celebrations
- Small clubs and rec leagues picking weekly practice times
- Distributed teams of 4 to 10 people who would rather not play Doodle email tag
- Parents coordinating kids' playdates and birthday parties

## MVP Scope

- Single-page calendar where the organiser picks candidate dates
- Shareable link with no account required
- Each invitee taps the slots they are free
- Live-updating overlay showing which date fits everyone
- One-click "this date works" confirmation and a copy-to-clipboard share message
- Mobile-first layout, no install, no signup

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- No accounts, no email collection, no cross-event tracking
- Privacy default: availability is per-link and per-cookie; deleting the browser session clears the schedule
- Mobile-first rendering; the page must work end-to-end on a phone without zoom
- Single OpenAI-compatible endpoint not required — the entire flow fits a static page plus a tiny backend