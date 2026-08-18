---
id: "348"
slug: need-a-service-for-generating-names-and-instantly-check
title: Need a service for generating names and instantly checking domain availability
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-names-and"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: Russia
tech: [Next.js, OpenAI API, Domain availability via RDAP + WHOIS, Telegram Bot API, Postgres]
---
# Need a service for generating names and instantly checking domain availability

## Problem

A Russian founder with a half-formed project spins up a name idea and then spends 20 minutes checking domains in five TLDs, then realises the .com is taken but the .io is available, then wonders if the social handles are still reservable, then loses the name they liked. The poster wants one tool that returns a ranked set of name ideas + domain availability across the major TLDs + social handles in one screen.

## Objective

Ship a name + domain + handle generator that, given a project brief, returns a ranked set of name candidates with domain availability across .com/.io/.co/.ru/.dev and social handle availability on X, GitHub, Telegram, VK, in one screen, in under 10 seconds.

## Target Users

- Russian founders at the 'naming the project' step of a new venture.
- Russian indie developers and designers who want a clean .dev or .io without 20 minutes of guessing.
- Marketing freelancers in Russia building microsites and need one name + one URL fast.

## MVP Scope

- Brief intake: project description (max 200 words), audience, brand vibe (adjectives slider).
- Name generator: 20 candidates per request, ranked by distinctiveness and pronounceability.
- Domain availability: live RDAP/WHOIS lookup across .com, .io, .co, .ru, .dev, .app.
- Social handle availability: X, GitHub, Telegram, VK.
- One-screen ranked view: name + domains + handles + a 'reserve' CTA for the registrar.
- Saved shortlist per user, exportable.
- Telegram bot: 'name for indie SaaS for translators' returns a ranked short list.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-na` follows the constraints in `348-.../SPEC.md` and the chosen stack (Next.js, OpenAI API, Domain availability via RDAP + WHOIS). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Domain lookup rate-limited per user (<= 60 candidates/min) to keep RDAP quota under control.
- Social-handle availability checked via the platform's official handle-exists endpoint where available; otherwise best-effort probe.
- RU-language briefs produce a mix of RU and EN name candidates at the user's option.
