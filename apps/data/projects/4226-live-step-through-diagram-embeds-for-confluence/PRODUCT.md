---
id: "4226"
slug: live-step-through-diagram-embeds-for-confluence
title: "Live, step-through diagram embeds for Confluence"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49506940"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Live, step-through diagram embeds for Confluence

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Flostep embeds a live step-through diagram in Confluence (and Notion), so when the process changes the diagram on the wiki page changes too — no re-export, no re-upload, no stale "how we do this" doc quietly lying to its readers.


## Target Users

Technical writers, process owners, and operations teams whose wiki pages embed a "how we do this" diagram and who have lost trust in a stale picture. Assumes the reader is comfortable embedding a diagram in Confluence and editing the underlying flow when the process changes.

## Jobs To Be Done

- When I write a "how we do this" doc, I want a step-through diagram so a reader walks the process, not a static image.
- When the process changes, I want the embedded diagram to update so I do not have to re-export and re-upload.
- When a viewer reads the doc, I want Back / Next controls so they move at their own pace.


## Success Metrics

- Number of embeds in production Confluence pages.
- Latency from a flow change to a refreshed embed.
- Average session length on an embedded diagram (proxy for engagement).


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes other diagram tools (Mermaid, draw.io, Excalidraw) and Confluence macro products. The captured source post positions Flostep around the step-through canvas and the live embed, but does not enumerate specific competitors by name.


## Risks & Open Questions

- "Updates without re-export" is a load-bearing claim; if the embed is cached or stale, the product loses its reason to exist.
- Confluence's embed model has quirks; the integration has to handle permission changes, page moves, and embed removal.
