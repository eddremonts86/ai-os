---
id: "667"
slug: how-much-should-i-charge-this-app
title: How much should I charge this app?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpvn9t/how_much_should_i_charge_this_app/"
category: saas
date: "2026-08-16"
tags: [saas, consumer, focus, ios]
tech: [SwiftUI, Swift, Lottie, Supabase, StoreKit 2, TelemetryDeck]
---
# How much should I charge this app?

## Problem

The poster has built a focus-timer app: start a timer, a panda sits with the user, and on finishing they receive rewards for the time they kept focusing. The post is a single paragraph asking how much to charge. The implicit problem: a single-feature B2C focus app with a clear visual hook, no pricing, and no stated willingness-to-pay signal.

## Objective

Define a freemium-with-credits pricing model and a feature roadmap for a single-feature focus-timer app with an animated companion. The plan treats the source as a thin product brief: pricing is the open question, and the MVP scope is the app the post describes.

## Target Users

- **Primary:** students and knowledge workers who already use Pomodoro timers and want a more engaging visual reward.
- **Secondary:** indie hackers and solo founders who treat focus sessions as a deliberate ritual.
- **Tertiary:** creators who want to gamify a daily writing or coding habit.

## MVP Scope

- A single timer screen with the animated panda companion.
- Reward logic: on completing a focus session, award credits redeemable for cosmetic companions or session themes.
- A free tier: 3 sessions/day with one companion.
- A paid tier at $4.99/month or $29.99/year: unlimited sessions, all companions, custom themes.
- iOS first; Android deferred.
- Excluded in v1: social features, leaderboards, team sessions, AI coaching.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single timer screen, full-bleed, with the animated panda at the centre. Minimal chrome; the product is the timer.

## Constraints

- The panda must animate smoothly even on a 5-year-old iPhone.
- The reward logic must not gamify distraction; it rewards completed sessions, not partial sessions.
