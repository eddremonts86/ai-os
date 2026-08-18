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

## Tech Stack

- **Desktop shell:** Tauri (Rust + WebView), single binary, code-signed for macOS.
- **Recording + replay runtime:** Python 3.12 packaged via PyInstaller; uses `pynput`, `Quartz` (macOS), and `pyobjc` for low-level event capture.
- **AI layer:** Anthropic Claude for procedure inference from the captured trace; OpenAI Whisper for any audio (call-recording) flows shipped later.
- **Local storage:** DuckDB for procedure library + per-run logs; no external DB.
- **Sync (opt-in):** end-to-end encrypted with libsodium; server stores ciphertext blobs keyed by user-supplied passphrase.

## Architecture

The agent has three processes that talk over local IPC: a recorder that captures OS events, a builder that turns a trace into a procedure draft, and a runner that executes saved procedures. The AI layer is called only at build-time, never at run-time, so a saved procedure replays offline.

A self-contained architecture diagram lives at [`assets/on-device-automation-layers.html`](assets/on-device-automation-layers.html) (open in any browser; SVG rendered inline, no server required).

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-procedure recorder demo. End of week 2.
2. **M1 — Recorder + builder.** Capture a 30-second workflow, infer a 5-step procedure, confirm-and-save. End of week 6.
3. **M2 — Runner.** Replay saved procedures with parameter slots; per-run log UI. End of week 10.
4. **M3 — Sync (opt-in).** E2EE cloud library, multi-device. End of week 14.
5. **M4 — Public beta.** 200 macOS users via TestFlight-equivalent for desktop. End of week 20.

## Risks

- **macOS accessibility permissions** — users must grant `Accessibility` and `Input Monitoring`. If a high fraction drops off at the permission screen, conversion will collapse; needs in-product coaching and an explicit pre-flight check.
- **LLM inference quality** — Claude may misread unusual workflows. Mitigation: a "edit steps" UI before save is mandatory; the LLM never executes anything autonomously.
- **Code signing + notarization** — required for distribution outside the Mac App Store; cost + 2-week lead time. Plan for Sparkle-based auto-update from week 1.
