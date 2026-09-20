# SPEC.md — Get hard to get backcountry permit

## Problem

I got tired of trying to go backpacking and losing out on permits either through lottery or someone effectively bid-sniping cancellations. So, I built a real-time alert system across every state and federal booking system in the US. This covers ~700 permitted trails and locations as well as campsites.<p>It&#x27;s the first real end-to-end product I&#x27;ve ever built myself and I gotta say, it&#x27;s a lot of fun. I had to build a ton of custom infra and adapters to connect to the various, disparate booking systems in order to find cancellation.<p>Definitely pushed my capabilities.<p>Hope this helps some of you finally land a trip you&#x27;ve been wanting to take.<p>Edit: I&#x27;ve created a forecast model for openings which has been quite accurate at a 7 and 14-day timespan. Next year I should be able to make this the backbone for predictive alerts. <a href="https:&#x2F;&#x2F;permitsnag.com&#x2F;permit-forecasts" rel="nofollow">https:&#x2F;&#x2F;permitsnag.com&#x2F;permit-forecasts</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49589572)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T18:48:51Z

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
