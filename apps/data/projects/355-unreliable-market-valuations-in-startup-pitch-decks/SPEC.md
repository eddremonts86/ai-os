---
id: "355"
slug: unreliable-market-valuations-in-startup-pitch-decks
title: Unreliable market valuations in startup pitch decks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-startup"
category: startups
date: "2025-10-29"
tags: [Startups]
country: Russia
tech: [Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds, registry data), Postgres, React-PDF (rendered slide)]
---
# Unreliable market valuations in startup pitch decks

## Problem

A Russian founder putting together a pitch deck for an investor encounters market valuation claims that they cannot independently verify: TAM/SAM/SOM numbers that circulate deck-to-deck without primary-source citations, market-size figures that are inherited from a 2018 report, and growth assumptions that hold up only under stretch conditions. The poster wants a citation-grounded valuation source before the deck hits an investor's desk.

## Objective

Ship a citation-grounded market-valuation tool for Russian startup pitch decks that returns TAM/SAM/SOM figures with primary-source citations, a 'last-checked' date, and a flag if a figure is older than 18 months or relies on a single secondary source.

## Target Users

- Russian founders preparing a Series-A or pre-seed deck who need defensible market numbers.
- Russian-speaking VCs running diligence on a deck and wanting a third-party check on the numbers.
- Russian student pitch-club participants building a serious deck before a competition.

## MVP Scope

- TAM/SAM/SOM query: input is geography + vertical + unit (revenue / users / spend).
- Primary-source ranking: census data, central-bank stats, registry filings, paid industry reports (where licence allows).
- Citation panel: per-number, a primary source link + a 'last-checked' date.
- Old-figure flag: any number older than 18 months marked in the report.
- Single-source flag: number from one source marked as 'needs confirmation'.
- Exportable citation pack: PDF + JSON for embedding into a deck appendix.
- No fabricated or extrapolated numbers; missing-number fallback to a 'no primary source' line.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-s` follows the constraints in `355-.../SPEC.md` and the chosen stack (Next.js, OpenAI API (citation extraction), Public-data sources (RU/EU SEC feeds). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Every number returned carries a primary-source URL or is marked 'no primary source'.
- Numbers older than 18 months are flagged, not deleted; the founder chooses how to handle.
- All paid-report numbers carry a licence attribute; piracy of paid reports is out of scope.
