# SPEC.md — CleverCrow, Get paid to work your backlog

## Problem

Howdy all,<p>My first post [1] on CleverCrow generated some great conversation and a few things stood out: less AI, more money for open source maintainers please!<p>So in the intervening 84 days, that&#x27;s what I&#x27;ve done. I&#x27;ve entirely removed all AI and pivoted to a model where backers put money on issues they want fixed and the whole pool goes towards paying the maintainer of the project (minus Stripe fees and a 5% platform fee).<p>Along the way I ditched javascript [2] which tightened up the security model!<p>Sponsorship is still the best way to go, but for those that want to see specific issues fixed and keep the money and control in the hands of the maintainer, CleverCrow.io is there.<p>[1] - <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=48621645">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=48621645</a>
[2] - Technically 40 lines for copy to clipboard and 90 for some Stripe glue to avoid an unrestricted key in the web tier

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49702339)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T19:11:47Z

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
