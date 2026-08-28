---
id: "3140"
slug: ebm-lens-searches-biomedical-papers-ranks-evidence-grou
title: "EBM Lens, searches biomedical papers, ranks evidence, grounds claims"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49448826"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# EBM Lens, searches biomedical papers, ranks evidence, grounds claims

## Tech Stack

Python around a PubMed E-utilities client, because the biomedical retrieval tooling lives there; retrieval plus reranking over the returned abstracts; claim-to-source linking kept as explicit spans rather than model-generated citations.

## Architecture

Query goes to a literature API, results are reranked by study type and other evidence signals, then answer generation is constrained so each output sentence carries the identifier of the passage it was drawn from. The span-to-source map is a first-class artefact, not a formatting step, so grounding can be verified rather than assumed.

## Milestones

1. Literature search against PubMed returning structured records
2. Evidence ranking with the hierarchy documented in the repo
3. Claim-to-source span linking with a verification pass
4. CLI plus README so someone else can reproduce a run

## Risks

- Ranking quality is bounded by the underlying search; a weak candidate set cannot be reranked into a good answer
- A confidently phrased ungrounded claim is worse in clinical use than no answer
- API rate limits shape how much of the corpus a run can see
