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

## Problem

Hi HN, Nick here, founder at OpenKnowledge. We built an open source library, Visimer, for editing Mermaid diagrams with a what-you-see-is-what-you-get visual editor. Try the playground at https://visimer.com/playground. You can rename labels, change shapes, add new nodes, etc. by clicking and dragging the visual canvas.We set out to build this originally for OpenKnowledge, our markdown wysiwyg editor, then realized it’d be great to share it as a proper embeddable component library so that other apps can leverage it as well.Our general take is that AI is great for generating content, but whenever you want to tweak fine details, for example to create an artifact sharable with others, point-edit functionality is much better. We built Visimer to bring that to Mermaid diagrams, just like we did for markdown.Some technical bits:- Leverages the native Mermaid.js renderer for visualizing the Mermaid diagram true to how it’s intended. We add point-edit functionality on top.- We tried re-generating the entire file on every edit, but found that it would eat comments and formatting, etc. The final approach maps the rendered SVG elements back to a CST, so we can then edit only the parts of the file that should change.You can pair the visual editor with any text-editor so you can have both visual and code-level editor experiences. The library provides bindings for Monaco and CodeMirror and is extensible. There's also a low-level headless version.If you just care about being able to edit your Mermaid diagrams in your markdown, you can try it in the OpenKnowledge app (our OSS markdown IDE, available as Mac/Linux/Windows apps).Let us know what you think.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
