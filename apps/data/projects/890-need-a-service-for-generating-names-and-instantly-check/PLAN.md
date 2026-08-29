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

## Tech Stack

- **Frontend:** React + TypeScript SPA served by TanStack Start, with a generation form (keyword seeds, length bias, zone filter, stylistic bias) and a results page showing name + zone + availability + registrar handoff link.
- **Backend API:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM, single Coolify instance behind Docker.
- **Name generator:** a deterministic-but-varied generator that combines keyword seeds, length heuristics, and stylistic templates (real-word, invented, blend) — kept simple enough that the candidates are explainable, not LLM-dependent.
- **Availability checkers:** WHOIS for legacy zones, RDAP for zones with RDAP support (including .ru via the registry's RDAP endpoint), and direct registrar APIs (Namecheap, Porkbun) for the zones where those APIs are cheaper or more accurate than public WHOIS.
- **Caching layer:** in-memory + SQLite cache of recent availability results, TTL keyed by name + zone, to keep the registrar and registry rate limits happy.
- **Affiliate handoff:** per-registrar outbound link builder that signs the affiliate id into the registrar's purchase URL; click-through and conversion tracked via the registrar's affiliate dashboard plus a first-party event log.
- **Auth:** email-link via Resend (passwordless) for the free-tier cap and the paid tier.

## Architecture

```
Browser ─▶ TanStack Start (SPA + API)
              │
              ├─▶ /api/generate ──▶ name generator ──▶ candidate list
              │                          │
              │                          └─▶ per-candidate availability check
              │                                  │
              │                                  ├─▶ WHOIS (legacy zones)
              │                                  ├─▶ RDAP (.ru and others)
              │                                  └─▶ registrar APIs (Namecheap, Porkbun)
              │                                       │
              │                                       └─▶ cache layer (SQLite + in-memory)
              │
              ├─▶ /api/registrar/handoff ──▶ signed affiliate URL
              │
              └─▶ free-tier counter + paid-tier gating
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + registrar affiliate-program shortlist approved. End of week 1.
2. **M1 — Generator + .com availability.** Name generator produces short candidates; .com availability checked via WHOIS with caching and rate-limit handling. End of week 3.
3. **M2 — .ru + .net availability.** RDAP path for .ru; registrar API path for .net; result list shows availability per zone per candidate. End of week 5.
4. **M3 — Registrar handoff + affiliate wiring.** Signed affiliate URLs per registrar; click-through event log; first-party conversion dashboard. End of week 7.
5. **M4 — Free-tier cap + paid tier.** Free-tier daily candidate-generation cap; paid tier for higher caps, bulk export, and team collaboration. End of week 9.
6. **M5 — Pilot + affiliate-program validation.** Real traffic against the chosen registrars; affiliate-program terms validated (no surprise clawback clauses); conversion-rate baseline set. End of week 12.

## Risks

- **Registrar affiliate terms.** Affiliate programs vary widely on payout, refund-clawback, and monthly caps; the v1 business model is only as solid as the chosen programs' terms, and a surprise clawback clause or low payout rate would erode the conversion math.
- **.ru registry semantics.** Russian registry data is sometimes slow or behind CAPTCHA; the v1 must not silently return "available" when the answer is "registry unreachable", or the trust signal collapses the first time a user buys through and the registrar says the domain is taken.
- **Rate-limit behaviour.** A naïve parallel fan-out across WHOIS / RDAP / registrar APIs is the right user experience but acts like a scraper if uncapped; a polite queue with backoff and a cache is necessary, but adds latency that has to stay under the user's "feels like one tool" threshold.
- **"Premium" domain ambiguity.** Some registrars mark taken-but-resellable domains as "premium" with a non-standard price; the result list must distinguish "taken" from "premium" so users do not click through expecting a standard registration.
- **Free-tier calibration.** The free daily cap is the conversion funnel for the paid tier; setting it too high starves affiliate revenue, too low starves word-of-mouth. The cap is a real product dial that has to be measured, not picked.
- **Name-generator creativity ceiling.** A non-LLM generator produces explainable, low-cost candidates but is bounded in stylistic variety; if candidates feel formulaic, the AI-chatbot competitors look more attractive despite their weaker availability story. v1 should ship the simple generator and revisit LLM-augmented generation only if the variety ceiling becomes a measurable conversion problem.
