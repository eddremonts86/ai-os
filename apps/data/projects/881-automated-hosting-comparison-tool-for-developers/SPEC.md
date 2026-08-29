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

## Problem

Kirill is a developer managing multiple projects, each with its own infrastructure to set up and maintain. Following the principle of not putting all his eggs in one basket, he deliberately does not use a single hosting provider for everything — so every new project means choosing a provider again, and choosing means manually comparing configurations and prices across providers, which he says consumes enormous amounts of time. He has faced this for over 8 years, and it comes up roughly 2–3 times per month when launching new projects or migrating existing ones. His current workaround is to build comparison tables of hosting plans by parsing data from hosting providers' websites, then manually filter and sort by the parameters he cares about: price, server specifications, and data centre locations. He is willing to pay 300–500 RUB (about $5–6) per month for a service that automates the comparison by key parameters and provides up-to-date data in a convenient format. In the comments, someone reports building an adjacent product that takes over after the host is chosen, and another commenter offered an MVP link.

## Objective

Replace the hand-built comparison table: keep hosting plans from multiple providers current, and let a developer filter and sort them by price, server specifications and data centre location in one place, for around $5–6 per month.

## Target Users

- Primary: developers running several projects across deliberately different providers, who re-choose hosting 2–3 times a month for launches and migrations — Kirill's exact case, sustained over 8 years.
- Secondary: developers doing a one-off migration who need a current price and spec comparison without building the table themselves.

## MVP Scope

- Provider coverage: normalised hosting plans from multiple providers, collected automatically rather than parsed by hand per search.
- The three filter axes the author actually uses: price, server specifications (CPU, RAM, disk), and data centre locations.
- Sorting and side-by-side comparison, the operations he currently performs manually on his own tables.
- Freshness: up-to-date data, stated as a requirement — each plan carries when it was last verified against the provider's site.
- Export, so a comparison can leave the tool in the form he already works in.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- $5–6 per month is the ceiling. Scraping and normalising many providers' pricing pages continuously has to fit inside that, which caps how many providers can be covered and how often they are refreshed.
- Data must be current. The author is replacing his own freshly-parsed tables, so a stale catalogue is worse than no product.
- The comparison stops at selection. Provisioning and infrastructure setup is a different product — a commenter describes building exactly that as the next step after the host is chosen.
- Provider pricing pages change format and may block scrapers; the pipeline needs per-provider adapters rather than one generic parser.
- Multi-provider by design: the user does not want a single recommended host, he wants a comparison, because spreading projects across providers is his stated principle.
