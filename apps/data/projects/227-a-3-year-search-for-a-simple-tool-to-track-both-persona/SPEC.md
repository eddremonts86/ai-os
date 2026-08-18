---
id: "227"
slug: a-3-year-search-for-a-simple-tool-to-track-both-persona
title: "A 3-year search for a simple tool to track both personal and business finances in one place. Nothing matches because the reports are split, the UX is heavy, or the price is wrong."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-01-29"
tags: [Fintech, Personal Finance, Small Business]
country: USA
tech: [Python, FastAPI, PostgreSQL, React, Plaid, Stripe]
---
# A 3-year search for a simple tool to track both personal and business finances in one place. Nothing matches because the reports are split, the UX is heavy, or the price is wrong.

## Problem

A US user with a side business and a personal life has been searching for 3 years for a tool that tracks both in one place. Personal finance apps (Mint, YNAB, Monarch) ignore the business. SMB accounting (QuickBooks, Wave, Xero) treats personal spending as a separate problem or as a chart of accounts. The user ends up with two ledgers, two reconciliations, and no unified view of how much do I actually have after taxes and the business draw. What is missing is a single tool with a clean mental model that treats personal and business as two ledgers in one view, with a single reconciliation step and a single tax-relevant summary. None of the mainstream options target this combination.

## Objective

A single finance tool that runs personal and business ledgers side-by-side, with a unified reconciliation step and a single tax-relevant summary that respects the US freelancer / side-business reality.

## Target Users

US freelancers, side-hustlers, and one-person businesses who file a Schedule C and want a single view of personal + business finances without the double-entry tax.

## MVP Scope

Plaid integration for both personal and business accounts. Two ledgers in one view. Single reconciliation step. Tax-relevant summary (Schedule C, estimated tax). Web + mobile. No investment tracking in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `227-.../SPEC.md` and the chosen stack (Python, FastAPI, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must not be a tax-preparation service (forms). Must respect the user's own categories. Must export to the user's accountant. Must be HIPAA-aware if any health-spending is tracked. Bank creds must be Plaid-only (no screen-scraping).
