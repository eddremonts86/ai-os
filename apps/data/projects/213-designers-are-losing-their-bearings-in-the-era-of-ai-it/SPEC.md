---
id: "213"
slug: designers-are-losing-their-bearings-in-the-era-of-ai-it
title: "Designers are losing their bearings in the era of AI — it's unclear which direction to develop in, who reviews work, and how to keep the craft."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: design
date: "2026-03-16"
tags: [Design, AI, Community]
country: Russia
tech: [Next.js, PostgreSQL, Meilisearch, Python, FastAPI, Stripe]
---
# Designers are losing their bearings in the era of AI — it's unclear which direction to develop in, who reviews work, and how to keep the craft.

## Problem

Designers in Russia (and across Eastern Europe) report that every AI announcement adds a new skill they should learn, a new tool they should evaluate, and a new title they should consider. The pace is faster than any one person can absorb, and the places where designers used to learn — studios, peer communities, design schools — have not reorganised for this. What is missing is a structured, mentor-driven space where a designer can name the question they actually have (which direction to develop in next), publish a piece of work for serious review, and progress through a curated curriculum instead of an infinite feed of tutorials. None of the existing design communities (Dribbble, Behance, design Twitter) provide this — they are showcases, not learning loops.

## Objective

A mentor-driven community and curriculum platform where designers in Russia and the broader post-Soviet market can build a personal learning plan, get serious review from a working mentor, and progress through skills that matter for the AI era rather than chasing every new tool.

## Target Users

Mid-career designers in Russia, Belarus, Ukraine, and Central Asia who feel professionally unmoored by AI. Also junior designers trying to break in and looking for a structured alternative to the showcase sites.

## MVP Scope

Personal curriculum builder (3, 6, and 12-month tracks). Mentor matching with a pool of 10 working designers in the region. Review submission flow (artefact + 3 questions). Public portfolio page per designer. No live workshops in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `213-.../SPEC.md` and the chosen stack (Next.js, PostgreSQL, Meilisearch). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Mentors must be active practitioners, not coaches. Reviews must be substantive — minimum 300 words and reference specific artefacts. Curriculum tracks must be updated quarterly. No AI-generated reviews (clear disclosure required).
