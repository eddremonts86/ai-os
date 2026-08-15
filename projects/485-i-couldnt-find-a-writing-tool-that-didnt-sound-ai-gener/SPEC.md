---
id: "485"
slug: i-couldnt-find-a-writing-tool-that-didnt-sound-ai-gener
title: "I couldn't find a writing tool that didn't sound AI-generated for GTM work, so I built my own and dogfooded it for 2 months"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vej4p9/i_couldnt_find_a_writing_tool_that_didnt_sound/"
category: indiehackers
date: "2026-08-03"
tech: [Next.js, TypeScript, Anthropic API, PostgreSQL, Stripe, Resend, Vercel]
---
# I couldn't find a writing tool that didn't sound AI-generated for GTM work, so I built my own and dogfooded it for 2 months

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vej4p9/i_couldnt_find_a_writing_tool_that_didnt_sound/)))))

Original post:

> GTM writing as a solo founder is where I kept losing time. Not drafting, but fixing. Every AI tool I tried would produce something that sounded fine on the surface but completely wrong in context. Cold emails that read like blog intros. Partner pitches that opened with "In today's fast-paced landscape." LinkedIn replies that sounded like they were written by someone who'd never closed a deal. I went looking for something with a curated corpus, configurable by GTM context. Nothing fit. So I built it inside RawReply and started running my own outbound, LinkedIn, and partner emails through it. Two months in, the biggest thing I learned: the problem isn't the model, it's the signal. Generic AI writes toward the average of the internet. GTM writing needs to write toward how buyers in a specific market actually think and respond. Once I started shaping the corpus around that, the output stopped needing so many fixes. Now building the curated corpus and custom GTM configuration layer properly before opening it up. Gating first access to GTM founders to pressure-test it on real use cases. hope am cooking something other will use it as well!!! submitted by /u/Common_Dream9420 [link] [comments]

---

What this plan addresses: A GTM-writing tool that does not sound AI-generated, with rubrics for "sounds human" and a citation rule.

## Objective

A GTM-writing tool that does not sound AI-generated, with a strict "sounds human" rubric and editor highlighting. When I am writing GTM copy and hate AI-flavored output, I want a tool with a strict "sounds human" rubric and editor highlighting, so I do not ship copy that reads as AI-generated.

## Target Users

- Solo founders writing GTM copy (landing pages, emails, decks)
- Marketing leads at small SaaS companies who hate AI-flavored copy
- Copywriters who want a structured "sounds human" rubric

## MVP Scope

- Brief intake (audience, message, channel)
- Draft generation with strict "sounds human" rubric
- Editor view highlighting AI-tells
- No auto-publish

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vej4p9/i_couldnt_find_a_writing_` follows the constraints in `485-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Anthropic API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says the poster couldn't find a writing tool that didn't sound AI-generated for GTM work
- Plan is the implied tool with a "sounds human" rubric
- Source did not name a price or channel
