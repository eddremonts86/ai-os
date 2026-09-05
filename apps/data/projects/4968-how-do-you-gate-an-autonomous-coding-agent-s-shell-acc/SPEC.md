# SPEC.md — How do you gate an autonomous coding agent's shell access?

## Problem

I&#x27;ve been giving coding agents more autonomy lately, letting them run shell commands unattended for longer stretches, and I don&#x27;t have a good answer for how people actually gate that beyond &quot;run it in a container and hope.&quot; A container limits blast radius but doesn&#x27;t stop the agent from reading a secret and then making an outbound call in the same session, or force-pushing to a branch it shouldn&#x27;t touch, or just doing something irreversible while nobody&#x27;s watching. Curious what people are actually doing: allowlists of commands, human-in-the-loop approval for anything destructive, something built into the agent framework itself, or just accepting the risk because the alternative is too slow? Specifically interested in what happens when the approval step itself fails or times out, does your setup default to allow or deny?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49556858)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-03T20:56:36Z

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
