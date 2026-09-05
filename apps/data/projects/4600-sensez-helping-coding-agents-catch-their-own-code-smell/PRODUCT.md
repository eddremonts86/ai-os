---
id: "4600"
slug: sensez-helping-coding-agents-catch-their-own-code-smell
title: Sensez – helping coding agents catch their own code smells
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49536840"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Sensez – helping coding agents catch their own code smells

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN — I’ve been frustrated by how many code smells coding agents produce - no matter how many instructions I put in the AGENTS.md, even the most capable models still reach for dict[str, Any], add multiple boolean flags to functions or hide logic in a heavy nested function that I can't easily unit test. I've even implemented duplication checks as soft CI gates at two companies, but neither solved the problem. I narrowed it down to 3 compounding issues:- agent context decays over a long session and skills or instructions become less reliable- CI is way too late for such feedback and soft static analysis warnings are very easy to ignore- none of the tools I found gave me exactly what I wanted at a speed that allows it to run on every agent turn.And then I finally found the answer to a question that had been bugging me - why are coding agents so bad at detecting code smells? Because they don't have a nose.So I built them one - sensez is my attempt at fixing all 3. It's an open-source static-analysis toolkit for Python and JS/TS and its noze module looks for duplication, dead code, cycles and code smells. The idea is for the agent to run it while the context is still fresh, fix what it introduced, then continue.
It runs locally and the scans are generally well below a second on the repos I've tested - between 160 and 270 ms. Apart from using it daily for the past 2 months, I also ran an A/B eval across ~90 tasks using deepseek-v4-flash. In the final diffs, control runs contained 129 new structural clones and 14 new code smells (as reported by sensez), compared with 0 new clones and 2 new code smells with sensez in the loop, at ~9% more token usage. The sensez runs still produced issues along the way — the feedback gave the agent a chance to detect and address them before finishing.sensez does not replace linters or type-checkers like ruff, ESLint, ty, etc. - it is meant to run alongside them as a separate static signal available to the agent.I have several improvements planned, including better incremental analysis for very large codebases, a VS Code extension and semantic duplication detection.
I'd love feedback, bug reports and ideas, including things like:* What problems do agents repeatedly introduce in your codebases, regardless of how you've tried to prevent them?* What static signals would you actually trust enough to put directly into the agent loop?Repo: https://github.com/popov95s/sensez

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49536840) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
