---
id: "762"
slug: voice-control-for-ai-coding-breaks-when-i-change-my-min
title: Voice control for AI coding breaks when I change my mind mid-sentence. Need an AI intermediary that cleans up prompts through conversation before sending.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/2k6f44lb51-voice-control-for-ai-coding-breaks-when"
category: ai
date: "2026-02-23"
tags: [AI, Dev, Productivity, Other]
country: Netherlands
tech: [TypeScript, Whisper / WebSpeech STT, GPT-4-class LLM intermediary, Tauri or Electron desktop app, system-wide hotkey, Cursor / Windsurf / VS Code compatible]
---
# Voice control for AI coding breaks when I change my mind mid-sentence. Need an AI intermediary that cleans up prompts through conversation before sending.

## Tech Stack

- **Desktop shell:** Tauri (Rust + webview) preferred for low memory and small binary; Electron acceptable if the team is JS-first. The shell owns the global hotkey, the OS audio capture, and the clipboard / window-paste integration.
- **Frontend:** React + TypeScript inside the webview for the settings UI, the target-agent picker, and the live partial-transcript indicator.
- **STT (local):** Whisper.cpp running as a sidecar process (or whisper-cpp-python via a subprocess); streams partial transcripts to the intermediary.
- **STT (hosted fallback, opt-in Pro):** OpenAI Whisper API or equivalent; raw audio sent over TLS, not stored.
- **LLM intermediary (local):** a small open-weights model (Llama-3.1-8B-Instruct class) running via `llama.cpp` or `ollama` as a sidecar; tuned via a system prompt that enforces "one short clarifying question max."
- **LLM intermediary (hosted Pro):** OpenAI or Anthropic API with a constrained-decoding schema for the clarifying-question output (max length, single-question format).
- **Agent forwarding:** OS clipboard paste + optional auto-Enter via the OS-native automation API; per-agent presets (Cursor / Windsurf / VS Code + Copilot / Claude Code / Codex CLI) with target window matching by app name.
- **Settings + history:** a small Tauri-managed SQLite file for per-user preferences and the cleaned-prompt history (Pro sync deferred to v2).

## Architecture

The Tauri shell registers a global hotkey; on press it starts capturing system audio and streaming it to the STT sidecar. The STT sidecar emits partial transcripts over a local socket; the LLM intermediary consumes partials, resolves contradictions, and either emits a clarifying question (played through the OS TTS or shown as a banner) or emits a cleaned prompt. The shell writes the cleaned prompt to the clipboard, focuses the configured agent window, pastes, and (optionally) presses Enter. The raw stream never leaves the STT sidecar; the agent only ever sees the cleaned prompt.

```
Global hotkey ─▶ Tauri shell starts audio capture
                          │
                          ▼
                  STT sidecar (Whisper.cpp local / hosted Whisper opt-in)
                          │   partial transcripts
                          ▼
                  LLM intermediary (local Llama / hosted GPT-class opt-in)
                          │
                          ├─▶ clarifying question ─▶ OS TTS / banner (one sentence max)
                          │
                          └─▶ cleaned prompt ─▶ OS clipboard ─▶ paste into agent window
                                                       │
                                                       └─▶ optional auto-Enter
```

## Milestones

1. **M0 — Spec + design freeze.** SPEC.md, DESIGN.md, system prompt for the LLM intermediary, agent-target presets approved. End of week 1.
2. **M1 — Capture + STT.** Tauri shell with global hotkey, audio capture, Whisper.cpp sidecar emitting partial transcripts. End of week 3.
3. **M2 — LLM intermediary.** Local Llama sidecar wired, contradiction resolution + clarifying-question output schema, latency profiling. End of week 5.
4. **M3 — Agent forwarding.** OS clipboard paste + Enter automation for Cursor, Windsurf, VS Code + Copilot, Claude Code, Codex CLI; per-agent preset UI. End of week 7.
5. **M4 — Hosted Pro track.** OpenAI / Anthropic API integration, Pro subscription gating, hosted-mode opt-in. End of week 9.
6. **M5 — Pilot.** 30 developers onboarded (mix of founders, indie devs, RSI users); weekly latency + clarification-rate review. End of week 15.

## Risks

- **Latency budget slippage.** p95 ≤ 2.5 s in local mode is tight; if Whisper.cpp partial emissions lag or the local Llama is too slow, the user perceives the tool as "slower than typing." Mitigation: ship the local-mode minimum hardware spec prominently and lead with hosted mode as the default in the trial.
- **Constrained-decoding reliability.** Enforcing "exactly one short clarifying question" via prompt engineering alone is unreliable; the v1 launch must use a constrained-decoding schema (e.g., max_tokens + regex / grammar) or the design promise breaks under load.
- **OS accessibility permissions.** macOS in particular has tightened clipboard + window-focus automation permissions; a regression on the next macOS update could break the paste flow. Mitigation: ship a fallback path that uses the OS-native text-input simulation rather than accessibility APIs, even if it requires a one-time setup wizard.
- **Agent-target drift.** Cursor / Windsurf / VS Code / Claude Code / Codex CLI all change their window titles, app IDs, and paste-handling behavior; the preset table must be tested per release, and a "configure my own target" option is needed for less common agents.
- **Privacy posture drift.** The v1 default must be "only cleaned prompt leaves the device"; if the hosted-mode opt-in is too easy to enable by accident, the privacy claim collapses. The opt-in must be a deliberate two-click flow with a clear "raw audio / partial transcripts will be sent" disclosure.
- **First-party voice modes.** If Cursor or VS Code ships its own contradiction-resolving voice mode, the value proposition shifts; the response is "we work across all of them, including the ones that don't ship their own," not "we compete head-to-head."
