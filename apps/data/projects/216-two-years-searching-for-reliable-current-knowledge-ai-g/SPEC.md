---
id: "216"
slug: two-years-searching-for-reliable-current-knowledge-ai-g
title: "Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of low-quality links. Need a trustworthy digest in the user's domain."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: ai
date: "2026-03-12"
tags: [AI, Research, Knowledge]
country: Russia
tech: [Python, FastAPI, PostgreSQL, pgvector, Claude API, Next.js]
---
# Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of low-quality links. Need a trustworthy digest in the user's domain.

## Problem

A user in Russia has spent two years looking for a way to get a reliable, current, in-domain knowledge digest. AI assistants give generic answers that look right but quietly miss the recent developments in their field. Search engines return thousands of low-quality SEO articles with no editorial signal. RSS feeds are noisy and unaudited. What is missing is a service that ranks sources by actual editorial credibility and recency in a specific domain, then synthesises a digest that the user can audit. Nothing mainstream does this. AI products hide their sources; search does not rank by trust; RSS does not synthesise.

## Objective

A digest service that curates in-domain sources by an explicit credibility score, ranks them by recency and depth, and produces a weekly or daily digest the user can audit down to the source paragraph.

## Target Users

Knowledge workers in Russia and the EU who need a current read on a specific professional domain (law, finance, AI, biotech, etc.) and have given up on search and generic AI. Secondary: teams in professional services firms (consulting, law, accounting).

## MVP Scope

User picks a domain. System ranks 30 candidate sources by credibility score derived from authorship, citations, retraction history, and editorial reputation. Daily or weekly digest synthesised with citations to source paragraphs. User can subscribe and give feedback on quality. Three domains in v1: AI, finance, biotech.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `216-.../SPEC.md` and the chosen stack (Python, FastAPI, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Citations must be at paragraph level, not just article level. Sources must be shown to the user, not hidden. The credibility score must be inspectable. The digest must be reproducible from the same source state. No retraining of any model on proprietary content.
