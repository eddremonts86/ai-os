# SPEC.md — Has anyone measured how often agents use the skills you ship?

## Problem

A lot of SaaS and API platforms now publish agent skills. We did too, but I cannot tell how useful they are for real users.<p>We have evals for testing that the skills work under ideal conditions, but I&#x27;m interested in runtime behaviour in the wild. For instance:<p>How often did an agent fall back to web search instead of following what the skill said? 
How often does an installed skill get triggered for an average user?<p>Is anyone tracking real use, beyond the install counts that platforms like skills.sh report? Does it even make sense to try and get these insights?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49727921)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-16T14:50:44Z

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
