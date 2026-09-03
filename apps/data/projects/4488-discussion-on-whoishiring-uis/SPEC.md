# SPEC.md — Discussion on Whoishiring UIs

## Problem

Would anyone be interested in a more user-friendly frontend to the whoishiring thread? There are 4 frontends linked in the thread but none of them seem aimed at ease of use, so I&#x27;m also wondering if this is deliberate - are the mods deliberately steering away from essentially creating another Reed-like job board for some reason?<p>Specifically, I&#x27;m talking about the fact that with job boards like Reed, you can easily filter jobs by stating where you are and what you&#x27;re looking for. Location filters work by letting you specify where you are, onsite&#x2F;remote, and how long you&#x27;re willing to commute. Compare to the 4 frontends linked on the thread:<p>- One seems to be based on tags with a custom query syntax, e.g. &quot;~us-based&quot; for &quot;not US-based&quot;. Is anyone really looking for &quot;jobs that aren&#x27;t in the US&quot;? Surely 99.9% of people are looking for jobs either in their city, or remote and not &quot;[another country] only&quot;.<p>- One allows filtering by JS regexes -- again, I don&#x27;t want to program, I just want to look for a job.<p>- Another one is just a search box with another custom query syntax.<p>- One has AI-enhanced search, but the first query I tried came up with invalid results (search term &quot;javascript&#x2F;typescript jobs suitable for remote or onsite in UK&quot;; brings up a job specifying Poland&#x2F;Romania only).

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49527281)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-01T19:59:13Z

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
