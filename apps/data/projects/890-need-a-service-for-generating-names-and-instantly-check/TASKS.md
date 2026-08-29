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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Sign up for affiliate programs with the chosen registrars; document each program's terms (payout, clawback, caps)
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Resend email-link auth (passwordless) for the free-tier cap and the paid tier
- [ ] Define Drizzle schema: users, name-generation batches, candidate availability cache, click-through events

## Phase 1: Core

- [ ] Name generator with configurable parameters: length bias, zone filter (.com / .ru / .net first), keyword seeding, stylistic bias (real-word, invented, blend)
- [ ] Availability check per candidate across .com (WHOIS), .ru (RDAP), .net (registrar API or WHOIS)
- [ ] In-memory + SQLite cache of recent availability results with TTL keyed by name + zone
- [ ] Polite queue with rate-limit handling so the service does not get banned by registries or registrars
- [ ] Results page: name, zone, status (available / taken / premium / error), registrar handoff link
- [ ] Filters on the result list: hide taken, sort by length, sort by zone preference, favourite / save
- [ ] Registrar handoff: signed affiliate URL per registrar; click-through event log; first-party conversion dashboard
- [ ] Free-tier daily candidate-generation cap; paid tier for higher caps, bulk export, team collaboration
- [ ] Honest "available" semantics: never report available when the registry is unreachable or behind CAPTCHA — error state is visible to the user
- [ ] End-to-end test: enter keywords, see a batch of candidates with verified availability across .com / .ru / .net, mark one as the chosen domain, click through to registrar, conversion event logged

## Phase 2: Deploy

- [ ] Public landing page with the generation form available without signup
- [ ] Move billing to live mode for the paid tier (Stripe)
- [ ] Pilot the registrar affiliate dashboards against real traffic; verify payout, clawback, and cap terms match expectations
- [ ] Add a second zone tier (e.g., .io / .dev / .app) once the .com / .ru / .net path is stable
- [ ] Open the project to outside contributors (CONTRIBUTING, issue templates, CI on the availability cache)
