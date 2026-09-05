# SPEC.md — Casefile – Git why for AI-assisted development

## Problem

During my work at Brokk last year we developed a task-slicing system. The idea was to have a bunch of tasks where each task can be implemented and verified in isolation. So I can mentally focus only on one task at a time with checking the evidence it works as expected. Most follow-up tasks are based on their predecessor(s).<p>After my time at Brokk I picked up this idea and developed Casefile. To avoid loading the entire previous session context, the agent creates a task log. So a follow-up task only needs to load the necessary task logs + git state as the base to implement its task. Each log is linked to its commit, so git blame on a line leads back to the decision behind it. Another advantage of this approach is that you can retrieve the intent why a code change was made and which alternative solutions were skipped. You can see the workflow in the open at <a href="https:&#x2F;&#x2F;github.com&#x2F;native-federation&#x2F;devtools" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;native-federation&#x2F;devtools</a>.<p>Last month I extended the system to store the plan and task logs in a non-public Casefile repository because my enterprise customers don&#x27;t allow work artifacts like these in their repositories.<p>Give it a shot if you think it&#x27;s useful. I would like to hear your feedback!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49564994)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T14:16:01Z

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
