---
id: "3161"
slug: recalled-track-your-products-and-get-instant-alerts-whe
title: Recalled – Track your products and get instant alerts when recalls occur
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/recalled?utm_campaign=startup-184458&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [mobile app, push notifications, REST API, SQLite/Postgres]
---
# Recalled – Track your products and get instant alerts when recalls occur

## Phase 0: Scaffold

- [ ] Audit the four agency feeds (CPSC, NHTSA, FDA, USDA) and document each one's published format and cadence
- [ ] Pick a push provider (APNs + FCM) and wire credentials
- [ ] Define the common recall-record schema the normaliser will produce
- [ ] Decide how a photo-saved product maps to a recall-matchable identifier — the post does not state this

## Phase 1: Core

- [ ] Build a daily ingestion job per agency with a normaliser into the common schema
- [ ] Build the saved-product model with photo, barcode, and manual entry paths converging on one record
- [ ] Implement match logic that fires within the same daily window a recall lands
- [ ] Wire push notifications with Class I / serious-hazard flagging and a link to the original notice

## Phase 2: Deploy

- [ ] Ship the mobile app to TestFlight / internal track and confirm push delivery end-to-end
- [ ] Verify in production: save a known-recalled product, wait for the next daily cycle, confirm the alert arrives with the original-notice link

---

_Generated automatically by Lúa on 2026-08-26_
