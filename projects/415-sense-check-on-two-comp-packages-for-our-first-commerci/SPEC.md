---
id: "415"
slug: sense-check-on-two-comp-packages-for-our-first-commerci
title: Sense check on two comp packages for our first commercial hire - equity vs cash split - I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vnj580/sense_check_on_two_comp_packages_for_our_first/"
category: startups
date: "2026-08-13"
---
# Sense check on two comp packages for our first commercial hire - equity vs cash split - I will not promote

## Problem

The poster runs a small B2B services company with two founders. They are bringing on their first senior commercial hire on a formal package. The candidate has 25 years in the space, has been working with the founders informally already, and they want to keep him. His stated floor is £100k. They can't fund that yet. They've got one contract landing shortly and a larger one in the pipeline, but nothing collected at the scale that would support that salary. He said he's down for equity, but he has a mortgage and kids so they have to support him. Two options: Option 1 £4k/month base, stepping to £6k at £150k cumulative revenue, plus equity. Option 2 lower base, more equity. The poster is asking for a sense check. Country: UK (£). No ARR, no revenue was stated.

## Objective

Give a small B2B founder who is bringing on their first senior commercial hire a named-trade-off framework for the equity-vs-cash split, with the named thresholds for stepping the base, the named equity grant shape, and the named vesting. The job is not to make the call — it is to give the founder a named framework to defend the call to the candidate and to the co-founder.

## Target Users

Primary: a small B2B founder (UK, 2-3 founders) who is bringing on their first senior commercial hire and wants the named trade-off framework for the equity-vs-cash split. Secondary: a chief of staff or operations lead at the same kind of company who is being asked to model the comp and wants the named thresholds in front of them.

## MVP Scope

In scope for v1:

- A 'first senior commercial hire' framework: the named thresholds for the base, the step-up, the equity grant, the vesting, the cliff.
- A 'two options side-by-side' sketch: Option 1 (lower base, more equity, faster step-up at revenue) vs. Option 2 (higher base, less equity, slower step-up). With the named trade-off of each.
- A 'before you sign' checklist: the named preconditions (mortgage support, kids support, named exit, named vesting acceleration).
- A one-page export the founder can drop into a Notion doc or a contract note.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vnj580/sense_check_on_two_comp_packa` follows the constraints in `415-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a question, not a feature request — the deliverable is a framework, not a product.
- Country: UK (£). The MVP must respect the currency, the mortgage structure, and the UK employment law on equity, not assume USD.
- The output must not invent a compensation number — name the named ranges from the post and let the founder fill in the specifics.
