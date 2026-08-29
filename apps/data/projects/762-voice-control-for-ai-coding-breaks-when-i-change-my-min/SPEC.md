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

## Problem

A developer in the Netherlands uses text-to-speech to dictate prompts to AI coding agents (Cursor, Windsurf, and similar). Voice input dramatically speeds up the loop, but it breaks down on the most common real-world pattern: thinking faster than speaking. He changes his mind mid-sentence, restarts the same idea with a different framing, trails off and rephrases — and the raw transcript that lands in the agent's prompt box is a tangled, contradictory mess. The messy transcript clutters the agent's context window, gets re-read on every subsequent turn, and degrades the quality of the answer. He wants an AI intermediary that listens to his natural, messy voice stream, asks a clarifying question when it cannot resolve the contradiction, and only forwards a clean, single-intent prompt to the coding agent — running as a separate process so the messy thinking never enters the agent's context.

## Objective

Ship a voice-to-clean-prompt intermediary desktop app that captures system-wide voice input, transcribes it (streaming STT), routes the transcript through a fast LLM that resolves contradictions and asks a short clarifying question when intent is unclear, and forwards the cleaned prompt to a configurable AI coding agent (Cursor, Windsurf, VS Code + Copilot, Claude Code, Codex CLI) — so the messy voice stream never reaches the agent's context window. The developer dictates naturally; the intermediary edits; the agent receives a clean single-intent prompt.

## Target Users

- Primary: developers who already dictate prompts to AI coding agents and hit the "I changed my mind" wall — the messy transcript clutters the agent's context and degrades output quality.
- Secondary: developers with RSI / repetitive strain who cannot type at full speed for long sessions, and who depend on voice input as their primary coding-agent interface.
- Tertiary: pair-programming teams where one developer narrates while the other reviews; the cleaned prompt becomes the shared transcript.

## MVP Scope

- System-wide voice capture: a desktop app (Tauri or Electron) with a global hotkey that toggles dictation; audio streamed to the host via the OS-native speech API or a local Whisper.cpp process.
- Streaming STT: incremental transcription with partial-result emission so the LLM intermediary can start working before the user finishes speaking.
- LLM intermediary: a fast, small model (GPT-4-class mini or local equivalent) that (a) resolves mid-sentence contradictions, (b) rephrases for clarity, (c) asks one short clarifying question when intent is truly ambiguous, and (d) emits a clean, single-intent prompt.
- Agent forwarding: paste the cleaned prompt into the active coding agent window via the OS clipboard (and optionally auto-press Enter) for Cursor, Windsurf, VS Code + Copilot, Claude Code, Codex CLI; the user picks the target in settings.
- Conversation memory within a single dictation session (so a clarification Q&A stays coherent) but no leakage into the next session — the messy raw stream never reaches the agent.
- Local-first by default: STT and the LLM intermediary can run on-device (Whisper.cpp + a local model) for privacy-sensitive repos; a hosted LLM fallback is offered as an opt-in.
- English-only in v1; multi-language UI strings but STT/LLM in English only.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The intermediary must run as a separate process so the messy raw transcript never enters the coding agent's context window — the entire value proposition is "the agent never sees the mess."
- Latency budget: the user finishes speaking → the agent receives the cleaned prompt in ≤ 2.5 seconds at p95 on a modern laptop, so the voice loop still feels faster than typing.
- The clarifying question must be exactly one short sentence; if the LLM emits more than one question or a long paragraph, the design has failed — the developer is trying to move fast.
- LLM cost must stay under $0.02 per cleaned prompt at hosted-model pricing so a heavy dictation day (50 prompts) costs ≤ $1; local-mode eliminates this cost but must still meet the latency budget.
- Voice data must not leave the device by default; if the user opts into hosted LLM, only the final cleaned prompt is sent, not the raw audio or intermediate transcripts.
- The app must work on macOS first (primary dev platform per the user's country); Windows + Linux support is deferred to v2 unless the pilot cohort requires it sooner.
- The author has not stated a price; reasonable subscription ($10–$20/month) for the hosted-LLM track is within the implied value range.
