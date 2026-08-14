---
id: "435"
slug: welche-herausforderungen-hast-du-i-will-not-promote
title: Welche Herausforderungen hast Du? i will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vm6kpo/welche_herausforderungen_hast_du_i_will_not/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, Tailwind, Postgres, pgvector, Resend, Vercel]
---
# Welche Herausforderungen hast Du? i will not promote

## Problem

Source: https://www.reddit.com/r/startups/comments/1vm6kpo/welche_herausforderungen_hast_du_i_will_not/

Original post:

> Hallo, was sind wiederkehrende Herausforderungen oder auch einfach nur Zeitfresser, Kostentreiber, die Dich in Deiner täglichen Arbeit bremsen? Wenn Du drei Wünsche frei hättest, welche Barrieren würdest Du wegzaubern lassen? Ich möchte gerne technische Lösungen entwickeln, die den Arbeitsalltag verbessern. submitted by /u/TheTesla42 [link] [comments]

---

What this plan addresses: Bilingual (German-first) workplace pain-point intake that ranks and dedupes recurring friction for technical solutions.

## Objective

A workplace pain-point intake that ranks and dedupes so the same friction does not get reported 12 different ways. When I am asked to "build three wishes," I want a structured intake so the wishes are comparable across teams, so developers pick the friction that is actually most common.

## Target Users

- German-speaking employees and team leads who repeatedly hit the same workflow friction
- Internal-tools developers looking for demand signals
- Team leads doing process audits

## MVP Scope

- 5-field intake (role, pain point, frequency, current workaround, time lost per week)
- German + English UI with translation toggle
- Public ranked feed sorted by time lost per week
- Weekly digest by email

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vm6kpo/welche_herausforderungen_hast` follows the constraints in `435-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Tailwind). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body is in German; plan respects bilingual UI
- No market size or industry specifics stated
- Plan does not invent a German-only market cap
