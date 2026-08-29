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

## Tech Stack

- **Figma plugin:** TypeScript with the official Figma Plugin API, running in the Figma sandbox; talks to the inference service over HTTPS.
- **Inference service:** Python with FastAPI for the layout adaptation pipeline; the heavy work runs here because the Figma sandbox cannot host it.
- **Layout model:** a fine-tuned layout-adaptation model trained on paired desktop → tablet → mobile Figma frames; the model outputs the structural transformation rather than resized pixels.
- **Persistence:** PostgreSQL for the package ledger, design-system snapshots, and the per-frame quality-gate log; Redis for the package-job queue.
- **Design-system extractor:** a static-analysis pass on the source Figma file that identifies auto-layout constraints, component definitions, text-style tokens, and color tokens; the adaptation pipeline consumes this snapshot.
- **Billing:** Stripe with a per-package Payment Intent, no subscription; the plugin UI surfaces the price before the operator confirms.
- **Plugin distribution:** Figma Community plugin listing as the primary discovery surface; no separate marketing site in v1.

## Architecture

```
Figma (designer selects frames)
   │
   ▼
Figma Plugin (TypeScript)
   │  • reads selected frames
   │  • sends design-system snapshot + frame list
   │  • polls / long-polls for results
   ▼
Inference Service (Python, FastAPI)
   │
   ├──▶ design-system extractor
   │
   ├──▶ layout-adaptation model
   │       │
   │       └─▶ per-frame tablet/mobile variants
   │
   ├──▶ quality gate
   │       │  • auto-layout integrity check
   │       │  • component-detachment check
   │       │  • text-overflow check
   │       └─▶ if any check fails → re-generate
   │
   └──▶ design-system update pass
           │
           └─▶ mobile/tablet component variants + tokens
```

The plugin never runs the model itself. The plugin is the operator surface (frame selection, package confirmation, thumbnail review) and the delivery channel (it writes the new frames into the source Figma file on confirm). All inference, quality gating, and design-system analysis happens server-side.

## Milestones

1. **M0 — Plugin shell + frame reader.** Figma plugin that reads a selection, posts to the inference service, returns a placeholder. End of week 2.
2. **M1 — Layout adaptation MVP.** Single-frame desktop → tablet + mobile variants with a hand-coded adaptation pipeline (no model yet). End of week 5.
3. **M2 — Quality gate.** Auto-layout integrity, component-detachment, and text-overflow checks; failed screens re-generated within the same package. End of week 7.
4. **M3 — Package model.** 30–40 screens per package, batched inference, per-package pricing via Stripe. End of week 9.
5. **M4 — Design-system update pass.** The pass proposes mobile-and-tablet component variants and surface tokens; the operator accepts or rejects per item. End of week 12.
6. **M5 — Fine-tuned layout model.** Replace the hand-coded adaptation pipeline with a model trained on paired Figma frames, A/B-tested against M1's quality on a held-out set. End of week 18.
7. **M6 — Figma Community launch.** Public listing with a recorded demo, a sample package runnable in the listing, and a paid conversion funnel. End of week 22.

## Risks

- **Quality gate conservatism.** The hardest design decision is where to draw the "ship / don't ship" line. Too strict and the agent delivers 20 screens instead of 35, eroding the price-per-screen value. Too loose and the designer pays €30 for a package they have to redo. The gate must be tuned on real designer feedback in a closed beta before public launch.
- **Pay-per-result unit economics.** At €20–30 per package, the inference cost is the dominant variable. GPU cost per frame must drop below €0.50 at the bottom of the price band, or the lower tier is a loss-leader. M1 must publish the per-frame cost before M3 fixes the price.
- **Figma Plugin API limits.** The Figma sandbox cannot make arbitrary network calls during certain operations, and large result sets have to be paged. The plugin's IPC layer must be designed for partial-result delivery so the designer can review the first 10 screens while the next 20 are still being generated.
- **Design-system update pass overreach.** Proposing mobile-and-tablet component variants can be helpful or can be a parallel system that drifts. The pass must be conservative: propose only where the source system has no equivalent, and never silently overwrite an existing token.
- **Single-channel distribution.** The Figma Community plugin listing is the only organic discovery channel in v1. If Figma downranks the listing or the listing search terms drift, installs drop without a recovery channel. A waitlist + a "share this plugin" link in the deliverable can soften but not replace the listing dependency.
