# SPEC.md — Socratix – an AI tutor for proving mastery, not memorizing

## Problem

The idea for Socratix was formed from constant &quot;completion&quot; of online courses and videos without the ability to actually use the material.
How it works: give it a learning objective, and it creates an personalized curriculum in the form of a DAG of prerequisite concepts rather than a list of videos. Each concept comes with theory and interactive practice (with actual code running in browser for technical subjects), and instead of a pass&#x2F;fail metric, it analyzes mistakes you make in order to diagnose conceptual problems, not simple errors.
A concept opens the next one only when it is demonstrated that you know it well enough (practice + diagnostics). Additionally, I&#x27;m creating a live voice AI Viva (oral exam style test of knowledge where you will have to justify the answers) that is not live yet, but is coming.
It covers various domains, not just programming (mathematics, economics, sciences, etc.)
Will appreciate any feedback, especially on curriculum generation part and if the loop of practice&#x2F;diagnostics feels different from regular quizzes.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49661638)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T16:59:44Z

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
