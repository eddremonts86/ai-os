# SPEC.md — Tell HN: Check your Claude settings, it may have silently enabled remote access

## Problem

I went to https:&#x2F;&#x2F;claude.ai&#x2F;code today and saw some of my most recent Claude CLI sessions appeared there. I have never explicitly enabled RC, specifically because of security concerns and the only sessions I previously had in https:&#x2F;&#x2F;claude.ai&#x2F;code were the ones I actually started there out of convenience, whenever I was away from my dev machine.<p>So imagine my complete shock when I saw those sessions in their web client <i>and</i> that &#x2F;rc was <i>actually</i> enabled in my CLI! Again, I never enabled it!!!<p>Notably, there was a recent bug fixed 3 days ago (https:&#x2F;&#x2F;github.com&#x2F;anthropics&#x2F;claude-code&#x2F;releases&#x2F;tag&#x2F;v2.1.257) which reads:<p>&quot;Fixed dismissing the Remote Control consent prompt (Esc, or n at claude remote-control) counting as consent, so the next request connected without asking&quot;<p>But MY GOD, if this is what happened here to me—even though I don&#x27;t recall being asked that question—then Anthropic NOT handling this properly by disabling RC and <i>re-asking</i> users to <i>double-check</i> their config and <i>explicitly</i> re-enable it is just unimaginable.<p>This has personally absolutely drew the line for me with them. I use Codex simultaneously and as soon as they release GPT6, I am canceling my sub. Enough is enough.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49565799)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-04T15:09:47Z

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
