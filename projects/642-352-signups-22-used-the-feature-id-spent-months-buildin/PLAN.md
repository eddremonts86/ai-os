---
id: "642"
slug: "352-signups-22-used-the-feature-id-spent-months-buildin"
title: "352 signups, 22 used the feature I'd spent months building. So I cut the feature, not the product"
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Next.js for the marketplace + thread UI, Postgres for members and agreements, a worker (BullMQ or similar) for periodic backlink verification, an HTTP crawler that follows the agreed URL and asserts the link exists with the agreed anchor and target.

## Architecture

Member profile + site catalogue → browse/filter → thread-based agreement → agreement record → verification worker (cron) crawls target page, parses links, checks anchor + href match → updates trust score.

## Milestones

- [ ] Member + site catalogue schema
- [ ] Browse + filter UI
- [ ] Thread-based agreement flow with anchor/URL fields
- [ ] Agreement → verification job queue
- [ ] Verification crawler with anchor + href matching
- [ ] Trust score derived from verification outcomes

## Risks

- Verification is the only durable moat and it has to be hard to game (sandboxed targets, randomised re-check cadence).
- Cold-start: a backlink exchange with few members has nothing to match against — founder needs a launch wedge.
- The poster's prior automation is a sunk-cost risk: scope creep back into "make it easier" features that recreate the trust problem.
