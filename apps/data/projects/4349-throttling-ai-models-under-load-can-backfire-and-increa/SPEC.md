# SPEC.md — Throttling AI models under load can backfire and increase demand (SIM)

## Problem

OP here: TL-DR: When AI providers silently swap weaker models under high demand, this can cause even more demand as users tend to re-ask. This is even worse for agents. Both of these effects cause even higher load on the data centers. I guess all of us have felt when the models &quot;don&#x27;t feel quite the same&quot;, so this could explain part of it.<p>I modeled this as a fleet scheduling problem using Queueing Theory and Dynamic Programming over a finite horizon. The standard practice of throttling once the number of jobs in server exceeds certain threshold is in fact suboptimal. The optimal policy consists in segmenting the part of the traffic that is retry sensitive, from those that are not. For example, an user doing a basic data parsing might still do well under a weaker model, but a power user will certainly feel the degradation and ask more.<p>Demo: Just a toy instance to illustrate the issue. The user can create their own policies and see how they perform against the industry standard and the optimal one. It is roughly 100 lines of Flask + JS frontend.<p>Paper with proofs: <a href="https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2608.23986" rel="nofollow">https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2608.23986</a><p>For those of you who have worked in inference infra, does this match anything you have seen?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49521092)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T12:33:01Z

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
