---
tags: ["saas", "sports", "analytics", "consumer"]
tech: ["Next.js", "TypeScript", "Supabase", "nflfastR", "Stripe"]
id: "554"
slug: feedback-on-my-sports-web-app
title: Feedback on my sports web app
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6lsh/feedback_on_my_sports_web_app/"
category: saas
date: "2026-08-14"
---
# Feedback on my sports web app

## Problem

A founder just launched TrendLine (trytrendline.com), an NFL database that lets users build sports betting models by filtering games on weather, location, performance, trends, team, coach, referee, travel, rest, and other variables. The site shows historical performance of the model and the current games for that week that match. The founder is looking for any feedback on the launch. The implicit product: a B2C sports-betting analytics tool with a model-builder UI for NFL games, historical performance tracking, and weekly picks.

## Objective

Define the MVP scope for TrendLine as an NFL model-builder + weekly-picks tool for sports bettors. The MVP has to demonstrate the round-trip: filter variables, see historical performance, see the week's matching games, track the model's record over time.

## Target Users

- **Primary:** US-based sports bettors who want to build their own models rather than follow handicappers.
- **Secondary:** sports analytics enthusiasts who track NFL data for fun but do not bet.
- **Tertiary:** small sports-betting Discord communities that want a shared model.

## MVP Scope

- NFL game database with the filter variables the poster named (weather, location, performance, trends, team, coach, referee, travel, rest).
- Model-builder UI: pick variables, see historical performance of the filter, save the model.
- Weekly picks: the games that match the user's saved models, with a per-pick confidence.
- Record tracking: per-model win/loss over time.
- Free tier: 1 saved model, weekly picks read-only. Pro at $19/month: unlimited models, per-pick confidence, record-tracking export.
- Excluded in v1: live in-game odds, bankroll management, multi-sport (NBA, MLB), social / shared models.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single model-builder surface — variable filters on the left, historical performance chart in the centre, the week's matching picks on the right. No marketing-site chrome; the product is the model.

## Constraints

- The MVP is NFL-only; multi-sport is roadmap, not v1.
- Per-state gambling regulations: explicit disclaimer that the tool is for analytics, not betting advice.
- Data latency: the model must use the most recent NFL game data; weekly picks update at a fixed time.
