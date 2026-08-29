---
id: "742"
slug: need-a-tool-that-automatically-finds-people-in-social-m
title: Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/6stv96yp21-need-a-tool-that-automatically-finds-peo"
category: social
date: "2026-04-28"
tags: [Social, Marketing, Business, Startups, AI, Productivity, Other]
country: USA
wtp:
  raw: $50/month
  currency: USD
  min: 50
  max: 50
  period: month
  mrrMid: 50
tech: [TypeScript, Node.js, BullMQ job queue, Postgres with Drizzle ORM, OpenAI or Anthropic API, Apify + Bright Data scraping, Coolify]
---
# Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.

## Problem

A founder / community builder (Steven Musielski, USA) needs to find people who publicly, regularly, consistently, and transparently share what they are building — startups, projects, products — across LinkedIn, Facebook, X (Twitter), and TikTok. Today he does this by hand: scrolling feeds, reading profiles, manually evaluating whether a person is open and consistent enough to be worth a conversation. The lead-generation tools he has tried (the standard "find people by keyword" suites) work too superficially: they match a bio keyword, not the deeper pattern he actually needs (regular posting cadence, transparent build-in-public voice, recent activity, topic focus). He runs this search every day, the work is energy-intensive and slow, and he is willing to pay $50/month for a tool that returns structured results matching his deeper criteria.

## Objective

Ship a multi-platform social-search tool that lets the user define deep criteria (e.g., "people who have posted about a startup, project, or product at least once a week for the last 8 weeks, in English, on LinkedIn or X, with profile bios that mention building") and returns a structured database of matching people with profile URLs, recent posts, and the criteria each match satisfied. End state: one query replaces an hour of manual feed-scrolling and returns a CSV the user can act on.

## Target Users

- Primary: founders, community builders, and indie investors who want to find builders sharing their work publicly and consistently on social platforms.
- Secondary: developer-relations and community managers scouting potential ambassadors, podcast guests, or beta users; recruiters sourcing for "founder / maker" archetypes.
- Tertiary: journalists and trend researchers tracking who is shipping what across platforms.

## MVP Scope

- Criteria builder: a structured form combining platform (LinkedIn / X / Facebook / TikTok), topic keywords, posting cadence (e.g., ≥ 1 post/week for last N weeks), recency, language, and bio signals.
- Multi-platform crawl: each platform scraper (Apify / Bright Data workers) ingests public posts + profile data, with rate-limit awareness and per-user daily quotas.
- Matching engine: an LLM-assisted scorer that evaluates each candidate against the criteria and returns a structured hit list with the criteria each match satisfied.
- Export: results download as CSV (profile URL, handle, platform, top posts, match reason).
- Daily-quota dashboard: visible quota per platform, remaining searches, daily refresh option.
- Single-user, English-only UI in v1; no team workspaces.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's budget cap is $50/month, which must cover platform subscription only — scraping cost is absorbed by the platform's infra budget, not the user.
- Only public posts / public profile data are used; no scraping of DMs, private groups, or anything behind a login wall.
- Per-platform rate limits must be respected to keep the workers' accounts healthy; quotas are visible to the user and refreshed daily.
- Platform terms of service must be reviewed for each scraper; if LinkedIn / X / Facebook tighten ToS during v1, the affected platform may need to be temporarily suspended rather than risk legal exposure.
- The tool does not store DMs or content behind a login wall; if a candidate's recent posts require login, the result is marked "public-only" and limited to what is reachable without auth.
- LLM-assisted matching cost must stay under $0.10 per query to preserve margin at the $50/month price point.
