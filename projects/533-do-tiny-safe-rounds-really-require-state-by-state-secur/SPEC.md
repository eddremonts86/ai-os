---
id: "533"
slug: do-tiny-safe-rounds-really-require-state-by-state-secur
title: Do tiny SAFE rounds really require state-by-state securities compliance? I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vo0d9v/do_tiny_safe_rounds_really_require_statebystate/"
category: startups
date: "2026-08-14"
---
# Do tiny SAFE rounds really require state-by-state securities compliance? I will not promote

## Problem

I’m raising roughly $30k–$50k from a few friends, with potential investors in California, New York, and Arizona. Some may be "non-accredited" I understand SAFEs are securities, but do small startups really have lawyers analyze each investor’s state exemption individually? Or is the normal route basically: Delaware C-Corp → SAFE → Rule 506(b) → Form D + routine state notices? Curious what founders/lawyers actually do in practice for small friends & family rounds. Sorry, this is based off some AI research. Am just trying to learn about compliance before I actually start the process. submitted by /u/gelypse [link] [comments]

---

## Objective

Ship a plain-English explainer (and an interactive decision tree) that tells a tiny-SAFE-round founder exactly which US states actually require a securities filing for a $50k-$250k SAFE, and which they can ignore, based on the founder's investor list — without misrepresenting the law or substituting for a lawyer.

## Target Users

- Primary: a US-based founder closing their first SAFE round under $500k from friends/family + a few angels.
- Secondary: a non-US founder raising from US-based angels (the source's underlying concern).

## MVP Scope

- A state-by-state filing requirement table for small SAFE rounds (≤$1M, ≤25 non-accredited investors), sourced from each state's Blue Sky law portal.
- A 5-question decision tree: founder state, investor states, round size, accreditation mix, MFW or not.
- A "what to file, where, by when" output per scenario.
- An explicit "this is not legal advice, talk to a lawyer" disclaimer on every page.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Every claim must be sourced to a state's securities regulator portal or a credible secondary source (e.g. a national Blue Sky summary).
- No claim about the legality of a specific SAFE structure for a specific founder — that's a lawyer's call.
- The page must include the last-verified date for each state's row.
