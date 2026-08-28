---
id: "826"
slug: regular-loss-of-tax-credits-among-immigrants-in-the-us
title: Regular loss of tax credits among immigrants in the US
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/unnnxi3m71-regular-loss-of-tax-credits-among-immigr"
category: other
date: "2025-11-26"
tags: [Immigration, Legal, Finance, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Regular loss of tax credits among immigrants in the US

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An immigrant filing taxes in the US sees which credits they are entitled to, which they are at risk of losing because of their residency status, ITIN versus SSN, or dependent situation, and what documents are required to keep each one. The framing the post supports is "credits missed because eligibility is invisible", not "cheaper tax filing".

**One-liner:** Find the US tax credits your residency status is hiding from you.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Immigrants in the US filing their own taxes | Need to see which credits their status combination actually unlocks, not the ones off-the-shelf software surfaces |
| Tax preparers and small firms serving mixed-status households | Need a quick check they can run against a household's status to flag missed credits before filing |

## Jobs To Be Done

- When I am about to file, see which credits my residency status actually affects.
- When a credit is at risk, know what documents I need to keep it.
- When a household mixes statuses (SSN + ITIN, mixed-age dependents), check which family member unlocks which credit.

## Success Metrics

Source does not state a metric. Outcomes to validate before MVP: share of returning users who recover at least one previously missed credit, time spent per eligibility check, and number of preparer hand-offs per week.

## Pricing & Monetization

Pricing is not stated by the source. Whether the tool is free, paid per check, or paid per preparer hand-off must be validated with both personas.

## Competitive Landscape

Tax-prep tools (TurboTax, FreeTaxUSA) and immigrant tax services exist, but the source does not name any direct competitor that flags credits commonly lost by US immigrants.

## Risks & Open Questions

- US tax rules change yearly; the tool needs a maintenance story the post does not provide.
- Sensitive identifiers (SSN, ITIN, address) raise privacy and storage questions not addressed in the source.
- "Regularly" is the post's word; quantifying it would require research, not invention.
- State-level credits are not addressed by the post and would need explicit scope before launch.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/unnnxi3m71-regular-loss-of-tax-credits-among-immigr) · **Category:** other · **Tags:** Immigration,Legal,Finance,Other
