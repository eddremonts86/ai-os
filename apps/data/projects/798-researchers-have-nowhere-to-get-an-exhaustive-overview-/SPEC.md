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

## Problem

Researchers in France — and the framing is general to any researcher — cannot easily get an exhaustive overview of what has already been done in their field, and the risk of duplicating work is real. The post names the gap: there is no single surface a researcher can open, name their subfield, and see what has been published, what has been replicated, what is in dispute, and what remains open, in a form that supports their own literature-review work without sending them to ten databases and stitching the answer together themselves.

The capture is a one-line problem statement from ProblemHunt, with country listed as France and no further detail. The post does not name a specific field, a specific researcher, a specific database, a specific paper, a publisher, or a review-methodology standard. What the source names is the actor (a researcher), the pain (no exhaustive overview of prior work), and the missing thing (a way to avoid duplicating work). The plan treats those bare facts as the ground truth.

What follows from those bare facts is the shape of the problem: any solution has to ingest the open scholarly-record feeds, build a per-field overview that surfaces prior work, replication outcomes, open disputes and open questions, and present it in a form the researcher can read and trust without checking each paper individually. The plan scopes the narrowest honest MVP that addresses exactly the exhaustive-overview use case for one research field at a time, leaving the cross-field comparison for after the per-field shape is validated.

## Objective

Build a per-field exhaustive-overview surface a researcher can open, name their subfield, and read: what has been published (with citations), what has been replicated, what is in dispute, and what remains open — built from the open scholarly-record feeds with provenance per claim, so the researcher gets a starting map of the field without stitching together ten databases themselves.

## Target Users

- Researchers in France starting a new project who need an exhaustive overview of what has been done in their subfield before designing their own study.
- Researchers in France writing a literature-review section who need a structured map of prior work, replicated findings, and open questions.
- PhD students in France scoping a thesis who need to know what is settled, what is disputed, and what remains open in their area.
- Research-group leaders in France who want a per-field briefing their new members can read in an afternoon rather than over a month.
- Independent researchers and journalists who cover a research field and need a documented starting map they can cite.
- Funders and programme officers who need to know which subfields are crowded and which have open questions worth funding.

## MVP Scope

- A per-field overview surface where the researcher names a subfield (a string), and the surface returns a structured overview: published-work map (clustered by sub-topic), replicated findings, disputed findings, and open questions.
- An ingestion pipeline that pulls from the open scholarly-record feeds (arXiv, Semantic Scholar Graph, OpenAlex, Crossref), normalises the records into a unified paper model with title, authors, abstract, year, venue, citation graph, and replication-outcome field where it exists.
- A per-claim provenance field: every statement in the overview carries the source record ID(s) it was derived from, so the researcher can inspect the source.
- A clustering step that groups papers by sub-topic within the named field, using the abstracts and the citation graph, so the overview is structured rather than a flat list.
- A replicated-findings view: papers flagged in the open replication feeds as having been replicated, with the replication outcome (success, partial, failure) where the source feed provides it.
- A disputed-findings view: papers where later work has challenged the result, drawn from citation context where the citing paper explicitly contests the original.
- An open-questions view: papers that explicitly identify an open question in their abstract or introduction, surfaced as a list.
- French and English copy on the researcher-facing surface, since the source country is France and the first researcher audience is French.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The overview is built from open scholarly-record feeds. Paid databases (Web of Science, Scopus) are out of scope at MVP and would change the licensing terms.
- Provenance is per claim, not per overview. A statement that "X has been replicated" carries the source record; a statement that "X is disputed" carries both the original and the disputing record.
- The MVP covers one research field at a time. The researcher names the field; the overview is per-field. Cross-field comparison is deferred.
- The clustering step is heuristic; the MVP does not claim a definitive taxonomy of any field. The overview is a starting map, not a settled one.
- The replication-outcome field is populated only where the open replication feeds provide it. Many papers have no replication record, and that absence is surfaced as "no replication record found," not as a claim of no replication.
- The overview does not host papers. The researcher reads the overview and follows provenance links to the source records.
- French and English copy are both in scope. The MVP surfaces both; the post does not pick a primary language.
