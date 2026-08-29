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

## Phase 0: Scaffold

- [x] Capture the launch report from HackerNews with its figures intact
- [ ] Write the floor rule in one sentence and keep the implementation to it: pay more, take the floor, previous holder moves down
- [ ] D1 schema: floor, holder, claim, displacement, counter, asset
- [ ] Decide the page-weight budget for a floor image and enforce it in the upload path, not in review
- [ ] Astro board rendering the stack from D1 with the top floor as the visual reward
- [ ] Edge cache policy plus an explicit purge hook fired only on settled claims
- [ ] Stripe Checkout in test mode with the webhook endpoint verified end to end
- [ ] Turnstile on the claim form before any link can be submitted
- [ ] Plausible installed, confirming the country breakdown is available as an API read

## Phase 1: Core

- [ ] Claim flow: pick a floor, enter an amount above the current holder, create a pending claim
- [ ] Hand-off to Stripe Checkout with the pending claim ID carried through the session
- [ ] Settlement webhook: serialised D1 transaction re-reading the floor before installing the holder
- [ ] Refuse-and-refund path when the floor was taken at a higher amount during Checkout
- [ ] Concurrency test: ten simultaneous claims on one floor must produce one holder and nine refunds
- [ ] Displacement: previous holder moves down one position inside the same transaction
- [ ] Displacement notice email with a direct link back to re-take the floor
- [ ] Image upload: resize to the fixed design frame, enforce the byte budget, store at the edge
- [ ] Link validation and a moderation queue for claimed links, with a takedown path that preserves the payment record
- [ ] Cache purge on settlement only, with a test proving an unpaid claim is never renderable
- [ ] Public counters: floors claimed and total sales computed from D1, country split read from analytics
- [ ] Per-floor Open Graph share cards, since the reported ~200k+ impressions came through social posts
- [ ] Displacement animation as the single piece of motion on the page

## Phase 2: Deploy

- [ ] Deploy Workers plus D1 to production with the board served entirely from edge cache at rest
- [ ] Load test at the arrival rate implied by ~200k+ impressions in 24 hours, confirming no origin reads on the read path
- [ ] Switch Stripe to live keys and take one real claim end to end before any promotion
- [ ] Verify the published counters reproduce the launch-report figures exactly: floors claimed 54, total sales in 24 hrs $754
- [ ] Confirm the country breakdown renders the reported spread: 112 countries, top 5 US 20.9%, India 16%, France 11.3%, UK 3.5%, Germany 2.8%
- [ ] Track revenue against advert spend from day one, the $754 versus $700+ ratio being the decision input for the next push
- [ ] Review displacement and re-bid rates weekly; a stalled top floor is the failure mode to watch for
