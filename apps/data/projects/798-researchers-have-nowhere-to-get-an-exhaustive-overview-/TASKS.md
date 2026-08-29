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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/798-researchers-have-nowhere-to-get-an-exhaustive-overview-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the unified paper model in PostgreSQL with the title, authors, abstract, year, venue, citation graph, and per-feed provenance ID fields.
- [ ] Integrate the four open scholarly-record feeds (arXiv, Semantic Scholar Graph, OpenAlex, Crossref), normalise into the unified model, deduplicate across feeds, update the citation graph.
- [ ] Build the pgvector embedding store and the subfield-query retrieval against the unified model.
- [ ] Implement the clustering step using the embeddings and the citation graph, with the documented clustering rubric.
- [ ] Build the replicated-findings panel: ingestion of the replication-outcome field from the open feeds, surfaced only where the feeds provide it.
- [ ] Build the disputed-findings panel: citation-context contest detection so the surface is not flooded with every paper that cites the original.
- [ ] Build the open-questions panel: extraction from abstracts and introductions of papers that explicitly identify an open question.
- [ ] Implement the overview generation: LLM-based summarisation with provenance carried into the summary, enforced at write time.
- [ ] Build the researcher-facing surface: the four-panel view, the per-claim provenance link to the source record, French and English copy.
- [ ] Add the per-feed ingestion cadence and the per-field overview regeneration cadence, with the Redis cache of recently served overviews.
- [ ] Add the documented escalation path for a researcher who disputes a claim in the overview.
- [ ] Confirm the licensing terms of each open feed before launch, with the per-feed licence review as a recurring task.
- [ ] Add the honest "limited open-feed coverage" state for subfields where the open feeds are thin, surfaced rather than hidden.
- [ ] Run an end-to-end test: a French researcher names a subfield, the overview is generated with the four panels, every claim in the summary links to a source record, the replication and disputed panels surface only what the open feeds actually provide, the researcher drills from a claim to the source paper.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
