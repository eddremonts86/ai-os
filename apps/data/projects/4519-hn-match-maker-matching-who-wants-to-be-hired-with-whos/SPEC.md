# SPEC.md — HN Match Maker – Matching "Who Wants to Be Hired?" With "Who's Hiring?"

## Problem

Hi!<p>Every month the &quot;Who Wants to Be Hired?&quot; and &quot;Who&#x27;s Hiring?&quot; Threads come through I would think to myself, &quot;there should be a match maker for these two threads&quot;.<p>So I had abacus.ai whip one up. The methodology is pretty simple, data is extracted from posts using an LLM, score matches based on salary, domain experience, remote&#x2F;onsite, etc., and then eliminate incompatible postings, like &#x27;looking for remote work&#x27; and &#x27;onsite only&#x27;. The result is two views: jobs-by-user and user-by-jobs.<p>If you&#x27;ve submitted a post to this month&#x27;s &#x27;Who Wants to Be Hired?&quot;, you can find your matching job listings at <a href="https:&#x2F;&#x2F;hnmatchmaker.com&#x2F;user&#x2F;:user_name" rel="nofollow">https:&#x2F;&#x2F;hnmatchmaker.com&#x2F;user&#x2F;:user_name</a>, for example <a href="https:&#x2F;&#x2F;hnmatchmaker.com&#x2F;user&#x2F;G4Vi" rel="nofollow">https:&#x2F;&#x2F;hnmatchmaker.com&#x2F;user&#x2F;G4Vi</a><p>---<p>Some observations when looking at the matches pair up right now:<p>Poke around, let me know what you think!<p>Ultimately, I hope this is actually helpful to some folks.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49528057)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T20:53:35Z

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
