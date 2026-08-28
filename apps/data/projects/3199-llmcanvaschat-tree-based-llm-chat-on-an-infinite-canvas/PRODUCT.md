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

## Value Proposition

No one thinks linearly, yet current LLM interfaces still force you to, and it sucks.So I built llmcanvas.chat. The name says it all; you can branch, regenerate across models and compare: all in one infinite canvas.Every prompt and response is a node in the canvas and it brings ultimate flexibility on how you interact with the LLM, while keeping the old-school way of chatting linearly.Bring your own keys, 4 providers supported: Anthropic, OpenAI, Gemini, and OpenRouter.Try it: llmcanvas.chat. I'd love to hear your feedback.

**One-liner:** A canvas-first LLM chat where prompts and responses are draggable nodes you can branch, regenerate against multiple models, and compare side-by-side — with bring-your-own-keys support for Anthropic, OpenAI, Gemini, and OpenRouter and a linear-chat fallback when you do not need the canvas.

## Target Users

- Primary: power LLM users who want to branch a conversation when an answer goes off-track, regenerate the same prompt against a different model, and compare results without juggling browser tabs.
- Secondary: users who already pay for one or more of the four named providers and want a single canvas that uses their own API keys across all of them.

## Jobs To Be Done

1. Functional — branch from any node, regenerate that branch against multiple models, and place the results side-by-side so the user can compare.
2. Emotional — escape the "linear chat interfaces suck" feeling the author names, where the only way to compare is to open parallel tabs and stitch screenshots together.
3. Social — share a canvas with another user so the comparison and the branches are visible to both, not just described in a long paste.

## Success Metrics

- Canvas re-use: how many sessions end up with a branched node graph rather than a single linear thread (signals the canvas is actually being used, not just sitting empty).
- Cross-model regeneration usage: what fraction of regenerations go to a different provider, not the same one.
- Linear-mode fallback rate: how often the user drops back to plain linear chat; if this is high, the canvas is getting in the way and needs simplifying.

## Pricing & Monetization

Not stated in the source. The poster lists four bring-your-own-key providers and does not mention any pricing, plan, or hosted-side billing.

## Competitive Landscape

Not stated in the source. The post names the four providers but does not name any other canvas-style LLM chat tool.

## Risks & Open Questions

- Provider drift: the four named providers (Anthropic, OpenAI, Gemini, OpenRouter) each change their APIs and key formats; the BYOK layer has to track those changes per provider.
- API key handling: storing user keys locally and not accidentally sending them to a server is a hard correctness and trust problem; the MVP cannot leak keys through any logged request.
- Canvas performance at scale: "infinite canvas" with hundreds of nodes and live-streaming responses is a UI engineering problem; lag or dropped frames will drive users back to linear chat.
- The "keep the old-school way of chatting linearly" promise means a second interaction model the user can switch into; if the linear mode is half-finished, it will be the canvas users first complain about.
