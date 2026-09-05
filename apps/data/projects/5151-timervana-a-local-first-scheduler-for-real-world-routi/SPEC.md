# SPEC.md — TimerVana a Local-first scheduler for real world routines

## Problem

Hi HN, I’m the creator of TimerVana.<p>It&#x27;s not just &quot;another timer app&quot;.  The engineering analogy is a lightweight task scheduler for things people do in the real world. A normal timer models one countdown. TimerVana models a small dependency graph in JSON: some steps run sequentially, others run in parallel, and everything can converge on a target finish time. You can also combine multiple timers (e.g., combine a timer with all the steps to cook a steak + a timer for roasting vegetables).<p>I originally built it because I often set multiple timers and alarms when cooking and got tired of repeatedly juggling separate alarms to get a main dish and several sides ready together. The same model also works for workouts, study sessions, morning routines, and other repeatable processes.<p>The iPhone app is local-first by design [0]. You can create, save, and run timers entirely on your phone without an account or cloud sharing. If you want the networked features, the companion website lets you browse and download timers, upload your own, and share them with other people.<p>Everything available today is free. I may eventually add optional AI-assisted timer creation as a paid feature, but I haven’t settled on the business model or pricing. I&#x27;m more doing this to solve my own problem and hope it will help others as well.<p>I’m interested in whether the underlying abstraction makes sense: does a sequence of dependent and parallel timed steps help you? I’d also appreciate feedback on the balance I took between the completely local experience and the optional sharing layer (I was partially inspired by the old iOS Workflow App, which was acquired by Apple and is now called Shortcuts). Of course, any other feedback very much appreciated.<p>[0]: <a href="https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;timervana-share-complex-timers&#x2F;id6754122976">https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;timervana-share-complex-timers...</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49571102)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T22:47:59Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
