---
id: "3457"
slug: watches-user-sessions-finds-bugs-that-matter-and-fixes-
title: "Watches user sessions, finds bugs that matter, and fixes them"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49466704"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Observability, Agent, Open Source]
tech: [TypeScript, PostgreSQL, ClickHouse, OpenTelemetry, Docker Compose]
---
# Watches user sessions, finds bugs that matter, and fixes them

## Problem

Abhishek, ex-Robinhood, describes the bug-tracking pain that defines Opslane's origin: at Robinhood the team did quarterly bug bashes, only fixed bugs with confirmed customer impact, then declared bankruptcy by mass-resolving everything that remained. Sentry's default priority levels "made no sense" against hundreds of open issues, and coding agents make the noise worse, not better.

He frames modern error trackers as failing twice. First, **false positives** — dashboards full of errors whose user impact is unknown. Second, **false negatives** — user-facing issues that never throw (broken dropdowns, dead clicks, abandoned forms), so they are invisible to error trackers entirely.

Opslane's premise is to combine error tracking with session recording and put an agent on top of both. The SDK captures errors, console logs, network requests, and session recordings; the product ranks issues by users affected, reads the codebase to learn the product, and watches for frustration patterns in recordings (rage clicks, dead clicks, abandoned forms). Abhishek's stated example: an early customer had a dropdown closing itself on click — no exception, no bug report — surfaced by watching session recordings.

The other pillars are explicit: **open source**, self-hostable from one Docker Compose file; **agent-first**, shipped with an MCP server so Claude Code can ask "what broke for users this week" and drive the resolution; and the system knows when an issue is fixable, only opening a PR when it can verify the fix.

## Objective

Ship Opslane as an open-source, self-hostable observability agent that combines error tracking and session recording, ranks issues by real user impact, catches frustration-driven false negatives, and opens PRs only when it can verify the fix it is proposing. The product must be deployable from a single Docker Compose file and reachable from a coding agent via MCP.

## Target Users

- Small-to-mid engineering teams that already pay for Sentry (or a comparable tracker) and feel the noise-vs-signal mismatch in their dashboard.
- Solo founders / indie teams who cannot afford an enterprise observability contract but ship enough surface area to need one.
- Engineering leads running coding-agent-in-the-loop workflows who want the agent to be able to ask "what broke" instead of opening the dashboard themselves.

## MVP Scope

- Self-hostable Docker Compose stack: web UI, ingestion API, session-recording storage, and the agent runtime.
- Browser SDK that captures errors, console logs, network requests, and session recordings with a single install.
- Issue ranking driven by distinct users affected, not raw event count.
- Frustration-signal detection on session recordings: rage clicks, dead clicks, abandoned forms (the categories Abhishek named).
- Project-aware context: the agent reads the host repo to learn the product, then uses that context when triaging issues.
- MCP server exposing "issues affecting users" so a coding agent (Claude Code is named) can pull the list and drive the resolution.
- PR-creation flow that **only opens a PR when the agent can verify the fix** — the gating rule Abhishek stated as non-negotiable.
- Out of scope: native mobile SDKs, multi-tenant SaaS hosting in v1, third-party integrations beyond GitHub for PR creation.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49466704` follows the constraints in `3457-.../SPEC.md` and the chosen stack (TypeScript, PostgreSQL, ClickHouse, OpenTelemetry, Docker Compose). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the engineering / on-call reader.

For show-hn category, the defaults lean toward a documentation-first surface: code blocks and terminal commands are first-class, the demo video is embedded, and no third-party tracking is added to the docs.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for the "verified fix" badge (the system's most important assertion), one muted accent for low-confidence signals. No gradients in v1.

**Type** — one display family for issue titles, one text family for body, one mono for stack traces and MCP responses. Type scale is small (4 steps) so the issue list stays compact.

**Density** — tight, table-driven for the issues dashboard; generous spacing for the demo video and the self-host quick-start.

**Motion** — minimal: an explicit play on the demo video; everything else is static.

## Constraints

- Self-hostable from a single Docker Compose file; ops complexity that exceeds that is a launch-blocker.
- The system must **never** auto-open a PR it has not verified. The "only opens a PR if it can verify the fix" rule is structural, not policy.
- Session recordings and error events can carry PII or secrets; the MVP must handle redaction or surface the policy to the operator on day one.
- Browser SDK must add a bounded CPU/network overhead budget on the user-facing site; silent recording of a customer's customers is not free.
- Open source license must be permissive enough for the self-host + MCP + agent-friendly posture to be credible.
