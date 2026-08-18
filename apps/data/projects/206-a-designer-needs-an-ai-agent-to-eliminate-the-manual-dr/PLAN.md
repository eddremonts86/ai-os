---
id: "206"
slug: a-designer-needs-an-ai-agent-to-eliminate-the-manual-dr
title: A designer needs an AI agent to eliminate the manual drudgery of adapting designs for mobile and tablet breakpoints.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: design
date: "2026-04-20"
tags: [Design, AI, Productivity]
country: Estonia
tech: [Figma Plugin API, TypeScript, Anthropic Claude API, PostgreSQL, Next.js]
---
# A designer needs an AI agent to eliminate the manual drudgery of adapting designs for mobile and tablet breakpoints.

## Tech Stack

Figma Plugin API in TypeScript for the in-canvas experience. Anthropic Claude API for the per-section decision making. PostgreSQL for the design-system cache and rule store. Next.js for the designer's settings dashboard and billing.

## Architecture

Plugin reads document → extracts components, tokens, and existing variants → ships a system context to the model → model returns per-section settings for mobile and tablet → plugin renders sibling frames in the same file. Settings stored locally so re-runs are deterministic.

## Milestones

M0 — read a design system and produce one mobile variant for a sample frame. M1 — designer settings per section. M2 — tablet variant. M3 — 20 design teams in private beta. M4 — public launch in the Figma community marketplace.

## Risks

Figma's plugin API changes are common and can break the integration. Large design systems take a long time to ingest. Designers may reject the work if it doesn't match the style they imagined for that specific breakpoint.

## Data Model

## Integrations

Figma Plugin API in TypeScript for the in-canvas experience. Anthropic Claude API for the per-section decision making. PostgreSQL for the design-system cache and rule store. Next.js for the designer's settings dashboard and billing.
