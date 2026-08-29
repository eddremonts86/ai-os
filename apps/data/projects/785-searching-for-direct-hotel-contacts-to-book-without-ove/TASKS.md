---
id: "785"
slug: searching-for-direct-hotel-contacts-to-book-without-ove
title: "Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/travel/kymbn6kp61-searching-for-direct-hotel-contacts-to-b"
category: travel
date: "2026-01-19"
tags: [Travel, AI, Other]
country: UK
tech: [Next.js (App Router), TypeScript, Postgres, SerpAPI, Resend, Stripe Checkout, Vercel]
---
# Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/785-searching-for-direct-hotel-contacts-to-book-without-ove/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Ingest the UK public listings feed and SerpAPI lookups into Postgres with one row per property and a structured contact record
- [ ] Serve a directory page that renders a contact card per property with verification dates on every channel
- [ ] Implement the rolling independent test-call sampling so the verification date on the card reflects real work
- [ ] Add the aggregator comparable-price lookup for the user's dates and show the saving per property, quoting the poster's 15-30% range as the historical starting point
- [ ] Wire the Resend outbound helper: user edits the enquiry, sends from their own mailbox, reply is captured back into Postgres
- [ ] Surface the per-property reply-rate signal on the card and update it as new replies land
- [ ] Add Stripe Checkout and the monthly search gate that unlocks the contact card and the outbound helper
- [ ] Build the editorial console: flag a stale contact, update a verification date, and process a property-manager deletion request without a code change
- [ ] Document the GDPR basis, retention and deletion path for both user and property data
- [ ] Run a sampling-bias check so the rolling test-call sample does not favour the same properties every month

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
