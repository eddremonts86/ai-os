# SPEC.md — How do you know your LLM giving accurate info?

## Problem

I spend a good amount of time chasing the LLM for evidence that its answer is actually accurate. To be honest, I can usually get there, but it works great for fresh work and gets messy on months-old work. And it&#x27;s not just me; a lot of people have raised the same thing.<p>So for the last 6 months I&#x27;ve been trying to fix it. Today I can say it&#x27;s working for me — it flags me in advance. Obviously not perfect yet, and that&#x27;s where I need help: I need people to test it and tell me what else needs fixing.<p>PS: This isn&#x27;t a memory layer; it flags stale answers before you act on them. Give it a try, and if you think I&#x27;m solving a real problem, please drop a star.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49624134)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T10:22:22Z

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
