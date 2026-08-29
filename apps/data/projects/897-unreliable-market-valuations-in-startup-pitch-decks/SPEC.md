---
id: "897"
slug: unreliable-market-valuations-in-startup-pitch-decks
title: Unreliable market valuations in startup pitch decks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-startup"
  captured: "2025-10-10"
category: startups
date: "2025-10-10"
tags: [Startups]
country: Russia
tech: [Python, ClickHouse / Postgres, citation graph (CBO Insights + Crunchbase + PitchBook + public filings), LLM-assisted narrative review]
---
# Unreliable market valuations in startup pitch decks

## Problem

The submitter (an investor or analyst working a startup-deal funnel in Russia) describes a recurring, systemic problem at the primary-analysis stage: pitch decks that cite TAM / SAM / SOM figures with no real methodology behind them. The deck author takes a number from a single consultancy report, multiplies it optimistically, and presents it as fact; or aggregates unrelated adjacent markets to inflate the top line; or quotes an outdated report as if it were current. The result is that "70% of all projects entering our funnel" (the author's stated hit-rate) carry market-size claims that mislead diligence, waste analyst time, and erode trust in founders. Existing partial fixes — manual cross-referencing against reports, ChatGPT for sanity-checking — are ad-hoc, slow, and depend on the analyst's experience.

## Objective

Ship a deal-team tool that automatically stress-tests the market-size claims in a startup pitch deck: extracts the cited TAM / SAM / SOM numbers and their source citations, cross-references the source against a corpus of public + paid market reports (Cruncbbase / PitchBook / CBO Insights / public SEC filings / industry-association data), flags citations that are out of date, misattributed, or aggregate unrelated markets, and produces a "market-claim confidence report" an analyst can attach to their deal memo. The MVP is "drop a pitch deck in, get a confidence report out, in ≤ 15 minutes".

## Target Users

- **Primary:** early-stage VC / angel analysts and partners running a deal funnel who triage pitch decks weekly and need a fast first-pass on market-claim quality.
- **Secondary:** accelerators and demo-day judges who need to triage 50+ decks per cohort in a short window.
- **Tertiary:** corporate venture and corp-dev teams doing competitor landscape scans; founder-side advisors who want to stress-test their own deck before sending it out.

## MVP Scope

- Document ingestion: PDF, Google Slides export, PowerPoint, and a plain-text paste path.
- Claim extraction: identify TAM / SAM / SOM statements, the cited sources, the year of the source, and the math the deck applies.
- Citation cross-reference: lookup each cited source against a curated corpus (free public sources in v1: SEC filings, Statista snippets, World Bank / OECD, industry-association reports; paid sources behind an API key in v1.1).
- Red-flag engine: flag citations older than 3 years, single-source claims with no triangulation, "sum of adjacent markets" arithmetic, and TAM numbers larger than the GDP of plausible end markets.
- Confidence report: a one-page PDF summarising each claim, the source, the cross-reference result, and the red-flag score; exportable as a deal-memo attachment.
- Per-workspace history so an analyst can compare claim quality across deals in the funnel.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The corpus must be reproducible and auditable — every claim in the confidence report links back to the underlying source so the analyst can verify manually.
- Paid data sources (PitchBook, CBO Insights) are behind the analyst's own seat license in v1.1; the MVP must be usable on free sources alone.
- Must respect the copyright of the source reports — excerpts are short and cited; full reports are never republished.
- LLM-assisted narrative review is allowed, but every numerical claim must be grounded in a verifiable source citation; the tool must show its work.
- Per-deck processing latency ≤ 15 minutes; analyst attention is the bottleneck, not compute.
- The tool must not be marketed as "verdict on the deal" — it produces a confidence report that the analyst interprets, not a binary go/no-go.

## Legal & Compliance

If the tool ingests paid-source reports, it must do so via the analyst's own seat license and never store full report contents beyond the working session. Public-source excerpts must respect fair-use scope (headline figures + brief context, not whole sections). Cite back to the original URL or DOI for every numerical claim so the analyst can verify.
