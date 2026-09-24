# SPEC.md — Why does cmux need 200 settings?

## Problem

Just recently discovered how great cmux terminal is but silly question: why does it need 200 settings? I&#x27;m trying to find how to turn certain things on and off and I gave up trying to use my human brain to search for the right thing and started asking codex.<p>Then I found the one settings I want (turn off the bell notification isn&#x27;t even there) so I forked it and had codex add that only to discover the xcode build process takes hours. So I made a branch called &quot;simple&quot; and I told codex &quot;remove 90% of the code from this branch and just make this a very simple version of cmux.&quot; And then I started adding back the few missing things:<p>https:&#x2F;&#x2F;github.com&#x2F;andrewarrow&#x2F;cmux&#x2F;commits&#x2F;simple&#x2F;<p>Now it builds in 6 seconds and any custom setting I need codex just ads so the silly question is:<p>For a terminal app used by developers for developers who all use codex, why do we even need 1 giant 2 hour build process app with all that extra stuff? We all have xcode and since I have to use codex anyway to find the right setting, this isn&#x27;t slower it&#x27;s faster!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49743291)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-17T16:40:47Z

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
