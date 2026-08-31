---
id: "3874"
slug: mktero-a-source-linked-markdown-reader-for-zotero
title: Mktero – a source-linked Markdown reader for Zotero
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499373"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Zotero API bridge, Markdown rendering, Source-link resolver, Local file reading, Reading UI, Cross-platform shell]
---
# Mktero – a source-linked Markdown reader for Zotero

## Problem

This Show HN capture is a bare link to github.com/tenglvjun/mktero; the product claim is the title: "Mktero – a source-linked Markdown reader for Zotero". Mktero presents itself as a reader for Zotero, the open-source reference manager, that renders Markdown and keeps every document linked back to its source — notes and documents stay connected to the Zotero items they came from. The capture states nothing about supported platforms, how the Zotero link works, or which formats it reads beyond Markdown.

## Objective

Build the claimed reader: read Markdown documents inside a Zotero-linked workflow, with every document tied to its source item. The MVP opens a Markdown document from a Zotero library, renders it, and navigates back to the source item.

## Target Users

- Zotero users who take notes in Markdown instead of the built-in editor.
- Researchers who link notes to papers and need the trail back to the source.
- Academics managing reading notes across many items.

## MVP Scope

- Open and render Markdown documents from the Zotero library.
- Source linking: each document resolves to its Zotero item, and back.
- Reading-focused UI: a rendered view, not an editor-first surface.
- A clear install and connect path for a Zotero library.

## Constraints

- The capture is a bare repo link; platforms and integration details are unstated.
- The source-linked promise is the core: navigation must work in both directions.
- Markdown is the stated format; other formats are out of scope unless stated.

## Design Direction

See `DESIGN.md` for this project's design tokens.
