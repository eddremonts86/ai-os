# SPEC.md — Why aren't LLM token CDN cache's a thing?

## Problem

Sorry if this is a stupid question but...<p>Problem:<p>I boot opencode into a codebase. I ask it to do one thing, it has to call 40 tools to &quot;remember&quot; what the codebase looks like relevant to that.<p>It has no memory so every fresh boot is re-explore.<p>My understanding, as an ML n00b, is the GPU have KV states of massive matrices that are multi GB in RAM (e.g., 10-30GB) so dumping to disk and pushing over network (<i>his shoulders shuddered at the thought of egress fees</i>), is not great.<p>So instead we have cache during &quot;work time&quot;, but off &quot;work time&quot;, we have to reboot and build the cache again.<p>But couldn&#x27;t CF or someone setup CDNs to cache token state between days or something like that?<p>Ages ago I was trying to solve part of this problem client side w&#x2F; vectoring a codebase and creating a tool to do quick queries, but I kind of stopped.<p>Curious if LLM token CDNs are gonna be a thing or not

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49714867)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-15T16:20:29Z

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
