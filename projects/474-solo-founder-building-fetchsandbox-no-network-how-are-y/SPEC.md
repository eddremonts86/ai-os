---
id: "474"
slug: solo-founder-building-fetchsandbox-no-network-how-are-y
title: "Solo founder building FetchSandbox, no network. How are you actually getting VC intros?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vi2qdv/solo_founder_building_fetchsandbox_no_network_how/"
category: indiehackers
date: "2026-08-07"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# Solo founder building FetchSandbox, no network. How are you actually getting VC intros?

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vi2qdv/solo_founder_building_fetchsandbox_no_network_how/)))))))

Original post:

> solo founder building FetchSandbox at pre-seed, no co-founder, no warm network, and every guide just says "get warm intros" like that's easy when you're flying solo. coldest part isn't the outreach, it's watching deals move on relationships you simply don't have access to. cross-posting this here because I'm sure someone in this community has already been through exactly what I'm facing right now. if you've cracked it, I'd genuinely love to know what worked. also throwing this out there: looking for someone to review my pitch deck before I send it to VCs. happy to return the favor, review yours, give honest feedback, whatever's useful. dm me if you're open to it. submitted by /u/Common_Dream9420 [link] [comments]

---

What this plan addresses: A solo-founder-friendly VC directory with transparent warm-intro paths and explicit "no network" guidance.

## Objective

A solo-founder-friendly VC directory with transparent warm-intro paths and explicit "no network" guidance for every VC. When I am a solo founder at pre-seed with no VC network, I want a directory that tells me how to reach each VC without a warm intro, so I stop guessing whether cold outreach will work.

## Target Users

- Solo founders at pre-seed with no prior VC network
- First-time fundraisers who do not know how warm intros work
- Founders in niche geographies who feel excluded from SF/NYC networks

## MVP Scope

- VC database with stage focus, sector, geography, check size
- Warm-intro paths (who in your network likely knows them)
- "No network" guidance for each VC
- No auto-intro tool in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vi2qdv/solo_founder_building_fet` follows the constraints in `474-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions FetchSandbox and "no network, how are you actually getting VC intros?"
- Plan keeps the no-network guidance framing
- Source did not name a stage, sector, or target VC list
