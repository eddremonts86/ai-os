---
id: "748"
slug: a-designer-needs-an-ai-agent-to-eliminate-the-manual-dr
title: A designer needs an AI agent to eliminate the manual drudgery of adapting designs for mobile/tablet. Willing to pay €20–30 per project.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/design/j8ay8xay71-a-designer-needs-an-ai-agent-to-eliminat"
  captured: "2026-04-20"
category: design
date: "2026-04-20"
tags: [Design, AI, Productivity, Other]
country: Estonia
wtp:
  raw: "€20–30 per package of 30–40 screens (pay-per-result, multiple packages per month)"
  currency: EUR
  min: 20
  max: 30
  period: one-shot
  mrrMid: 100
tech: [TypeScript, Figma plugin API, Python, PostgreSQL, Stripe]
---
# A designer needs an AI agent to eliminate the manual drudgery of adapting designs for mobile/tablet.

## Problem

Emma is a freelance designer in Estonia who builds Figma layouts for SaaS clients. The work she enjoys is the desktop composition; what she dreads is adapting each desktop layout to tablet and mobile. For large projects, that adaptation is "many hours" of mechanical rearrangement she has been doing manually for 5–6 years. She has tried the obvious Figma plugins: Make It Responsive (auto-layout breaks, elements fall apart), Responify (so much manual setup it does not save time), and a long tail of others that either work only on very simple layouts or are buggy. She has also tried auto-responsiveness in website builders, but those are not the deliverable — she ships Figma files to engineers. The ask is for an agent that takes a finished desktop Figma layout and produces production-ready tablet and mobile adaptations with no manual setup, several times a month. She states willingness to pay €20–30 per package of 30–40 successfully generated screens, explicitly preferring a pay-per-result model over a subscription with "a hundred extra features." She also wants the agent to update or generate the mobile-and-tablet portion of the design system, not just resize screens.

The implicit problem Emma is naming is that the desktop-to-mobile adaptation is a well-defined mechanical transformation that current Figma plugins botch, and that the market has no agent-grade solution that ships clean production-ready output without a human babysitting every screen.

## Objective

Ship a Figma-native AI agent that takes a finished desktop layout and produces 30–40 tablet-and-mobile adaptations per package at a quality that Emma would not have to redo. Pricing is pay-per-package at €20–30, with multiple packages per typical month — explicitly not a subscription.

## Target Users

- Primary: freelance Figma designers (Emma's exact profile) who ship SaaS layouts and currently spend multiple hours per project on tablet/mobile adaptation. Worth €20–30 per package for output that does not need a redo.
- Secondary: in-house designers at SaaS companies whose roadmap releases faster than the responsive layer can keep up.
- Tertiary: design studios and agencies that want to absorb responsive adaptation without billing the client for the hours, freeing senior designers for higher-leverage work.

## MVP Scope

- A Figma plugin (TypeScript, Figma Plugin API) that receives a desktop frame selection and produces tablet + mobile variants without requiring manual setup beyond the initial selection.
- A design-system-aware adaptation pipeline that reads auto-layout constraints, text resizing rules, and component re-use from the source file rather than resizing pixels.
- A package model: the agent delivers 30–40 screens per package; the operator pays per package, not per screen, and not per month.
- A quality gate that rejects any output where auto-layout breaks, components are detached, or text overflows; failed screens are re-generated rather than shipped.
- A review surface where the designer can flip through the generated screens, mark the ones that need a redo, and the agent re-runs only those.
- A design-system update pass: for each adapted variant, the system also proposes mobile-and-tablet component variants and surface tokens where the source design system lacks them.

## Design Direction

See `DESIGN.md` for this project's design tokens. The plugin UI lives inside Figma: a small panel with a "Run" button, a progress indicator per screen, and a thumbnail grid of results. The marketing surface is sparse — the product is bought on Figma community / word-of-mouth / direct outreach to design studios, not on a polished site.

## Constraints

- Emma's pricing model is explicit: €20–30 per package of 30–40 screens, no subscription. The unit economics have to close at that price, which means the inference cost per package is constrained and the agent must batch hard.
- The output must be production-ready. "Auto-layout breaks" and "elements fall apart" are named as the failure modes of existing plugins. A single broken frame in a delivered package is enough to lose the designer permanently.
- The agent must respect the source file's design system. Adapting a frame without updating the system tokens creates a parallel system that drifts; the design-system update pass is in scope for v1.
- The pay-per-result model means the operator carries the risk of bad output. The quality gate must be conservative: ship fewer screens in a package before charging, rather than ship a broken package and refund.
- The plugin must work inside Figma's Plugin API limits (sandbox, no external network from inside plugin code); the inference layer must run on the service side, not inside the plugin runtime.
