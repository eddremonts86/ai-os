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

## Tech Stack

Chosen for a reader that lives inside the Zotero world; the capture names no libraries.

- **Zotero API or plugin bridge:** item and attachment access.
- **Markdown renderer:** the reading view.
- **Source-link resolver:** document to item and item to document.
- **Local file access:** Markdown attachments read where Zotero stores them.
- **Cross-platform reader shell:** the surface users open documents in.

## Architecture

- **Library bridge:** enumerate Zotero items and their Markdown attachments.
- **Reader:** renders the active document.
- **Link layer:** bidirectional navigation between document and source item.
- **Storage:** reads files in place; no forced migration of the library.

## Milestones

1. **M0 — Connect.** A Zotero library connects and lists its Markdown attachments.
2. **M1 — Read.** Markdown documents render in the reader with source-link back-navigation.
3. **M2 — Round trip.** Item to document and document to item navigation is polished.
4. **M3 — Public release.** Install docs ship for the Zotero community.

## Risks

- **Integration stability:** Zotero versions change the API surface.
- **Niche overlap:** the built-in reader already covers part of the workflow.
- **Single-author maintenance.**
