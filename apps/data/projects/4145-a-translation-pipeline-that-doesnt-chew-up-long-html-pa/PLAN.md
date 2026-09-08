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

## Tech Stack

- **Tree-sitter** for HTML parsing, matching the source's stated approach and giving the chunker a real node tree to walk.
- **An LLM API (the names the source does not provide)** for the per-chunk translation step; the pipeline is provider-agnostic, the LLM is the only piece that has to change for a different model.
- **Python or Node** as the runner language, since both have mature tree-sitter bindings and both can drive a per-chunk translation loop. The source does not name a language.
- **A batch runner** that walks a directory of HTML pages, dispatches per-chunk translations in parallel within the model's rate limit, and assembles the per-page report alongside the translated output.
- **A structural diff** between the source tree and the translated tree, comparing node counts and parent-child relationships per element type, so the per-page report can name the dropped and summarised sections.
- **A non-translatable filter** that identifies template logic, layout attributes, and other markup the model should not touch, implemented as a tree walk that strips nodes before the LLM sees the page.

## Architecture

The pipeline has five stages: parse, filter, chunk, translate, check.

The parse stage turns the long HTML page into a tree-sitter node tree. The page is not a flat string the splitter can mangle; it is a tree the chunker can walk along real element boundaries.

The filter stage walks the same tree and removes nodes the model should not translate: template logic (the source's example), layout attributes, and other markup whose translation would break the rendering. The filter is structural, not regex; the source's claim is that anything non-translatable stays out of the model's hands entirely, not that the model is asked to skip it.

The chunk stage walks the filtered tree and emits chunks whose boundaries are real HTML elements. A chunk is a heading, a section, a list item, a table row — whatever the source's structural unit is. The chunker never invents a boundary the source HTML did not have. If a single structural unit exceeds the model's window, the chunker flags it as a unit that needs splitting, not silently splits it.

The translate stage runs each chunk through the LLM and collects the translated chunk. The runner dispatches chunks in parallel within the model's rate limit; per-chunk failures are retried with the same chunk and the same prompt, since a chunk failure is rarely a model failure.

The check stage compares the source tree to the assembled translated tree, node by node, and emits a per-page report. The report names the structural units the translated output dropped (the source had a section the translation does not), the chunks the model summarised instead of translated (the chunk came back shorter than the source chunk and the structural check noticed), and the repairs the post-check made as a safety net. The report is the deliverable, not an afterthought.

The pipeline is provider-agnostic at the translate stage: the LLM call is the only piece that has to change for a different model. The structural chunker, the filter, the check, and the report are all model-independent, so a team can swap models without rewriting the pipeline.

## Milestones

1. **M1 — Tree-sitter parse and node-tree output** — the HTML parser binding, the per-page node tree, the JSON serialisation of the tree for the chunker.
2. **M2 — Non-translatable filter** — the template-logic and layout-attribute walk, the filter's allowlist of translatable node types, the per-page report naming what was filtered out.
3. **M3 — Structural chunker** — the boundary-aware chunker, the chunk size guard, the "single structural unit exceeds window" flag.
4. **M4 — Per-chunk translate and parallel runner** — the LLM call wrapper, the rate-limit-aware parallel dispatch, the per-chunk retry on failure, the chunk reassembly into the translated tree.
5. **M5 — Post-translation structural check** — the source-tree to translated-tree diff, the dropped-unit detection, the summarised-chunk detection, the repair-as-safety-net pass.
6. **M6 — Per-page report** — the dropped-sections list, the summarised-sections list, the post-check repair list, the report's per-page file alongside the translated output.
7. **M7 — Six-language batch run** — the batch runner that walks a directory and emits per-page reports across six target languages.
8. **M8 — Documentation and the poster's run as evidence** — the README, the per-page report format spec, the documented run on the poster's site (1,000+ pages, six languages, hand-checked output).

## Risks

- **Structural-chunker misses a node type** — a hand-written element the chunker does not know becomes an unchunked region and the LLM sees the whole thing. Mitigation: the chunker's node-type allowlist is explicit; any unknown node is filtered out or flagged, never silently passed through.
- **Non-translatable filter too aggressive** — the filter strips a node that should have been translated (a data attribute whose value is user-facing copy). Mitigation: the filter's allowlist is named; the per-page report names what was filtered so a reviewer can audit.
- **Single structural unit exceeds the window** — a deeply nested section with thousands of words is too long for any single chunk. Mitigation: the chunker flags it as untranslatable and the per-page report names it; the pipeline does not silently split it.
- **Post-check repair masks a real drop** — the structural check repairs a translation that the chunker should have caught, and the drop is invisible in the report. Mitigation: the repair count is a first-class metric in the per-page report; a high repair rate is the signal the chunker is leaking.
- **Six-language parity drift** — one language's structural check is tighter than another's and the per-language pass rate diverges. Mitigation: the structural check is language-agnostic; the per-language pass rate is a metric the batch runner reports.
- **Provider swap breaks the chunker contract** — a new LLM has a different window or a different chunk-size sweet spot, and the chunker is too generous. Mitigation: the chunk-size guard and the "exceeds window" flag are model-independent; the chunker is retuned, not rewritten.
- **Per-page report is not enough for QA** — the reviewer needs a structural diff, not a list, and the pipeline ships only the list. Mitigation: the report format is documented; the structural diff is available behind a flag and the report links to it.
