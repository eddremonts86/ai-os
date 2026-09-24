# SPEC.md — Whoever's doing OpenAI's system security is just incompetent in the worst way

## Problem

We&#x27;re at what, 50 years of computing, and these people don&#x27;t seem to know how to air gap a system?<p>It is pretty simple to prevent a rogue AI from hacking a third party. Make the system air gapped completely. You want a cache of internet or artifacts, you bring those into the air gapped data center, plug in, copy. You want info out, you go in, you collect, and inspect the inert data outside of the dangerous agents farm.<p>None of this is a surprise. An agent is a user. An unaligned agent should never be in any environment with a path to the internet.<p>It&#x27;s not difficult to do any of this, just tediously inconvenient.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49743813)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-17T17:23:29Z

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
