# SPEC.md — Who-GPU, a simple monitoring tool to view GPU usage across machines

## Problem

At my university, we have a bunch of GPU machines, but no scheduling system. So you would have to manually SSH into them and check which ones are in use before you start a job. So, I made a CLI to automate that for me. That evolved into a dependency-free webpage as well. It works on Linux, Mac, and Windows (windows needs Git Bash.)<p>If you regularly SSH into machines to check their GPU usage, you are the perfect user! I&#x27;d love your feedback.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49726812)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T13:33:27Z

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
