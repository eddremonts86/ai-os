# SPEC.md — Project Estimator – a free, no sign-up software cost estimator

## Problem

I got tired of pricing projects by gut feeling, so I built this after numerous cost estimation errors that costed me extra hours of free work.
With this free tool, you describe a project as a tree of work items, rate complexity of the work across 8 axis and account for skill gaps, reuse and offloading to external tools to get a final price with full hour breakdown.
The model combines ideas from COCOMO, Function Points, the Mythical Man-Month into a single mathematical model that takes a JSON input to describe all activities, parameters and considerations for the specific project.
You can also use the bottom-right copy button to get a prompt for LLMs that generates a compatible JSON input after you describe your project.
Every parameter is customizable and you can easily export the JSON or a formatted table with hours + cost details in PDF format, ready to be sent to the customer.<p>To know more about it, check out the blog article: <a href="https:&#x2F;&#x2F;blog.webround.com&#x2F;en&#x2F;project-estimator" rel="nofollow">https:&#x2F;&#x2F;blog.webround.com&#x2F;en&#x2F;project-estimator</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49623534)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T09:09:34Z

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
