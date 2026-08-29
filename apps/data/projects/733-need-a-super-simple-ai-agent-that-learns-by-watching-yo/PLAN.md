---
id: "733"
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
tech: [Electron, Node.js, OS-level screen capture (DXGI on Windows, CoreGraphics on macOS), screenpipe-style local frame+audio pipeline, OpenAI/Anthropic vision LLMs, local-only SQLite history]
---
# Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month.

## Tech Stack

- **Desktop shell:** Electron app on Windows and macOS, single code path; OS-level screen capture via DXGI on Windows and CoreGraphics on macOS.
- **Capture pipeline:** a screenpipe-style local frame+audio stream that timestamps every screen frame and mic/system audio sample into a rolling 24-hour SQLite index, never leaving the device unless a routine explicitly opts in.
- **Action hooks:** OS accessibility APIs (UI Automation on Windows, AXUIElement on macOS) for both event capture during recording and event dispatch during replay; coordinate-based pixel replay is explicitly avoided.
- **Reasoning layer:** OpenAI / Anthropic vision LLMs behind a thin internal adapter; routine-step segmentation happens against the captured event stream so the LLM is asked to label already-segmented steps, not to invent steps from pixels.
- **Storage:** local SQLite for the rolling buffer and recorded routines; metadata only on the server (account, billing, routine names) so a reinstall can restore routines without uploading screen content.
- **Billing:** Stripe Checkout on $19/month or $15/month annual, 7-day free trial; webhook flips the local license flag in the app.

## Architecture

```
User clicks Record ─▶ Electron renderer
                            │
                            ▼
                  Capture service (DXGI / CoreGraphics)
                            │
                            ▼
                  Event segmentation (UIA / AXUI hooks)
                            │
                            ▼
                  Routine store (SQLite, encrypted-at-rest)
                            │
                            ▼
                  Replay scheduler (cron / trigger)
                            │
                            ▼
                  Action dispatch (UIA / AXUI) ──▶ confirmation UI on first 3 runs
```

The capture service and the replay service are deliberately separate processes so the recording loop never blocks on the LLM and the replay loop never blocks on capture. The LLM is only consulted on the natural-language "fix it" prompt and on step-label generation; the steady-state replay path does not touch the cloud at all, which keeps the per-user inference cost bounded inside the $19 ARPU.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + capture/replay API contracts approved. End of week 1.
2. **M1 — Capture + segment.** Windows + macOS capture service running, event-segmentation produces a step list from a recorded session. End of week 4.
3. **M2 — Replay engine.** Routine replay against the recorded event hooks; confirmation UI on the first three runs; "fix it" natural-language prompt stubbed. End of week 7.
4. **M3 — Billing + trial.** Stripe Checkout, 7-day trial, license flag wired into the app. End of week 9.
5. **M4 — Pilot.** 30 non-technical users onboarded, weekly interviews for the first month. End of week 13.

## Risks

- **Action hook fragility.** Replay depends on the target app keeping stable accessibility IDs. Two app updates later, half of the user's recorded routines may break. The "fix it" prompt mitigates this but does not eliminate it; the v1 must be honest that breakage will happen.
- **Cloud LLM cost ceiling.** The natural-language "fix it" path can balloon the per-user inference cost past the $19 ARPU if a heavy model is used. Sizing the cap and the fallback to a smaller model is a Phase 1 task, not a Phase 2 polish.
- **Trust backlash.** The author named trust as the central issue. Any silent write-action — even a benign autofill — can destroy adoption in week 1. The confirmation UI must be the loudest part of the app, not a checkbox buried in settings.
- **macOS screen-recording permission UX.** macOS 10.15+ requires explicit permission and the system reminds the user on every major OS update that the app is recording. The install flow must be designed around that reality, not against it.
