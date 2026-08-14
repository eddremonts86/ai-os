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

> Auto-enriched product brief.

## Value Proposition

A flowchart-first feature spec editor that ties each node of a Mermaid diagram to a section of the spec, so the spec stays in sync with the diagram.

## Target Users

- Solo founders and indie devs who find text feature specs hard to maintain
- Small product teams of 2-4 who keep specs in Notion / Google Docs and lose them
- Technical co-founders trying to communicate UI flow to non-technical co-founders

## Jobs To Be Done

When I am spec-ing a feature, I want a flowchart that doubles as the spec, so I do not write the spec in one place and the diagram in another.

## Success Metrics

- At least 200 specs drafted in 90 days
- Median time-to-shareable-spec below 30 minutes

## Pricing & Monetization

Pricing & Monetization is intentionally left as TODO in this plan because the source post at `https://www.reddit.com/r/SaaS/comments/1vo051p/i_stopped_writing_feature_specs_a` did not name a price, a billing model, or a comparable benchmark. Forcing a price here would invent a claim the poster never made. The pricing decision lives in a separate product memo once the MVP is shipped and a real user from the country stated in the source has validated the value of the task it removes.

## Competitive Landscape

Whimsical, Excalidraw, and various Mermaid editors exist; not named. Plan is a feature-spec-specific wedge.

## Risks & Open Questions

- Diagram drift if nodes are renamed; auto-link by stable ID, not label
- Large diagrams become unreadable; per-spec node cap
