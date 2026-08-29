---
id: "3601"
slug: show-hn
title: Show HN
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49478909"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Astro, Cloudflare Workers, Cloudflare D1, Stripe Checkout, Cloudflare Turnstile, Plausible Analytics]
---
# Show HN

## Tech Stack

- **Astro** for the board itself: the stack of floors is content that changes on a claim, so it ships as static HTML with almost no client JavaScript, which is what keeps a design-led page fast for the majority of visitors who never pay.
- **Cloudflare Workers** as the edge runtime. With 12,000+ visitors from 112 countries and no country above 20.9%, there is no correct origin region, so the read path is served from wherever the visitor is.
- **Cloudflare D1** for floor state: the write volume implied by 54 floors claimed in 24 hrs is tiny, and a single-writer SQL store makes the one operation that must be serialised — taking a floor — easy to get right.
- **Stripe Checkout** for payments, hosted rather than embedded, so card data never touches this codebase and the claim flow is a redirect plus a webhook instead of a payment integration to maintain.
- **Cloudflare Turnstile** on the claim form, because a paid link surface is a spam target from the first hour and a captcha that does not degrade the page is part of the design constraint.
- **Plausible Analytics** for the visitor and country numbers the operator publishes — 112 countries and the top-5 split — collected without a cookie banner sitting on top of the design.

## Architecture

The board is a static page rebuilt on every state change. Floor state lives in D1; a Worker renders the stack to HTML and puts it behind an edge cache with an explicit purge on claim settlement. That inversion is deliberate: the read path serves a viral spike from cache with no database touch at all, which is what makes ~200k+ impressions worth of referral traffic affordable, while the write path stays small enough to be careful with. Floor images are uploaded once, resized to the fixed frame the design imposes, and served from the same edge, so no claimant can push page weight past the budget for everyone else.

Taking a floor is a two-phase operation. A visitor picks a floor and enters an amount above the current holder's; the Worker records a pending claim carrying the floor, the amount and the previous holder, then hands off to Stripe Checkout. Nothing on the board changes yet. When the payment webhook arrives, a single serialised transaction in D1 re-reads the floor, confirms the paid amount still exceeds the current holder's, moves the previous holder down one position, installs the new holder, and only then purges the cached page. If the re-read shows the floor was taken by a higher amount in the meantime, the transaction refuses and the payment is refunded rather than producing a second holder on one floor. Ordering the check after settlement, not before, is what keeps money and position consistent.

Displacement is an event, not a side effect. When a holder moves down, the transaction writes a notification row and the mailer sends it, because the only reason a board like this keeps earning is that being pushed off a floor is felt and answered. Public counters — floors claimed, total sales, visitor and country splits — are computed from D1 and the analytics API into a cached fragment, so the operator's next launch post is a read rather than a manual tally of the kind the original numbers were.

## Data Model

- `floor` — position in the stack, current holder, current amount, claimed timestamp.
- `holder` — display name, link, image reference, contact address for displacement notices.
- `claim` — floor, holder, amount, state (pending, settled, refused, refunded), Stripe session, previous holder.
- `displacement` — floor, previous holder, new amount, notified timestamp.
- `counter` — computed snapshot of floors claimed and total sales, so published figures are reproducible.
- `asset` — uploaded image, normalised dimensions, byte weight, so the page-weight budget is enforced in data rather than by convention.

## Integrations

- **Stripe Checkout and webhooks** — payment collection, settlement events, and refunds for refused claims.
- **Plausible Analytics** — visitor and country breakdown, the source of the 112-country figure.
- **Transactional email** — displacement notices, the mechanic's feedback loop.
- **Social share cards** — per-floor Open Graph images, since the ~200k+ impressions came through social posts.

## Milestones

1. **M0 — The stack, static and fast.** Floors rendered from D1 to a cached edge page with the design's image frame and weight budget enforced. Exit criterion: the board serves from cache with no database read, and adding a floor image cannot exceed the page-weight budget.
2. **M1 — A paid claim that settles.** Pending claim, Stripe Checkout, webhook, serialised install, cache purge. Exit criterion: a test card takes a floor end to end and the board shows the new holder within seconds of settlement, with no unpaid claim ever visible.
3. **M2 — Concurrency proven.** Two simultaneous claims on the same floor. Exit criterion: a scripted race of ten concurrent claims on one floor produces exactly one holder, and every losing payment is refunded automatically with a record of why.
4. **M3 — Displacement loop closed.** Previous holder moves down and is notified. Exit criterion: a displaced holder receives the notice and can re-take the floor from the link in it, and the displacement is recorded for the re-bid metric.
5. **M4 — Public counters and launch readiness.** Floors claimed, total sales and the country split computed rather than typed. Exit criterion: the page reports the same figures the operator would otherwise assemble by hand, and a load test at the arrival rate implied by ~200k+ impressions in 24 hours holds without a scaling change made under load.

## Risks

- **Money and position can diverge.** A payment that settles while a floor moves is the one failure that produces two holders or a paid claim with nothing to show. It is why the check runs inside the settlement transaction and not before Checkout.
- **A viral read spike is cheap only if it stays cached.** One uncached dynamic element on the board turns 12,000+ visitors across 112 countries into a database problem; cache correctness is a revenue concern, not a performance nicety.
- **The mechanic can stall.** If nobody outbids the top floor, the competition and the income stop together, and no amount of design fixes it.
- **Traffic was bought.** The reported 12,000+ visitors and ~200k+ impressions came alongside $700+ of advert in 24 hours. The unpaid baseline is unknown, so unit economics built on the launch numbers are provisional.
- **Paid links attract abuse.** A live link on a visible surface will be used for something bad eventually; without moderation the design differentiator becomes a liability.
- **Fees bite at small tickets.** With total sales in 24 hrs $754 across 54 floors claimed, per-transaction payment fees are a real share of the take and constrain any minimum claim amount.
- **The idea is not scarce.** Thousands of clones exist. Execution and cadence are the whole moat, and the author's own conclusion is the operating rule: "Keep shipping. Over. And over."
