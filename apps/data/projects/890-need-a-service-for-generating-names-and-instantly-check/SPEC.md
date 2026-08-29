---
id: "890"
slug: need-a-service-for-generating-names-and-instantly-check
title: Need a service for generating names and instantly checking domain availability
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-names-and"
  captured: "2025-10-16"
category: marketing
date: "2025-10-16"
tags: [Marketing]
country: Russia
wtp:
  raw: hidden commission on domain purchase accepted
  currency: USD
  min: 0
  max: 0
  period: one-shot
  mrrMid: 0
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, WHOIS + RDAP + registrar APIs (Namecheap, Porkbun, etc.), Coolify, Docker]
---
# Need a service for generating names and instantly checking domain availability

## Problem

Egor (Russia) starts a new project on a regular cadence and every time hits the same long, inefficient process of selecting a domain name and a cool name for the project at the same time. He wants one tool that generates candidate names and immediately checks whether the matching domain is available, filtering out taken domains, with particular value placed on short names and with priority on the .com, .ru, and .net zones. He has tried one existing service that generates names but does not check availability in the same step, so it surfaces names whose domains are already taken — defeating the purpose. The whole name-plus-domain selection process currently averages a couple of days per project. He is willing to pay, and explicitly recognises that domain name registrars make money through affiliate programs, so he is comfortable paying a hidden commission baked into the eventual domain purchase rather than a separate SaaS subscription; that revenue model is the implicit business model of any service that solves this.

## Objective

Ship a name-and-domain service that generates short candidate names for a project, instantly checks whether the matching .com / .ru / .net domain is available, filters out taken names, and routes the user to a registrar to buy the available domain, with the registrar's affiliate commission as the monetisation path — so a founder choosing a name and a domain for a new project collapses from a couple of days of frustration into one short, productive session.

## Target Users

- Primary: founders, indie hackers, and side-project builders who pick a name and a domain together every time they start a new project, and who want short names in .com / .ru / .net with availability shown alongside the suggestion.
- Secondary: marketers and brand-strategy freelancers who run naming sprints for clients and need a tool that produces ten candidate names plus verified availability in one pass.
- Tertiary: domain investors / "name-hunters" who want a faster availability sweep across a candidate list with a length filter.

## MVP Scope

- A name generator with configurable parameters: length preference (short bias), zone filter (.com / .ru / .net first; additional zones in phase 2), keyword seeding, and a stylistic bias (real-word, invented, blend).
- An availability check that runs in parallel for every generated candidate against the chosen zones, with results displayed inline ("available", "taken", "premium", "error").
- Filters the user can apply on the result list: hide taken, sort by length, sort by zone preference, favourite / save.
- A registrar handoff that links the user to a registrar's purchase page for the chosen available domain, with the registrar's affiliate link wired in for monetisation.
- A free tier with a daily name-generation cap (e.g., 50 candidates per day) so the tool is usable without signup; a paid tier with higher caps, bulk export, and team collaboration for agencies.
- Single-user, single-workspace auth in v1; team features deferred.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The author's stated willingness-to-pay is "hidden commission on the domain purchase", not a SaaS subscription; the v1 monetisation must therefore flow through registrar affiliate links rather than a paid plan, or it fails the stated business model.
- Availability checks must be near-instant for the user's session to feel like one tool, not two; bulk-checking 50 candidates across 3 zones cannot take longer than a few seconds per batch.
- The service must respect each registrar's rate limits and terms of service; a naïve parallel WHOIS flood can get the service rate-limited or banned.
- .ru zones have distinct registry semantics (RDAP rollout, restricted registrars); the .com / .ru / .net path cannot be treated as identical by the availability check.
- The tool must surface "available, not" honestly — claiming a name is available when the actual WHOIS / RDAP says taken is a trust-killing failure.
- The free daily cap is the conversion funnel for the paid tier; setting it too high kills affiliate revenue, setting it too low starves word-of-mouth.
