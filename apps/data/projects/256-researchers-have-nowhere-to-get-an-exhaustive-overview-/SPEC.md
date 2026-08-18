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

## Problem

A researcher who enters or surveys a field cannot easily produce an exhaustive overview of what has been done. The current sources — Google Scholar, Semantic Scholar, arXiv, Scopus, conference proceedings, lab homepages — are partial, fragmented, and biased toward English-language and high-citation-count work. Reading groups and review papers are helpful but are themselves biased by who wrote them. The poster frames the missing piece as a service that gives the researcher a real exhaustive view, so they can stop rediscovering what is already known.

The pain is at the entry and review stages, not at the discovery-of-a-single-paper stage. The researcher can find a paper. The researcher cannot confidently say "I have seen everything relevant to my question."

The post is short. It does not name a specific field, lab, country, or funding body. The framing is that the gap exists and is structural.

## Objective

Build a research-overview service that produces, for a given question or sub-field, an evidence-backed synthesis of the work that exists: what has been done, where, by whom, and how it has been received. The output is a structured review with citations the researcher can follow, not a generated essay.

The MVP focuses on a small set of fields (the post does not specify which) and on transparency about coverage: every claim in the synthesis is tied to a paper the researcher can open.

## Target Users

- Academic researchers entering a new field or sub-field who need to know what has been done before they begin.
- Industrial research labs who want to avoid duplicating work that already exists in adjacent academic literature.
- PhD students preparing a literature review for a thesis chapter.
- Grant reviewers and programme officers who want a quick structured read on what has been done in a topic area.

The source frames the user as the researcher. The lab or grant body is named as a downstream beneficiary.

## MVP Scope

- A search and synthesis surface: the researcher enters a question or sub-field (e.g., "self-supervised representation learning for medical imaging 2018–2025"); the service returns a structured overview organised by sub-topic, method, and benchmark.
- Citation-first output: every claim in the overview is followed by a link to the underlying paper. No unsourced claim is allowed in the MVP.
- A coverage indicator: the overview states how many papers were indexed for the question, from which sources, and over what period. The researcher can see whether the synthesis missed a major source.
- An export to BibTeX and to a Markdown literature-review document the researcher can drop into a thesis chapter.

The MVP does not include full-text reasoning over every paper, ML-based claim extraction, or auto-generated prose. The synthesis is template-driven; the human researcher remains the writer.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ai/t3i6ddxjb1-researchers-have-nowhere-to-get-an-exha` follows the constraints in `256-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in France.

For France, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Citation honesty: every claim must be tied to a paper. A synthesis that drops the citation chain is worse than no synthesis, because it makes fabricated claims look cited.
- Source coverage must be disclosed. If the MVP missed a major database (e.g., PubMed for biomedical work), the overview must say so rather than imply exhaustive coverage.
- Field-specific databases exist (PubMed, IEEE Xplore, ACM DL, JSTOR, arXiv). The MVP must integrate the right ones for the chosen pilot fields; a one-size-fits-all database list is dishonest.
- Language bias is real: many significant works are not in English. The MVP must either integrate non-English sources (CNKI for Chinese, HAL for French, SciELO for Spanish/Portuguese) or disclose the English-only limitation.
- No auto-generated claims. The synthesis is template-driven; the human researcher remains the writer. The MVP's value is coverage and structure, not prose.
