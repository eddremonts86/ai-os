---
id: "798"
slug: researchers-have-nowhere-to-get-an-exhaustive-overview-
title: "Researchers have nowhere to get an exhaustive overview of what has been done in their field, leading to the risk of duplicating work"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/t3i6ddxjb1-researchers-have-nowhere-to-get-an-exhau"
category: ai
date: "2026-01-08"
tags: [AI, Other]
country: France
tech: [Python, FastAPI, PostgreSQL with pgvector, Celery, Redis, arXiv API, Semantic Scholar Graph API, OpenAlex API, Crossref API, Anthropic / OpenAI API for field-summarisation, React with TypeScript, Coolify]
---
# Researchers have nowhere to get an exhaustive overview of what has been done in their field, leading to the risk of duplicating work

## Tech Stack

- **Python with FastAPI** for the ingestion pipeline, the overview-generation API, and the researcher-facing surface, since the workload is integration-heavy (multiple open feeds, a clustering step, a per-claim provenance path) and FastAPI's type hints keep the surfaces separated.
- **PostgreSQL with the pgvector extension** for the unified paper model, the embedding store used by the clustering step, and the per-field overview records.
- **Celery** for the background jobs (feed ingestion, embedding generation, clustering, overview regeneration), because the overview is regenerated on a cadence rather than per request.
- **Redis** for the Celery broker and the cache of recently served overviews, so the researcher-facing surface does not regenerate per request.
- **arXiv API, Semantic Scholar Graph API, OpenAlex API, Crossref API** as the four open scholarly-record feeds, normalised into a unified paper model.
- **Anthropic or OpenAI API** for the field-summarisation step (turning a clustered paper set into the human-readable overview text), with provenance carried into the summary so the reader can inspect the source.
- **React with TypeScript** for the researcher-facing surface — the per-field overview view with the four panels (published-work map, replicated findings, disputed findings, open questions) and the per-claim provenance link.
- **Docker** for local and staging runs, and **Coolify** for self-hosted production on a single VPS, matching the per-plan deployment shape used across this corpus.

## Architecture

The service has three planes — an ingestion plane, an overview-generation plane, and a researcher-facing surface — and one unified paper model underneath. The unified model carries title, authors, abstract, year, venue, citation graph (incoming and outgoing), replication-outcome field (where the open feeds provide it), and a per-record provenance ID per source feed. The model is the contract every plane reads and writes against.

The ingestion plane runs as a Celery job on a stated cadence. It pulls from each of the four open feeds, normalises the records into the unified model, deduplicates across feeds (a paper on arXiv is the same paper on Semantic Scholar), and updates the citation graph. The plane writes the normalised records to PostgreSQL and writes the embeddings to pgvector. The cadence is per-feed: arXiv refreshes more often than Crossref because the publication cycles differ.

The overview-generation plane takes a subfield string from the researcher and runs four steps: (1) retrieve the papers in the field using a subfield-query against the unified model, (2) cluster the papers into sub-topics using the embeddings and the citation graph, (3) for each sub-topic, surface the replicated findings (papers with a replication-outcome record), the disputed findings (papers with later contesting citations), and the open questions (papers whose abstract or introduction identifies an open question), (4) summarise each panel into human-readable text with the LLM API, carrying the source record IDs into the summary so the reader can inspect the provenance.

The researcher-facing surface is a per-field overview view with four panels. Each panel shows the structured data and the human-readable summary; each claim in the summary links back to the source record ID. The researcher can drill from a claim to the source paper, and from the source paper to its citation graph and replication-outcome field. The surface is read-only and does not host the papers themselves.

The MVP covers one research field at a time. The researcher names the subfield; the overview is per-field. Cross-field comparison is deferred because the per-field shape is the load-bearing one. The clustering is heuristic, not definitive — the overview is a starting map, not a settled one, and the README states this explicitly.

The replication-outcome field is populated only where the open feeds provide it. Many papers have no replication record, and that absence is surfaced as "no replication record found," not as a claim of no replication. The disputed-findings view uses citation context to identify contests, not just any citation, so the surface is not flooded with every paper that cites the original.

## Milestones

1. **M1 — Unified paper model** — schema, the four-feed ingestion connectors, the deduplication step, the citation graph.
2. **M2 — Embeddings and clustering** — pgvector embedding store, the subfield-query retrieval, the clustering step using embeddings and citation graph.
3. **M3 — Replicated, disputed, open-questions panels** — the replication-outcome ingestion, the citation-context contest detection, the open-question extraction from abstracts.
4. **M4 — Overview generation** — the LLM-based summarisation step with provenance carried into the summary.
5. **M5 — Researcher-facing surface** — the four-panel view, the per-claim provenance link, French and English copy.
6. **M6 — Cadence and cache** — the per-feed ingestion cadence, the per-field overview regeneration cadence, the Redis cache.
7. **M7 — Licensing confirmation** — sign-off on each open feed's downstream-use terms before launch.

## Risks

- **Feed licence drift** — one of the four open feeds changes its licence and the overview's downstream use is no longer permitted. Mitigation: per-feed licence review is a recurring task, with a deployment pause on change.
- **Clustering drift** — two overviews of the same field produce different sub-topic maps. Mitigation: the clustering step is deterministic on its inputs (embeddings + citation graph), and the rubric is documented.
- **False positives in replication** — a paper that mentions replication in passing gets flagged as a replicated finding. Mitigation: the replication feed is the source of truth, not paper-text heuristics.
- **LLM summary drift** — the LLM produces a summary that does not match the structured panel underneath. Mitigation: the summary is regenerated from the panel, with the panel as the source of truth and the summary as the readable form.
- **Provenance loss** — a claim in the summary loses its source record ID. Mitigation: per-claim provenance is enforced at write time, with a validation step that rejects summaries without provenance.
- **Cross-field scope creep** — pressure to add cross-field comparison before the per-field shape is validated. Mitigation: the per-field MVP is its own milestone, and cross-field comparison is an explicit later milestone.
- **Thin-feed coverage** — a niche subfield has little indexed work and the overview is empty. Mitigation: an honest "limited open-feed coverage" state surfaced rather than a confident empty overview.
