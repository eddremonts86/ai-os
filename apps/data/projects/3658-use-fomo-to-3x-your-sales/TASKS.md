---
id: "3658"
slug: use-fomo-to-3x-your-sales
title: Use FOMO to 3x your sales
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482964"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Next.js, TypeScript, PostgreSQL, Prisma, Stripe Connect, WooCommerce REST API, Edge runtime webhooks]
---
# Use FOMO to 3x your sales

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3658-use-fomo-to-3x-your-sales/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement Stripe Connect webhook intake with signature verification and idempotent event processing into the event log
- [ ] Implement WooCommerce REST API ingestion with webhook support where available and a polling fallback where not
- [ ] Build the notification engine: server-side event selection, rules, and PII redaction enforced server-side
- [ ] Make fake events impossible by construction: every rendered notification traces to a real upstream event in the event log
- [ ] Build the lightweight widget script with a CSP-friendly variant and a fallback for stores that cannot run third-party scripts
- [ ] Ship the merchant dashboard: connected integrations health, recent notifications with their upstream events, and the in-dashboard uplift measurement
- [ ] Add privacy controls: placeholder/redaction options, frequency caps, quiet hours, all enforced server-side
- [ ] Publish the integration roadmap with shipped / in-progress / planned status so "more integrations coming soon" is honest
- [ ] Add a polling fallback for missed Stripe webhooks and a reconciliation pass so missed events do not become missed notifications
- [ ] Document the privacy posture in plain language: what is captured, what is stored, what is shown, what the merchant can configure

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
