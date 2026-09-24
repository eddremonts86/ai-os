# SPEC.md — Skillzero – save tokens by omitting skills from agent context

## Problem

Hi HN, this is a first for me. I use agents for multiple things, from daily life, fitness, video editing, to (performance) engineering. For some of those I have skills globally installed, because I may need them across different projects. But this means in any unrelated task, all skill names + descriptions will still make it into the agent context [1]. 
This is not the end of the world, but also not great as it could lead to your agent no longer invoking skills reliably (see Addy Osmani&#x27;s <a href="https:&#x2F;&#x2F;addyo.substack.com&#x2F;p&#x2F;audit-your-agent-files" rel="nofollow">https:&#x2F;&#x2F;addyo.substack.com&#x2F;p&#x2F;audit-your-agent-files</a>).<p>With skillzero, you can manage the skills via CLI. It splits them in 3 categories:
- hidden skills (entirely removed from context) → they now behave like &#x2F;-commands
- collection skills (bundled into <i>one</i> skill, so the agent sees only one name + description) → agent can still invoke these when it thinks it should use them
- regular skills (untouched by skillzero)<p>You can install it via `npx skillzero` (or `pnpx` or whatever you prefer).<p>[1]: Actually Claude Code &amp; Codex have an optimization, if the name+desc&#x27;s exceed 1%&#x2F;2% of the context window, both will omit some skills entirely.<p>Happy to hear any feedback!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49698184)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T15:06:04Z

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
