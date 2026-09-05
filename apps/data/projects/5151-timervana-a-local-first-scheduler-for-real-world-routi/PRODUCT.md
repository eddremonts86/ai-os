---
id: "5151"
slug: timervana-a-local-first-scheduler-for-real-world-routi
title: TimerVana a Local-first scheduler for real world routines
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49571102"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# TimerVana a Local-first scheduler for real world routines

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, I’m the creator of TimerVana.It's not just "another timer app". The engineering analogy is a lightweight task scheduler for things people do in the real world. A normal timer models one countdown. TimerVana models a small dependency graph in JSON: some steps run sequentially, others run in parallel, and everything can converge on a target finish time. You can also combine multiple timers (e.g., combine a timer with all the steps to cook a steak + a timer for roasting vegetables).I originally built it because I often set multiple timers and alarms when cooking and got tired of repeatedly juggling separate alarms to get a main dish and several sides ready together. The same model also works for workouts, study sessions, morning routines, and other repeatable processes.The iPhone app is local-first by design [0]. You can create, save, and run timers entirely on your phone without an account or cloud sharing. If you want the networked features, the companion website lets you browse and download timers, upload your own, and share them with other people.Everything available today is free. I may eventually add optional AI-assisted timer creation as a paid feature, but I haven’t settled on the business model or pricing. I'm more doing this to solve my own problem and hope it will help others as well.I’m interested in whether the underlying abstraction makes sense: does a sequence of dependent and parallel timed steps help you? I’d also appreciate feedback on the balance I took between the completely local experience and the optional sharing layer (I was partially inspired by the old iOS Workflow App, which was acquired by Apple and is now called Shortcuts). Of course, any other feedback very much appreciated.[0]: https://apps.apple.com/us/app/timervana-share-complex-timers...

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49571102) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
