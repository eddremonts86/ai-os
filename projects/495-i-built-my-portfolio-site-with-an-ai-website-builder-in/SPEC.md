---
id: "495"
slug: i-built-my-portfolio-site-with-an-ai-website-builder-in
title: "I built my portfolio site with an AI website builder in an afternoon, here's what broke and what held up"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnzzuk/i_built_my_portfolio_site_with_an_ai_website/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, MDX, PostgreSQL, Resend, Vercel]
---
# I built my portfolio site with an AI website builder in an afternoon, here's what broke and what held up

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vnzzuk/i_built_my_portfolio_site_with_an_ai_website/

Original post:

> I'd been putting off making a proper portfolio site for literally a year, so I tried building the whole thing with an AI website builder in one afternoon to see how far it'd get me. What held up: - Layout and responsiveness were genuinely fine, looked good on mobile with zero effort from me - Getting from blank to hosted and live took maybe two hours - The image and section suggestions were a decent starting skeleton What broke or annoyed me: - The copy was generic filler I had to rewrite entirely - Any custom tweak outside the presets was a fight - It quietly added a bunch of bloat I had to trim for load speed Honest verdict: great for skipping the boring setup, not great if you have a specific vision. I spent the saved time on writing and polish instead of fighting CSS, which felt like the right trade. For those who've used these builders for a real project, did you stick with it or eventually move to hand-coding? Curious where the ceiling is. submitted by /u/Several_Function_129 [link] [comments]

---

What this plan addresses: A portfolio site builder for technical people, built in an afternoon with an AI builder, plus a "what worked / what didn't" review.

## Objective

A portfolio site builder that produces a focused, fast single-page portfolio from a one-page brief in an afternoon, with a "what worked / what didn't" review of the AI-builder process. When I have been putting off a portfolio site, I want a builder that takes a one-page brief and produces a focused site in an afternoon, so I stop procrastinating.

## Target Users

- Engineers / designers / researchers who have been putting off a portfolio
- Job seekers who want a focused, fast portfolio site
- Freelancers who need a quick "here is my work" page

## MVP Scope

- Single-page portfolio template
- AI-assisted content filling from a one-page brief
- Deploy to a subdomain in one click
- No CMS in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnzzuk/i_built_my_portfolio_site_` follows the constraints in `495-.../SPEC.md` and the chosen stack (Next.js, TypeScript, MDX). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions building a portfolio site with an AI builder in an afternoon
- Plan keeps the afternoon + AI-assisted framing
- Source did not name a price
