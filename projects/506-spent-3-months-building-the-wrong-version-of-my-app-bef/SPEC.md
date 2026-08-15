---
id: "506"
slug: spent-3-months-building-the-wrong-version-of-my-app-bef
title: Spent 3 months building the wrong version of my app before realizing the actual insight
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnybs6/spent_3_months_building_the_wrong_version_of_my/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# Spent 3 months building the wrong version of my app before realizing the actual insight

## Problem

Source: [reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…]([reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vnybs6/spent_3_months_building_the_wrong_version_of_my/)))))))

Original post:

> When I started building Scholia (an AI reading companion that photographs a book page and asks questions about it), my first instinct was to make it work like every other book-AI tool: answer anything about the book, any time, like a search engine for the text. Tested it on a few people and the feedback was oddly negative, even when the answers were accurate. Took a while to figure out why: people don't want a search engine for their book; they want a companion that respects where they actually are in the story. The second someone got an answer that referenced something 100 pages ahead, they felt like the "magic" of reading was ruined, even if the answer itself was technically helpful. So I rebuilt the core logic around a much harder constraint: it has to know exactly where you are (using the actual sentences on the page, not a page number, since editions differ) and refuse to answer anything past that point. Went from "smart search" to something closer to a reading companion that holds a boundary. Felt like a downgrade in capability on paper, tested infinitely better in practice. Small lesson but one I didn't expect: the feature that makes a product feel trustworthy is often the thing it refuses to do, not the thing it can do. Join the waitlist, we'll be choosing people from here to be testers: scholia.cloud Anyone else build the "more capable" version first and have to strip it back before it actually worked? submitted by /u/No-Candle-2698 [link] [comments]

---

What this plan addresses: A pre-build "wrong-version detector" that helps founders figure out what the actual user problem is before coding.

## Objective

A pre-build "wrong-version detector" that helps founders figure out what the actual user problem is before coding, with a restart playbook. When I am about to build (or rebuild) my app, I want a pre-build detector that surfaces hidden assumptions, so I do not spend 3 months building the wrong version again.

## Target Users

- Solo founders who built the wrong version of their app
- First-time founders with a finished MVP that no one uses
- Indie hackers iterating on a side project that stalled

## MVP Scope

- Pre-build questionnaire that surfaces hidden assumptions
- "What you actually built vs. what they wanted" comparison
- Restart playbook based on the answers
- No auto-rebuild in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnybs6/spent_3_months_building_th` follows the constraints in `506-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says the poster "spent 3 months building the wrong version of my app before realizing the actual problem"
- Plan is the implied pre-build detector
- Source did not name a product or restart path
