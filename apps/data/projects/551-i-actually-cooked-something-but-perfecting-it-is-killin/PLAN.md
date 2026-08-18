---
id: "551"
slug: i-actually-cooked-something-but-perfecting-it-is-killin
title: "I actually cooked something, but perfecting it is killing my productivity."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo7dla/i_actually_cooked_something_but_perfecting_it_is/"
category: saas
date: "2026-08-14"
tags: [saas, video, ai, desktop]
tech: [Swift, "C#", WinUI, Adobe CEP, SQLite, Stripe, Paddle]
---
# I actually cooked something but perfecting it is killing me

## Tech Stack

- **Desktop app:** native Swift on macOS, native C# / WinUI on Windows.
- **Plugin integration:** Adobe CEP + the relevant host APIs for the 3 additional programs.
- **AI model:** the founder's manually-trained proprietary model, served from a small GPU box or in-process.
- **Storage:** local-only SQLite for project state; no cloud sync in v1.
- **Payments:** Stripe (the Mac app) + Paddle (the Windows build, for tax handling).

## Architecture

Native desktop app per platform; the agent runs in-process against the host program's API. No server-side dependency for the editor surface.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the v1 plugin's existing features re-documented. End of week 1.
2. **M1 — Auto-agent mode (feature-flagged).** End of week 4.
3. **M2 — Native Windows build.** End of week 8.
4. **M3 — 3 additional host integrations.** End of week 12.
5. **M4 — Public beta with the existing v1 user base.** End of week 14.

## Risks

- **Perfectionism on the auto-agent loop** — the "ship now" rule must be enforced by a feature flag, not by willpower.
- **Native Windows build** — non-trivial; the founder explicitly rejects Electron.
