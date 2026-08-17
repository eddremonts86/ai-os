---
id: "002"
slug: need-a-super-simple-ai-agent-that-learns-by-watching-yo
title: Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/0jcnxkipi1-need-a-super-simple-ai-agent-that-learns"
  captured: "2026-07-17"
category: ai
date: "2026-07-17"
tags: [AI, Productivity, Other]
country: USA
wtp:
  raw: $10–30/month
  currency: USD
  min: 10
  max: 30
  period: month
  mrrMid: 20
tech: [Python, Tauri, OpenAI Whisper, Anthropic Claude, DuckDB]
---
# Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month.

## Problem

Knowledge workers in the US want a desktop agent that watches routine screen activity — opening apps, filling forms, copying values between windows — and turns those patterns into one-click automations. Existing RPA tools are priced for enterprise IT (UiPath, Automation Anywhere) or are open-source but require scripting skill; the "10–30 dollars per month, works out of the box" layer is missing.

## Objective

Ship a macOS-first desktop agent that records a user's screen actions, infers a reproducible procedure, and offers a button that re-runs it. The agent must work without cloud sync of personal data, and the first usable automation must be recordable in under 5 minutes by a non-technical user.

## Target Users

- Primary: solo operators and small-team founders who do 30+ minutes of repetitive computer work a day and have no developer on call.
- Secondary: admins and ops generalists at sub-50-person companies who already use Zapier but hit ceiling on multi-app, on-device workflows.

## MVP Scope

- Screen recorder with a "stop & save" affordance; captures click, type, focus, and clipboard as a structured trace (not video).
- Procedure builder that proposes a 3–7 step script from the trace and asks the user to confirm or edit each step.
- Local execution engine (no cloud round-trip) that re-runs the saved procedure with parameter slots (e.g., "this email address").
- Library of saved procedures with one-key replay and per-run logs.
- Sharing procedures as a JSON file via drag-and-drop to Finder.
- No Windows build, no mobile, no team workspace, no scheduled triggers in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ai/0jcnxkipi1-need-a-super-simple-ai-agent-that-learn` follows the constraints in `002-.../SPEC.md` and the chosen stack (Python, Tauri, OpenAI Whisper). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Personal data must stay on-device by default; cloud sync is opt-in and end-to-end encrypted.
- Must run on macOS 13+ on Apple Silicon and Intel without a paid runtime.
- The recording step must add < 8% CPU overhead on a 2021 MacBook Pro so the user does not notice it.
