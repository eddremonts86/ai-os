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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Register the Figma plugin manifest, get it into the developer's local Figma desktop app, scaffold the plugin UI shell with frame selection and a "Run" button
- [ ] Provision the Python inference service (FastAPI + GPU node) and the Postgres ledger
- [ ] Hand-coded desktop → tablet → mobile adaptation pipeline (no model yet) producing structurally valid Figma frames
- [ ] Stripe account with a Payment Intent per package; the plugin UI surfaces the price before the operator confirms
- [ ] Per-frame inference cost instrumentation: every frame records its compute cost in cents so the unit-economics thesis can be checked weekly

## Phase 1: Core

- [ ] Design-system extractor: read auto-layout constraints, component definitions, text-style tokens, color tokens from the source file and pass the snapshot to the adaptation pipeline
- [ ] Layout-adaptation pipeline (hand-coded first): desktop frame → tablet frame → mobile frame, preserving auto-layout, components, and tokens
- [ ] Quality gate: auto-layout integrity, component-detachment, text-overflow checks; failed screens re-generated within the same package at no extra charge
- [ ] Package model: 30–40 screens per package, batched inference, the operator confirms package scope and price in the plugin before run
- [ ] Design-system update pass: for each package, propose mobile-and-tablet component variants and surface tokens where the source system lacks them; operator accepts or rejects per item, never overwrites
- [ ] Review surface: thumbnail grid in the plugin, mark-for-redo per screen, re-run only the flagged ones
- [ ] Figma file write-back: confirmed frames are written into the source file on operator confirm, with a design-system snapshot ID embedded for traceability
- [ ] End-to-end test: a designer selects 30 desktop frames, confirms a package, the inference service returns 30 valid tablet + 30 valid mobile frames, quality gate passes, file write-back succeeds, designer confirms the result without manual redo

## Phase 2: Deploy

- [ ] Publish the Figma Community plugin listing with a recorded demo and a sample package runnable in the listing
- [ ] Move Stripe to live mode and set the per-package Payment Intent to the published price
- [ ] Closed beta with 10 freelance designers across the EU; weekly cost-per-frame read-out and weekly refund-rate read-out
- [ ] Public launch post on Figma Community + a targeted outreach to design studios in the EU and the US
- [ ] Quarterly review of whether the €20–30 band is sustainable, and a published price update either way
