# SPEC.md — Updog.link – a URL shortener you can run for free

## Problem

Hi HN. I half-built a dumb link-shortening service in 2020 on API Gateway and DynamoDB, and never finished it, but that didn&#x27;t stop me from registering an &#x27;updog&#x27;-themed domain for it. I forgot about it until tonight and decided it was worth finishing this tool from a bygone era.<p>I scrapped everything and moved to more modern tools: one script on a Cloudflare Worker, with the links (and the Terraform state) in R2. You can use what I&#x27;m hosting if you want, or clone it and deploy your own. Here are some of the characteristics:<p>It&#x27;s free-ish. It runs on Cloudflare&#x27;s free tier, which serves something like a hundred thousand requests a day.<p>It&#x27;s stateless-ish. Each link is an immutable JSON object in R2. No traditional databases or servers, nothing to really run or maintain.<p>It&#x27;s private-ish. There are no click stats, so nobody can see who followed a link, including the person who made it. Cloudflare&#x27;s edge presumably logs something somewhere, because that&#x27;s what edges do.<p>It&#x27;s funny-ish, if you can remember being 12.<p>What surprised me most is how simple a task this has become. Not only is writing code much faster, but the architecture and footprint are much smaller. I like to think I&#x27;m also better at my job, but that part is probably negligible.<p>The S3-ish object + short-lived compute architecture was sorta possible in 2020, but not that common as I recall. The simplicity is what let me rework and publish it from the couch in an evening.<p>You can make a shortlink with it here: <a href="https:&#x2F;&#x2F;whats.updog.link" rel="nofollow">https:&#x2F;&#x2F;whats.updog.link</a><p>Source (MIT): <a href="https:&#x2F;&#x2F;github.com&#x2F;ignore-prior-instructions&#x2F;Updog.link" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ignore-prior-instructions&#x2F;Updog.link</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49655103)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T08:16:40Z

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
