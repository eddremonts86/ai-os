---
id: "2992"
slug: gene-inspector-pro-i-built-a-tool-for-exploring-your-ow
title: Gene Inspector Pro – I built a tool for exploring your own genome
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49337198"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Gene Inspector Pro – I built a tool for exploring your own genome

## Problem

When Sergey's son was diagnosed with several health conditions and told to "learn to live with it", he refused and started looking for answers. He spent the next seven years teaching himself genetics and cellular biology, then built **Gene Inspector** to turn raw DNA data into a shortlist of findings people can investigate. The tool supports data from common DNA tests, Whole Exome Sequencing, and Whole Genome Sequencing. Findings are annotated using public genetic sources and linked to the underlying evidence. Sergey also built a pipeline that processes open-access papers, extracts claims about specific variants, and links each claim to its source — so users can check the research themselves instead of trusting a black-box interpretation. He's now building an invite-only AI research agent **Diana** that explains what users are seeing and connects the dots, with two modes: a strict "geneticist" hat focused on clinical evidence and a broader "functional medicine" hat that looks at metabolism, enzymes, pathways, and common variants.

## Objective

Ship a tool that helps non-geneticists turn their raw DNA data into a shortlist of findings they can investigate, with every claim traceable to a paper. End state: a user can answer "what does this variant mean and where did you get that" by clicking through to the source.

## Target Users

1. **Families affected by a genetic diagnosis** who were told "learn to live with it" and want a way to investigate the research themselves.
2. **Self-directed patients** with raw DNA data from 23andMe, Ancestry, or a clinical sequencing provider who want more than a flat web report.
3. **Functional-medicine practitioners and curious clinicians** who want a tool that can switch between a strict clinical-geneticist lens and a broader functional-medicine lens.

## MVP Scope

- Parsing of raw DNA data from common consumer tests, Whole Exome Sequencing, and Whole Genome Sequencing.
- Variant annotation against public genetic sources, with links to the underlying evidence.
- A claim-extraction pipeline over open-access papers, with each claim linked to its source.
- An invite-only AI research agent (Diana) that explains what users are seeing and connects the dots, with two distinct modes: geneticist (strict, clinical) and functional medicine (broader, pathways-focused).
- Voice + text conversations with the agent.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The agent is invite-only beta per the source; closed-beta UX is the implicit v1.
- The two hats (geneticist vs functional medicine) must remain distinct — users should be able to tell which mode is producing which claim.
- Medical-advice boundary: claims are traceable, not prescriptions; the product is investigation, not diagnosis.
- Source does not name a price; pricing is left as an open question.
