---
id: "604"
slug: launching-first-ads-today-thought-i-would-feel-more-exc
title: Launching first ads today. Thought I would feel more excited
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vovwm0/launching_first_ads_today_thought_i_would_feel/"
category: saas
date: "2026-08-15"
tags: [saas, growth, paid-acquisition, indie]
tech: [Next.js, TypeScript, Meta Ads API, Google Ads API, Reddit Ads API, Supabase, Stripe]
---
# Launching my first ad today for my little SaaS

## Problem

A founder is launching their first ad today for a SaaS they have been working on for nearly 2 years, from ideation to production. They keep telling themselves that because they are an expert in the problem and very passionate about the "why," things will be okay, but they also recognise they are a perfectionist. The post is essentially a milestone-share with implicit anxiety about the launch. The implicit product: a SaaS the founder has built over 2 years, now going to paid acquisition for the first time.

## Objective

Define the MVP scope for the founder's SaaS (the specific product is unnamed in the source post; the plan uses the founder's milestone as the input) and the post-launch paid-acquisition playbook. The MVP has to demonstrate the round-trip: first ad → first paid user → first retention signal.

## Target Users

- **Primary:** the buyers the founder's SaaS targets (the founder has 2 years of domain expertise, so the audience is narrow and known).
- **Secondary:** the founder themselves as a first-time ad buyer, who needs a structured playbook to avoid wasting budget.

## MVP Scope

- The SaaS itself (the founder has shipped it; the plan re-documents the product surface from the milestone).
- A first-ad playbook: budget cap, audience test, ad creative test, landing-page test.
- A weekly post-mortem template: spend, CTR, conversion, retention.
- Excluded in v1: scale to $10K/day spend, multi-channel (Meta + Google + Reddit), attribution modelling.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single launch dashboard — the ad-spend card at the top, the per-channel CTR in the centre, the weekly post-mortem at the bottom. No marketing-site chrome; the product is the dashboard.

## Constraints

- First ad budget must be small enough that a 100% loss is acceptable; the founder must define this before launch.
- The first ad must target the founder's known audience; broad targeting is the failure mode.
- The founder's perfectionism is the risk; a weekly post-mortem ritual is the safety net.
