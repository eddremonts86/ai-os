---
id: "881"
slug: automated-hosting-comparison-tool-for-developers
title: Automated hosting comparison tool for developers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-de"
  captured: "2025-10-26"
category: dev
date: "2025-10-26"
tags: [Dev]
country: Russia
wtp:
  raw: "300–500 RUB ($5–6) per month"
  currency: USD
  min: 5
  max: 6
  period: month
  mrrMid: 5.5
tech: [Go scrapers with per-provider adapters, PostgreSQL with historical price snapshots, HTMX server-rendered filter UI, Playwright for JS-rendered pricing pages, Cron scheduler, CSV and JSON export]
---
# Automated hosting comparison tool for developers

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

The comparison table you would have built by hand, already built and kept current: hosting plans from multiple providers, filterable by price, server specs and data centre location, for $5–6 a month instead of the hours it takes 2–3 times a month.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developer with multiple projects on multiple providers | Chooses hosting 2–3 times a month by hand; has done this for over 8 years. |
| Developer mid-migration | Needs current prices and specs across providers once, without writing a parser for it. |
| Hosting providers | Appear in a comparison where a favourable price or data centre location wins the plan on merit. |

## Jobs To Be Done

1. **Functional job** — Pick a hosting plan for a new or migrating project by filtering current plans on price, specs and location.
2. **Emotional job** — Stop rebuilding the same comparison table every few weeks.
3. **Social job** — Keep spreading projects across providers deliberately, without paying for that discipline in hours.

## Success Metrics

- **Time to decision:** minutes from opening the tool to a shortlisted plan, against the hours the manual table costs today.
- **Catalogue freshness:** share of plans verified against the provider's site within the last refresh window.
- **Price accuracy:** discrepancies found between a listed plan and the provider's own page — the metric that decides whether the tool is trustworthy at all.
- **Return frequency:** sessions per user per month, expected around the author's own 2–3 hosting decisions.

## Pricing & Monetization

300–500 RUB, about $5–6, per month — the author's stated figure for a service that automates the comparison by key parameters and provides up-to-date data in a convenient format. At that price the cost of scraping and normalising provider catalogues is the binding constraint, so coverage and refresh cadence are pricing decisions, not just engineering ones.

## Competitive Landscape

- **The author's own parsed comparison tables** — the incumbent: he parses provider sites, then filters and sorts manually by price, specs and data centre location. Accurate, and expensive in time.
- **Provider pricing pages read directly** — the raw source; no normalisation, so plans are not comparable across vendors.
- **An MVP shared in the comments** — another reader posted a deploy-comparison prototype for the author to evaluate. The thread's moderator notes problem authors rarely return to read comments, so it is unclear whether he ever saw it.
- **Adjacent infrastructure-automation products** — one commenter is building a service that takes over after the host is chosen, provisioning CI/CD, networking, scaling and monitoring. Complementary rather than competing.

## Risks & Open Questions

- [ ] Scraping economics at $5–6 per user per month: per-provider adapters need maintaining as pricing pages change, and that cost does not scale down.
- [ ] Which providers to cover. The source says "different providers" without naming any, so the launch catalogue is undefined.
- [ ] Providers may block scrapers or object to their pricing being republished; no affiliate or API relationship is mentioned.
- [ ] Normalising specs across vendors is genuinely hard — vCPU, burst limits and disk types are not stated comparably, and a wrong normalisation makes the comparison misleading rather than merely incomplete.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/dev/djk3np9401-automated-hosting-comparison-tool-for-de) · **Category:** dev · **Tags:** Dev
