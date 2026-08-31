---
id: "3834"
slug: documentationaimd-a-docs-standard-for-ai-agents-not-hum
title: "Documentation.ai.md – a docs standard for AI agents, not humans"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493041"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Markdown-based documentation standard, llms.txt-complementary convention, machine-actionable doc schema, example docs, CC BY 4.0 license, community contribution workflow]
---
# Documentation.ai.md – a docs standard for AI agents, not humans

## Tech Stack

Chosen for a documentation standard whose deliverable is the spec text and its adoption path.

- **Markdown-based documentation standard:** the spec text itself, in the repo.
- **llms.txt-complementary convention:** explicit positioning next to the existing standard.
- **Machine-actionable doc schema:** structure agents can parse and execute.
- **Example docs:** worked conformant files for adoption.
- **CC BY 4.0 license:** the standard's distribution terms.
- **Community contribution workflow:** CONTRIBUTING and MANIFESTO as the governance surface.

## Architecture

- **Spec document:** the normative definition of documentation.ai.md.
- **Manifesto:** the machine-first rationale and llms.txt positioning.
- **Examples:** conformant docs showing the standard in use.
- **Contribution path:** proposals and reviews via the repo.

## Milestones

1. **M0 — Draft spec.** documentation.ai.md defined with a manifest and license.
2. **M1 — Examples.** Conformant example docs in the repo.
3. **M2 — Adoption pitch.** Explain clearly why agents need this and how it complements llms.txt.
4. **M3 — Community.** First external adopters and contributions beyond the author.

## Risks

- **No adopters:** the standard's only metric is usage it does not yet have.
- **Positioning risk:** llms.txt complementarity must be credible or the standard is noise.
- **Governance:** a 4-commit solo repo has no decision-making structure yet.
- **Agent-actionability:** the spec must define what "act on" means precisely, or tools cannot implement it.
- **Iteration speed:** standards need versioning and backward compatibility early.
