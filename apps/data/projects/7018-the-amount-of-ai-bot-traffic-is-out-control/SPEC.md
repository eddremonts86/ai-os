# SPEC.md — The amount of AI bot traffic is out control?

## Problem

We host a web app which has around 50,000 statically generated public pages, and the amount of bot traffic is insane. Facebook’s crawler requested the same pages over 3 million times in 2 days, and we’ve used Vercel and Cloudflare to block as much as possible but it’s not working. The AI scrapers are routing requests through residential proxies, and even after putting our entire app behind an Auth gate with cloudflare turnstile they’re creating accounts to get access to data that’s meant for humans to read &#x2F; use. I’ve never seen anything like it before, our hosting costs are up like crazy, and besides all of this, I can’t trust anything I read or see on this web anymore. As a last resort we’ll try switching to hcaptcha tomorrow instead of turnstile which appears to be more difficult but this is all so depressing to me. Want to hear if anyone else is experiencing this, there’s no way I’m the only here who is struggling with sophisticated bots?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49705724)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-14T23:36:01Z

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
