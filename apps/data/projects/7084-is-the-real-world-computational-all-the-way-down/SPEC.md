# SPEC.md — Is the real world computational all the way down?

## Problem

Stephen Wolfram states the entire universe is computational all the way down. Guillermo Rauch recently tweeted: Everything is code.<p>These may be soundbites. But I&#x27;ve been thinking about how the take-off of spatial intelligence within AI is setting the stage for actually expressing everything as source code.<p>I recently co-authored a paper on highly programmable 3D. For that, I surveyed quite a bit of the field. Philosophically speaking, when I see the likes of  Astra&#x2F;Fable generating ThreeJS, Blender or CAD objects, I feel this expressiveness can conceivably one day eat everything.<p>As they improve at synthesizing higher order differentials, their ability to produce unique shapes will improve too. And because code can express form and functionality both, expressing abilities is basically just encoding attributes in the software:<p>- I.e. when a leg is moved, at its core, it&#x27;s something like rig[&#x27;Leg_*_Hip&#x27;].rotation = 42°
- When a vehicle turns, we&#x27;re essentially doing something like w.rotation.y = 0.42 rad
- When a jello jiggles, it&#x27;s something like Σ A·e^(−λr)·e^(−decay·τ)·[(1−b) + b·cos(ωτ − kr)] · p̂

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49708962)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-15T07:23:56Z

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
