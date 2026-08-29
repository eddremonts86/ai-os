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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A VC / angel analyst gets a tool that ingests a pitch deck, extracts every TAM / SAM / SOM claim with its cited source, cross-references the source against a curated corpus of public (and later paid) market data, and produces a one-page confidence report an analyst can attach to their deal memo. The product turns a 90-minute manual "is this TAM number real" exercise into a 15-minute automated first pass — and catches the inflated, misattributed, or stale citations that erode trust in the funnel.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early-stage VC / angel analyst | Triage 50+ decks a week; needs a fast first pass on market-claim quality. |
| VC partner / IC reviewer | Wants a confidence report attached to the deal memo before partner meeting. |
| Accelerator / demo-day judge | Triages 50–100 decks per cohort; needs pre-meeting signal on claim quality. |
| Corporate venture / corp-dev | Does competitor landscape scans; wants the same cross-reference engine. |
| Founder-side advisor | Wants to stress-test their own deck before sending it to investors. |

## Jobs To Be Done

1. **Functional job** — Produce a confidence report on every TAM / SAM / SOM claim in a pitch deck, with source citations and red flags, in ≤ 15 minutes.
2. **Emotional job** — Stop the frustration of reading a deck with a $50B TAM and recognising the cited source doesn't support it.
3. **Social job** — Be able to attach a reproducible confidence report to a deal memo so the partner meeting conversation starts from facts, not vibes.

## Success Metrics

- **Throughput:** analysts process ≥ 5 decks per day using the tool, vs. 1–2 manually.
- **Red-flag recall:** the tool flags ≥ 90% of known-bad claims on a curated test set of 50 decks with annotated ground truth.
- **Analyst trust:** ≥ 80% of confidence-report red flags are confirmed by the analyst on manual review (low false-positive rate is the credibility signal).
- **Time saved:** median time to first-pass confidence report ≤ 15 minutes per deck.
- **Retention:** ≥ 75% of analysts who run ≥ 5 decks in their first month remain active in month 3.

## Pricing & Monetization

Per-seat subscription at $149 / month per analyst (the source did not state a price; $149 sits comfortably under typical analyst-tool SaaS pricing tiers — Refinitiv / PitchBook seats are $1,000+/year). Annual plan at $1,490 / year. Enterprise tier with paid-data-source connectors (PitchBook, CBO Insights) and SSO at $499 / seat / month, sold to larger VC and corporate venture teams. A free tier is intentionally not offered — the value is in the analyst's history and the per-deck confidence reports, both of which need a seat.

## Competitive Landscape

- **Manual cross-referencing against reports (Excel + Wayback Machine + Statista)** — the current workflow the source is replacing.
- **ChatGPT / Claude / Perplexity for market sizing sanity-checks** — useful but unsourced and unreliable; the exact failure mode the source complains about.
- **PitchBook / Crunchbase Pro** — company / funding data, not market-size data; no deck ingestion.
- **CB Insights / Tracxn** — paid market intelligence; expert-curated but expensive and not deck-driven.
- **Deck-OCR tools (DocSend analytics, Slidebean)** — track engagement, not claim quality.
- **Internal analyst notes (Notion, Google Docs)** — what VCs use today; no shared corpus, no cross-reference automation.

## Risks & Open Questions

- [ ] Paid-data-source licensing (PitchBook, CBO Insights) is non-trivial; without it the MVP runs only on free sources, which limits TAM coverage. Confirm the path to paid connectors before public launch.
- [ ] LLM-assisted narrative review is a hallucination risk; every numerical claim must be grounded in a verifiable source citation. The red-flag engine must be deterministic; the LLM is only used for narrative summary, never for the underlying fact-checking.
- [ ] Analyst trust calibration is the existential risk — if the tool flags too many false positives, analysts will ignore it; if it misses too many real red flags, partners won't trust it. The pilot must measure both axes carefully.
- [ ] Copyright: excerpts of source reports must be short and cited; full reports are never stored. A copyright review with a media lawyer is mandatory before paid launch.
- [ ] Geography: the source is in Russia but the corpus is global. Confirm the corpus covers the markets the analyst's funnel actually draws from (the original problem is global in nature, but the analyst's deal flow may be Russia / CIS-heavy).
- [ ] Competitive risk if ChatGPT or Perplexity ships a "verify this citation" mode — the tool must keep its corpus and red-flag engine defensible.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/startups/45pkeu8rb1-unreliable-market-valuations-in-startup) · **Category:** startups · **Tags:** Startups
