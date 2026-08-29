---
id: "867"
slug: no-effective-service-for-finding-target-customers
title: No effective service for finding target customers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/voyb4a4nb1-no-effective-service-for-finding-target"
category: marketing
date: "2025-10-29"
tags: [Marketing, Other]
country: Russia
tech: [Python, FastAPI, Playwright, DuckDB, HTMX, Caddy]
---
# No effective service for finding target customers

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A self-hosted workbench that turns a buyer's plain-language description into a deduplicated, evidence-backed contact list drawn from the public sources the operator chooses. The operator describes who they are looking for in their own words, the system collects publicly available evidence about who those people actually are, and every contact in the output carries the row that produced it.

The capture names no price, no product and no market segment, and the workbench is honest about that. It owns the collection, the matching and the rendering; it does not own outreach, and it does not pretend the operator's buyer profile is anything other than the operator's input. The country in the frontmatter shapes where and how the workbench is hosted, not the shape of the pipeline itself.

**One-liner:** A self-hosted workbench that turns a buyer's description into an evidence-backed contact list, with every row traceable back to the public source it came from.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo founders in Russia | Cannot find a customer-discovery service that fits their market or their product, and need a tool that runs locally. |
| Marketing leads at small companies | Have a clear buyer in mind but no reliable way to turn that picture into a contactable list. |
| Independent consultants and freelancers | Target audience is defined by niche, region or interest rather than by company size, and mainstream tools do not match that shape. |
| Operators in restricted markets | Mainstream customer-discovery services are unavailable, unfit or priced for a market that is not theirs. |
| Data-protection reviewers | Need every contact in the output to carry the source row that produced it, so the operator can show how the list was built. |

## Jobs To Be Done

1. **Functional job** — Describe the buyer in plain language and have that description turned into a scored, deduplicated contact list.
2. **Functional job** — Audit every contact in the output back to the public source it came from.
3. **Functional job** — Run the whole pipeline on one machine, without depending on a third-party service that is unavailable from the operator's country.
4. **Emotional job** — Stop guessing whether the list the operator bought is actually full of the people they are trying to reach.
5. **Social job** — Have a defensible answer to the question "how did you get this contact" if the operator is ever asked.

## Success Metrics

- **Profile to list completion** — share of buyer profiles that produce at least one contact crossing the operator-set threshold, which is the step the workbench exists to deliver.
- **Match precision** — share of exported contacts a reviewer marks as relevant, since a long list full of noise is the failure the title names.
- **Source coverage** — proportion of configured sources that contributed at least one candidate in the last run, so silent channel failures are visible.
- **Collection-to-contact yield** — number of contacts exported per thousand candidates collected, as a proxy for profile quality and source fit.
- **Audit completion** — share of exported contacts for which the source row resolves, so a list that cannot be audited fails visibly rather than silently.
- **Operator-side rate-limit events** — number of times the workbench stopped a channel because the source's rate limit was hit, since exceeding it is a permanent block.

## Pricing & Monetization

The capture names no price, no payer and no business model, and the architecture is self-hosted, so there is no SaaS unit to charge against by default. What the design does fix is the cost shape: the expensive resource here is the operator's own time spent describing the buyer and reviewing the matches, not compute, so any future paid offering has to live with that and stay optional. The honest read is that the tool is paid for by being local-first, and any revenue direction — a hosted tier, a marketplace of source configurations, an institutional license — stays an open question rather than a plan.

## Competitive Landscape

- **Hosted customer-discovery and lead-list services** — abundant, but the capture's complaint is exactly that they do not work for the operator, and self-hosted is the most direct response.
- **Advertising-platform audience builders** — solve a different problem, since they target people inside a paid channel rather than producing a list the operator owns.
- **Generic scraping and crawling tools** — produce raw output, not a scored, deduplicated contact list with provenance, so the workbench sits between them and the operator's hand-rolled spreadsheets.

The capture names no specific competitor, so no further comparison is justified here.

## Risks & Open Questions

- [ ] Confirm whether the operator's buyers are individuals or companies, because the matching model differs for each and the source names neither.
- [ ] Decide which public sources the workbench supports at launch, since every added source is a maintenance contract and the source does not name any.
- [ ] Establish a defensible definition of match for the operator, since the workbench cannot score without one and the title names no scoring criterion.
- [ ] Confirm rate-limit handling matches the source's expectations, because a workbench that breaks a source's rules is a workbench that does not work the next day.
- [ ] Resolve how long raw candidate rows are retained, since the operator owns the storage and the data-protection story depends on a real retention rule.
- [ ] Test whether the match-threshold UI is honest about false negatives, since a tight threshold that hides good candidates is a worse failure than a long list with some noise.
