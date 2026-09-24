# SPEC.md — Skill to generate change preview pages

## Problem

To review diffs more easily, I created a `&#x2F;change-preview` skill to generate a page that combines the following:
- Before&#x2F;After screenshots and&#x2F;or videos
- Diagrams if no screenshots applicable
- Annotations on the screenshots of things that have changed in the UI
- Code diffs alongside AI summaries of why that code was changed
- Steps to reproduce if I want to test changes manually<p>Now I can run a few agents in parallel, get them to spin up a change preview page once done, and verify it&#x27;s done the right thing by having the diff, before&#x2F;after videos, etc. all in one place.<p>Brief demo here: <a href="https:&#x2F;&#x2F;steveharrison.dev&#x2F;reviewing-ai-work-with-change-previews" rel="nofollow">https:&#x2F;&#x2F;steveharrison.dev&#x2F;reviewing-ai-work-with-change-prev...</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49726919)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T13:41:44Z

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
