---
id: "556"
slug: i-built-a-pricing-research-tool-youd-be-surprised-how-m
title: "I built a pricing research tool, you'd be surprised how many people initially set their pricing just based on a competitor"
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6270/i_built_a_pricing_research_tool_youd_be_surprised/"
category: saas
date: "2026-08-14"
---
# I built a pricing research tool, you'd be surprised how many people initially set their pricing just based on a competitor

## Tech Stack

- **Survey runner:** a hosted survey endpoint that lets the founder push a Van Westendorp (or alternative) price-sensitivity survey to their own list, with consent-aware respondent capture.
- **Price-impact modeler:** a deterministic model that takes the survey outputs (acceptable price range, indifference point, optimal price point, resistance point) and projects MRR / break-even retention under a candidate price.
- **Decision log:** every price change ships with a `pricing_decisions` row containing the chosen price, the modelled outcome, and the realised outcome 30/60/90 days later; the log surfaces "what we tried and what worked" to the founder.
- **Web app:** Next.js + a multi-tenant row-level scope so each founder's data is isolated.
- **Payments:** Stripe subscriptions with a 30-day free trial.

## Architecture

Kinetic Pricing (the OP's product) addresses a specific founder behaviour: copy-pasting a competitor's $29/$49/$99 ladder without testing the actual willingness-to-pay. The product runs a Van Westendorp price-sensitivity survey on the founder's own list, then models the revenue impact of each candidate price and logs the decision so the founder can revisit. The wedge is not "do more research"; it is "do the right research on the panel you already have, and keep the receipts".

```
Founder's list ─▶ survey endpoint ─▶ Van Westendorp outputs
                                                    │
                                                    ▼
                                       price-impact modeler ──▶ MRR projection + break-even retention
                                                                                  │
                                                                                  ▼
                                                                       pricing_decisions log
                                                                       (chosen / modelled / realised)
```

## Milestones

1. **M0 — Survey-only MVP.** Hosted Van Westendorp survey + dashboard with the four PSM points. End of week 3.
2. **M1 — Price-impact modeler.** Project MRR + break-even retention per candidate price. End of week 6.
3. **M2 — Pricing-decision log + 30/60/90-day realised view.** End of week 9.
4. **M3 — Pricing experiments (price A vs price B over a defined window).** End of week 12.
5. **M4 — Public release + paid tier.** End of week 16.

## Risks

- **Survey quality depends on the panel.** Van Westendorp on a cold list produces garbage; on the founder's actual users or activated signups, it produces a defensible signal. The product must refuse to run on a too-small or too-cold panel, with a clear "your list is too small" message.
- **Modelled vs realised gap.** A modelled MRR projection is not a guarantee; founders will eventually compare what the model said against what happened. The decision log surfaces this honestly only if the realised numbers are captured, not skipped.
- **The OP self-promotes.** The Reddit post openly mentions "i'm building Kinetic Pricing around exactly this". The plan is honest about that and treats the OP as the user-research source, not a neutral observer.
