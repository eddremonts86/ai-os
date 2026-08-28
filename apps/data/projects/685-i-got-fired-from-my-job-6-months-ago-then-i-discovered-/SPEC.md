---
id: "685"
slug: i-got-fired-from-my-job-6-months-ago-then-i-discovered-
title: "I got fired from my job 6 months ago. Then I discovered a problem I couldn't stop thinking about."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpragt/i_got_fired_from_my_job_6_months_ago_then_i/"
category: saas
date: "2026-08-16"
tags: [saas, consumer, ios, focus]
tech: [SwiftUI, Swift, Screen Time API, StoreKit 2]
---
# I got fired from my job 6 months ago. Then I discovered a problem I couldn't stop thinking about.

## Problem

The poster got fired six months ago, started building apps, learned that "building something is easy but building something people actually care about is not", lost motivation, and ended up with 8-9 hours of daily screen time on Reels, Shorts, and random videos. The number itself was not the part that bothered them — the realisation was. The implicit problem: a phone-distraction interruption layer that forces a deliberate pause before opening a distracting app, scoped as a B2C consumer tool with the founder as the first user.

## Objective

Define a single-purpose interruption layer for iOS that surfaces a deliberate pause prompt before opening a distracting app, with the founder as the design partner. The product is the pause moment; everything else is plumbing.

## Target Users

- **Primary:** solo founders and knowledge workers who have noticed their own screen-time spiral and want a friction layer that does not require willpower.
- **Secondary:** students and creators who treat the phone as a deliberate tool and want a guard rail.
- **Tertiary:** parents who want a child-mode variant (out of scope for v1).

## MVP Scope

- A "pause" prompt that appears before opening a configurable list of distracting apps.
- A single question at the pause: "Did you actually choose this, or is it the default?"
- A daily tally: how many pauses were deliberate vs. default.
- iOS-first via the Screen Time API; Android deferred.
- Free tier: 3 apps in the list; paid at $4.99/month or $29.99/year: unlimited apps, daily-tally analytics.
- Excluded in v1: full app-blocking, focus-mode automation, scheduled breaks, Android.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single full-screen pause prompt, no chrome, the question at the centre. The product is the pause.

## Constraints

- The pause must not feel punishing; it is a question, not a wall.
- The iOS Screen Time API has hard limits on what an app can intercept; the MVP must work within those limits.
- The founder is the design partner; the product must work for their actual usage before being shipped to others.
