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

## Tech Stack

The post is from a builder using "vibe coding" — not stated as a specific framework. The only technology surfaces named in the source are the four payment providers he has already evaluated (Razorpay, PayU, Cashfree, Dodo Payments) and the integration flow he wants (UPI / dynamic QR → webhook → backend activation). Naming any other tool, framework, or library would be invention.

## Architecture

None. The "shape" of the post is a small integration flow the author wants the community to confirm is achievable on an individual-friendly Indian gateway:

```
[author's site] → Pay Now → UPI/QR (dynamic)
    → buyer pays in UPI app
    → gateway webhook → author's backend
    → backend verifies payment
    → backend activates credits / subscription
```

The flow is well-defined; the unresolved piece is which gateway will let him run it as an individual.

## Milestones

The post has no milestones. The implicit personal milestones the author is working toward are:

1. Shortlist one or two more Indian payment providers that explicitly onboard individuals and support UPI + webhooks with fast settlement.
2. Decide between (a) registering a company now and unlocking the full provider pool, or (b) staying individual and living with a narrower provider set.
3. Run a sandbox / test transaction on the chosen provider end-to-end and confirm the webhook-to-credit activation loop works.
4. Switch the live site over to the chosen provider once the loop is verified.

## Risks

- **Payout cycle mismatch.** The author's Dodo experience shows that "UPI is available" is not the same as "the payout cycle fits an indie SaaS." Replies that focus only on the integration, not on the cycle, will mislead him.
- **Regulatory drift.** RBI rules on UPI recurring / autopay have changed multiple times since 2023. Replies that name a provider without flagging the date of the rule they are relying on will mislead.
- **KYC scope.** Individual onboarding usually caps transaction value or volume. Replies that assume the author will stay below the cap indefinitely are over-fitting to his current scale.
- **Tax compliance.** GST registration is a separate bucket from payment-gateway onboarding. Replies that ignore it are giving the author a working checkout but not a working business.
- **Source truncation.** The captured problem is truncated; the live Reddit thread may contain context the author did not include in the captured snippet (volume, ticket size, SaaS category). Acting on the capture alone risks over-fit.
