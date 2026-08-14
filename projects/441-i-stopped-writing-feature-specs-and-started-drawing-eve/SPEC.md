---
id: "441"
slug: i-stopped-writing-feature-specs-and-started-drawing-eve
title: I stopped writing feature specs and started drawing every feature as a flowchart first. Way less wasted code.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo051p/i_stopped_writing_feature_specs_and_started/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, Mermaid.js, PostgreSQL, Resend, Vercel]
---
# I stopped writing feature specs and started drawing every feature as a flowchart first. Way less wasted code.

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vo051p/i_stopped_writing_feature_specs_and_started/

Original post:

> Solo founder, mostly self-taught. My biggest money leak in year one wasn't tools or ads, it was building features that made perfect sense in my head and fell apart the second a real user touched them. What changed: before I build anything now, I map the whole flow in a free flowchart maker. Every screen, every branch, what happens when the user has no data yet, what happens when they cancel, where they can get stuck. Boxes and arrows, thirty minutes. Sounds trivial, but drawing it exposes the holes before I've written a line. Half the time I find a branch I never would have handled, and a couple of times the flowchart made it obvious the feature wasn't worth building at all, which saved me a week each time. It also doubles as documentation when I come back to that code three months later and have completely forgotten how it works. Curious how others plan before building. Do you spec in writing, diagram it, or just start coding and refactor later? What's actually cut down your wasted work? submitted by /u/Key-Scallion7406 [link] [comments]

---

What this plan addresses: A flowchart-first feature spec editor for solo founders, replacing wall-of-text feature docs with executable diagrams.

## Objective

A flowchart-first feature spec editor that ties each node of a Mermaid diagram to a section of the spec, so the spec stays in sync with the diagram. When I am spec-ing a feature, I want a flowchart that doubles as the spec, so I do not write the spec in one place and the diagram in another.

## Target Users

- Solo founders and indie devs who find text feature specs hard to maintain
- Small product teams of 2-4 who keep specs in Notion / Google Docs and lose them
- Technical co-founders trying to communicate UI flow to non-technical co-founders

## MVP Scope

- Editor with a Mermaid canvas and a Markdown side panel
- Each node in the flowchart maps to a section of the spec
- Versioned snapshots with diff view
- Public share link with read-only mode

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vo051p/i_stopped_writing_feature_specs_a` follows the constraints in `441-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Mermaid.js). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source says the poster "stopped writing feature specs and started drawing every feature as a flowchart"
- Plan turns that personal workflow into a public editor
- Source did not specify stack preferences or team size
