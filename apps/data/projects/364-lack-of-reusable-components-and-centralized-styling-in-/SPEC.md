---
id: "364"
slug: lack-of-reusable-components-and-centralized-styling-in-
title: Lack of reusable components and centralized styling in Tilda
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/91cnbgco21-lack-of-reusable-components-and-centrali"
category: dev
date: "2025-10-29"
tags: [Dev, No-Code, Design]
country: Russia
tech: [Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit, Component library in Web Components, Storybook]
---
# Lack of reusable components and centralized styling in Tilda

## Problem

A Russian-speaking designer / developer building on Tilda faces a real limitation: Tilda blocks are flexible but there is no first-class component system and no centralized styling. Sections look similar but not identical across pages, and a small rebrand becomes a find-and-replace across the entire publication. The poster wants a Tilda-compatible component layer with centralized styling - without losing Tilda's editing experience.

## Objective

Ship a component and styling layer for Tilda publications that introduces versioned reusable components and centralized design tokens, with a migration path from existing Tilda projects and a continued Tilda editor experience for non-component content.

## Target Users

- Russian-speaking designers and developers working on Tilda publications that need design-system discipline.
- Russian digital agencies serving 5-20 Tilda projects who want one component library, not 20.
- Russian in-house marketing teams running multi-brand Tilda portfolios (Tilda supports multi-project workflows).

## MVP Scope

- Component library: header, footer, CTA, card, pricing, FAQ, testimonial, news-card, written as Web Components compatible with Tilda Zero Blocks.
- Centralized design tokens: color, typography, spacing, radius - exported as CSS variables and as Tilda class hooks.
- Migration tool: scan a Tilda project, identify candidate blocks, propose a swap to a component.
- Storybook view of the component library, with RU copy tokens.
- Compatibility mode: Tilda editor continues to edit non-component pages; component sections are managed by the library.
- No public Tilda API guarantees; the migration tool works with exported HTML/CSS as a baseline.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/dev/91cnbgco21-lack-of-reusable-components-and-centra` follows the constraints in `364-.../SPEC.md` and the chosen stack (Tilda Zero Blocks API + custom JS, Postgres, Static-site rebuild via Vite + Lit). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Component library versioned in npm-style semver; breaking changes are documented in release notes.
- All component customisations available via documented CSS variables; magic numbers in the markup are not allowed.
- Tilda publication continues to be edited in the Tilda editor for everything that is not a component section.
