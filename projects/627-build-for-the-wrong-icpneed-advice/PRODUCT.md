---
id: "627"
slug: build-for-the-wrong-icpneed-advice
title: Build for the wrong ICP…need advice
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozd65/build_for_the_wrong_icpneed_advice/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [saas, retention, customer-success, icp-discovery]
scores:
  money: 5
  learn: 4
  fun: 4
tech: [Behavioural analytics, segmentation rules, LLM-generated outreach]
---
# Build for the wrong ICP…need advice

> Product brief — auto-generated then authored.

## Value Proposition

**One-liner:** Find the customers you're about to lose, and get a personalised win-back message drafted before they go.

The post frames this as a tool with two halves: at-risk segment identification and personalised message drafting. The value to the operator is recovery — recovering demand before it disappears — but the source also flags a second-order failure mode the tool does not solve: the recovered demand has to be *fulfillable*. That tension is what makes the ICP question load-bearing.

## Target Users

The poster names DTC subscription businesses as the leading alternative to home businesses. From the shape of the problem (capacity-constrained operator + per-customer win-back economics), the candidate set expands to:

- DTC subscription operators whose lapsed subscribers represent recoverable MRR.
- Local service operators (clinics, salons, trades) where an empty slot is the loss, not a missed order.
- B2B SaaS with land-and-expand churn, where a usage drop precedes cancellation.
- Membership and community products where churn is gradual, not abrupt.

What is *not* a target user, by the source's evidence: home businesses whose operational ceiling sits below the demand the tool would surface. They are an explicit failed-validation result.

## Jobs To Be Done

1. **Functional — segment-level risk surfacing.** "Which slice of my customers is about to churn, and what does each slice have in common?"
2. **Functional — message drafting.** "Give me a personalised message for that slice so I am not writing it from scratch at 11pm."
3. **Emotional — operator reassurance.** "I am not losing customers I could have saved; I am at least seeing them before they go."
4. **Negative — don't make things worse.** A win-back tool that pushes more demand than the operator can serve is a tool that breaks trust. The home-business failure is exactly this.

## Success Metrics

- **ICP-validation metric:** number of candidate ICPs taken from hypothesis to a paid or paying-pilot conversation within a defined discovery window. The source itself frames this as the open question.
- **Product-fit metric:** share of generated messages the operator ships to the customer with no rewrite or only minor edits. If most drafts are unusable, the LLM is doing the wrong job.
- **Outcome metric:** recovered customers / saved subscriptions per active segment, measured by the operator's existing system — the tool itself does not own this number.
- **Failure-mode metric:** count of times the tool recommends a win-back against an operator who later reports they could not absorb the demand. A non-zero count is the same trap the home businesses fell into.

## Pricing & Monetization

_TODO:_ the source does not state a willingness to pay, a budget, a comparable spend, or a charging model. Pricing should be set after the first paying-pilot conversation, not before — pricing invented today would misrepresent what the source actually contains.

## Competitive Landscape

The poster names no competitors and the source does not signal awareness of any specific product. The honest framing: this sits adjacent to the **retention / customer-success / CRM** category, where operators today piece together the same job from behavioural analytics, segmentation rules, and message tooling. The tool's defensibility, if it has one, will come from collapsing those three into one workflow tuned to small operators — but that hypothesis is unproven and is not stated in the source.

## Risks & Open Questions

- **ICP is unproven.** The whole post is the author's admission that they have not yet found one. Any plan that names a single vertical as "the answer" is overreach.
- **The "downstream absorption" failure generalises.** A win-back tool that pulls more demand than the operator can serve is a net negative for that operator. The screening question for every candidate ICP is *can they absorb the orders this will surface?*
- **Message personalisation at segment level is unspecified.** The post says "segment" and "personalised" in the same sentence but does not reconcile them — segments by definition group customers, personalisation implies per-customer variation. The product definition is open.
- **No WTP signal.** Pricing cannot be inferred. Treat absence as signal, not as something to fill in.
- **Source is thin.** No team size, no revenue, no customers yet. Sections that would normally lean on those will be short on purpose.
