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

## Value Proposition

Search biomedical literature and get back ranked evidence where every claim points at the paper it came from, as open source you can run yourself.

## Target Users

Clinicians, medical researchers, and evidence-based-medicine students who need an answer they can trace to a citation rather than a summary they have to trust.

## Jobs To Be Done

- Ask a clinical question and see the supporting papers ranked by evidence strength
- Follow any sentence in the answer back to the source that supports it
- Run the tool on my own infrastructure because it is open source

## Success Metrics

- Share of generated claims that resolve to a retrievable source
- Whether users click through to the cited paper, since grounding only works if it is checked
- Repository clones and forks, since distribution here is the repo

## Competitive Landscape

Biomedical search (PubMed, Europe PMC) and EBM grading tools exist, but the source does not name any direct competitor that combines them with grounded claim ranking.

## Risks & Open Questions

- The post gives no detail on the ranking heuristic, which is where the product's credibility sits
- Evidence grading is contested; whose hierarchy the ranking encodes is unstated
- Grounding can be technically present and still misattribute a claim to a paper that does not support it
