# SPEC.md — Open-source, Git-inspired versioning for hardware design – Cascadia PLM

## Problem

PLM (product lifecycle management) software is the ugly middle generation between simple CAD-data-management (typically called &quot;PDM&quot; or Product Data Management) and true Digital Threads. No one likes their PLM, but when you need it, you need it. And the kings (the old monsters) of PLM are all billion-dollar companies who charge massive enterprise subscriptions, and add massive enterprise consulting fees for implementation and support on top of that. Also, their PLM is built for the Fords and Boeings of the world, not the little guys, who need to move faster and be &quot;more messy.&quot;<p>I say phooey to that.<p>Cascadia is my brainchild of the last few years. PLM that is more than just PLM, because small manufacturers often don&#x27;t have clear boundaries between Engineering and Manufacturing. PLM that is Digital Thread directed from the beginning, because context is what&#x27;s important to engineering decisions, and never has that been more clear than now, in the AI age. PLM that you can self-host, on Linux, with Postgres, so that you don&#x27;t have to pay massive Windows Server &#x2F; SQL Server &#x2F; Oracle DB licenses on top of your subscription. PLM that&#x27;s code-first because low code is the death of maintainability in enterprise software. PLM that your engineers might actually want to use, rather than working around, because it makes their lives easier, not harder.<p>Anyway, thanks for making it through my rant. Check it out at the link.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49552651)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T16:25:55Z

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
