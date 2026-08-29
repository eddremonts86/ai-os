---
id: "3651"
slug: im-auctioning-10-sticker-spots-on-an-rtx-5090-to-pay-fo
title: "I'm auctioning 10 sticker spots on an RTX 5090 to pay for the GPU"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483507"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Next.js, TypeScript, Stripe, PostgreSQL, Redis, Tailwind CSS]
---
# I'm auctioning 10 sticker spots on an RTX 5090 to pay for the GPU

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3651-im-auctioning-10-sticker-spots-on-an-rtx-5090-to-pay-fo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the public landing page that explains the auction, the GPU and what the ten winners get
- [ ] Implement the bid submission flow with email, amount and sticker design
- [ ] Persist bids in PostgreSQL with the auction state machine and a stated end time
- [ ] Render the live top-ten leaderboard and the running funding coverage
- [ ] Lock the top ten at the stated end time and reject the rest
- [ ] Charge the ten winners through Stripe with retries on transient failures
- [ ] Refund any pre-authorisation on non-winning bidders after the close
- [ ] Ship the post-auction page with the ten winners, the GPU's serial and a placeholder photo
- [ ] Document the auction rules explicitly, including what happens if bids do not cover the retail price
- [ ] Verify the close mechanism under contention so two near-simultaneous bids cannot both claim the same spot

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
