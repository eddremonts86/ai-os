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

## Problem
 I'm building a small SaaS project in India using vibe coding, and I'm currently stuck at the payment part. I basically need a simple setup where users can pay through UPI on my website (ideally a dynamic QR / UPI checkout), I get a webhook when the payment is successful, and then my backend can automatically activate the credits/subscription they purchased. Fast settlement would be a big plus, ideally same-day or close to instant. The problem is that I'm currently operating as an individual/freelancer. I have my personal KYC, personal bank account and a live website, but I haven't registered a company yet. I don't really want to spend weeks and a significant amount of money registering a business first, only to then wait another few weeks for a payment gateway approval, especially when I'm still validating the product. I've already tried a few options: - Razorpay: applied, but I've been waiting for a very long time and haven't received a proper response yet. - PayU: they rejected the application saying my line of business didn't fit their criteria. - Cashfree: I'm currently exploring this, as I already have an old verified individual account with them. - Dodo Payments: verification went through and UPI is available, but the payout cycle isn't practical for my use case. So I'm trying to figure out what other freelancers/indie hackers in India are actually using for this. I'm NOT looking to bypass KYC or do anything shady. I just need a legitimate provider that is comfortable onboarding an individual/freelancer, accepts UPI, provides API/webhook support, and ideally offers fast settlement. The flow I'm looking for is basically: User → Pay Now → UPI/QR → Payment → Webhook → Payment verified → Credits/subscription activated If you've personally used a provider that works well for this, I'd really appreciate some recommendations or experiences. Especially interested in: - Whether they accepted you as an individual/freelancer - What documents they asked for - UPI support... [truncated]

---

## Objective

This is an onboarding-problem question to r/SaaS, not a product spec. An Indian freelancer / indie SaaS builder is stuck at the payment step because the payment gateways he has tried either reject individual applicants (PayU), take too long to respond (Razorpay), or have impractical payout cycles (Dodo Payments). He wants a legitimate provider that will onboard him as an individual, supports UPI (dynamic QR / UPI checkout) with API and webhooks, and settles quickly. He explicitly says he is not trying to bypass KYC or do anything shady — he just does not want to spend weeks and money registering a company first while he is still validating. The post names the integration flow he wants end-to-end. No product, vertical, or ICP is named.

## Target Users

- Primary: r/SaaS readers in India (or familiar with the Indian payment ecosystem) who have onboarded as individuals / freelancers to a payment gateway that supports UPI with webhooks, and can describe the experience.
- Secondary: other Indian indie hackers validating a product who are weighing whether to register a company first or to find an individual-friendly gateway first.
- Tertiary: payment providers themselves — the post is, in effect, a public ask from the buyer side of the market.

## MVP Scope

No product is described. The closest thing to a deliverable is the open question the post puts to the community, which has three threads:

1. **Provider recommendations from individual-friendly experience.** Other freelancers / indie hackers in India: what gateway did you use, did they accept you as an individual, what KYC / documents did they ask for, and is UPI supported with API + webhooks?
2. **Settlement and payout cycle.** The author specifically calls out Dodo Payments as failing on payout cycle, and wants same-day or close to instant. Replies that name a provider with the right cycle are the gold.
3. **Order-of-operations advice.** The author is weighing "register a company first" vs. "find an individual-friendly gateway first." Replies from people who have done either path (and what it cost in time and money) help him choose.

The integration flow the author wants end-to-end is:

```
User → Pay Now → UPI/QR → Payment → Webhook → Payment verified → Credits/subscription activated
```

If anything were to be built from this post, it would be a provider-comparison tool or an individual-onboarding facilitator. That is out of scope here.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- No product, no tech, no pricing, no go-to-market. The post is a provider-recommendation question.
- The author has named four providers he has already tried (Razorpay, PayU, Cashfree, Dodo Payments) with the outcome for each. Replies that recommend a fifth provider should address at least one of his stated failure modes (individual onboarding, UPI + webhooks, payout cycle).
- The author does not name a vertical, monthly volume, or transaction size. Replies that assume "high-volume SaaS" or "consumer subscription" over-fit.
- The post is truncated in capture; the source page on Reddit may have additional context (the truncation is from the corpus scraper, not the source). Replies should be treated as advice to the author, not as a complete spec.
- The author is explicit: "NOT looking to bypass KYC." Any reply that suggests a workaround that bends KYC rules is out of scope and is doing him a disservice.
