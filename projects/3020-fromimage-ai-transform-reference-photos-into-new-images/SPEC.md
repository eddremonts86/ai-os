---
id: "3020"
slug: fromimage-ai-transform-reference-photos-into-new-images
title: FromImage AI – Transform reference photos into new images with controllable edits
status: enriched
source:
  name: manual
  url: "https://betalist.com/startups/fromimage-ai?utm_campaign=startup-182635&amp;utm_medium=atom&amp;utm_source=newsfeed"
category: beta
date: "2026-08-18"
tags: [BetaList, Beta, Product]
---
# FromImage AI – Transform reference photos into new images with controllable edits

## Problem

FromImage AI lets you upload a reference image and generate new visuals that keep key elements while applying precise changes. Choose an image-to-image model, describe what to keep and what to modify, and iterate in controlled steps to refine results. You can also switch to text-to-image to create images from scratch. Pricing uses credits with subscriptions or one-time packs, and generations are watermark-free with automatic refunds on failures.

---

## Objective

The MVP delivers a creative-tool SaaS where a user uploads a reference image, picks an image-to-image model, and writes a structured prompt that says what to keep and what to change. The product then iterates: the user reviews the result, tightens the "keep" / "modify" instructions, and re-runs until the output matches intent. The brief explicitly mentions a fallback to text-to-image for images from scratch, credit-based pricing with subscriptions and one-time packs, no watermarks on paid generations, and automatic refunds when a generation fails. The first release ships with one image-to-image model and one text-to-image model so the iteration loop is the headline, not model breadth.

## Target Users

1. **Independent designers and illustrators** who already work from reference photos and want a tool that lets them say "keep this pose, change the lighting" without retouching software.
2. **Marketing and social-media creators** producing thumbnail and ad visuals who need a fast way to riff on a reference photo while keeping a brand element intact.
3. **E-commerce sellers** who need product photos in many lighting or background variants and would rather describe the change than stage a new shoot.
4. **Hobbyists and casual creators** who want watermark-free generations and a pay-as-you-go credit option without committing to a subscription.
5. **Agencies producing visual concepts** who iterate with clients and need predictable refunds on failed generations rather than charged-and-lost credits.

## MVP Scope

- A web app where a user uploads a reference image, writes a structured "keep / modify" prompt, picks an image-to-image model, and submits a generation.
- An iteration view that shows the source image, the latest generation, and a side-by-side diff so the user can decide what to tighten.
- A text-to-image tab that creates images from scratch using a separate model, since the brief explicitly says the user can switch modes.
- A credit system with subscriptions (monthly credit allowance) and one-time packs, surfaced in a pricing page with the per-generation cost in credits.
- A refund mechanism: a generation that fails server-side or returns a moderation-blocked result refunds the credit automatically and surfaces a clear message in the user's history.
- A watermark-free delivery: paid generations return an unwatermarked PNG, free or trial generations may carry a visible watermark to discourage abuse.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The MVP will not ship every image-to-image model on the market; one strong default is the headline, with model selection as a v1.5 expansion.
- The MVP will not allow training or fine-tuning a custom model on the user's uploads; the brief is about reference-based generation, not model ownership.
- The MVP will not host the model weights in-house; generation runs against third-party model APIs and a failure means a refund.
- The MVP will not include video, 3D, or animation outputs; image only.
- The MVP will not promise commercial-indemnity or ownership transfer on generated images; the brief says "watermark-free" and "refunds on failures", not "you own the output for any use".
