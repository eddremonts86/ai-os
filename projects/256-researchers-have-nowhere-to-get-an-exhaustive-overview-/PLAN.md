---
id: "256"
slug: researchers-have-nowhere-to-get-an-exhaustive-overview-
title: "Researchers have nowhere to get an exhaustive overview of what has been done in their field, leading to the risk of duplicating work"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/t3i6ddxjb1-researchers-have-nowhere-to-get-an-exhau"
category: ai
date: "2026-01-08"
tags: [AI, Other]
country: France
---
# Researchers have nowhere to get an exhaustive overview of what has been done in their field, leading to the risk of duplicating work

## Tech Stack

- Python 3.11 + FastAPI for the API; chosen because the work is metadata extraction, citation graph traversal, and structured synthesis — Python's ecosystem for scholarly metadata (pymed, habanero, scholarly) is the strongest fit.
- A metadata aggregation layer that pulls from open sources: Crossref for DOIs, OpenAlex for open citation data, arXiv for preprints, HAL for French academic work, Semantic Scholar's open API for embeddings. Each source has a connector with a documented coverage and update cadence.
- PostgreSQL for papers, authors, venues, citation edges, and overview records.
- Meilisearch (or OpenSearch) for the search index over titles, abstracts, and author names; chosen over a heavier solution because the workload is read-heavy and predictable.
- A small Next.js + TypeScript surface for the overview page; the page renders a structured synthesis with citation footnotes and a coverage disclosure block.
- A scheduled worker (Celery beat) for periodic re-indexing of the open sources the MVP depends on.
- Self-hosted on Coolify; the workload is batch indexing plus on-demand overview generation.

## Architecture

Three pieces:

1. **Indexing pipeline** — connectors per source (Crossref, OpenAlex, arXiv, HAL, Semantic Scholar) write papers and citation edges into PostgreSQL and Meilisearch. Each connector documents what it covers and what it does not.
2. **Overview builder** — for a given question or sub-field, the builder queries the index, applies a template-driven synthesis (organised by sub-topic, method, and benchmark), and produces a structured document where every claim has a citation.
3. **Researcher surface** — a Next.js page that renders the structured synthesis with citation footnotes, a coverage-disclosure block, and export to BibTeX and Markdown.

The MVP does not use ML to extract claims from full-text papers. The synthesis is template-driven over metadata; the researcher remains the writer.

## Milestones

- **M1 — Indexing pipeline.** Connectors for Crossref, OpenAlex, arXiv, HAL, Semantic Scholar; per-source coverage documentation; periodic re-indexing.
- **M2 — Search and topic discovery.** A query (question or sub-field) returns a structured list of papers with citations and venue info.
- **M3 — Overview template.** Template-driven synthesis organised by sub-topic, method, and benchmark; every claim tied to a paper.
- **M4 — Coverage disclosure.** The overview page shows which sources were queried, the date span, and the number of papers; the researcher can see what was searched.
- **M5 — Export.** BibTeX and Markdown export of the structured overview with embedded citations.

## Risks

- Source coverage is the binding constraint. A synthesis that misses a major database is dishonest by omission. The MVP must disclose its source list per overview and refuse to imply exhaustive coverage.
- Language bias: significant work is not in English. The MVP must integrate HAL (French), and disclose the English-only limitation for other non-English sources, rather than imply global coverage.
- Auto-generated prose is a risk: it lets the synthesis look authoritative without being so. The MVP keeps synthesis template-driven; the researcher remains the writer.
- Citation-graph staleness: citation counts and reference lists update continuously. The MVP must publish an "indexed as of" date on every overview so the researcher can judge freshness.
- Pilot-field scope: starting with too many fields dilutes the per-field source coverage. The MVP must pick one or two pilot fields and disclose the choice.
