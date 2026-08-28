---
id: "458"
slug: i-dont-know-why-i-still-have-0-tenants
title: "I don't know why I still have 0 tenants"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnvx5c/i_dont_know_why_i_still_have_0_tenants/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Google Ads API, Resend, Vercel]
---
# I don't know why I still have 0 tenants

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vnvx5c/i_dont_know_why_i_still_have_0_tenants/

Original post:

> I built a SaaS booking system for salons and barbershops. However, after using Ahrefs and running Google Ads for a month, I still have zero customers. My pricing is intentionally low as an introductory offer, and the system is fully packed with features. Does anyone have tips on how I should market this or pivot my strategy? Any help or advice is highly appreciated. Thanks! submitted by /u/Background-Pay5502 [link] [comments]

---

What this plan addresses: A salon / barbershop booking SaaS with a built-in local-SEO and Google Ads playbook for solo operators.

## Objective

A salon / barbershop booking SaaS that bundles a local-SEO and Google Ads playbook so the operator does not have to learn both separately. When I have a salon / barbershop and need a booking system that also brings in customers, I want a SaaS with a built-in local-SEO and Google Ads playbook, so I stop running Ahrefs and Ads in parallel without knowing what to fix.

## Target Users

- Solo salon / barbershop owners running their own booking
- New salon / barbershop owners launching without a marketing budget
- Local-service owners who have tried Ahrefs / Google Ads without results

## MVP Scope

- Booking SaaS with low introductory pricing
- Built-in local-SEO checklist (Google Business Profile, citations)
- Google Ads playbook with named keywords + budget recommendations
- No "AI receptionist" in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnvx5c/i_dont_know_why_i_still_have_0_te` follows the constraints in `458-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says the poster built a SaaS booking system for salons and barbershops, ran Ahrefs + Google Ads for a month, has 0 customers
- Plan reframes the booking system with a local-SEO + Ads playbook bundled in
- Source did not name a country or city
