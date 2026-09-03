# SPEC.md — An Autonomous Agent for Slay the Spire

## Problem

While coding agents have reached a relatively mature stage, domain-specific agents are lagging far behind; for instance, using Codex to play games yields poor results.<p>The Spire agent addresses the challenge of maintaining consistency across long-horizon tasks by delegating deterministic actions to domain-specific tools, while the LLM handles logical tasks requiring reasoning and acts as the &quot;glue&quot; connecting the components.<p>Currently, about 40% of runs reach Act 3, and approximately 10% reach Act 4.<p>I am currently optimizing an offline &quot;evolving agent&quot; capable of refining deck-building strategies based on data from past runs. Given that an offline simulator provides ground-truth rewards, this appears to be a promising path toward a self-evolving agent.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49532826)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T07:15:15Z

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
