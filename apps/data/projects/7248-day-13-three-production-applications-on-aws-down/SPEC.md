# SPEC.md — Day 13. Three production applications on AWS down

## Problem

We’re on day 13 of all 3 of our production applications on AWS down. We were going to market and onboarding users.<p>We were resolving a credits issue that they acknowledged was an error on their end and agreed to fix. But then they said the terms we received and planned our opex on was not actually valid so they wouldn’t release the credits at all.<p>This matters because it’s second part of a total credits, and was agreed to be released before the first part expired. So when it wasn’t, it created the problem it was structured to avoid with the first credits expiring, then our account going past due which we sent many alerts to prevent.<p>So we created a support ticket to ensure our uptime while asking for a proper review of our credits terms and was informed that our account was “in good standing”. But the next day, we lost access. We only found out that it was suspended 6 days later after looking for help on the AWS subreddit.<p>We’ve now been getting conflicting information from support asking us to first opt-out of our credits terms before they conduct any review of the credits we created the case for in the first place.<p>Would’ve really preferred if we didn’t have to post here but we’re going around in circles and it&#x27;s now 13days.<p>Does anyone know how to get us to the right humans at AWS e.g. contracts? Thanks

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49716456)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-15T18:10:00Z

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
