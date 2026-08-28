---
id: "3389"
slug: rook-a-multi-agent-harness-that-lives-100-in-a-browser-
title: "Rook – A multi-Agent harness that lives 100% in a browser extension"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49456492"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [JavaScript, Chrome MV3 extension APIs, OPFS, Web Workers with embedded SQLite (wa-sqlite), Chrome extension sandbox API, optional companion PWA]
---

# Rook – A multi-Agent harness that lives 100% in a browser extension

## Tech Stack

JavaScript modules loaded directly by the Chrome MV3 service worker (no Node runtime on the hot path); Chrome MV3 extension APIs for permissions, host controls, alarms and the sandbox; OPFS for the per-extension private filesystem; Web Workers hosting agents with wa-sqlite (WASM) as the per-agent durable store and address registry; the Chrome extension sandbox API as the safe-JS execution boundary; React + Vite for the extension popup and options UI; a tiny companion PWA (vanilla JS + service worker) for the optional captcha-relay path; Slack and Discord WebSocket adapters for channels.

Justification: the post's whole pitch is that the agent lives 100% in a Chrome MV3 extension with no backend, so the stack is the smallest set of browser primitives the author names — MV3, OPFS, Web Workers, sandbox API, alarms, WebSocket — plus an embedded SQLite for durable memory; the legacy Node/TanStack/Coolify default would force a backend the post explicitly forbids.

## Architecture

A Chrome MV3 extension whose service worker spawns one Web Worker per agent address. Each worker owns a wa-sqlite database and a unique address that survives service-worker kills — that address is the durable-object analogue the author rebuilt in JavaScript. Execute and bash code paths run inside the Chrome extension sandbox API, so the model can author arbitrary JS safely. File operations read and write to an OPFS mount, with user-granted File System Access directories overlay-mounted on top so the agent can copy files across the user's real filesystem. Browser automation is Playwright/WebMCP code authored by the model inside the same sandbox. The alarms API schedules recurring routines on the user's behalf. Slack and Discord gateways open outbound WebSockets from the extension to the user's workspace tokens, deserialising inbound messages into tool calls. The optional companion PWA opens a WebSocket to the extension and relays captchas so a phone user can keep a long-running task moving.

## Milestones

- **M1 — Agent runtime:** Web Worker host, wa-sqlite address model, execute and bash tools wired, MV3 manifest that installs and survives service-worker restarts.
- **M2 — Browser primitives:** OPFS isolation, File System Access directory mounts, extension sandbox API execution, alarms API for scheduled routines.
- **M3 — OpenAI provider:** ChatGPT subscription path and OpenAI API key path, model-side tool selection, prompt plumbing.
- **M4 — Browser use:** model-authored Playwright/WebMCP code in the sandbox, Chrome Enterprise host controls as the upper bound.
- **M5 — Channels:** Slack and Discord WebSocket adapters so the extension can be pinged without a backend.
- **M6 — Companion PWA:** remote-control PWA, captcha relay, decision on whether to gate it behind payment.

## Risks

MV3 memory and runtime caps still force long sessions to checkpoint through the SQLite layer or they will lose progress; the sandbox API plus Chrome Enterprise host controls must be configured together or the model can exfiltrate via allowed hosts the user didn't intend; Slack and Discord WebSocket connections drop when the extension unloads and need a reconnect strategy that doesn't drift agent state; OpenAI-side rate limits and policy changes ripple directly into the user experience because there is no backend buffer; pricing the PWA companion risks a store-policy review for remote-control surfaces and the author has not yet decided.