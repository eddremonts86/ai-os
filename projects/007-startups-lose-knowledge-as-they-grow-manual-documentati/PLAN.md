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

## Tech Stack

- **Frontend:** Next.js 14 with the chat UI as the primary surface.
- **Database:** Postgres + pgvector for the answer index; per-tenant schema.
- **AI layer:** Anthropic Claude for synthesis; the same model produces the citation list.
- **Connectors:** Slack API (read channels + DMs with explicit opt-in), Notion API (read pages + databases), meeting transcript uploads.
- **Auth:** Clerk for SSO with Google and Slack identity providers.

## Architecture

A self-contained data-flow diagram lives at [`assets/in-house-qa-data-flow.html`](assets/in-house-qa-data-flow.html) (open in any browser; SVG rendered inline, no server required).

Sources push into a per-tenant ingest pipeline that chunks, embeds, and stores with metadata. The Q&A path retrieves the top-k chunks, asks the model to synthesize an answer with citations, and renders the citation list inline. Permission scoping happens at the chunk level, not the query level — a chunk from a private channel is never returned to a user without access.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + first customer's Slack scope. End of week 2.
2. **M1 — Slack ingest.** OAuth, channel selection, ingest worker, pgvector index. End of week 6.
3. **M2 — Q&A path.** Retrieval, synthesis, citations, permission filter. End of week 10.
4. **M3 — Notion + meeting transcripts.** Notion ingest, transcript upload + transcription. End of week 14.
5. **M4 — 10-customer pilot.** 10 LATAM startups across 25–80 seats each. End of week 20.

## Risks

- **Hallucinated citations** — Claude may cite a chunk that doesn't contain the answer; mitigation: every citation must include the verbatim source sentence, and users can flag a bad answer to retrain the chunk.
- **Permission leakage** — Slack DMs and private channels are sensitive; the ingest pipeline must respect Slack's `groups:read` scope and the chunk filter must be a hard rule, not a soft prompt.
- **Adoption** — if no one asks the bot, the index rots; an onboarding nudge and a weekly digest of "questions the bot could answer" is mandatory.
