---
id: "362"
slug: automated-tool-for-link-checking-and-stylistic-editing
title: Automated tool for link checking and stylistic editing
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/gvks1brdf1-automated-tool-for-link-checking-and-sty"
category: media
date: "2025-10-29"
tags: [Media]
country: Russia
tech: [Next.js, Node.js (link crawler), OpenAI API (style pass), Postgres, Browser extension (Manifest V3)]
---
# Automated tool for link checking and stylistic editing

## Problem

A Russian-speaking editor or content lead is shipping long-form articles (Russian or English) and finds post-publication link rot and stylistic drift are the two most common follow-up tasks. Today each is a separate tool and a separate day. The poster wants link rot caught and stylistic consistency enforced before the article is published, in the same pass.

## Objective

Ship an automated link-check and stylistic-edit tool for Russian-language long-form content that runs link rot and style consistency in one pass, supports a configurable style guide per publication, and ships a browser-extension overlay for content management systems.

## Target Users

- Russian-speaking editors at digital publications producing 5-30 long-form articles per week.
- Russian content marketers publishing on Tilda / WordPress / Telegram who need link and style consistency.
- Russian university-press editors and copyeditors who need a CI-like style pass on every article.

## MVP Scope

- Article input: paste / upload Markdown, HTML, or pull from a WordPress/Tilda CMS.
- Link checker: HTTP probe each link; status code + last-seen-up + cache for 30 days; broken links surfaced.
- Stylistic edit: configurable style guide (tone, banned words, RU/EN-specific constructs).
- Browser-extension overlay: link-check + style pass directly on the CMS editor view.
- Diff view: every proposed change is a diff the editor approves.
- Weekly sweep on a publication's existing article set; alert on new rot.
- No automatic republishing or unapproved rewrites.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/media/gvks1brdf1-automated-tool-for-link-checking-and` follows the constraints in `362-.../SPEC.md` and the chosen stack (Next.js, Node.js (link crawler), OpenAI API (style pass)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Link probes rate-limited per user to keep the tool polite to small publishers.
- Style guide configurable per publication; the out-of-the-box guide is explicitly Russian-language-aware.
- All proposed changes are diffs; the tool never rewrites without an editor's click.
