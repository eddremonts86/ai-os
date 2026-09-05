---
id: "4858"
slug: claude-s-innerworkings-turn-170-costs-2-1x-turn-20-ove
title: "Claude's innerworkings: turn 170 costs 2.1x turn 20, over 14,640 turns"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49552931"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Claude's innerworkings: turn 170 costs 2.1x turn 20, over 14,640 turns

## Problem

On Aug 26, this happened in my CoWork session:Tom: I can't help but think we can do some other cool stuff with this knowledge of Claude's innerworkings regarding sessions, etc. Any thing sticks out to you that I haven't captured/asked for yet?Claude: Six: the scaffolding trend (the cost of our own rules, creeping 87,999 → 92,619 → 93,809 across three seats), the review share of the wall clock (the thesis measured), the session aging curve (when a fresh seat is cheaper), before/after receipts on process changes, model economics, and a crash watchdog reading both records.Four days later, we analyzed 144 sessions, 14,640 turns. The facts showed us that past turn 141, a turn costs 2.1x what a turn cost in the same session's first twenty. https://my-status.app/stats#aging The worst offenders were our own batch sessions, so we stopped batching. Wanna see your own curve? The script is public: https://github.com/lordbron/mystatus-samples/tree/main/claud...What we do is our own flavor of "one thinking session, short task sessions" to better utilize my plan. I kept running out of Fable usage and had about half my usage leftover for Opus.But this only happened because we wrote a script to surface the data to us. (Granted, our first run found a bug in our script: 46.6M tokens that were really 28.1M. https://my-status.app/t/t33hPWp7zmtnAE5G/u/d2ba812d-13bb-4ad...)This peek into the innerworkings of Claude fascinated me, so we kept counting: the standing context re-read every turn (114,133 tokens on the hub seat https://my-status.app/t/6iYmualpgrZ6_C9u/u/2f4d4498-dcdb-43a..., 108,213 on a spoke https://my-status.app/t/Zsse45gEDBTQ6mOL/u/c3f8bca2-b7f9-4be...) and the human's share of the clock (67% https://my-status.app/stats#review).The best part of all this to me: every feature moving forward comes with receipts. Take the aging curve: it cost 2.6 person hours and $8.23 in tokens at list rates. https://my-status.app/receiptsWe have a whole bunch of stats for you to nerd out on if you want. It's a bit overboard, but new things pop up as other things come down. https://my-status.app/statsI know we're not the only ones geeking out about stuff like this. What else have you all measured, and what surprised you in the findings?Oh and if you wanna know what the heck the project was originally built for: it's public task tracking, for things like a 20 mile run https://my-status.app/t/EdiPcBGBZxcGkr9x or which app versions are supported https://my-status.app/t/i3jQU03T46e0hrsk. The experiment behind the project is: Can a human and Claude build something new, splitting the work along what each excels in?

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
