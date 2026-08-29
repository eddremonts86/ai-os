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

## Tech Stack

- **Application surface:** a web app is the most likely target given the indie-novel-tool space, but a desktop or cross-platform client is possible. The project page should clarify.
- **Editor:** a focused rich-text editor (ProseMirror, TipTap, Slate, or Lexical) tuned for long-form prose, with chapter / scene / part hierarchy.
- **Metadata layer:** a small database for characters, places, scenes, and arcs, linkable from the prose and reflected back into a project overview.
- **Export pipeline:** EPUB / DOCX / PDF generation with tested styling for italics, scene breaks, chapter headings, and front / back matter.
- **Project overview:** a dashboard view that shows word count by chapter, scene status, character coverage, and release-arc state.
- **Storage:** the user's manuscript is durable across sessions; offline / local-first behavior is a defensible choice for novelists who fear losing work.

## Architecture

```
┌────────────┐    ┌────────────┐    ┌────────────┐    ┌────────────┐
│ Editor     │───▶│ Manuscript │───▶│ Metadata   │───▶│ Project    │
│ (focused   │    │ store      │    │ store      │    │ overview   │
│  rich text)│    │ (chapters, │    │ (chars,    │    │ (word      │
│            │    │  scenes,   │    │  places,   │    │  counts,   │
│            │    │  parts)    │    │  arcs)     │    │  status)   │
└────────────┘    └────────────┘    └────────────┘    └────────────┘
                                              │
                                              ▼
                                       ┌────────────┐
                                       │ Export     │
                                       │ (EPUB /    │
                                       │  DOCX /    │
                                       │  PDF)      │
                                       └────────────┘
```

The editor is the primary surface; the metadata and the overview exist to keep a long manuscript consistent. The export is the path that turns a Neo project into a manuscript the rest of the world can read.

## Milestones

1. **M0 — Surface agreement.** Lock the editor model (chapter / scene / part), the metadata layer (characters, places, arcs), and the export formats. These are product decisions, not features.
2. **M1 — Editor + project model.** A new project can be created, chapters and scenes can be added, and the prose edits cleanly in focused mode.
3. **M2 — Metadata links.** Characters, places, and arcs are first-class, linkable from the prose, and reflected in the project overview.
4. **M3 — Tested export.** An EPUB / DOCX / PDF export that survives a real editor pass — italics, scene breaks, chapter headings, front / back matter all render correctly.

## Risks

- **Trust-signal precision.** "From the author of Silo" must be accurate; if the author only endorsed or only inspired the tool, the project page must say so.
- **Export fragility.** Long manuscripts are where export bugs hide; EPUB italics, DOCX heading styles, and PDF embedding all need end-to-end testing.
- **Editor scale.** Novel-scale (100k+ words) editor performance is its own problem; the MVP must stay responsive at novel-scale, not just chapter-scale.
- **Platform ambiguity.** The post does not state the platform; web vs. desktop changes the offline story and the install friction.
- **Scope creep.** "AI writing assistant" or "publishing platform" would dilute the novel-writing focus; the MVP must hold the line.
