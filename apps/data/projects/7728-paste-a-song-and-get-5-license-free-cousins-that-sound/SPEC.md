# SPEC.md — Paste a song and get 5 license-free cousins that sound like it

## Problem

I make youtube videos for fun occasionally. Finding license free music without paying a subscription is a PITA. Free tools make you search by name, tags, etc. and surface music that never fits what I&#x27;m looking for.<p>I built mockfreeli.org to find license-free music that sounds like the song you want. It&#x27;s free, all you do is find a youtube video to the song you want, paste the link in mockfreeli, and it&#x27;ll find five of the closest-related, license-free cousins from the corpus.<p>The corpus it searches is 38k songs from youtube audio library, no copyright sounds, and the internet archive, heavily refined to exclude rips, covers, or anything that requires licensing. The primary relational algorithm is MuQ-MuLan with metadata, BPM, and key as secondary search criteria. It runs on a mac mini with an rpi 5 as fallback. Consequently, searches take about 10s on the mini to about 30s on the rpi. If people find value in it, maybe i&#x27;ll consider throwing a couple dollars towards cloud hosting to reduce downtime and improve throughput. Use it, leave feedback, and let me know if anything could be improved.<p>If you like it and it saves you time, consider throwing a couple of bucks in the tip jar. Otherwise, feel free to mock freeli.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49743031)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T16:20:45Z

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
