---
id: "402"
slug: built-this-thing-called-dolly-would-love-if-some-of-you
title: "built this thing called dolly, would love if some of you tried it"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnml72/built_this_thing_called_dolly_would_love_if_some/"
category: saas
date: "2026-08-13"
---
# built this thing called dolly, would love if some of you tried it

## Problem

The poster has been doing AI video and image work for clients for about a year, mostly ads, and spent a lot of that time inside Higgsfield. The tools themselves were fine, but the billing side drove them crazy: credits went faster than the pricing page led them to expect, and they confirmed they were not the only one. They built Dolly as a general-purpose AI media generation tool — images, video, voice, music — using mostly the same underlying models everyone else has access to. The thing they actually care about is that a user can see what a generation costs before running it, and the credit math isn't a mystery. The post is a launch announcement, not a question. No country, no pricing, no metrics were stated.

## Objective

Give creative professionals who are tired of credit-based AI billing surprises a pricing-trustworthy media generation tool that surfaces the cost of every generation before the user spends the credit. The job is to remove the named failure mode (credit math is a mystery) without rebuilding the model layer.

## Target Users

Primary: a creative professional — agency producer, freelance video editor, ad creative, social media lead — who is using AI media tools (Higgsfield, Runway, Pika, Suno, ElevenLabs) and is tired of running out of credits mid-job. Secondary: a small agency owner who is buying credits for a team and wants to forecast the monthly bill.

## MVP Scope

In scope for v1:

- A pre-run cost preview: every generation shows the credit cost before the user clicks run, with the model's input parameters (length, resolution, voice, audio duration) on the same screen.
- A credit ledger: a running balance with the timestamp and the cost of every generation, exportable as CSV.
- A workflow wrapper: text-to-image, text-to-video, image-to-video, text-to-voice, text-to-music, all on the same credit math.
- A model-agnostic backend: the same user can route generations to whichever upstream provider (Runway, ElevenLabs, Suno, etc.) is the cheapest at the moment, without leaving the cost preview.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnml72/built_this_thing_called_dolly_wou` follows the constraints in `402-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a launch announcement, not a complaint — the deliverable is a product, not a diagnostic.
- No country, no revenue, no user count was stated; the MVP must work for any creative professional with a monthly credit budget.
- The credit math must be deterministic and auditable. The model's input parameters are the cost equation — no hidden multipliers.
