---
id: "333"
slug: ai-agent-for-automatic-seo-promotion-of-websites-on-wor
title: AI agent for automatic SEO promotion of websites on Wordpress and Tilda
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-of"
category: seo
date: "2025-10-29"
tags: [SEO, Marketing, AI, Other]
country: Serbia
tech: [Python (FastAPI), WordPress REST API, Tilda Webhook + External API, OpenAI API, Postgres]
---
# AI agent for automatic SEO promotion of websites on Wordpress and Tilda

## Problem

A small SEO operator in Serbia is paid to keep client sites on WordPress and Tilda ranking for a handful of commercial keywords. The work is a sequence of small, recurring tasks: weekly content drafts, metadata refreshes, internal-link audits, sitemap regen and Search Console follow-up. Today an operator runs the same checklist manually for each client. The poster wants an agent that runs those tasks unattended.

## Objective

Ship an AI agent that connects to a WordPress or Tilda site via API and runs a weekly SEO routine: keyword-tracked content drafts, metadata refresh, internal-link audit, sitemap regen, and Search Console follow-up, with operator approval on each change.

## Target Users

- Serbian and wider Balkan SEO operators managing 10-30 small-business WordPress and Tilda sites.
- In-house marketers at SMBs in the region who want SEO to run on autopilot without a full-time hire.
- Freelance web designers who maintain sites they built and want a recurring revenue stream from each one.

## MVP Scope

- Site connect flow for WordPress (REST + app password) and Tilda (API key).
- Routine library: 6 weekly routines (content draft, metadata refresh, internal-link audit, sitemap regen, Search Console triage, broken-link check).
- Per-routine approval queue: every state-changing action generates a diff the operator approves.
- Per-site keyword set (max 25) with weekly ranking snapshot from a SERP provider.
- Notification digest (email + Telegram) summarizing approved changes and ranking movement.
- No link-buying, no PBN management, no cloaking - explicitly out of scope.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-o` follows the constraints in `333-.../SPEC.md` and the chosen stack (Python (FastAPI), WordPress REST API, Tilda Webhook + External API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Serbia.

For Serbia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Diff-then-approve is mandatory; the agent must not publish a post without a human click.
- Operates only on sites the operator demonstrably owns (domain verification step).
- Per-site keyword pull cached for 24h to keep SERP-API costs bounded.
