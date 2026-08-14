---
id: "220"
slug: voice-control-for-ai-coding-breaks-when-i-change-my-min
title: Voice control for AI coding breaks when I change my mind mid-sentence. Need an AI intermediary that understands my actual intent after the corrections.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: ai
date: "2026-02-23"
tags: [AI, Voice, Coding]
country: Netherlands
tech: [Python, Whisper, Claude API, Rust, WebRTC, PostgreSQL]
---
# Voice control for AI coding breaks when I change my mind mid-sentence. Need an AI intermediary that understands my actual intent after the corrections.

## Tech Stack

Python for the orchestration. Whisper for ASR. Claude API for the distillation. Rust for the latency-sensitive stream handler. WebRTC for the optional voice capture. PostgreSQL for the trace log.

## Architecture

Voice → Whisper → raw text → distillation (self-correction merge) → intent JSON → coding agent. Each stage logged. Per-developer tunable confidence threshold for the merge.

## Milestones

M0 — Whisper capture + raw text to coding agent. M1 — distillation layer with 85% accuracy on a holdout set. M2 — integration with Claude Code. M3 — 50 developers in pilot. M4 — public launch with a local-only option.

## Risks

Distillation layer may over-merge and lose a real change of plan. Latency budget is tight. Local-only privacy may conflict with model quality. The coding agent itself may still misinterpret the cleaned intent.

## Data Model

## Integrations

Python for the orchestration. Whisper for ASR. Claude API for the distillation. Rust for the latency-sensitive stream handler. WebRTC for the optional voice capture. PostgreSQL for the trace log.
