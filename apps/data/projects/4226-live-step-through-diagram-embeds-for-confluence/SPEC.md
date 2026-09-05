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

## Problem

Flostep (flostep.dev/blog/documentation-diagrams-already-out-of-date) is a step-through diagram builder with a Confluence embed. The post's framing: documentation diagrams go stale the moment the process changes, but the picture on the wiki page does not, so the "how we do this" doc quietly lies to anyone who trusts it. Flostep's answer is a step-through canvas (Back / Next controls that walk viewers through a flow one step at a time) and a Confluence embed that updates when the underlying flow does, so the doc and the diagram stay in lock-step without re-export or re-upload.


---

## Objective

Ship a step-through diagram tool with a Confluence embed, so a process diagram in a wiki page stays in lock-step with the process it describes without a manual re-export.


## Target Users

Technical writers, process owners, and operations teams whose wiki pages embed a "how we do this" diagram and who have lost trust in a stale picture. Assumes the reader is comfortable embedding a diagram in Confluence and editing the underlying flow when the process changes.


## MVP Scope

- A step-through canvas where the designer defines steps, decisions, and handoffs.
- Back / Next controls that walk a viewer through the flow one step at a time.
- A Confluence embed that renders the live diagram from the Flostep URL.
- An update story: when the flow changes, the embedded diagram reflects it without a re-upload.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the product is presented as a public Confluence embed.
- Confluence is the primary embed target; Notion is named as the second.
- "Step-through" is the headline affordance; a static image does not satisfy the promise.
