---
id: "322"
slug: problem-of-finding-and-obtaining-grants-for-small-busin
title: Problem of finding and obtaining grants for small businesses
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/gkrcgpelx1-problem-of-finding-and-obtaining-grants"
category: finance
date: "2025-10-29"
tags: [Finance, Business, Legal, Other]
country: Canada
tech: [Next.js 14, TypeScript, Postgres + pgvector, OpenAI API, Canada.ca grants API (where available), Stripe, Hetzner (Canada region)]
---
# Problem of finding and obtaining grants for small businesses

## Problem

Canadian small businesses — across provinces and territories — miss grant programs because the discovery surface is fragmented across federal (Canada.ca), provincial (Ontario, BC, Alberta, Quebec, etc.), municipal, and private-foundation programs. The title records the failure as a discovery-and-application gap, not just discovery: even when a business finds a grant, the application is 10–30 pages, jargon-heavy, and rarely worth a first-time applicant's time without help. The result is grants that go unspent, businesses that miss funding they qualify for, and consultants who charge 5–15% to apply on the small business's behalf.

## Objective

Ship a Canadian small-business grant discovery and application product that matches a business profile to every grant it qualifies for, drafts the application in the funder's format, and tracks the submission lifecycle. Outcome: a Canadian small business applies to every grant it qualifies for, in days, with a completion rate that beats the DIY baseline.

## Target Users

Canadian small businesses (1–50 FTE) across all provinces and territories. Owners and operators who are not professional grant writers. Secondary: Canadian bookkeepers and accountants who want a grant-discovery add-on for their SMB clients. Tertiary: Canadian economic-development officers who want a higher submission rate from the local SMB base.

## MVP Scope

Business profile intake: legal entity, province/territory, NAICS code, employee count, prior funding. Grant matching engine: federal + provincial + municipal + private-foundation programs with eligibility rules. Application drafting: per-funder template (Canada.ca, provincial portals, foundations), with the business's profile auto-populated. Submission tracker with status (drafted, submitted, awarded, declined) and follow-up cadence. Canada-hosted data (Hetzner Canada region or alternative).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/finance/gkrcgpelx1-problem-of-finding-and-obtaining-g` follows the constraints in `322-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres + pgvector). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Canada.

For Canada, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

All matched grants must come from the platform's curated database — no scraping of unauthorised sources. Application drafting must cite the funder's published guidelines, with the business profile fields explicitly mapped. Per-province and per-funder language rules (Quebec in French, Nunavut in Inuktitut + English) must be respected in v1 minimum for QC + ON + AB + BC.
