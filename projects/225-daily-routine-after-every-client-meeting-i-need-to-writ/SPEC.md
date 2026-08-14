---
id: "225"
slug: daily-routine-after-every-client-meeting-i-need-to-writ
title: "Daily routine: after every client meeting, I need to write a structured report for colleagues. Existing tools are slow, opinionated, or forget the context."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: productivity
date: "2026-02-10"
tags: [Productivity, AI, Meetings]
country: UK
tech: [Python, FastAPI, Whisper, Claude API, PostgreSQL, Next.js]
---
# Daily routine: after every client meeting, I need to write a structured report for colleagues. Existing tools are slow, opinionated, or forget the context.

## Problem

A UK professional finishes a client meeting and has to write a structured report for colleagues — what was decided, what is open, who owes what, when. Existing tools (Otter, Fireflies, tl;dv) produce a transcript and a summary, but the summary is generic and the important context (the company's own client history, the colleague's working style, the previous report's phrasing) is lost. The professional ends up rewriting the summary from the transcript anyway. What is missing is a meeting-to-report service that knows the user's own templates, the client's history, and the colleague's working style, and that produces a draft report the user adjusts in 60 seconds rather than writes from scratch in 30 minutes.

## Objective

A service that takes a meeting transcript and produces a draft report tailored to the user's own templates, the client's history, and the colleague's reading style, with a 60-second human review.

## Target Users

UK and EU professionals in consulting, agencies, law firms, and customer-facing teams who write a client report after every meeting. Also internal teams that need a meeting summary in a specific format.

## MVP Scope

Upload or live-transcribe a meeting. Select a template (per client, per colleague). Output a draft report in the template's style. Memory per client (past reports, preferences). Web app with a 60-second review. No calendar integration in v1.

## Design Direction

Design direction for the MVP at `` follows the constraints in `225-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect the user's own wording preferences. Must not invent names or decisions not in the transcript. Per-client memory must be deletable. No third-party logging of the transcript.
