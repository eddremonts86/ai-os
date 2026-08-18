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

## Tech Stack

Chosen for this problem, not from a default catalogue.

- **Behavioural analytics layer** — read customer-level activity (purchase cadence, last-touch, tenure, channel) and produce at-risk signals. A small PostgreSQL or equivalent data store plus rule-based thresholds covers the MVP; a heavier analytics engine is premature until the ICP is fixed.
- **Segmentation rules** — group at-risk customers into named segments the operator can act on. Editable per ICP candidate, because the segment definitions are part of what is being validated.
- **LLM-generated outreach** — produce a draft personalised message per segment from the segment's behavioural profile and (where available) representative customer attributes. The source's "personalised" requirement stops at segment-level draft quality; per-customer generation is out of MVP scope.

The source does not name a framework, a vendor, or a deployment target. The above is chosen for *this* problem — segmentation plus drafted outreach against behavioural data — and not lifted from a generic SaaS template.

## Architecture

Three components, intentionally light:

1. **Ingest.** A small connector that pulls customer + behavioural data from a CSV or a single source-of-truth API. Multi-connector breadth is a Phase 2 problem; for ICP discovery one integration is enough.
2. **Segment + risk model.** Rule-based scoring over the behavioural data, grouping customers into named at-risk segments. Rules are editable per ICP candidate.
3. **Message drafter.** Given a segment's behavioural profile, produce a draft win-back message. Output is a draft, not a send — the operator stays in the loop.

The IP is the segment definitions and the message-quality bar. Neither depends on the underlying data store.

## Milestones

- **M1 — ICP screen.** For each candidate ICP (DTC subscription, local services, B2B SaaS, community/membership), confirm the *can-absorb-orders* property before any deeper validation. The home-business failure was a screening miss.
- **M2 — One pilot.** Pick the candidate that passes M1 and run a paid or paying-pilot conversation against a real operator with a real customer list. The goal is to learn, not to close.
- **M3 — Tool against pilot data.** Onboard that operator's data, generate segments, draft messages, measure message-edit rate. This is the first honest product-fit signal.
- **M4 — ICP lock-in or pivot.** Decide whether the chosen ICP is worth productising, or return to M1 with the next candidate. Do not skip this gate.

## Risks

- **Risk: ICP stays unfixed.** The author is at risk of building a tool that demos well across many verticals and sells to none. The discovery discipline in M1–M2 is the only mitigation.
- **Risk: the home-business failure mode repeats.** Any candidate ICP where the operator cannot absorb recovered demand will produce the same negative outcome. The M1 screen exists precisely to catch this.
- **Risk: segmentation rules and message drafts disagree.** If the operator does not trust either output, both layers need work. A single pilot with one operator is not enough signal; the M4 gate is built to expose this.
- **Risk: scope creep into fulfilment tooling.** The temptation to add scheduling, ordering, or capacity planning to "complete the loop" will be strong. The tool's value is upstream of that loop — adding it dilutes focus and lengthens time-to-ICP-answer.
- **Risk: source is thin.** The plan above relies on a short post with no operator data, no revenue, and no stated pricing. Every milestone that requires those numbers is honestly constrained by what was not said.
