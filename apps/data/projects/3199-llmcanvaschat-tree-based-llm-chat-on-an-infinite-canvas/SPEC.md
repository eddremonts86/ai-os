---
id: "3199"
slug: llmcanvaschat-tree-based-llm-chat-on-an-infinite-canvas
title: Llmcanvas.chat Tree-based LLM chat on an infinite canvas
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451733"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Llmcanvas.chat Tree-based LLM chat on an infinite canvas

## Problem

No one thinks linearly, yet current LLM interfaces still force you to, and it sucks.So I built llmcanvas.chat. The name says it all; you can branch, regenerate across models and compare: all in one infinite canvas.Every prompt and response is a node in the canvas and it brings ultimate flexibility on how you interact with the LLM, while keeping the old-school way of chatting linearly.Bring your own keys, 4 providers supported: Anthropic, OpenAI, Gemini, and OpenRouter.Try it: llmcanvas.chat. I'd love to hear your feedback.

## Objective

Build an LLM chat interface where every prompt and response is a node on an infinite canvas so the user can branch conversations, regenerate the same prompt against multiple models, and compare results side-by-side — while still being able to chat linearly when they want to.

## Target Users

1. Power LLM users who want to branch a conversation when an answer goes off-track, regenerate the same prompt against a different model, and compare what each model says without juggling browser tabs.
2. Curious users who already pay for Anthropic, OpenAI, Gemini or OpenRouter and want one canvas to use all four with their own API keys rather than being locked to a single provider.

## MVP Scope

- An infinite-canvas interface where each prompt and each response is a node the user can drag and connect.
- Branching from any node so the conversation forks instead of staying a single linear thread.
- Regeneration across multiple models with the results placed side-by-side for comparison.
- A "linear chat" mode that the user can fall back to when they want the old-school experience.
- Bring-your-own-keys support for the four providers named in the source: Anthropic, OpenAI, Gemini, and OpenRouter.
- Per-user API key storage so the keys are remembered between sessions.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The four providers named in the source (Anthropic, OpenAI, Gemini, OpenRouter) are the supported set for the MVP; do not add a fifth without a clear user request.
- API keys belong to the user; do not require a hosted proxy or a paid plan to use the user's own keys.
- Canvas interactions (drag, connect, branch) must stay smooth with hundreds of nodes, not just a handful.
- A linear-chat fallback mode must remain available so the canvas does not become a barrier for simple sessions.
