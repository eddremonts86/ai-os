---
id: "206"
slug: a-designer-needs-an-ai-agent-to-eliminate-the-manual-dr
title: A designer needs an AI agent to eliminate the manual drudgery of adapting designs for mobile and tablet breakpoints.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: design
date: "2026-04-20"
tags: [Design, AI, Productivity]
country: Estonia
tech: [Figma Plugin API, TypeScript, Anthropic Claude API, PostgreSQL, Next.js]
---
# A designer needs an AI agent to eliminate the manual drudgery of adapting designs for mobile and tablet breakpoints.

## Problem

A designer in Estonia spends hours every week adapting a desktop Figma frame into mobile and tablet variants. The mechanic is mostly mechanical: collapse multi-column sections to single column, resize hero spacing, adjust font scales, swap a 4-up grid for a 2-up. The work is not creative — it is the same kind of decision the designer already made on the desktop version, applied to a smaller canvas.

Off-the-shelf responsive-design tools outside Figma (Anima, Builder.io, Figma's own 'auto layout' with constraints) cover the trivial case but ignore the design-language decisions: which sections can collapse, which must stay multi-column, where to keep the brand detail. None of them learn the designer's existing patterns and apply them consistently across a whole design system.

## Objective

A Figma plugin that, given a desktop frame and a designer's design system context, produces mobile and tablet variants that respect the designer's existing patterns, with a single review pass per variant rather than per component.

## Target Users

In-house designers at startups and agencies in Europe and the US whose teams maintain a Figma design system and ship a mobile or tablet product. Particularly those handling marketing sites, B2B SaaS, and ecommerce.

## MVP Scope

Figma plugin reading the active document and the design system library. Variant generation for a single screen-to-screenflow, mobile portrait first, tablet portrait second. Settings per section: collapse-to-stack, hide, scale-down, keep-multi-column. Review-and-approve UI per variant. Output: a sibling frame in the same file. No code export in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `206-.../SPEC.md` and the chosen stack (Figma Plugin API, TypeScript, Anthropic Claude API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Estonia.

For Estonia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must run inside the Figma plugin sandbox (no outbound network for raw design data). Must not modify the original frame. Must respect the designer's existing components and tokens. Output must be regenerable from settings, not a black box.
