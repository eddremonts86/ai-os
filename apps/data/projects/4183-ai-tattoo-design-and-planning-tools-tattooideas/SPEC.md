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

## Problem

Getting a tattoo starts with an idea — a memory, a symbol, a story — and ends with a tattoo artist who needs to redraw or adapt the final design for the wearer's body, placement, size, and the way the tattoo will age. The work in between is full of decisions the wearer is not equipped to make: does the composition fit the placement, is there too much detail for the intended size, which reference best communicates the direction to the artist? TattooIdeas is a web app that turns the idea into a custom AI tattoo concept, supports the wearer through focused tools for lettering, photos, stencils, cover-ups, and placement, and ships the references that best explain the wearer's preference to the artist.

The source is the TattooIdeas landing page (tattooideas.app). Six tools ship under one subscription-free credit model: AI Tattoo Generator, Tattoo Font Generator, Image to Tattoo Converter, AI Tattoo Stencil Generator, AI Tattoo Cover Up Generator, and Virtual Tattoo Try-On Online. The pricing is three one-time credit packs (no subscription, no recurring charge, credits never expire): Starter ($9.90, 200 credits, up to 50 AI tattoo generations), Creator ($19.90, 480 credits, up to 120 generations), Studio ($29.90, 800 credits, up to 200 generations). Two free AI designs after sign-in and a free virtual tattoo try-on are the entry points.

The source is explicit about scope. AI output is a concept and communication reference, not a replacement for a professional tattoo artist. The artist adapts the final linework, size, and placement to the wearer's body and the artist's technique. The platform's claim is that a useful tattoo design platform should support the real decision, not replace the artist.

The source names the actor (a wearer with a tattoo idea who needs to translate the idea into references an artist can execute), the pain (no focused tools for the decisions between idea and artist), and the missing thing (a platform that supports each decision with a dedicated tool and ships the references that communicate the wearer's preference). It does not name a specific artist community, a specific tattoo style market, or a specific artist network.

## Objective

Build the TattooIdeas web app: six focused tools (AI Tattoo Generator, Tattoo Font Generator, Image to Tattoo Converter, AI Tattoo Stencil Generator, AI Tattoo Cover Up Generator, Virtual Tattoo Try-On Online) that turn a tattoo idea into references a professional tattoo artist can execute, with a one-time credit-pack pricing model and two free AI designs after sign-in as the entry point.

## Target Users

- Wearers with a tattoo idea (a memory, a symbol, a story) who need focused tools to translate the idea into references an artist can execute.
- Tattoo artists who need clear communication references (a style direction, a placement preview, a stencil) rather than a finished tattoo-ready design.
- Wearers considering a cover-up who need to see four free AI cover-up directions and a private preview before committing to a session.
- Wearers who want to compare 18 tattoo font styles for a name, date, or short phrase and download a free PNG reference.
- Wearers who want a virtual try-on with depth-aware contouring on male and female body templates to compare placement before talking with an artist.

## MVP Scope

- A web app at tattooideas.app with six focused tools: AI Tattoo Generator, Tattoo Font Generator, Image to Tattoo Converter, AI Tattoo Stencil Generator, AI Tattoo Cover Up Generator, Virtual Tattoo Try-On Online.
- The AI Tattoo Generator: a prompt surface (memory, symbol, story), a style picker (fine line, blackwork, realism, Japanese, minimalist, floral, geometric, and others), a body-part picker, and the generation of two custom AI tattoo designs free after sign-in.
- The Tattoo Font Generator: a text input (name, date, short phrase), a style picker (18 tattoo font styles), a lettering adjustment surface, and the download of a free PNG reference.
- The Image to Tattoo Converter: an image upload (photo or drawing), a tattoo style picker, a body-part picker, and a comparison view (original vs tattoo conversion).
- The AI Tattoo Stencil Generator: a tattoo upload (photo, sketch, finished design), an adjustable detail and line-weight surface, and a faithful black-and-white stencil reference.
- The AI Tattoo Cover Up Generator: an upload of an old tattoo photo, four free AI cover-up directions, and a private preview for 4 credits.
- The Virtual Tattoo Try-On Online: a body-template picker (male, female), a tattoo upload, a depth-aware contouring surface, and an instant placement download.
- A pricing surface with three one-time credit packs: Starter ($9.90, 200 credits, up to 50 AI tattoo generations), Creator ($19.90, 480 credits, up to 120 generations), Studio ($29.90, 800 credits, up to 200 generations); no subscription, no recurring charge, credits never expire.
- A sign-in flow that grants two free AI designs and access to the free tattoo font generator and the free virtual tattoo try-on.
- A design history and downloads surface scoped per tier.
- An artist-communication scope statement: AI output is a concept and communication reference, not a finished, tattoo-ready design; the artist adapts the final linework, size, and placement.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Pricing is one-time credit packs, not a subscription. No recurring charge; credits never expire; the pricing surface is explicit.
- The Starter pack is $9.90 (200 credits, up to 50 AI tattoo generations); the Creator pack is $19.90 (480 credits, up to 120); the Studio pack is $29.90 (800 credits, up to 200). The plan does not invent a tier the source does not name.
- The sign-in flow grants two free AI designs, free access to the tattoo font generator, and free access to the virtual tattoo try-on. A free credit is the entry point; the credit packs are the upgrade path.
- AI output is a concept and communication reference. The platform does not claim the AI output is finished, tattoo-ready artwork; the artist adapts the final linework, size, and placement.
- The cover-up preview costs 4 credits. The four free cover-up directions are not a credit cost; the private preview is.
- The virtual try-on is depth-aware and uses built-in body templates. The preview is a placement comparison, not a prediction of a healed tattoo on the wearer's own skin.
- The image-to-tattoo conversion is a visual direction, not a finished stencil. The wearer uses it as a reference for discussion with the artist, not as a tattoo-ready file.
- The pricing surface is in USD; the source's checkout uses Waffo for tax calculation. The plan does not invent a non-USD tier.
