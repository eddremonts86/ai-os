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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (settings UI, agent-target picker, live partial-transcript indicator, banner for clarifying question)
- [ ] Provision Tauri shell with global hotkey registration + OS audio capture permissions
- [ ] Wire Whisper.cpp sidecar; benchmark partial-transcript latency on a 2024 MacBook Pro
- [ ] Wire local Llama sidecar (via `llama.cpp` or `ollama`); write the system prompt enforcing "one short clarifying question max"
- [ ] Document local-mode minimum hardware spec in the README

## Phase 1: Core

- [ ] Global hotkey to start / stop dictation; audio streamed to STT sidecar
- [ ] Whisper.cpp sidecar emitting partial transcripts over a local socket
- [ ] Local Llama sidecar consumes partials; emits either a clarifying question (max one sentence) or a cleaned prompt
- [ ] Constrained-decoding schema for the clarifying-question output (max length, single-question format)
- [ ] OS TTS / banner for clarifying question
- [ ] OS clipboard write for cleaned prompt + focus the agent window + paste + optional auto-Enter
- [ ] Agent-target presets: Cursor, Windsurf, VS Code + Copilot, Claude Code, Codex CLI; per-agent config UI
- [ ] Hosted Pro track: OpenAI or Anthropic API integration with two-click opt-in disclosure ("raw audio / partial transcripts will be sent")
- [ ] Pro gating via Stripe Subscriptions ($15/month) + 14-day trial
- [ ] Latency profiler: p50 / p95 end-to-end on local and hosted modes, surfaced in a debug panel
- [ ] Settings persistence in a Tauri-managed SQLite file
- [ ] End-to-end test: developer dictates a prompt with two mid-sentence changes of mind, intermediary emits a clarifying question, developer answers, cleaned prompt lands in Cursor with no raw transcript visible

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 30 pilot developers (founders, indie devs, RSI users, pair-programming teams)
- [ ] Weekly latency + clarification-rate review with the pilot cohort for 6 weeks
- [ ] Set up status page + first-party-voice-mode monitoring (Cursor / Windsurf / VS Code release notes)
- [ ] Post-mortem after week 15; decide v2 scope (Windows + Linux support, Team tier, prompt-template marketplace)
