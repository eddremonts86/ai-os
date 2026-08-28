---
id: "705"
slug: we-pay-users-with-free-product-days-for-posting-about-u
title: We pay users with free product days for posting about us - the experiment
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vq000g/we_pay_users_with_free_product_days_for_posting/"
category: saas
date: "2026-08-16"
---
# We pay users with free product days for posting about us - the experiment

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/705-we-pay-users-with-free-product-days-for-posting-about-u/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up a shared inbox for post-link submissions
- [ ] Build a verification workflow (founder opens the link, confirms it is a real public post about the product)
- [ ] Wire Stripe (or equivalent) to grant one paid-tier day per verified post
- [ ] Write the personal thank-you email template (founder claims the personal touch, not the reward, drives repeat posting)
- [ ] Track each granted day against the source post URL for later attribution
- [ ] Add a public rules-of-engagement page in the extension's settings explaining the loop and the no-store-reviews rule

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-16_
