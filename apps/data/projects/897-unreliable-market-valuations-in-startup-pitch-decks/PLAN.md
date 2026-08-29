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

## Tech Stack

- **Backend:** Python (FastAPI) for the orchestration service; the corpus-ingestion workers also live in Python.
- **Document ingestion:** `pdfplumber` + `python-pptx` + Google Slides API; a small layout-aware extractor for TAM / SAM / SOM tables and bullet text.
- **Claim extraction:** a fine-tuned small model (or a structured-output LLM call) that returns `{claim_text, value, unit, year, source_text}` per market-size statement.
- **Citation cross-reference:** a Python service that talks to a curated corpus of free public sources in v1 (SEC EDGAR, Statista excerpts via the public API, World Bank / OECD / industry-association PDFs) and, behind the analyst's seat license, to PitchBook / CBO Insights APIs in v1.1.
- **Red-flag engine:** a deterministic rule engine (Python) that runs over the extracted claims + cross-reference results; rules include "source older than 3 years", "single-source, no triangulation", "TAM larger than plausible end-market GDP", "sum of unrelated adjacent markets without rationale".
- **Confidence report:** a Jinja-templated PDF generated server-side, with a citation appendix linking each claim to its source URL / DOI.
- **Storage:** Postgres for users, decks, claims, reports; ClickHouse for corpus-indexed aggregates; S3-class object storage for the deck originals and the PDF reports.
- **LLM use:** narrative summary only (one paragraph per claim, grounded in the extracted values). The numerical red-flag engine is deterministic — no LLM is in the critical path.
- **Auth:** email-link (passwordless) for analysts; SSO on the enterprise tier.

## Architecture

A deck hits the system and flows through four stages: ingestion → claim extraction → citation cross-reference → red-flag engine → confidence-report render. Every stage writes its intermediate output to Postgres so the analyst can drill into any claim. The LLM narrative summary is the last step and only runs after the deterministic pipeline has already produced a stable red-flag list.

```
Analyst uploads deck (PDF / PPTX / Slides)
        │
        ▼
Ingestion service ──▶ S3 (original deck)
        │
        ▼
Claim extractor ──▶ Postgres (claims table)
        │
        ▼
Citation cross-reference service
        ├──▶ Free corpus (SEC, Statista, World Bank, OECD, industry PDFs)
        └──▶ Paid corpus (PitchBook, CBO Insights) — analyst's seat license
        │
        ▼
Red-flag engine (deterministic) ──▶ Postgres (flags table)
        │
        ▼
LLM narrative summary (grounded in extracted values, never free-form)
        │
        ▼
Confidence-report render (Jinja → PDF)
        │
        ▼
Analyst dashboard + deal-memo export
```

## Milestones

1. **M0 — Spec freeze + corpus design.** Document the corpus scope (which free sources are in v1), the deterministic red-flag rule set, and the analyst-UX. End of week 1.
2. **M1 — Ingestion + claim extraction.** PDF / PPTX / Slides ingestion; claim extraction returning the canonical `{claim_text, value, unit, year, source_text}` tuple. End of week 4.
3. **M2 — Free corpus + cross-reference.** Build the free-source corpus (SEC, Statista, World Bank, OECD, industry PDFs) and the cross-reference service; ≥ 70% of plausible citations cross-referenced in v1. End of week 8.
4. **M3 — Red-flag engine.** Deterministic rules (staleness, single-source, GDP-impossible TAM, sum-of-unrelated-markets); ≥ 90% recall on a curated 50-deck ground-truth test set. End of week 11.
5. **M4 — Confidence report + dashboard.** PDF render with citation appendix; per-analyst dashboard with deal-history; deal-memo export. End of week 13.
6. **M5 — Pilot with 5 VC analysts.** 5 analysts using the tool for 60 days; calibration of false-positive rate; iteration on the rule set. End of week 17.
7. **M6 — Paid corpus connectors.** PitchBook + CBO Insights API connectors behind analyst seat licenses. End of week 22.

## Risks

- **Analyst trust calibration.** False positives are as bad as false negatives for tool adoption. The pilot must measure both axes and tune the rule thresholds accordingly.
- **Corpus coverage.** Free public sources cover a fraction of the TAMs that show up in pitch decks. Without paid connectors the tool will fail on the most-claimed verticals (consumer, fintech, deep tech). Confirm the path to paid connectors before promising coverage.
- **LLM hallucination risk.** The narrative summary must be strictly grounded in the extracted values; no LLM is in the numerical-critical path. If the narrative summary is ever allowed to free-form, the tool becomes another ChatGPT and loses its reason for existing.
- **Copyright.** Excerpts of source reports must be short and cited; full reports are never stored. A media-lawyer review is mandatory before paid launch.
- **Geography.** The source is in Russia but the corpus is global. Confirm the analyst's deal-flow geography and prioritise corpus expansion accordingly.
- **Competitive risk.** If a foundation-model vendor ships a "verify this citation" mode, the tool must keep its deterministic red-flag engine and reproducible corpus as the defensible moat — narrative summarisation alone is not enough.
