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

## Problem
 Two-person bootstrapped product, no ad budget. So the marketing budget lives inside the product: any user who posts publicly about the extension sends us the link and gets one free day of the top plan per post. Uncapped - 30 posts is a free month. [preview.redd.it/nqmx3kyo9rjh1.png…](https://preview.redd.it/nqmx3kyo9rjh1.png?width=473&format=png&auto=webp&s=e8dbec70ee5b90e86944c13f7e6a10edab18823f) Design decisions that mattered: - Social posts ONLY. Nothing touches store reviews, ever - review incentives are policy violations and trust poison. - Uncapped on purpose: the person doing 20 posts is exactly the evangelist we want to super-serve. - Manual fulfillment by email - the personal thank-you drives repeat posting more than the reward does. - The reward is paid-tier access, so the reward itself demos the upgrade. User posts convert better than anything we write, because they sound like humans. Launch is Sunday; this flywheel is a big part of the plan. Curious if others have paid users in product instead of ads. submitted by /u/Ok_Negotiation_2587 [link] [comments]

---

## Objective

Document a growth mechanic the founder is using for their own two-person bootstrapped browser-extension product: instead of buying ads, they reward paying-tier users who publicly post about the product with one free day of the top plan per post (uncapped). The plan captures the mechanic, the design rules it depends on, and the failure modes the founder is explicitly guarding against, so a reader can decide whether to copy it. The product under growth is not separately scoped here.

## Target Users

- Two-person bootstrapped SaaS founders who have a paid tier but no ad budget and are launching on a Sunday.
- Indie hackers running a small paid extension / micro-SaaS who want to convert user word-of-mouth into trackable, budgeted acquisition.

## MVP Scope

- A lightweight reward loop: user posts publicly about the product → user sends the link to the founder → founder personally emails the user and grants one free day of the top plan per verified post.
- Cap or uncapping is a deliberate founder choice; the post argues for uncapping (the 20-post evangelist is the user to super-serve).
- Manual fulfilment by email is the loop the founder is shipping with; the personal thank-you, not the reward, drives repeat posting.
- Reward is paid-tier access only — never store reviews (those are policy violations and trust poison).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Social posts only — no store review incentives, ever.
- Reward must be paid-tier access so the reward itself demos the upgrade.
- Personal, manual fulfilment by email — no automated redemption.
- Uncapped on purpose; do not introduce a cap.
