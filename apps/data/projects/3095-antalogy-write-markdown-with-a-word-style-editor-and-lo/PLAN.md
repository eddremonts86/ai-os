---
id: "3095"
slug: antalogy-write-markdown-with-a-word-style-editor-and-lo
title: Antalogy – Write Markdown with a Word-style editor and local LLM
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/antalogy?utm_campaign=startup-184321&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Antalogy – Write Markdown with a Word-style editor and local LLM

## Tech Stack

Desktop app, with a Word-style ribbon over Markdown. The listed stack — React + TypeScript + TanStack Start + SQLite-via-Drizzle + Coolify + Docker — points at an Electron-or-Tauri desktop shell running the React app, with the AI Assistant calling whatever OpenAI-compatible endpoint the user points it at (local Ollama, on-prem vLLM, LM Studio, OpenAI, Azure). SQLite stores local settings + recent-files index. No telemetry, no hosted service, so the entire build is offline-capable against a local LLM endpoint by default.

## Architecture

- **Desktop shell** (Electron or Tauri) hosting the React editor. Local file IO through the OS file picker; no remote storage.
- **Markdown editor core** with a Word-style ribbon: bold/italic/headings/lists/tables/links via toolbar and keyboard shortcuts.
- **`.docx` converter**: open `.docx`, render with formatting preserved (tables, lists, headings, images, footnotes), save clean `.md`. This is the post's lock-in wedge.
- **AI Assistant pane**: chat-style UI; sends prompts to whatever OpenAI-compatible endpoint the user configured. Selection-aware actions (rewrite, summarize, expand) operate on the current selection or document.
- **Endpoint config**: a single settings screen for base URL + API key + model name. Works fully offline against localhost endpoints.
- **No telemetry, no backend server.** All state is local; updates are manual or via OS-package channels.
- **Optional Cloud AI fallback** — the post mentions "whether local, on-prem, or cloud," so a cloud endpoint is allowed, but must be opt-in per request, not on by default.

## Milestones

1. **M0 — Editor + ribbon (3 wk).** Desktop shell + React editor + Word-style ribbon + Markdown round-trip. Internal alpha.
2. **M1 — `.docx` open/save (2 wk).** Open `.docx` with formatting preserved; save back to `.md`. Round-trip tests against a corpus of 50 real-world `.docx` files. Validated internally.
3. **M2 — AI Assistant pane (2 wk).** Chat UI, selection-aware actions, OpenAI-compatible endpoint support. Validated against Ollama + LM Studio locally + OpenAI cloud.
4. **M3 — Offline + zero-telemetry hardening (1 wk).** CI gate: app must run with the network cable unplugged end-to-end. Audit log proves no outbound calls.
5. **M4 — Cross-platform packages (2 wk).** macOS + Windows + Linux installers. Public beta.
6. **M5 — Pricing + paid tier (1 wk).** Validate price point with 10 interviews; pin. Either one-time license or annual subscription.

## Risks

- **`.docx` round-trip fidelity.** Real `.docx` files use complex Word features (revision marks, embedded objects, footnotes). The MVP must bound the supported feature set and communicate it clearly — silent formatting loss is the obvious churn driver.
- **No-telemetry verification.** A single analytics SDK call breaks the trust cue. Need an automated offline-mode test in CI, not just a written privacy promise.
- **Endpoint compatibility matrix.** Each OpenAI-compatible endpoint (Ollama, vLLM, LM Studio, OpenAI, Azure, Together) has quirks. The MVP must constrain to "chat completions" only and refuse tool-call / vision endpoints until each is individually supported.
- **Pricing unstated.** The post names no price. Treat the 5.5 Money ceiling as anchored on the workflow-shape, not the recurring signal, until 10 user interviews confirm it.
- **Cross-platform support scope.** If Mac-only at launch, the audience is bounded; the post does not specify, so the M4 milestone is the gating scope decision.
