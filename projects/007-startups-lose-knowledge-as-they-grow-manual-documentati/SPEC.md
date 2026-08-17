---
id: "007"
slug: startups-lose-knowledge-as-they-grow-manual-documentati
title: "Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval. Willing to pay from $25/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/oizu9ll251-startups-lose-knowledge-as-they-grow-man"
  captured: "2026-07-17"
category: productivity
date: "2026-07-17"
tags: [Productivity, Startups, Business, AI, Other]
country: Argentina
wtp:
  raw: from $25/month
  currency: USD
  min: 25
  period: month
  mrrMid: 25
tech: [Next.js, Postgres, Anthropic Claude, Slack API, Notion API]
---
# Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval. Willing to pay from $25/month.

## Problem

Series A–B startups in Argentina and Latin America lose institutional knowledge as headcount grows from 20 to 100: decisions live in Slack threads, Notion docs rot, and the same question is answered by a different person in five different ways. Manual documentation does not survive the pace; what is missing is capture-and-retrieval that does not require a human to write anything.

## Objective

Ship a tool that watches Slack channels and meeting transcripts, distills them into a searchable answers database with citations back to the original conversation, and answers a team member's question in plain language — without anyone writing a wiki page.

## Target Users

- Primary: founders and CTOs at Series A–B Latin American startups with 20–100 people, no dedicated knowledge-management role.
- Secondary: people-ops leads at the same companies who want onboarding time to drop from weeks to days.

## MVP Scope

- Slack channel and DM ingest with explicit per-channel opt-in (no silent reads of private channels).
- Meeting transcript uploads (audio or text) with automatic transcription and chunking.
- Vector search index over ingested chunks, scoped per tenant and per permission.
- Q&A surface: typed question returns a synthesised answer with clickable citations back to the original Slack message or transcript line, plus a verbatim quote per citation.
- Permission filter at the chunk level — a user without access to a source channel can never receive a citation from it.
- Feedback loop: thumbs up/down per answer; bad answers are excluded from future retrievals.
- Weekly digest email to admins: "questions the bot could answer for your team this week" to seed adoption.
- No Notion / Google Docs ingestion in v1 (deferred to v2 after permission-model validation).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/productivity/oizu9ll251-startups-lose-knowledge-as-th` follows the constraints in `007-.../SPEC.md` and the chosen stack (Next.js, Postgres, Anthropic Claude). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Argentina.

For Argentina, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- All inference must happen on the model side; the index stores embeddings and metadata only — no raw message content is held longer than necessary for the embedding generation.
- Slack OAuth scopes must be reviewed by counsel before launch; the app must respect Slack's `groups:read` and `im:read` limits.
- The Q&A surface must return an answer in under 10 seconds for the median query; longer waits break adoption.
- The product must run in a region the customer chooses (US, EU, or LATAM) for data-residency compliance.
- Pricing must stay at or below the stated $25/month for teams of 25–100 seats, the segment that the source identifies.
