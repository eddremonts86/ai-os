---
id: "256"
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
---
# Researchers have nowhere to get an exhaustive overview of what has been done in their field, leading to the risk of duplicating work

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A research-overview service that produces a citation-first synthesis of what exists in a sub-field: what has been done, where, by whom, and how it has been received. Every claim is tied to a paper the researcher can open, and the overview discloses its source coverage so the researcher can judge what it might have missed.

## Target Users

- Academic researchers entering a new field or sub-field.
- Industrial research labs who want to avoid duplicating adjacent academic work.
- PhD students preparing literature-review chapters.
- Grant reviewers and programme officers who want a structured read on a topic area.

## Jobs To Be Done

- When I start a new research direction, I want an exhaustive overview of what has been done, so I stop rediscovering prior work.
- When I am writing a literature-review chapter, I want a citation-first synthesis I can drop into my thesis, so I do not have to re-read every paper to write it.
- When I am a grant reviewer, I want a structured read on what has been done in a topic, so I can judge whether a proposal is novel.
- When I am a lab head, I want to know whether a research idea is already covered in adjacent fields, so I do not commit a PhD student to a duplicate.

## Success Metrics

- Number of overviews generated per month (proxy for usage breadth).
- Citation coverage: percentage of claims in an overview that are tied to a paper the user can open.
- Coverage disclosure: percentage of overviews that report the source list and the date span they cover.
- Researcher retention: percentage of researchers who return within 90 days for a second overview.

## Pricing & Monetization

Pricing is not stated in the source. The post is about a missing structural overview, not a price. Candidate models — institutional licences for universities and labs, per-overview credits for individuals, or a grant-funded open-access tier — are all open.

## Competitive Landscape

The post does not name competitors. It frames the gap as the absence of an exhaustive overview surface. Existing tools (Google Scholar, Semantic Scholar, Connected Papers, Litmaps) are not named by the source; any specific competitor naming beyond what the source states would be invention and is left out.

## Risks & Open Questions

- Validate problem with 5 researcher interviews before MVP: confirm that the exhaustive-overview framing matches what researchers actually need, and that they would trust a citation-first synthesis over a generated essay.
- Source coverage is the binding constraint. A synthesis that misses a major database is dishonest by omission; the MVP must disclose its source list per overview.
- Language bias: significant work is not in English. The MVP must either integrate non-English sources or clearly disclose its English-only limitation.
- Auto-generated prose is a risk: it lets the synthesis look authoritative without being so. The MVP keeps the synthesis template-driven; the researcher remains the writer.
- Field-specific databases: PubMed, IEEE Xplore, ACM DL, JSTOR are not interchangeable. The MVP must integrate the right ones for the pilot fields and disclose the choice.
