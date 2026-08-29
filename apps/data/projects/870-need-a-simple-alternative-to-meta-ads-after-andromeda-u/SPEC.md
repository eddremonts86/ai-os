---
id: "870"
slug: need-a-simple-alternative-to-meta-ads-after-andromeda-u
title: Need a simple alternative to Meta Ads after Andromeda update
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-meta-ads-af"
  captured: "2025-10-29"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: USA
wtp:
  raw: $29.99/month
  currency: USD
  min: 29.99
  max: 29.99
  period: month
  mrrMid: 29.99
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Need a simple alternative to Meta Ads after Andromeda update

## Problem

After Meta's Andromeda update, the posting team is seeing daily instability in their campaigns: performance drops, cost-per-click climbs, and the targeting playbooks they had built around Meta's earlier auction stop working. They have already tried DSP-style programmatic alternatives (The Trade Desk, StackAdapt) and found them operationally heavy — every step from campaign setup to performance monitoring requires deep technical knowledge and daily manual management — and the in-house programmatic specialist they hired is too expensive to scale across multiple clients. The author states a willingness to pay $29.99 per month for a managed campaign tool that automates bid decisions, surfaces clear analytics, and integrates with the major DSP platforms without requiring an agency or in-house specialist to babysit it.

## Objective

Ship a managed programmatic-ads dashboard that an agency or small marketing team can operate without hiring a specialist, with bid automation, clean cross-DSP analytics, and one-click connections to at least The Trade Desk and StackAdapt, so a $29.99/month seat recovers the manual labour cost the author currently absorbs.

## Target Users

- Primary: small agency owners or solo marketers running Meta-ad accounts that have degraded since the Andromeda update, who can spend $30/month on a tool but cannot justify a full-time programmatic specialist.
- Secondary: in-house marketing leads at SMBs with the same Meta-instability pain who are evaluating programmatic for the first time and want a thin abstraction over The Trade Desk / StackAdapt.

## MVP Scope

- A single dashboard per workspace: connect The Trade Desk and StackAdapt via OAuth/API key, list active campaigns, show spend and KPIs in one view.
- Automated bid rules: a small rule builder (if KPI X drops below Y, pause / adjust bid by Z) executed on a 15-minute cron.
- Cross-DSP analytics: roll up spend, impressions, clicks, CPA per workspace and per campaign, with daily / weekly / monthly ranges.
- Manual campaign-launch helper: a guided flow that takes a goal and budget, and posts the campaign via the chosen DSP's API, hiding the platform's native jargon.
- Single-user, single-workspace auth; no multi-tenant billing in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's stated budget cap is $29.99/month per seat; the product must be self-hostable or self-funded at that price point (no marginal cloud spend > $2/user/month).
- No paid ad spend passes through the tool in v1 — only bid-rule actions on the connected DSP accounts; financial KYC for handling ad dollars is out of scope.
- Must run on a single Coolify instance with SQLite so a single marketer can self-host without DBA work.
- DSP integrations are limited to The Trade Desk and StackAdapt in v1 (the two platforms the author has already tried); a third DSP would need a separate API contract.
