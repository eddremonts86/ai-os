---
id: "3715"
slug: editorial-pr-and-guest-post-placements-without-the-gues
title: "Editorial PR and guest post placements, without the guesswork"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488777"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, SEO, Marketing]
tech: [Next.js, Postgres, Stripe, Ahrefs API, Moz API, Majestic API]
---
# Editorial PR and guest post placements, without the guesswork

## Tech Stack

Chosen around one job: showing comparable third-party SEO metrics on every catalogue row and only taking money once the link is verified live.

- **Next.js:** renders the catalogue, quote builder, and admin back-office as one web app.
- **Postgres:** stores publisher records, metric snapshots, quotes, briefs, approvals, and invoices.
- **Stripe:** powers the invoicing step, which is triggered strictly by the live-link verification.
- **Ahrefs API:** supplies DR, RD, and traffic figures on the recorded refresh cadence.
- **Moz API:** supplies DA per publisher for the metrics panel.
- **Majestic API:** supplies TF for the same panel.

## Architecture

- **Catalogue service:** serves publisher records plus their freshest metric snapshots; every row carries a refresh timestamp.
- **Quote builder:** accumulates selected publishers into one quote and captures the content brief without taking any payment upfront.
- **Editorial pipeline:** brief intake, draft submission, buyer approval or revision request, then publisher-side placement.
- **Verification worker:** re-pulls the live URL after publication and only then emits the invoice event; failures route to refund and credit handling.
- **Admin back-office:** onboards publishers, schedules metric refreshes, and adjudicates delivery disputes.

## Milestones

1. **M0 — Catalogue with metrics.** Publisher records, filters, and the metrics panel render with refresh timestamps pulled from the three APIs.
2. **M1 — Quote and editorial flow.** The quote builder, brief intake, and draft approval/revision loop work end to end without payments.
3. **M2 — Live-link invoicing.** The verification worker re-checks the published URL; Stripe invoices fire only after a verified live link; refunds and credits are wired.
4. **M3 — Back-office and launch.** Publisher onboarding, refresh scheduling, and dispute adjudication ship; the catalogue opens to the first real buyers.

## Risks

- **Metric freshness drift:** if the Ahrefs/Moz/Majestic refresh cadence slips, the DR/DA/TF numbers on rows stop being trustworthy and the core promise breaks.
- **Invoice-before-link regression:** any code path that issues a Stripe invoice without a verified live link violates the product's main constraint.
- **ETA promises:** publisher editorial calendars are not predictable; shipping single-date ETAs instead of windows will generate disputes.
- **Sponsored flagging gaps:** a missed sponsored or discreet flag on a row or on the confirmation surfaces a placement the buyer never opted into.
- **API quota pressure:** refreshing 1,330+ publishers against three commercial APIs needs quota planning, or the catalogue goes stale.
