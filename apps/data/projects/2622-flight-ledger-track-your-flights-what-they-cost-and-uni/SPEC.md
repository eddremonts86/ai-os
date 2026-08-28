---
id: "2622"
slug: flight-ledger-track-your-flights-what-they-cost-and-uni
title: "Flight Ledger – Track your flights, what they cost, and United status"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49395637"
category: show-hn
date: "2026-08-22"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Flight Ledger – Track your flights, what they cost, and United status

## Problem

Hello HN,Flight Ledger is a private ledger of your flights, focused on (but not limited to) the United Airlines ecosystem. I am a physicist who has been based near two United hubs, first SFO and now IAH, and I fly United a lot, mostly for work.I built this app to track my flights, flight expenses, and Premier status qualification without having to log into various accounts. All the imports (such as MileagePlus activity csv, .eml receipts, or Flighty/myFlightRadar24 exports) and data filling are manual.A primary feature is that the app requires no sign-up and has no backend. Everything is stored locally, using SQLite and WebAssembly. This means that frequent back-ups are advisable to avoid losing data. For more robust backups and multi-device sync, the app also supports sync via Google Drive. I use this option for myself, but would be curious about other possible solutions.Perhaps the main features that differentiate it from other apps are that the app tracks costs and metrics like CPM (cost per mile), United-specific PQP, PQF, and award miles, and allows one to differentiate out-of-pocket and reimbursed expenses. It also includes other things such as route tracking and a lifetime mile tracker.While I have extensive programming experience in scientific computing and C++, my experience in web applications is more limited, and this app was built with Claude Code, which is unsurprising in this day and age, I guess. It is open source: https://github.com/vlvovch/flight-ledgerCurious to see your thoughts. I have particularly struggled with parsing various receipts, especially ticket reissue chains, and will be interested to know if the parser will survive yours.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
