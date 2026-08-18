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

## Value Proposition

A DNA variant explorer for non-geneticists. You upload raw data from 23andMe, a clinical sequencing provider, or a full WGS file. Gene Inspector returns a shortlist of findings, each linked to the public evidence and the open-access paper the claim was extracted from. An invite-only AI research agent Diana then explains what you're looking at in two distinct modes — a strict "geneticist" hat focused on clinical evidence and a broader "functional medicine" hat that looks at pathways, metabolism, and common variants.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Families affected by a genetic diagnosis | Want a way to investigate the research themselves instead of being told to "learn to live with it". |
| Self-directed patients with raw DNA data | Want more than a flat consumer web report. |
| Functional-medicine practitioners and curious clinicians | Want a tool that can switch between a clinical-geneticist lens and a broader functional-medicine lens. |

## Jobs To Be Done

1. **Functional job** — turn raw DNA data into a shortlist of findings you can investigate, with every claim linked to a paper.
2. **Emotional job** — feel like the tool respects you enough to show its sources, instead of handing you a black-box interpretation.
3. **Social job** — be able to share a finding with a clinician or family member in a way they can verify.

## Success Metrics

- **Activation:** time from raw-DNA upload to first shortlist.
- **Coverage:** number of variants annotated against public sources; number of open-access papers in the claim-extraction pipeline.
- **Retention:** invite-only beta users returning to ask Diana follow-up questions across sessions.
- **Trust:** percentage of Diana's claims that resolve to a linked paper (the source-traceability promise).

## Pricing & Monetization

The source post does not name a price; Diana is invite-only beta. Reasonable next decisions for the author: paid tier once out of beta, B2B plans for clinics or functional-medicine practices, or keep it a personal project. Pricing is left as an open question.

## Competitive Landscape

- **23andMe / Ancestry raw-data browsers** — basic, often single-nucleotide-polymorphism only, no claim-traceability.
- **Promethease** — single report per upload, no agent, no two-mode lens.
- **Genetic counseling services** — high-trust but expensive, not self-serve.
- **Functional-medicine "genomics reports"** — opinion-heavy, often with weak source-traceability.

## Risks & Open Questions

- [ ] Medical-advice boundary. The product must remain investigation, not diagnosis; claims traceable, not prescriptive. UI copy and disclaimers matter.
- [ ] Source-traceability drift. If the paper pipeline falls behind, claim-to-source links rot. Needs ongoing maintenance.
- [ ] Invite-only beta masks real demand; once opened, retention will tell the truth.
- [ ] Two hats risk confusion. Users may not realize which mode produced a claim; the UI must make it explicit.
