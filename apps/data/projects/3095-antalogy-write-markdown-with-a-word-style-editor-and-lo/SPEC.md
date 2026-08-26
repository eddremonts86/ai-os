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

## Problem

Antalogy is a desktop word processor that offers a familiar Word-style ribbon for Markdown while keeping everything local-first. It opens .docx files, preserves formatting, and saves clean .md files to avoid lock-in and reduce AI token waste. An integrated AI Assistant lets you brainstorm, edit, and summarize using any OpenAI-compatible endpoint, whether local, on-prem, or cloud. With zero telemetry and no backend servers, your documents stay on your machine. View startup

---

## Objective

Give Markdown authors the formatting surface they learned in Word — the ribbon, the inline toolbar, the formatting they can already use — while keeping the file format portable Markdown and the AI Assistant routing through any OpenAI-compatible endpoint the user already runs. The BetaList post frames this as a "no lock-in + no AI token waste" proposition: opens `.docx`, saves `.md`, never phones home.

## Target Users

1. **Markdown-native technical writers** — engineers, tech-blog authors, and developers who already prefer Markdown but work in teams where the format expectation is still Word-style.
2. **Privacy-conscious writers** — anyone whose documents cannot leave the machine: legal, medical, journalism, internal HR. The "zero telemetry, no backend servers" line is the explicit hook.
3. **AI-token-sensitive teams** — writers who route through local or on-prem LLMs (Ollama, vLLM, LM Studio) and want a Markdown editor that does not double-count their token spend by re-emitting HTML or `.docx` to a hosted service.

## MVP Scope

- Desktop app with a Word-style ribbon on top of Markdown editing.
- `.docx` open + format-preserving display + clean `.md` save (the post's lock-in wedge).
- AI Assistant pane: brainstorm / edit / summarize, hitting any OpenAI-compatible endpoint (local, on-prem, cloud) the user points it at.
- Zero telemetry, no backend server, no required account.
- Local file storage; documents never leave the machine.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "Zero telemetry" must mean no analytics SDK at all, not "telemetry we promise not to read." The post sells this hard, so a single network call for crash reports breaks the value.
- `.docx` round-trip is the conversion that makes or breaks onboarding; saving a `.docx` back to `.md` and losing formatting is the obvious failure mode the MVP has to avoid.
- AI Assistant must work fully offline against a local endpoint. A cloud-only fallback would split the audience — and the local-first audience is exactly the one the post targets.
