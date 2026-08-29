---
id: "864"
slug: problem-of-finding-and-obtaining-grants-for-small-busin
title: Problem of finding and obtaining grants for small businesses
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/gkrcgpelx1-problem-of-finding-and-obtaining-grants"
category: finance
date: "2025-10-29"
tags: [Finance, Business, Legal, Other]
country: Canada
tech: [Python, FastAPI, Elasticsearch, Redis, Playwright, PostgreSQL]
---
# Problem of finding and obtaining grants for small businesses

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Canadian small businesses hear about one grant from a peer and ask themselves what else exists that they could be applying for. The honest answer is that they do not know — there are federal programmes, province-specific programmes, municipal programmes and industry-specific programmes, each with its own eligibility test, its own portal and its own deadline, and the only people who track all of them are grants consultants whose time is paid for.

This product fills that gap. A user submits a business profile and the service returns the ordered list of grants the business is eligible for right now, with a deadline, an eligibility fit score that explains why a grant is on the list, and a link to the official portal. A lifecycle feed flags newly opened programmes and closing deadlines. Per-business application tracking carries the user from identified to outcome, with the deadline visible at every stage.

The MVP is intentionally narrow. It does not file applications on the founder's behalf, does not write the application narrative and does not cover private foundation grants. What it does do is turn a fragmented grants surface into one ordered, eligibility-fit-scored list per business, with the lifecycle state of each grant visible to the user.

**One-liner:** GrantFinder turns a Canadian small business's profile into the ordered list of federal, provincial, municipal and industry grants they are eligible for right now, with a deadline and an eligibility fit score per grant, and tracks each application through to a decision.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Canadian small-business owners | They hear about one grant from a peer and want a complete, current view of what they could be applying for. |
| Early-stage founders seeking non-dilutive funding | They want a filtered list that excludes programmes they would not qualify for, to spend grant-effort on the right grants. |
| Owner-operators in specific sectors | A sector-filtered view (agriculture, clean tech, digital adoption) cuts the noise of the generic federal listing. |
| Grants consultants and bookkeepers | They maintain grant lists for multiple clients and want a shared, versioned source they can point clients at. |
| Economic development offices and BIAs | They need to point member businesses at the programmes they are eligible for without rebuilding eligibility logic themselves. |
| Programme operators (indirect) | A public lifecycle feed gives them an external signal of how visible a programme actually is to the businesses it targets. |

## Jobs To Be Done

1. **Functional job** — Find every grant a Canadian small business is eligible for right now, in one list, ordered by deadline.
2. **Functional job** — See, per grant, which eligibility test the business passes and which it does not, so the user knows why it is on the list.
3. **Functional job** — Track each application from identified through to outcome, with the deadline visible at every stage.
4. **Functional job** — Catch newly opened programmes and closing deadlines without having to check every portal manually.
5. **Emotional job** — Stop wondering whether the next grant is sitting unopened on a portal the business does not know about.
6. **Social job** — Reach the same grants visibility as a peer business that happens to have a consultant on retainer.

## Success Metrics

- **Application completion rate** — share of identified grants that reach the submitted stage within the open deadline window, since a list without follow-through is not the product.
- **Eligibility-fit calibration** — difference between predicted fit and observed outcome per grant programme, since the score has to be honest about what it predicts.
- **Lifecycle-feed engagement** — share of businesses that act on a lifecycle event (newly opened programme, closing deadline), since the feed is the feature that beats a static list.
- **Coverage freshness** — proportion of programmes whose eligibility criteria have been reverified in the last 30 days, which is what keeps the fit score honest.
- **Consultant-to-client share** — number of small businesses per grants consultant using the same grant list, since repeated use by one professional is the real adoption signal.
- **Outcome recording rate** — share of submitted applications where the user records the outcome, which is the data that makes the calibration possible.

## Pricing & Monetization

The capture names no price. The architecture fixes a cost shape: the recurring cost is the weekly programme-portal check across federal, provincial and municipal sources, plus the storage of one application tracker per business. A free tier for individual businesses and a paid tier for grants consultants and economic development offices, charged per consultant or per organisation rather than per business, would fit the cost structure without paywalling the founder-facing list. Specific tier prices are not invented here because the source did not name any.

## Competitive Landscape

- **Grants consultants and grant writers** — the high-quality current answer for a business that can afford one, and the reason a free tool has room to exist: they are paid per application, not per programme listed.
- **Government programme portals individually** — authoritative, but each one only covers its own programmes and none cross-reference the others, so the business still has to assemble the eligibility view.
- **Generic business news sites with grant roundups** — periodic, often stale, and not personalised to the business's actual eligibility.

The post names no specific competitor, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Decide whether private foundation grants and family-office grants enter the MVP behind a separate data source, or stay out of scope entirely.
- [ ] Confirm the right policy when a programme portal is down during a deadline window — surface an estimated wait, escalate to a consultant partner, or just flag the deadline risk.
- [ ] Decide which provinces beyond the four largest land in v1 and which are gated behind a coverage-quality bar.
- [ ] Establish how a change to a programme's eligibility criteria is verified before it lands in the list, since the source authority varies and errors here are user-visible.
- [ ] Decide whether the eligibility fit score is recomputed against the user's outcome history automatically or on a manual refresh, since calibration is the load-bearing signal.
- [ ] Define the data-retention promise for the per-business application tracker — what is kept after the application is closed and what is purged.
