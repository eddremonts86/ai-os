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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4145-a-translation-pipeline-that-doesnt-chew-up-long-html-pa/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Bind tree-sitter's HTML parser and turn each input page into a node tree, serialised to JSON so the chunker and the check can both read it.
- [ ] Implement the non-translatable filter that walks the node tree and strips template logic, layout attributes, and other markup the model should not translate; the filter is structural, not regex.
- [ ] Implement the structural chunker that emits chunks along real HTML element boundaries (headings, sections, list items, table rows) and never cuts through a tag or sentence; flag any single structural unit that exceeds the model's window rather than splitting it.
- [ ] Implement the per-chunk translate call, a rate-limit-aware parallel dispatcher, and the per-chunk retry on a chunk-level failure; reassemble the translated chunks into the translated node tree.
- [ ] Implement the post-translation structural check that diffs the source tree against the translated tree, detects dropped structural units, detects chunks the model summarised instead of translated, and runs a repair pass as a safety net.
- [ ] Implement the per-page report that names the dropped sections, the summarised sections, and the post-check repairs, alongside the translated output.
- [ ] Implement the six-language batch runner that walks a directory of pages, dispatches per-page runs across six target languages, and emits the per-page reports alongside the translated output.
- [ ] Add the chunk-size guard and the chunker allowlist so an unknown node type is filtered or flagged, never silently passed through.
- [ ] Document the per-page report format and the structural-diff flag, so the QA reviewer can read the report and pull up the structural diff when the report is not enough.
- [ ] Run an end-to-end test on a representative page: parse a 5,000-word page into a node tree, filter the non-translatable nodes, chunk along structural boundaries, translate each chunk through the LLM, run the structural check, emit the per-page report, and confirm the translated tree's structural units match the source tree's structural units.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Document the poster's run as evidence (1,000+ pages, six languages, hand-checked output) so the pipeline ships with the source's claim rather than a fresh one
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
