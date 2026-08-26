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

## Tech Stack

Not specified by the source — the founder describes only the loop, not the product under growth. A minimal implementation needs:

- An inbox or shared mailbox to receive post links from users.
- A subscription/billing system that can grant time-bound paid-tier access (Stripe customer + subscription pause/resume, or a per-day promo credit).
- A tracking table linking each granted day to the public-post URL it was earned against.

## Architecture

```
  user posts publicly
        │
        ▼
  user emails the post URL  ──────►  shared inbox
                                          │
                                          ▼
                              founder verifies the post
                            (human review, ~30s/post)
                                          │
                                          ▼
                          billing system grants +1 day
                                          │
                                          ▼
                       founder sends a personal thank-you
                       (the post claims this is what
                        actually drives repeat posting)
```

Manual at every step until volume forces automation. The founder's hypothesis is that the manual thank-you is part of the value, not a temporary cost.

## Milestones

- [ ] Day 0 (Sunday launch): open the inbox, write the rules-of-engagement reply template, publish the link in the extension's settings page.
- [ ] Week 1: count posts vs paid upgrades attributable to a known post URL.
- [ ] Week 4: compare repeat-poster rate vs one-time-poster rate (the founder's central claim).
- [ ] Month 3: decide whether to keep the loop manual, add a verification step, or introduce a cap.

## Risks

- **Adversarial posting.** Users could screenshot a draft and claim credit for it; require a live URL.
- **Reward-as-loophole.** A user who values paid access at $X/day can harvest 30 free days with 30 trivial posts; verify content quality, not just the URL.
- **Manual-fulfilment fatigue.** The thank-you is the actual lever per the founder; if the team stops being personal, the loop flattens.
- **Platform risk.** Public-post URLs depend on the host (X, Bluesky, LinkedIn, Reddit) staying accessible and not deleting the post later; archive each one.
