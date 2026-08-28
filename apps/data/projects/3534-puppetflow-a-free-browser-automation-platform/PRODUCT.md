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

> Auto-generated brief rewritten. Source-grounded.

## Value Proposition

Puppetflow is a source-available browser automation platform built on Puppeteer that treats the hard part of automation — running, observing, and debugging workflows in production — as the actual product. The author (Jess, dev in France, ~15 years building software) had spent a year hitting the same wall on real projects: writing the script was easy, but figuring out why it broke in production was not. Puppetflow's answer is a deterministic-by-default engine with a live runner view, per-step replay, persistent execution history, a Blueprint library of reusable workflows, and an opt-in AI hook for the cases where deterministic workflows are the wrong tool.

The platform is explicitly not AI-first. The author has named the reasoning: AI is expensive, slow, and unpredictable when it breaks; deterministic workflows are easier to debug when they go wrong, and they will go wrong. AI is exposed as "talk to the model directly" or "hand it control of the browser" when needed. Two named engineering challenges are still open: keeping the live UI in sync with a running workflow, and surviving the anti-bot arms race (the author is experimenting with fingerprint-chromium and has explicitly asked the community for help).

**One-liner:** Source-available browser automation on Puppeteer where the live runner, replay, execution history, and community Blueprints are the product — deterministic by default, AI optional.

## Target Users

- Developers running Puppeteer (or Playwright) in production who currently debug with screenshots, logs, endless retries, and ad-hoc diagnostic tools — the author's named audience.
- Teams who need a shared, replayable execution history so post-mortems do not start from "what page was it on?".
- Authors of reusable workflows who would contribute to a community library if the path from "my workflow" to "shared Blueprint" were short.
- Power users who want an opt-in AI surface (chat or browser control) without paying the deterministic-first tax on every run.

## Jobs To Be Done

- When a workflow fails in production, answer the four questions the author named in the order a developer asks them: which step failed, what was on the page, what happened before, what was in the console.
- When a developer is writing a new workflow, watch it execute live and steer it through mouse/keyboard emulation instead of restarting from scratch.
- When an incident is post-mortemed, replay the exact failing run step by step, with the same DOM, console, and network state at each step.
- When a team wants to stop reinventing the same workflow, pull a Blueprint from the community library at github.com/puppetflow/library and run it locally.
- When a deterministic workflow hits a step AI would handle better, switch on the AI hook (chat or browser control) without rewriting the workflow.

## Success Metrics

- Time-to-first-answer on a failed run: a developer can name the failing step, page state, prior steps, and console contents within five minutes of opening the trace.
- Replay fidelity: a replayed run produces the same DOM, console, and network trace at each step as the original run.
- Blueprint adoption: published Blueprints in the community library, measured by import rate and reuse, not just uploads.
- Determinism by default: the share of runs that complete without invoking the AI hook; the author has chosen this metric implicitly by naming determinism as the default and AI as the opt-in.
- Author outreach loop: feedback channels that surface "what's failing, how do you troubleshoot it, what feels unnecessary" — the three questions the author is asking the community.

## Competitive Landscape

The post does not name competitors or claim benchmark numbers against them. It does ask the community directly: "If you use Puppeteer, Playwright or browser automation in production, I'd really like to know how you make it work today."

- Compared to raw Puppeteer (or Playwright) scripts, Puppetflow adds live viewing, replay, execution history, and a workflow layer — the parts the author says were the real pain.
- Compared to AI-first browser agents, Puppetflow is explicitly deterministic-first; the AI hook is opt-in and the author has named cost, speed, and unpredictability as the reasons not to default to it.
- Compared to enterprise browser-automation platforms, Puppetflow is source-available, single-developer-built, and honest about the anti-bot arms race being outside one person's scope.

## Risks & Open Questions

- Live-view sync: the author calls this out as a stated engineering challenge and is asking the community how competitors handle it. If the live UI falls behind a running workflow, debugging gets worse, not better.
- Anti-bot arms race: fingerprint-chromium is an experiment, not a guarantee. The platform's reliability depends on staying ahead of increasingly aggressive detection, which the author has flagged as outside one person's scope.
- Single-maintainer bus factor: Puppetflow is built by one developer over a year. If Jess steps away, the source-available license mitigates the worst case but not the project velocity.
- AI-hook failure modes: when the model "drives the browser," debugging is harder again. The opt-in must come with a clear logging surface so AI-driven steps are at least as inspectable as deterministic ones.
- Blueprint library network effect: the value of github.com/puppetflow/library scales with contributors. The risk is the classic empty-marketplace cold start; the mitigation is seed Blueprints from the author's own use cases.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49476246) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
