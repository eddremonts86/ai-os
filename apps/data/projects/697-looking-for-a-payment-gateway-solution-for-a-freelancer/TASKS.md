---
id: "697"
slug: looking-for-a-payment-gateway-solution-for-a-freelancer
title: Looking for a payment gateway solution for a freelancer/indie SaaS in India
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vq136d/looking_for_a_payment_gateway_solution_for_a/"
category: saas
date: "2026-08-16"
---
# Looking for a payment gateway solution for a freelancer/indie SaaS in India

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/697-looking-for-a-payment-gateway-solution-for-a-freelancer/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

The post is a provider-recommendation question, not a buildable product. There is no engineering work in scope for this plan. If the author wants to convert the thread into a decision he can act on for his own SaaS, the implied follow-ups are:

- [ ] Read the source Reddit thread on the live page; the captured problem text is truncated and may include context (volume, ticket size, SaaS category) that changes the answer.
- [ ] Skim replies for Indian freelancers who have actually onboarded individually to a named gateway — filter out the rest.
- [ ] For each candidate provider, write down the three buckets the author cares about: individual onboarding outcome, UPI + webhook support, payout cycle.
- [ ] Decide whether to keep trying as an individual or to register a company first; the order-of-operations trade-off is the most expensive unstated decision in the post.
- [ ] Run a sandbox / test transaction end-to-end on the chosen provider before switching the live site — verify the webhook-to-credit activation loop works, not just the charge.
- [ ] Confirm the GST position separately; a working checkout with no GST registration is not a working business in India once he crosses the registration threshold.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-16_
