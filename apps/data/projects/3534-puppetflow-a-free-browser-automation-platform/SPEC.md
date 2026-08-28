---
id: "3534"
slug: puppetflow-a-free-browser-automation-platform
title: Puppetflow a free browser automation platform
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49476246"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js, Puppeteer, React, InertiaJS, Laravel, SQLite, Docker]
---

# Puppetflow a free browser automation platform

## Problem

Jess, a France-based dev with ~15 years of building software, has spent almost a year on Puppetflow, a source-available browser automation platform that wraps Puppeteer around an explicit focus on observability and debugging. The author built it because every real project kept hitting the same wall: writing the automation was the easy part, but running it and figuring out why it broke was the real pain — which step failed, what was on the page at that moment, what happened before, and what was in the console.

The post lists what Puppetflow ships today: build browser workflows, watch them run live, interact with them through mouse/keyboard emulation, replay old runs, watch logs, and keep a proper execution history. A Blueprint feature lets users publish reusable automations to a community library at github.com/puppetflow/library. An AI hook is available — talk to a model or hand it control of the browser — but the author is explicit that AI is not the default: deterministic workflows are cheaper, faster, and easier to debug when they break.

Two failure modes the author calls out as "much more painful than expected":

- The real-time live view. Keeping the UI in sync while a run is happening was challenging and the author wants to know how competitors are handling it.
- Anti-bot measures. The author plans to experiment with fingerprint-chromium and acknowledges that "making browser automation reliable against increasingly aggressive bot detection is a whole problem of its own I can't handle all by myself."

The stack is openly named in the post: Puppeteer for the browser, Laravel for the backend, vanilla React + InertiaJS for the frontend, SQLite for storage. The author likes "boring technologies" and considers the combination fine. Source lives at github.com/puppetflow/puppetflow; docs at docs.puppetflow.com.

## Objective

Make a failed browser-automation run debuggable in five minutes instead of an afternoon, and let operators replay and intervene in runs after the fact. Concretely, the v1 product must ship the live runner view, the per-step replay, the execution history, the Blueprint library, and a deterministic-by-default engine with an optional AI hook — and survive the anti-bot arms race enough that the workflows stay reliable.

## Target Users

- Developers running Puppeteer (or Playwright, by extension) in production, who are the author's named audience and who currently debug with screenshots, logs, endless retries, and ad-hoc diagnostic tools.
- Teams that want a shared, replayable execution history instead of a folder of screenshots and console logs after every incident.
- Authors of reusable browser workflows who would contribute to a community Blueprint library if the publishing path existed.
- Power users who want the AI hook (talk to a model or hand it control) for cases where deterministic workflows are the wrong tool, even though the author has explicitly chosen deterministic-first.

## MVP Scope

- Live runner view: build a workflow, watch it execute, interact through mouse/keyboard emulation, see logs and the page state in real time.
- Per-run replay: every run is recorded; any past run can be replayed step by step with the same DOM, console, and network state at each step.
- Execution history: persistent record of every run with which step failed, what was on the page, what happened before, and the console contents — the four questions the author named as the real pain.
- Blueprint library: a reusable-workflow format with PR-based publishing to github.com/puppetflow/library, and an in-app browser for community workflows.
- Deterministic-first engine: workflows run without an LLM by default; the AI hook is opt-in and exposed as either "talk to the model" or "let the model drive the browser."
- Anti-bot experimentation layer: fingerprint-chromium or an equivalent to mitigate detection, documented as an arms race rather than a solved problem.

Out of scope for v1: replacing Puppeteer with a from-scratch browser engine, an AI-first default, and any production-grade anti-bot guarantee (the author has stated this is outside one person's scope).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source-available under the GitHub repo, not a closed SaaS. The license is part of the offer.
- Deterministic by default; AI is opt-in. The default path must remain cheap, fast, and reproducible, even when the AI hook is enabled.
- Browser automation is built on Puppeteer, backend on Laravel, frontend on vanilla React + InertiaJS, storage on SQLite. This is the stack the author has chosen and named explicitly.
- The live-view sync problem is a first-class risk: keeping the UI consistent with a running automation is a stated engineering challenge, not an afterthought.
- Anti-bot is an arms race. The platform must not promise what one developer cannot deliver; the constraint is honesty about coverage, not coverage itself.
