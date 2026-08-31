---
id: "3901"
slug: atlasface-the-study-kit-and-notetaking-app-youll-never-
title: "Atlas:Face – the study kit and notetaking app you'll never leave"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496451"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [spaced repetition, markdown editor, knowledge graph, offline-first sync, flashcard engine, desktop app]
---
# Atlas:Face – the study kit and notetaking app you'll never leave

## Tech Stack

- **Markdown editor:** notes with linked notes.
- **Knowledge graph:** connections between notes.
- **Spaced-repetition scheduler:** the review queue.
- **Flashcard engine:** fed by note conversion.
- **Offline-first sync:** notes survive bad connections.
- **Desktop app shell:** the primary workspace.

## Architecture

- A notes store with markdown bodies and bidirectional links.
- A conversion step that extracts flashcards from note structure.
- A review queue driven by a spaced-repetition scheduler.
- A graph view over note links and tags.
- Local-first storage with sync layered on top.

## Milestones

1. **M0 — Scaffold:** editor, note store, app shell.
2. **M1 — Notes work:** markdown, links, search, organization.
3. **M2 — Study works:** note-to-flashcard conversion, review queue, scheduling.
4. **M3 — Retention earns its claim:** streaks, reminders, import from rivals, export guarantees.

## Risks

- The fusion only matters if conversion is good; a bad bridge kills the concept.
- The retention claim sets a high bar; early churn would be public in any launch.
- Import/export is the trust currency in this category.
- A crowded market means the MVP needs one sharp edge, not breadth.
