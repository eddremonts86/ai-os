---
id: "239"
slug: hours-of-manual-searching-for-parts-for-chinese-cars-ne
title: Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for"
category: retail
date: "2026-01-21"
tags: [AI, Other]
country: Russia
tech: [Python, FastAPI, OpenAI CLIP + GPT-4o, Elasticsearch, Next.js 14, Telegram Bot API, PostgreSQL]
---
# Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part

## Problem

Russian owners of Chinese cars (Chery, Geely, Haval, Changan) spend hours searching for spare parts because the OEM catalogues are inconsistent, part numbers do not cross-reference cleanly between suppliers, and visual identification of an unfamiliar part is hard. The poster wants an AI agent that takes a photo or a text query and returns the part.

## Objective

Ship a Russian-language agent that accepts a photo of a car part or a plain-language description (e.g. "left rear tail-light for Haval Jolion 2022"), normalises it to a canonical part name and number, and returns a ranked list of suppliers with prices and lead times.

## Target Users

Russian owners of Chinese-brand cars who currently rely on Avito and forum threads to find parts. Independent Russian auto-parts shops that want a low-cost sourcing assistant. Russian auto service stations.

## MVP Scope

Telegram bot as the primary surface. Photo ingestion with CLIP-based visual search across a curated catalogue of Chinese-brand parts. Text-query normalisation via GPT-4o. Supplier lookup against an Elasticsearch index seeded from public OEM catalogues and Russian parts-shop feeds. Inline keyboard returning top 5 matches with price and lead time.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts` follows the constraints in `239-.../SPEC.md` and the chosen stack (Python, FastAPI, OpenAI CLIP + GPT-4o). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must work in Russian. Visual search quality is bounded by catalogue coverage; honest "no match found" beats confident wrong matches. No real-time pricing claims; prices lag supplier feeds by 24h.
