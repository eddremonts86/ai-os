---
id: "596"
slug: rant-disapointed-by-life-and-my-careeri-will-not-promot
title: (rant) Disapointed By Life and my career(I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1voq62g/rant_disapointed_by_life_and_my_careeri_will_not/"
category: startups
date: "2026-08-15"
tags: [saas, trading, ai, consumer]
tech: [Next.js, TypeScript, Polygon, Alpha Vantage, Supabase, Stripe]
---
# rant: disappointed by life and my career (and what I will do next)

## Problem

A founder has a math degree and a psychology degree, has been building things with computers since age 7 (currently 28), has a medium page with many readers, gets recruiter contacts often, and has built a trading system they have not shared. They are disappointed by life and their career and are about to commit publicly to building the next thing. The implicit product: a founder-led announcement of a new product, with the trading system or another AI tool as the wedge.

## Objective

Define the MVP scope for the founder's announced product — most likely an AI trading or analytics tool, given the math + psychology background and the existing trading system. The MVP has to demonstrate the round-trip: data ingest, model output, action surface.

## Target Users

- **Primary:** retail traders who follow the founder's writing and want a tool that operationalises their style.
- **Secondary:** quant-curious indie traders with no programming background.
- **Tertiary:** the founder's own medium audience as the first beta cohort.

## MVP Scope

- Trading signal tool: ingest market data, output a daily signal with confidence.
- Personal-style profile: train on the founder's past trades (the existing trading system).
- Per-user customisation: each user adjusts the signal threshold.
- Web-first; mobile deferred.
- Free tier: 1 signal / day, paper-trading only. Pro at $49/month: unlimited signals, live-trading mode.
- Excluded in v1: options / futures, multi-broker, social copy-trading.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single trading surface — the daily signal front and centre, the personal-style profile on the left, the per-user customisation on the right. No marketing-site chrome; the product is the signal.

## Constraints

- The MVP must respect the founder's existing medium audience as the first beta cohort; the product cannot alienate them.
- The trading signal must be honest about backtest vs live performance.
- The founder's psychology background must inform the UX (loss-aversion, over-trading guard rails).
