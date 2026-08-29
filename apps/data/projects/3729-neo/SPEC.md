---
id: "3729"
slug: neo
title: Neo
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/neo"
category: product-launch
date: "2026-08-17"
tags: [ProductHunt, Product Launch]
tech: [Web app, rich-text editor, character/scene databases, export to manuscript formats]
---
# Neo

## Problem

The ProductHunt post is URL-only: it points at [producthunt.com/products/neo](https://www.producthunt.com/products/neo) with the tagline "A novel-writing tool from the author of Silo" as the only inline content. Reading the title literally, the project is a novel-writing tool, and its differentiator is the author behind it: the writer of *Silo* (Hugh Howey's self-published series, known for serial-release and direct-to-reader distribution). The framing positions Neo as a tool informed by someone who actually shipped a long, multi-volume novel and the workflow that required.

The underlying problem this responds to is that novelists writing long, structured, character-driven fiction have no good writing tool. Word processors are general-purpose and ignore chapter / scene / character structure; screenwriting tools are too rigid; worldbuilding tools are great for the wiki but bad for the manuscript itself; and AI-writing tools tend to push the user toward generating text rather than managing a long-form project. The "from the author of Silo" angle implies the tool reflects a real writing workflow, not a generic "writing app" template.

The post does not name the feature set, the price, the platform (web, desktop, mobile), the collaboration model, or the export formats. Those choices live on the project site, not in the post.

## Objective

Ship a novel-writing tool whose design is informed by the workflow of someone who has actually shipped a long, multi-volume novel. The MVP targets the "manuscript + structure + character / scene metadata in one place" promise. It does not target screenwriting, journalism, or a generic AI-writing assistant.

## Target Users

- Novelists writing long-form fiction who need manuscript structure (chapters, scenes, parts) on top of prose.
- Self-publishing and serial-release authors whose workflow includes managing release arcs alongside the manuscript.
- Writers who want character, scene, and worldbuilding metadata linked to the prose, not in a separate wiki.

The post does not name screenwriters, journalists, or academic writers; the "novel" framing is fiction-long-form by construction.

## MVP Scope

- A manuscript surface: chapter / scene / part hierarchy, with the prose itself editable in a focused writing mode.
- A linked metadata layer: characters, places, scenes, and arcs that the prose can reference and that update the manuscript when changed.
- An export path: a clean manuscript export (EPUB, DOCX, or PDF — the choice is on the project site, not in the post) suitable for self-publishing or for an editor.
- A project home that shows the whole book at a glance: word count by chapter, scene status, character coverage.

The MVP does not include a marketplace, a publishing platform, an AI text-generation feature, or a collaboration / co-writing mode.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The "from the author of Silo" framing is the headline trust signal: the tool must reflect a real workflow, not just brand association. The features should be defensible against the question "would the author of Silo actually use this for the next book?"
- Manuscript-first: the prose is the primary surface. Metadata is in service of the manuscript, not a separate product bolted on.
- Self-publishing friendly: the export path must produce something a self-publisher can use, not just a marketing screenshot.
- Honest about scope: the post names a novel-writing tool, not a full creative-suite. AI-generation, illustration, audio narration, or distribution are out of scope.
- Single-author workflow: the post does not name co-writing; the MVP targets one author per book, with no forced multi-user complexity.
