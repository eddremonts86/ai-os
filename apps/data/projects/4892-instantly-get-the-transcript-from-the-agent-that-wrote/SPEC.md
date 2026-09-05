# SPEC.md — Instantly get the transcript from the agent that wrote any line of code

## Problem

This is basically &quot;git blame but for agent sessions&quot;.<p>In the olden days, we would use git blame (or gitlens extension) to see what body of work a certain line range or file was a part of. We would look back at the PR to see why something was done a certain way.<p>While agents can still do this part well, we can now take it a step further: we can surface the entire agent session from when the code was originally committed! You (or rather your agent) can go back and read the entire original transcript from when it was done.<p>This is very helpful for figuring out why something was done wrong. Maybe a missed assumption, maybe just regular slop. Either way it helps a ton to reference the original implementation session.<p>This is an extra capability, you can also use the regular search to pull up old sessions and work.<p>It runs fully locally and has a pretty cool set of performance optimizations if you care to look into what makes it so fast.<p>I built it for myself and didn&#x27;t look at my own usage levels until this week and realized the search and blame commands are being used over 1k times per day (yes it&#x27;s a lot, but against 5b tokens per day it&#x27;s reasonable).

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49550141)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T14:09:53Z

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
