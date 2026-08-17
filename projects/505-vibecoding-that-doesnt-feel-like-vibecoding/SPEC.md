---
id: "505"
slug: vibecoding-that-doesnt-feel-like-vibecoding
title: "Vibecoding that doesn't feel like vibecoding!"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnym0y/vibecoding_that_doesnt_feel_like_vibecoding/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Node.js, Pyodide, PostgreSQL, Stripe, Resend, Vercel]
---
# Vibecoding that doesn't feel like vibecoding!

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vnym0y/vibecoding_that_doesnt_feel_like_vibecoding/

Original post:

> Hello! I’ve been developing PySpec, a tool for vibe coders to structure their ideas in pseudo language instead of mass prompting. Users can generate a YAML spec and receive a zip containing markdown, functions, dataclass, and test functions scripts to then be plugged into a coding agent for more efficient and robust context. I also took the liberty of fiddling with some JS to be Windows-95 themed so vibe coding doesn’t just feel like prompting and waiting. You can find the web app here, repo here, and demo vid here! Thanks so much! submitted by /u/tjpark25 [link] [comments]

---

What this plan addresses: PySpec: a vibecoding tool that does not feel like vibecoding, with structured spec-first generation.

## Objective

PySpec: a spec-first vibecoding tool that generates code from a structured spec, with inline annotations and diff view, designed to feel less like "vibe coding." When I am using AI to write code and want it to feel less like "vibecoding," I want a tool that takes a spec and produces code with inline annotations, so I can review what the model did.

## Target Users

- Developers who want AI-generated code without the "vibe" feel
- Solo founders using AI to build features who want more rigour
- Engineering teams experimenting with AI-assisted coding

## MVP Scope

- Spec-first flow: input a spec, get code
- Inline spec annotations in generated code
- Diff view for spec changes
- No auto-deploy in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnym0y/vibecoding_that_doesnt_fee` follows the constraints in `505-.../SPEC.md` and the chosen stack (TypeScript, Node.js, Pyodide). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes PySpec as "vibecoding that doesn't feel like vibecoding"
- Plan keeps the spec-first framing
- Source did not name a price
