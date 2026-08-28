---
id: "1295"
slug: visimer-open-source-visual-editor-for-mermaid-diagrams
title: Visimer – open-source visual editor for Mermaid diagrams
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49335470"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Visimer – open-source visual editor for Mermaid diagrams

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, Nick here, founder at OpenKnowledge. We built an open source library, Visimer, for editing Mermaid diagrams with a what-you-see-is-what-you-get visual editor. Try the playground at https://visimer.com/playground. You can rename labels, change shapes, add new nodes, etc. by clicking and dragging the visual canvas.We set out to build this originally for OpenKnowledge, our markdown wysiwyg editor, then realized it’d be great to share it as a proper embeddable component library so that other apps can leverage it as well.Our general take is that AI is great for generating content, but whenever you want to tweak fine details, for example to create an artifact sharable with others, point-edit functionality is much better. We built Visimer to bring that to Mermaid diagrams, just like we did for markdown.Some technical bits:- Leverages the native Mermaid.js renderer for visualizing the Mermaid diagram true to how it’s intended. We add point-edit functionality on top.- We tried re-generating the entire file on every edit, but found that it would eat comments and formatting, etc. The final approach maps the rendered SVG elements back to a CST, so we can then edit only the parts of the file that should change.You can pair the visual editor with any text-editor so you can have both visual and code-level editor experiences. The library provides bindings for Monaco and CodeMirror and is extensible. There's also a low-level headless version.If you just care about being able to edit your Mermaid diagrams in your markdown, you can try it in the OpenKnowledge app (our OSS markdown IDE, available as Mac/Linux/Windows apps).Let us know what you think.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49335470) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
