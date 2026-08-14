---
id: "472"
slug: a-fiverr-animator-ghosted-us-so-we-made-this-product-an
title: "A Fiverr animator ghosted us, so we made this product animation with 3 prompts and one HTML file"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vi6u9i/a_fiverr_animator_ghosted_us_so_we_made_this/"
category: indiehackers
date: "2026-08-07"
tech: [Next.js, TypeScript, Anthropic API, Lottie, PostgreSQL, Resend, Vercel]
---
# A Fiverr animator ghosted us, so we made this product animation with 3 prompts and one HTML file

## Problem

Source: https://www.reddit.com/r/indiehackers/comments/1vi6u9i/a_fiverr_animator_ghosted_us_so_we_made_this/

Original post:

> We originally hired someone on Fiverr to create a product animation for bundle.social, the social media API we’ve been building for the past few years. Then they stopped replying. So instead of waiting, we tried building the first version ourselves. The video attached to this post was created from a self-contained HTML file in roughly 40 minutes, including a tea break. FYI, RECORDING IS A BIT WONKY BECAUSE I EXTRACTED IT FRAME BY FRAME The process was basically: We asked AI to break down the advertising styles of Apple, Solana and Revolut into actual rules: shot lengths, transitions, easing, text movement and end-frame timing. We used that document as the specification for a bundle.social animation. We slowed everything down, fixed the loop, and stopped the model from “improving” our product claims. The final result is a 35-second animation with six scenes. It borrows Solana’s fast text, Revolut’s movement and CTA structure, and Apple’s typography and long holds. Is it animator-level work? Not really. It got us about 70% of the way there. There’s no sound design, real footage, 3D, or that final layer of polish. But instead of giving an animator a mood board and saying “make it feel modern,” we can now give them a working reference with exact timing, copy, structure, and feeling. If you want to see the full process, including the actual prompts, what broke and where this method stops being useful, we wrote everything down here: https://bundle.social/blog/product-demo-animation-three-prompts Do you guys like it as an MVP? submitted by /u/bundlesocial [link] [comments]

---

What this plan addresses: A product-animation generator that turns a brief into a 30-second marketing animation in 40 minutes (bundle.social).

## Objective

A product-animation generator that turns a brief into a 30-second marketing animation in HTML, exportable as MP4. When I need a product demo animation and the animator has ghosted me, I want a tool that generates a 30-second animation from 3 prompts, so I do not miss the launch.

## Target Users

- Indie founders who need a product demo animation without hiring a freelancer
- Solo founders who have been ghosted by an animator
- Small SaaS teams producing launch assets on a deadline

## MVP Scope

- Brief intake (product, audience, vibe)
- AI generates 30-second animation with editable scenes
- Self-rendering HTML export
- No sound design or 3D in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vi6u9i/a_fiverr_animator_ghosted` follows the constraints in `472-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Anthropic API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes bundle.social and a 35-second animation made in 40 minutes from 3 prompts
- Plan keeps the prompt-to-HTML framing
- Source did not name a price
