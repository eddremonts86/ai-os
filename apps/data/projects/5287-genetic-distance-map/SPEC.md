# SPEC.md — Genetic Distance Map

## Problem

I created an interactive map of genetic similarity between populations, based on the Moriopoulos Collection 2025 (<a href="https:&#x2F;&#x2F;genarchivist.net&#x2F;showthread.php?tid=1449" rel="nofollow">https:&#x2F;&#x2F;genarchivist.net&#x2F;showthread.php?tid=1449</a>).<p>Each data point is a 25-dimensional representation (Global25), and I use Euclidean distance.<p>There is already <a href="https:&#x2F;&#x2F;genetic-distance.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;genetic-distance.com&#x2F;</a>, where you can look at the closest populations as a table.<p>The vis should come with many caveats. One is that it is based on the data (and their quality) that is there, which does not cover all populations. Second, the localization of groups is done via LLMs (Claude), and one of the limitations is that a whole population (sometimes as dispersed as &quot;Ashkenazi Jews&quot;) is put in one location, sometimes arbitrarily. Third, the interpolation of colours is purely decorative.<p>Source: <a href="https:&#x2F;&#x2F;github.com&#x2F;stared&#x2F;genetic-distance-map" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;stared&#x2F;genetic-distance-map</a><p>With all that in mind, enjoy!<p>See which populations are most related to Vikings, Mycenaean Greeks, or Canaanites. How about the modern diasporas of Ashkenazim or Roma?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49579403)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-05T18:40:59Z

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
