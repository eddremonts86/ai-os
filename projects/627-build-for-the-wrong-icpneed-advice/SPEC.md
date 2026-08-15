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

## Problem

The author has built a tool that does two things: (1) identifies customer segments that are at risk of churning or going dormant, and (2) drafts a personalised message to win them back. The tool was shaped after several interviews with **home businesses** — but those interviewees turned out to be the wrong customer: they like the idea of winning back lost customers, yet they don't have the operational capacity to absorb the orders the win-back would generate. The funnel breaks downstream of the tool itself: more demand lands, but the small operation can't fulfil it.

That leaves the author with a working concept and a known-wrong ICP. They explicitly ask the subreddit who else would find this useful, and name **DTC subscription businesses** as the leading candidate to test next. The whole post is, in effect, a request for help picking the next customer segment to validate against.

## Objective

Build the at-risk-segment-and-win-back-message workflow into a form that can be tested against multiple candidate ICPs, so the author can find the one whose customers both *want* the win-back output and *can absorb the resulting orders*. ICP selection is the open question — the objective is to make that question cheap to test rather than to lock in a single vertical prematurely.

## Target Users

The post is short on specifics, so what follows is the candidate set the source implies, not invented segmentation.

- **Primary candidate (author's own hypothesis):** DTC subscription businesses — recurring-revenue operators whose customers lapse or skip boxes and where each saved subscription compounds into MRR.
- **Adjacent candidates implied by the problem shape:** any small operator with the same two properties the home businesses lacked — (a) demand is constrained by capacity to fulfil, but (b) losing a customer is expensive enough that a win-back is worth a personalised message. Examples that fit that shape from the source's framing: local service businesses (salons, clinics, trades) where a slot is recoverable, B2B SaaS with land-and-expand churn, community / membership products.
- **Explicitly excluded by the source's evidence:** the original home-business ICP — they want the output but cannot use it. Treat this as a finding, not a guess.

## MVP Scope

A tool that, given a customer list with behavioural history, produces: (1) a ranked list of at-risk segments (not individual users — the post talks about *segments*), (2) for each segment, a draft personalised message intended to win them back. The MVP must be operable by a non-technical founder against more than one candidate ICP, because the ICP itself is the unproven variable.

What the MVP deliberately does not include:
- Any fulfilment, scheduling, or order-intake system — the bottleneck the home businesses hit lives downstream of the tool.
- Any single-vertical specialisation — segment definitions and message templates need to be editable per ICP candidate while discovery is open.
- Automated sending — drafts only, since the author is iterating on which customers actually exist.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- **No ICP yet.** The author states they are explicitly searching for one. Any plan that pretends to ship a verticalised product misrepresents the source.
- **No willingness-to-pay signal.** The post never quotes a price, a budget, or a comparable spend. Pricing must wait for first validation conversations.
- **The "downstream absorption" failure mode is real and general.** A small operator who can't fulfil one more order will not pay for a tool that produces more orders. Any candidate ICP must be screened for that property before time is spent on deeper validation.
- **Post is thin on specifics** — no team size, no revenue figures, no segment definitions, no tool surface. Sections that lean on these will be honestly short.