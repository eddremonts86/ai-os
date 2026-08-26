---
id: "706"
slug: building-toogoodtogo-for-developers-objective-100000-in
title: "Building TooGoodToGo for Developers. Objective $100,000 in 30 days. Day 1"
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpzu9n/building_toogoodtogo_for_developers_objective/"
category: saas
date: "2026-08-16"
---
# Building TooGoodToGo for Developers. Objective $100,000 in 30 days. Day 1

## Tech Stack

Not specified by the source. A minimal marketplace needs:

- Listing surface (web) for sellers to post available hours and scopes.
- Buyer-facing search/filter with the gate (vetted-only).
- Application / vetting flow for sellers, including the reference-call step (2 callable clients).
- Stripe Connect (or equivalent) for marketplace escrow + payouts.
- Profile + portfolio surface anchored on the 10-projects / 3-years / 2-references criteria.

## Architecture

```
   seller applies ────►  vetting flow
   (10 projects,           │
    3 yrs, 2 refs)         ▼
                    founder calls 2 refs
                           │
                           ▼
                    seller approved
                           │
                           ▼
                  seller posts a surplus-hour listing
                  (scope, hours, discount vs full rate)
                           │
                           ▼
                  buyer books the scope
                  (escrow holds funds)
                           │
                           ▼
                  work delivered, buyer releases
                           │
                           ▼
                  marketplace takes fee
                  (rate TBD), seller gets payout
```

## Milestones

- [ ] Day 1–7: open the seller application form and publish the vetting criteria; publish the founder's "would you ever accept below-rate work" prompt as a Reddit / LinkedIn follow-up.
- [ ] Day 7–14: vet the first 10 sellers end-to-end (call refs); pick a take-rate after seeing what sellers will accept.
- [ ] Day 14–21: open the buyer-facing listing surface with the first 10 sellers live.
- [ ] Day 21–30: publish daily GMV + repeat-seller rate publicly (the founder commits to "share any learnings").
- [ ] Day 30: post the $100k target's actual outcome and reset the next-30-days plan.

## Risks

- **The seller question is unresolved.** "Would you ever accept below-rate work, even invisibly?" — the founder does not know yet. If the answer is no, the marketplace has no supply.
- **Reference-calling is slow.** Two callable clients per seller is a high bar; throughput per day will be small.
- **Stigma tax.** Even an "invisible" below-rate listing risks devaluing the seller's full-rate work if it leaks; the listing surface needs to control discoverability.
- **$100k in 30 days is aggressive.** At a 10% take rate, GMV needs to hit $1M; the founder's own milestone ladder acknowledges the gap.
