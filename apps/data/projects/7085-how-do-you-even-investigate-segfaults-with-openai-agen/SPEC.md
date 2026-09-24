# SPEC.md — How do you even investigate Segfaults with OpenAI Agents?

## Problem

I have a &quot;simple&quot; segfault because of an out of bounds read&#x2F;write in one of my libraries. I cannot get any Astra&#x2F;Sol&#x2F;Luna agent to finish the probe work on this without it running into the &#x27;security work&#x27; blocker. This is an open code base, locally checked out.<p>Any tips or hints? There is not a sliver of nefarious intent behind me asking &quot;why does a high index XY cause an out-of-bound read&quot;. And I can&#x27;t see why this would trigger any safeguards.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49708448)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-15T06:18:23Z

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
