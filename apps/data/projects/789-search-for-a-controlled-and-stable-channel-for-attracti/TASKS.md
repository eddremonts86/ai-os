---
id: "789"
slug: search-for-a-controlled-and-stable-channel-for-attracti
title: "Search for a controlled and stable channel for attracting clients to a banquet hall, as an alternative to unpredictable social media advertising"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/g9lxp72ug1-search-for-a-controlled-and-stable-chann"
category: marketing
date: "2026-01-18"
tags: [Marketing, Business, AI, Other]
country: Algeria
tech: [Astro, Cloudflare Pages, Cloudflare D1 (SQLite), Cloudflare Workers, Cal.com embed, Telegram Bot API, Meta Lead Ads webhook, Plausible analytics]
---
# Search for a controlled and stable channel for attracting clients to a banquet hall, as an alternative to unpredictable social media advertising

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/789-search-for-a-controlled-and-stable-channel-for-attracti/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Astro venue page with structured data for the venue's name, address, capacity, photos and price band
- [ ] Deploy the venue page to Cloudflare Pages with the edge cache configured for the Algerian mobile network conditions
- [ ] Add the structured enquiry form with pre-qualifying fields and the Cloudflare Worker intake endpoint
- [ ] Define the D1 schema for enquiries and tour bookings, with the operator-side fields kept separate from public fields
- [ ] Wire the operator notifications: email, Telegram message into the private channel, and Cal.com tour-booking link
- [ ] Connect the Telegram bot to the venue's Telegram account and the operator's private channel for capture-only summaries
- [ ] Add the Meta Lead Ads webhook and route paid leads through the same qualification form and the same D1 schema
- [ ] Build the single sign-on protected admin page that shows the last 30 days of enquiries and the conversion to booked tours
- [ ] Add Plausible to the venue page so the operator can see organic traffic and conversion without a third-party pixel
- [ ] Run a slow-network rehearsal on the venue page and the enquiry form so the funnel survives the connection the user actually has

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
