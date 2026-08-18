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

> Product brief authored from the source title and category. The poster's text was not available (source.name: manual); sections below re-state the problem and infer only what the title and category support.

## Value Proposition

A Russian designer working in Tilda gets a versioned component library and centralized design tokens, with a migration tool that proposes swaps on an existing project - and the Tilda editor stays the place the rest of the publication gets edited.

## Target Users

- Russian-speaking designers and developers working on Tilda publications that need design-system discipline.
- Russian digital agencies serving 5-20 Tilda projects who want one component library, not 20.
- Russian in-house marketing teams running multi-brand Tilda portfolios (Tilda supports multi-project workflows).

## Jobs To Be Done

1. **Functional job** - Stop rebuilding the same header on every new Tilda page.
2. **Emotional job** - Stop dreading a brand refresh that means fixing 30 pages.
3. **Social job** - Hand the design system to a new designer in a day, not a quarter.

## Success Metrics

- **Coverage:** >= 70% of a pilot Tilda project's page sections become library components within 30 days.
- **Brand refresh:** a token update cascades to all component sections with no per-page edits.
- **Designer onboarding:** a new designer publishes a coherent page in < 1 day using the library.

## Competitive Landscape

- **Manual Tilda blocks + custom CSS** - what designers do today; no version control on the design system.
- **Headless CMS + Vite rebuild** - capable but heavier; the poster wants Tilda to stay as the editor.
- **Framer / Webflow** - design-system-native; the poster is on Tilda, not migrating today.

## Risks & Open Questions

- See PLAN.md Risks for the technical / operational risks.
- [ ] Confirm pricing model and WTP signal in user interviews before MVP launch.
- [ ] Validate country-specific compliance (data, payments, content) before MVP launch.

---

_Source:_ ProblemHunt (manual capture) · **Category:** dev · **Tags:** Dev, No-Code, Design
