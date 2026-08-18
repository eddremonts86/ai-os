---
id: "231"
slug: website-owners-constantly-need-minor-edits-in-the-admin
title: Website owners constantly need minor edits in the admin panel. They are forced to pay specialists for 5-minute changes. Need an AI that resolves those edits in plain English.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: ai
date: "2026-01-28"
tags: [AI, Web, CMS]
country: USA
tech: [Python, FastAPI, Claude API, PostgreSQL, React, WordPress]
---
# Website owners constantly need minor edits in the admin panel. They are forced to pay specialists for 5-minute changes. Need an AI that resolves those edits in plain English.

## Problem

A US website owner needs 5-minute edits in the admin panel (change a price, swap a hero image, fix a typo, update a date) several times a week. Each edit requires either a specialist (developer, agency) at $50-150 per round, or a half-day of learning the CMS the website is built on. The website owner pays for the specialist most of the time and the rest of the time the changes sit in a backlog. What is missing is an admin-side AI that accepts the edit request in plain English, performs the actual change in the CMS, and shows the before/after for approval. None of the mainstream AI admin tools (CMS-specific plugins, agency-built chatbots) do this end-to-end with a before/after approval.

## Objective

A web admin AI that accepts edits in plain English, performs the change in the CMS, and shows the before/after for one-click approval — without the website owner needing to know the CMS.

## Target Users

US and EU website owners of small and mid-sized sites on WordPress, Webflow, Shopify, and custom CMS. Also agencies that want to offer this as a value-add to their retainer clients.

## MVP Scope

Web app connected to one CMS (WordPress first). Plain-English edit request. Before/after preview. One-click approval. Audit log per edit. Webflow and Shopify second. No image generation in v1 (only swap-existing).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `231-.../SPEC.md` and the chosen stack (Python, FastAPI, Claude API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect the user's role permissions. Must show a before/after preview. Must keep a full audit log. Must not change the theme or the plugins. No auto-apply without approval.
