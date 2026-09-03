# SPEC.md — Selfship.ai – Surface and fix isues with your agentic applications 24x7

## Problem

We&#x27;ve been building an AI chat based trading system for last 3 years. The biggest issue was that when our Agent would mess up, we wouldn&#x27;t know until a user reported. Agent traces helped us uncover what&#x27;s wrong. But surfacing issues was almost always a manual trigger. So from those learnings, we built Selfship.ai. It&#x27;s an autonomous system that observes every trace&#x2F;turn&#x2F;multi turn convo to find out issues. If a user got what they wanted, if a tool call is failing repeatedly, if users have to always reframe their questions, if the agent is taking optimal paths and many more. It&#x27;s a loop - group failures by user intent, evaluate them, and ship fixes as PRs. After a fix is deployed, it evaluates if it worked or not. We recently opened it up as a SaaS. 
If you have an agentic product in production, we would love for you to try it out.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49522967)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T15:05:05Z

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
