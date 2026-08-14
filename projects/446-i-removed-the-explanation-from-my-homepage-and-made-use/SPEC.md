---
id: "446"
slug: i-removed-the-explanation-from-my-homepage-and-made-use
title: I removed the explanation from my homepage and made users experience the product first
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnyy7x/i_removed_the_explanation_from_my_homepage_and/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Plausible, Vercel]
---
# I removed the explanation from my homepage and made users experience the product first

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vnyy7x/i_removed_the_explanation_from_my_homepage_and/

Original post:

> I’ve been wrestling with a homepage problem that I suspect applies to a lot of products. I was trying to explain an unusual product with increasingly good copy. The copy kept getting better and the homepage kept getting worse. Eventually I realized the problem: If the core value of the product can be experienced in ten seconds, explaining it first creates friction. So I changed the sequence from: THESIS → EXPLANATION → PRODUCT to: ACTION → RESULT → EXPLANATION My product is about human judgment, so the first screen now simply asks: HUMAN OR MACHINE? A visitor commits before learning anything else. Only afterward do I explain why I’m recording the answer. I’m curious whether other founders have found cases where removing explanation actually improved comprehension. For anyone who wants to see the implementation: buildsomething.co submitted by /u/jonathanfin [link] [comments]

---

What this plan addresses: A "show, don't tell" homepage pattern library: real product screenshots and a live demo gate above the fold, with no marketing copy.

## Objective

A "show, don't tell" homepage pattern library with editorial review, plus a self-serve template that strips the explanation and replaces it with a live demo. When I am writing a homepage and not sure what to put on it, I want a catalogue of patterns that lead with the product instead of explaining it, so I can stop guessing what to remove.

## Target Users

- Solo founders writing their first homepage and unsure what to put on it
- Marketing leads at small SaaS companies redesigning a stale homepage
- Designers looking for a homepage-pattern reference

## MVP Scope

- Public catalogue of "show-don't-tell" homepage patterns with screenshot + traffic data
- Editorial review of each pattern: what works, what does not, when to use it
- Self-serve "remix" template that strips the explanation and replaces it with a live demo
- No auto-A/B testing in MVP; traffic data is reported, not enforced

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnyy7x/i_removed_the_explanation_from_my` follows the constraints in `446-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says the poster "removed the explanation from my homepage and made users experience the product"
- Plan turns that single observation into a public catalogue + template
- Source did not name a niche or conversion-rate target
