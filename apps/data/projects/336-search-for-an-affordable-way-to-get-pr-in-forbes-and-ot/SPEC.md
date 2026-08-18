---
id: "336"
slug: search-for-an-affordable-way-to-get-pr-in-forbes-and-ot
title: Search for an affordable way to get PR in Forbes and other top media outlets
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/xi1ox0v161-search-for-an-affordable-way-to-get-pr-i"
category: marketing
date: "2025-10-29"
tags: [Marketing, Media, Other]
country: Russia
tech: [Python (Aiohttp), Hunter.io + Apollo APIs, OpenAI API, Postgres, React (operator dashboard)]
---
# Search for an affordable way to get PR in Forbes and other top media outlets

## Problem

A Russian founder wants coverage in Forbes, Inc., TechCrunch and comparable outlets without paying the $5k-$15k placement-agency fee that the US PR-industrial complex charges. What the founder is missing is a way to identify the right journalist at each outlet for their specific story, draft a pitch that respects the journalist's beat, and persist through the follow-up sequence without paying an agency mark-up.

## Objective

Ship a do-it-yourself PR tool for Russian founders that maps a story to a ranked short list of journalists in Forbes/Inc/TC-tier outlets, drafts a beat-matched pitch in English or Russian, and runs the follow-up sequence with a privacy-clean unsubscribe and reply capture.

## Target Users

- Russian founders of post-Series-A startups who want tier-1 coverage and have a $500-2k media budget, not a $15k retainer.
- In-house marketing leads at Russian tech companies who would otherwise brief an agency.
- Solo PR freelancers in Russia serving 3-5 clients who want a tool that automates the research step.

## MVP Scope

- Story brief intake: company, traction numbers, news hook, target outlets, embargo.
- Journalist lookup: Hunter.io + Apollo + outlet bylines, ranked by beat-match score against the brief.
- Beat-matched pitch draft: English or Russian, with the traction numbers lifted from the brief.
- Send queue: rate-limited per outlet domain, respect journalist bylines and beat, no spam patterns.
- Reply capture and follow-up: 3-touch follow-up with a stop-on-reply rule.
- Coverage reporting: which journalist opened, replied, requested more, ran the story.
- No paid placement, no journalist-bribing workflow, no fake-byline generation.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/marketing/xi1ox0v161-search-for-an-affordable-way-to-` follows the constraints in `336-.../SPEC.md` and the chosen stack (Python (Aiohttp), Hunter.io + Apollo APIs, OpenAI API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Per-outlet send rate cap (default 1 pitch per journalist per 30 days) to keep deliverability clean.
- Operates on tier-1 outlets with verified journalist contacts; smaller outlets are supported in v1.5.
- All drafted pitches remain user-editable; the tool never sends without an explicit user click.
