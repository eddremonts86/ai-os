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

## Tech Stack

- **Next.js (App Router) with TypeScript** for the public directory and the authenticated dashboard, because the pages are search-heavy and the same components serve both marketing and authenticated users.
- **Postgres** as the system of record for properties, contacts, verifications, outbound logs and reply captures, because the data is relational and the verification history per property is what makes the score meaningful.
- **SerpAPI** to fill gaps in the public listings feed for properties the editorial feed does not cover, and to validate phone and email details against current web sources.
- **Resend** for the outbound email helper, because the user sends from their own mailbox and a transactional email provider with clean deliverability is the simplest path.
- **Stripe Checkout** for the small monthly subscription, because the post names no payment shape and Checkout is the lowest-friction way to take a flat fee without building a billing system.
- **Vercel** for hosting, because the directory is a web app with no long-running workers and Vercel's edge cache suits the per-property read path.

## Architecture

An ingest job runs nightly and merges a public listings feed with SerpAPI lookups into a Postgres properties table. Each row carries a structured contact record with phone, reservations email, sales email, WhatsApp link and the date each channel was last verified. A second job performs rolling independent test calls on a sampled subset of properties so the verification date on every card reflects real work, not a self-reported form.

The public directory serves property cards from Postgres with a small read-through cache. When a user enters dates, the page requests a comparable aggregator quote for those dates and the property; the saving shown on the card is computed at request time rather than asserted from a static range, even though the poster's named 15-30% range is shown as the historical starting point. The outbound helper is a server-rendered form: the user edits the message, Resend sends it on the user's behalf and the reply is captured back into Postgres so the property-level reply rate updates over time.

The subscription gate sits in front of the contact card and the outbound helper, with Stripe Checkout handling the small monthly fee. A small editorial console in the same Next.js app lets the team flag a stale contact, mark a verification date or pull a property that has asked to be removed. The hard parts are verification honesty, the comparable-price quote and the discipline of never taking a referral fee from an aggregator, which would recreate the markup the product exists to avoid.

## Milestones

1. **M1 — Index and contact cards** — public listings feed ingest, Postgres schema for properties and contacts, and a UK-first directory page rendering the contact card per property.
2. **M2 — Verification loop** — rolling independent test-call sampling, verification dates on every card, and a contact-confidence score that updates over time.
3. **M3 — Comparable price** — aggregator quote for the user's dates, the saving shown per property, and the historical 15-30% range quoted as the poster's own starting point.
4. **M4 — Outbound helper** — Resend-backed enquiry draft, reply capture into Postgres and the per-property reply-rate signal surfaced on the card.
5. **M5 — Subscription** — Stripe Checkout, the monthly search gate, and the flat-fee shape the architecture suggests.
6. **M6 — Editorial console** — flag a stale contact, update a verification date, and process a property-manager deletion request without a code change.

## Risks

- **Stale contact data** — the verification date is the only honesty signal; if it slips the directory becomes indistinguishable from a generic search engine.
- **Aggregator quote mismatch** — comparing the wrong room type or the wrong cancellation policy makes the saving misleading; the comparison must be against the same night and the same room.
- **Referral-fee temptation** — taking a commission from an aggregator would solve the cash-flow problem and recreate the markup the product exists to avoid; the constraint has to be written into the architecture, not just the pricing page.
- **Property-manager pushback** — a property that does not want to be listed, or wants its phone removed, needs a fast deletion path; slow removal is a credibility cost.
- **GDPR scope** — both users and properties are UK-located, so the data flow has a documented basis, retention and deletion path.
- **Sampling bias in verification** — if the rolling sample favours the same properties every month, the score stops reflecting reality; the sampling has to be genuinely random across the index.
- **Reply capture dropping** — if Resend's reply routing silently drops a property's response, the reply-rate signal becomes noise; a manual override has to exist.
