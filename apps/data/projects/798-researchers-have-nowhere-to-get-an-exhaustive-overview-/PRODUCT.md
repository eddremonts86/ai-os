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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A per-field exhaustive-overview surface a researcher can open, name their subfield, and read: a structured map of what has been published, what has been replicated, what is in dispute, and what remains open — built from the open scholarly-record feeds with provenance per claim, so the researcher gets a starting map of the field without stitching together ten databases themselves.

Every statement in the overview carries the source record ID it was derived from. The overview is heuristic, not definitive — a starting map the researcher can read in an afternoon and use to navigate the literature, with provenance to the source rather than a flat summary.

**One-liner:** A per-field exhaustive-overview surface built from the open scholarly-record feeds, where every claim carries the source record ID it was derived from, so a researcher gets a starting map of prior work with provenance rather than a stitched-together summary.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Researchers in France starting a new project | Need an exhaustive overview before designing their study. |
| Researchers in France writing a literature review | Need a structured map of prior work, replicated findings, and open questions. |
| PhD students in France scoping a thesis | Need to know what is settled, disputed, and open in their area. |
| Research-group leaders in France | Want a per-field briefing new members can read in an afternoon. |
| Independent researchers and journalists | Need a documented starting map they can cite. |
| Funders and programme officers | Need to know which subfields are crowded and which have open questions. |

## Jobs To Be Done

1. **Functional job** — Name my subfield and read a structured overview in an afternoon, with every claim linked to a source record.
2. **Functional job** — Identify the replicated findings in the field so I do not re-prove what has been proven.
3. **Functional job** — Identify the disputed findings in the field so I do not build on contested ground.
4. **Functional job** — Identify the open questions in the field so I can scope a contribution.
5. **Emotional job** — Stop the feeling that the literature review is an open-ended scavenger hunt.
6. **Social job** — Be the researcher who started from a structured overview rather than a flat citation list.

## Success Metrics

- **Overview coverage** — number of subfields with a published overview at the configured depth. Coverage is the prerequisite for the researcher to find their field.
- **Provenance completeness** — share of claims in an overview that carry a source record ID. A claim without provenance is the failure mode the system is built to prevent.
- **Replicated-findings surface rate** — share of overviews where the replicated-findings view is non-empty where the open feeds provide replication records. A high rate is the signal the ingestion is reaching the replication data.
- **Disputed-findings surface rate** — share of overviews where the disputed-findings view is non-empty where the citation graph provides contest context.
- **Open-questions surface rate** — share of overviews where the open-questions view is non-empty where abstracts identify open questions.
- **Researcher return rate** — share of researchers who come back for a second subfield overview within 90 days. The value compounds only if the overview is trustworthy enough to use again.

## Pricing & Monetization

The source names no fee, no rate and no tier. What the architecture fixes is the cost shape: the surface could be free (monetised by a grant or institutional subscription), charge per overview generated, or charge per institution per year. The source does not pick one, so the plan does not invent a number. Any future monetization has to be evaluated against the provenance completeness and the researcher return rate, because both metrics depend on the overview being trustworthy rather than a marketing surface.

## Competitive Landscape

- **Existing literature-review tools (the names the source does not provide)** — citation managers and search surfaces, but none that produce a structured per-field overview with replicated-findings and disputed-findings views.
- **The open scholarly-record feeds themselves (arXiv, Semantic Scholar, OpenAlex, Crossref)** — the data sources, not the overview. The MVP is a layer above them.
- **Systematic-review platforms (the names the source does not provide)** — produce structured reviews for a specific research question, not a per-field overview; the MVP addresses a different surface.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the licensing terms of each open scholarly-record feed permit the overview's downstream use, including any commercial-shape use.
- [ ] Define the clustering rubric so concretely that two overviews of the same field produce the same sub-topic map, since the overview's structure is the value the researcher reads.
- [ ] Confirm the replication-feed ingestion reaches the relevant records without false positives (a paper that mentions replication in passing does not get flagged as a replicated finding).
- [ ] Decide how the MVP handles a field where the open feeds are thin (a niche subfield with little indexed work), so the overview surfaces an honest "limited open-feed coverage" state rather than a confident empty overview.
- [ ] Validate with five French researchers that the per-field overview shape matches how they actually start a literature review.
- [ ] Establish a documented escalation path for a researcher who disputes a claim in the overview, so a literature dispute does not become a brand-trust problem.
