# SPEC.md — How did you improve agent's output readability?

## Problem

Hey,<p>It&#x27;s been a couple of months now that I&#x27;m seeing tons of complaints about Claude&#x27;s output. It is VERY difficult to read and makes reasoning particularly tedious. Asking it to use ASD-STE100 improved things a bit but it&#x27;s still not perfect.<p>I&#x27;ve also seen some tricks on Twitter such as adding this kind of blocks in the AGENTS.md&#x2F;CLAUDE.md file:<p>---<p>-  Use clear subject&#x2F;verb&#x2F;object constructions. Do not use cleft sentences, contrastive appositives, appended-glosses, or trailing clauses.<p>-  Assume I may edit documents myself. Especially markdown documents.<p>-  When writing markdown documents, don&#x27;t include references to conversations or threads a reader would not know about.<p>---<p>I&#x27;m curious how you&#x27;re handling this. 
Did you find anything that improves an agent&#x27;s communication style?
Also, do we know why it&#x27;s happening?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49509410)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-08-31T13:17:00Z

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
