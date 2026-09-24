# SPEC.md — Zuck's bot increased our Vercel bill 10x

## Problem

I’m writing this after receiving a Vercel bill that was 10x higher than usual.<p>The worst part: The increase wasn’t caused by more users, but by +1M requests from meta-externalagent&#x2F;1.1.<p>The requests targeted a Vercel preview deployment that we had shared on WhatsApp to test whether its link-preview metadata was working correctly.<p>We naively never bothered with bot calls; they had never caused any problems in the previous four years of our app on Vercel, but that changed when Meta’s crawler began repeatedly visiting this preview deployment.<p>If you host on Vercel, review your bot-protection settings and make sure preview deployments aren’t unnecessarily exposed. Otherwise, an aggressive crawler could leave you with a surprisingly large bill. And unfortunately, Vercel declined to help to ease this bill.<p>Zuck is definitely not slowing down.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49732873)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-16T20:54:31Z

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
