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

## Value Proposition

A polling-style scheduler that flips the question from "when are you busy?" to "when are you free?", so the date that fits the whole group is usually visible on the first screen, before anyone has had to argue.

## Target Users

- Friend groups picking a Saturday night
- Rec-league captains scheduling weekly practice times
- Distributed small teams of 4 to 10 people
- Parents and family members coordinating low-stakes events

## Jobs To Be Done

- When I am planning a group dinner, I want one link that everyone can open on their phone so I do not have to forward screenshots
- When each friend marks their free window, I want the page to show me which date fits all of them so I do not have to do the math
- When we confirm a date, I want a shareable message I can paste into a group chat so the plan actually sticks

## Success Metrics

- 70% of events show at least one "fits everyone" date within the first round of replies
- Median reply time under 4 hours for groups of 6 or fewer
- Reuse: more than half of returning organisers create a second event within 30 days

## Pricing & Monetization

_TODO:_ source did not state a price. No account required, so the business model is unclear; likely ads, a Pro tier for large groups, or sponsored templates.

## Competitive Landscape

- Doodle — established scheduling poll; focuses on "when are you busy", paid tier for power users
- When2Meet — classic "mark when free" grid; dated UI, no mobile-first design
- Calendly, SavvyCal, Cal.com — one-to-one booking, not multi-person free-finding
- Group chats (iMessage, WhatsApp, Slack) — what most groups actually use today; no live overlay

## Risks & Open Questions

- Group activity beyond ~15 people strains the grid view
- Time-zone handling is invisible in the source; needs an explicit story
- Free-tier monetisation is unclear; need to confirm path to revenue