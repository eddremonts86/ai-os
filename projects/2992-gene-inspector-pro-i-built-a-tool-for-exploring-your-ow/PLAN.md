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

## Tech Stack

Chosen for this problem:
- **Python** for the variant-annotation and claim-extraction pipelines (matches the bio/ML ecosystem).
- **Postgres** for the variant database and the per-paper claim registry.
- **Open-access paper ingestion** via PubMed / OpenAlex APIs, plus a local claim-extraction step.
- **A real-time voice + chat agent (Diana)** on top of a frontier LLM with two distinct system prompts (geneticist hat, functional-medicine hat).
- **Web app** for variant browsing, evidence linking, and the Diana conversation.

## Architecture

```
+--------------------+   raw DNA   +----------------------+   annotate   +-------------------+
|  User upload       | ----------> |  Variant annotator   | -----------> |  Public variant   |
|  (23andMe / WES /  |             |  (Python + ClinVar / |              |  sources          |
|   WGS)             |             |   gnomAD / dbSNP)    |              +-------------------+
+--------------------+             +----------------------+                       |
                                          |                                          v
                                          v                                 +-------------------+
                                  +--------------------+    claim extract   |  Variant findings |
                                  |  Shortlist UI      | <---------------- |  + claim registry |
                                  |  with citations    |                   +-------------------+
                                          |                                          |
                                          v                                          |
                                  +--------------------+                              |
                                  |  Diana agent       | <----------------------------+
                                  |  (text + voice,    |   consults claim registry
                                  |   two hats)        |
                                  +--------------------+
```

The variant annotator runs once per upload and produces the shortlist. The claim registry is built from open-access papers and updated on a schedule. Diana consults both the registry and the user's shortlist; every claim it produces must resolve back to a paper ID, not a generated citation.

## Milestones

- **M1 (already done per the source):** DNA parsing for 23andMe / WES / WGS, variant annotation, public-source linking, paper claim-extraction pipeline.
- **M2 (already done per the source):** Diana agent in invite-only beta, text + real-time voice, two-mode system prompts.
- **M3 (next):** open the beta; measure retention and the per-claim source-resolution rate.
- **M4:** pricing decision once retention is measurable.
- **M5+:** explore clinic / functional-medicine-practice tier if retention justifies it.

## Risks

- **Medical-advice boundary.** The product must remain investigation, not diagnosis. UI copy, disclaimers, and the two-hat mode switch are the line of defense.
- **Source-traceability drift.** Open-access papers get retracted, links rot, claim IDs need to be resolvable over time. Maintenance budget matters.
- **Invite-only beta hides demand.** Real retention will only be visible once the beta opens; pre-open traction is mostly signal noise.
- **Two-hat confusion.** Users may not realize which mode produced a claim. The UI must label every output by hat.
