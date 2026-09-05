---
id: "4145"
slug: a-translation-pipeline-that-doesnt-chew-up-long-html-pa
title: "A translation pipeline that doesn't chew up long HTML pages"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509437"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A translation pipeline that doesn't chew up long HTML pages

## Value Proposition

A translation pipeline for long, template-heavy HTML pages that parses the page into its real structure with tree-sitter, chunks along structural boundaries so each chunk is a complete meaningful unit, keeps non-translatable markup out of the model's hands, and runs a post-translation structural check so any dropped or summarised section is named in a per-page report instead of silently shipped.

The source's claim is concrete: a run on more than 1,000 pages, six languages, output checked by hand, no silently dropped sections. The poster is not pitching a product — the post is an open question about whether the content-loss problem bites other teams. The value proposition is the pipeline shape that worked, not a marketing ratio.

**One-liner:** A translation pipeline for long HTML pages that chunks along structural boundaries, keeps non-translatable markup out of the model's hands, and names every dropped or summarised section in a per-page report.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Site owners with template-heavy pages | Need translations that cover what the source covered, with a per-page report naming any section that did not make it. |
| Localization QA teams | Need a structural check that flags dropped or summarised sections, not a stylistic diff that misses them. |
| Documentation and help-center engineers | Need a translation pipeline that does not silently omit a feature description because the section was the model's second priority. |
| Translation agencies | Need a per-page report their reviewers can read alongside the translation, so the review covers the same structural units as the source. |
| Developers burned by line-based chunking | Want a chunking strategy that respects the document structure rather than cutting through tags and sentences. |

## Jobs To Be Done

1. **Functional job** — Translate a long HTML page and get back a translation whose structural units match the source's structural units, plus a per-page report naming any unit the model dropped or summarised.
2. **Functional job** — Keep template logic and layout attributes out of the model's hands so the LLM never sees what it should not translate.
3. **Functional job** — Process a directory of pages across six languages and emit the per-page report alongside the translated output, so the QA loop is per-page, not per-corpus.
4. **Emotional job** — Stop the feeling that the translation is missing half the page and the team will only find out when a reader complains.
5. **Social job** — Be the team whose localisation vendor hands back a translation that the QA reviewer can sign off on the structural report, not a stylistic best-effort.

## Success Metrics

- **Drop rate** — share of source structural units that did not appear in the translated output. The poster's pipeline aims to make this visible per page; the metric is the count, not a vague "looks complete".
- **Summarise rate** — share of chunks the model summarised instead of translated. The post-translation structural check is the signal; a high rate is the chunker warning that the chunk was too long.
- **Post-check repair rate** — share of translated outputs the structural check had to repair as a safety net. The chunker is the primary defence; the repair rate is the signal the primary defence is leaking.
- **Per-page report coverage** — share of pages in a batch that ship with a per-page report. A translation without a report is a pipeline failure, not an option.
- **Six-language pass rate** — share of pages where all six target languages produce a translation whose structural units match the source. The poster's run is the source's evidence.
- **Chunk-boundary integrity** — share of chunks whose boundaries are real HTML elements, not splits through tags or sentences. The chunker never invents a boundary the source HTML did not have.

## Pricing & Monetization

The source names no price, no tier, and no commercial plan. The poster is not pitching a product; the post is a question about whether the content-loss problem bites other teams. The pipeline shape is open in the sense that the poster describes how it works, but no product page, no library, and no commercial wrapper is named. Any future monetization has to be measured against the drop rate, the summarise rate, and the six-language pass rate, because those are the metrics the source actually names.

## Competitive Landscape

- **Naive line-or-character chunking** — what the poster explicitly rejects: cuts through tags, hands the model fragments that do not mean anything, silently drops content.
- **Generic LLM translation APIs (the names the source does not provide)** — accept long inputs, return a translation that looks complete, offer no structural report naming what was lost.
- **Translation management systems (the names the source does not provide)** — manage the workflow, not the chunking strategy, and inherit whatever content-loss behaviour the underlying API has.
- **Manual hand-off to a translation agency** — works for short pages, does not scale to 1,000+ pages, and produces no structural report the engineering team can audit.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the structural-chunking strategy generalises beyond the poster's template-heavy AI-drafted pages. The pipeline was tuned on a specific site; the open question is whether hand-written markup with deeper nesting breaks the chunker.
- [ ] Define how the post-translation structural check handles a section the model legitimately rewrote for fluency (a translated heading that no longer matches the source heading verbatim). The check is structural, not lexical; the open question is where to draw the line.
- [ ] Validate the non-translatable filter's coverage of template logic. The source mentions template logic and layout attributes; the open question is how the filter handles inline scripts, data attributes, and JSON-LD blocks.
- [ ] Decide the policy on a single structural unit that exceeds the model's window. The source does not name a maximum chunk size; the open question is whether the pipeline flags it as untranslatable, splits it along a sub-element boundary, or refuses the page.
- [ ] Establish a documented upgrade path when the parser is swapped (tree-sitter today, a different structural parser tomorrow). The chunker depends on the parser's node tree; the open question is whether the chunker is parser-agnostic enough to survive a swap.
- [ ] Confirm the per-page report's format is enough for a QA reviewer. The source describes a per-page report naming the dropped and summarised sections; the open question is whether the reviewer needs a diff view, a structural diff, or a structural diff plus a per-section prose diff.
- [ ] Decide the policy on a translation that is correct in language but wrong in structure (a heading that became a paragraph, a list that became prose). The structural check catches the shape; the open question is whether the pipeline names the shape drift or treats it as a repair.
