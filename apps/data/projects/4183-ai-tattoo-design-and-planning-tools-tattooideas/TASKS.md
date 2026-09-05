---
id: "4183"
slug: ai-tattoo-design-and-planning-tools-tattooideas
title: AI Tattoo Design and Planning Tools – TattooIdeas
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509984"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# AI Tattoo Design and Planning Tools – TattooIdeas

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4183-ai-tattoo-design-and-planning-tools-tattooideas/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the web app shell at tattooideas.app with the six-tool navigation (AI Tattoo Generator, Tattoo Font Generator, Image to Tattoo Converter, AI Tattoo Stencil Generator, AI Tattoo Cover Up Generator, Virtual Tattoo Try-On Online), the sign-in flow that grants two free AI designs, and the design history and downloads entry.
- [ ] Implement the AI Tattoo Generator: the prompt surface (memory, symbol, story), the style picker (fine line, blackwork, realism, Japanese, minimalist, floral, geometric, and others), the body-part picker, and the two-free-designs flow after sign-in.
- [ ] Implement the Tattoo Font Generator: the text input, the 18-style picker, the lettering adjustment surface, the free PNG download.
- [ ] Implement the Image to Tattoo Converter: the upload, the style picker, the body-part picker, the side-by-side comparison of the original and the tattoo conversion.
- [ ] Implement the AI Tattoo Stencil Generator: the upload of a tattoo photo, sketch, or finished design, the adjustable detail and line-weight surface, the faithful black-and-white stencil output.
- [ ] Implement the AI Tattoo Cover Up Generator: the upload of an old tattoo photo, the four free AI cover-up directions, the 4-credit private preview.
- [ ] Implement the Virtual Tattoo Try-On Online: the male and female body templates, the depth-aware contouring, the placement adjustment (size, position, rotation, opacity), the instant placement download.
- [ ] Wire the credit ledger with the three packs (Starter $9.90 / 200 credits / 50 generations, Creator $19.90 / 480 credits / 120 generations, Studio $29.90 / 800 credits / 200 generations), no subscription, no recurring charge, credits never expire; integrate the Waffo checkout with tax calculated and added.
- [ ] Add the artist-communication scope statement in the FAQ and on every tool's output footer (AI output is a concept and communication reference, not a finished, tattoo-ready design; the artist adapts the final linework, size, and placement).
- [ ] Run an end-to-end test: a wearer signs in, gets two free AI designs from the AI Tattoo Generator, picks a style and body part, generates the concepts, exports the artist-ready bundle (style direction + placement preview + stencil); the credit ledger debits the credits on each generation; the Waffo checkout completes the pack purchase with tax.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish the credit-pack pricing surface at tattooideas.app/pricing with the three tiers and the Waffo checkout
- [ ] Document the artist-communication scope statement on the FAQ and on every tool's output footer
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
