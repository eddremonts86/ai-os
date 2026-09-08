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

## Problem

The poster runs a site with more than 1,000 HTML pages, most of them AI-drafted content poured into templates. The pages are long and full of repeated structural markup, not hand-written one-offs. Feeding a long HTML page straight to an LLM for translation does not just mistranslate — it silently drops content. Whole sections vanish, paragraphs get summarized instead of translated, and the longer the page the worse it gets. The result looks like a translation but is missing half the page, with no warning anything was lost.

Naively splitting the page into smaller chunks by line or by character count does not fix this. The splitter cuts through the middle of tags and sentences, breaking the structure and handing the model fragments that do not mean anything on their own. What actually works, the poster says, is parsing the page into its real structure with tree-sitter, then chunking along structural boundaries so each chunk is a complete, meaningful unit and nothing gets silently cut or dropped. Anything non-translatable (template logic, layout attributes) stays out of the model's hands entirely. A structural check after translation catches anything that still slips through, mostly as a safety net at this point. The poster ran it for real on more than 1,000 pages, six languages, output checked by hand.

The source names the actor (a site owner with template-heavy AI-drafted HTML), the pain (long pages lose content silently when translated by an LLM, with no signal that anything was lost), and the missing thing (a translation pipeline that chunks along structural boundaries and refuses to drop content). The post is explicitly framed as a question — "Not pitching anything. Just want to know if this content-loss problem bites other people translating long pages with LLMs, or if it's specific to how my site is built." — so what the corpus can honestly extract is the problem the poster solved, not a new product pitch.

## Objective

Build a translation pipeline for long HTML pages that parses the page into its real structure, chunks along structural boundaries so each chunk is a complete meaningful unit, keeps non-translatable markup (template logic, layout attributes) out of the model's hands, and runs a structural check after translation so any content that did slip through is caught and flagged.

## Target Users

- Site owners with template-heavy, AI-drafted HTML pages who need to ship translations without losing content silently.
- Localization teams whose QA budget assumes a translation that covers the same structural units as the source page, not a translation that paraphrases sections away.
- Engineering teams running translation pipelines for documentation sites, knowledge bases, or product help centers where a missing section is a missing feature description, not a stylistic gap.
- Translation agencies whose reviewers are paid by the page and need to know the translation actually covers what the source covered.
- Developers who have tried chunking long pages by line or character and watched the splitter cut through tags, and want a chunking strategy that respects the document structure.

## MVP Scope

- An HTML parser that uses tree-sitter (or a structurally equivalent parser) to turn a long page into its real node tree, not a flat string the splitter can mangle.
- A structural chunker that walks the node tree and emits chunks whose boundaries are real HTML elements (headings, sections, list items, table rows), so each chunk is a complete meaningful unit and no chunk cuts through the middle of a tag or sentence.
- A non-translatable filter that identifies template logic, layout attributes, and other markup the model should not touch, and excludes them from the input the LLM sees.
- A translation step that runs each structural chunk through an LLM and recombines the translated chunks into the original node tree.
- A post-translation structural check that compares the source tree to the translated tree, flags any node that disappeared or any chunk that was summarised instead of translated, and emits a per-page report.
- A per-page report naming the sections that dropped, the sections that were summarised instead of translated, and the structural units the post-check had to repair as a safety net.
- A batch runner that processes a directory of HTML pages, six target languages, and emits the per-page report alongside the translated output.
- A documented run on the poster's own site — more than 1,000 pages, six languages, output checked by hand — so the corpus carries the source's evidence, not a fresh claim.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The pipeline chunks along structural boundaries, not by line count or character count. A chunk that cuts through the middle of a tag or sentence is a bug, not a knob.
- Non-translatable markup (template logic, layout attributes) stays out of the LLM's hands. The model never sees what it should not translate.
- The post-translation structural check is a safety net, not the primary defence. The chunker is the primary defence; the check is the backstop.
- A dropped section is a failure the per-page report names, not a silently truncated output. The pipeline does not claim a translation that omits content the source covered.
- The chunker never invents a chunk boundary the source HTML did not have. If a single structural unit is too long for the model's window, the pipeline flags it as a unit that needs splitting, not silently splits it.
- The per-page report is part of the deliverable. The pipeline does not emit a translation without the report.
- The poster's evidence (1,000+ pages, six languages, hand-checked output) is the source's claim. The plan does not promise a number the poster did not name; any future expansion has to be measured against the per-page report's drop and summarise counts.
