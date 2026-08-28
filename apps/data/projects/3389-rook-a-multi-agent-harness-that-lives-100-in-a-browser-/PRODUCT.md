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

Rook is a multi-agent harness whose runtime lives entirely inside a Chrome MV3 extension, with no backend and no data collection. By inheriting Chrome's identity, file-system, sandbox, scheduler, alarm and WebSocket-channel primitives, it sidesteps the infrastructure each of those layers would otherwise demand and keeps the agent local to the user's profile — opt in to a remote PWA only when phone-driven captcha-clicking is needed. The two tool sets — execute and bash — both run in the extension sandbox, and the durable-object memory is rebuilt from scratch on top of Web Workers plus an embedded SQLite per agent.

**One-liner:** a fully capable coding and computer-use agent that rents Chrome's identity, storage, sandbox and scheduler primitives instead of standing them up itself.

## Value Proposition

Rook delivers a fully capable coding and computer-use agent that runs entirely inside a Chrome MV3 extension. Identity comes from the user's Chrome profile (with optional Chrome Enterprise sandboxing), file isolation comes from OPFS plus File System Access mounts, sandboxing comes from the extension sandbox API plus Chrome Enterprise host controls, browser use comes from model-authored Playwright and WebMCP code, scheduling comes from the alarms API, and Slack/Discord come in over WebSocket — so the agent inherits primitives that would each otherwise be a backend of their own. The only paid surface the author flags today is the optional companion PWA for remote captcha-clicking from a phone.

## Target Users

Power users and indie developers who already subscribe to ChatGPT or hold an OpenAI API key, are comfortable installing a Chrome extension, and want their agent workflow to stay local to their machine. The optional PWA reaches the same user on mobile for captcha relay and light steering from the phone.

## Jobs To Be Done

When I want to run coding or computer-use tasks, give me an agent I can trust with my files and identity without standing up a backend; when my extension restarts or I switch agents, let me pick up exactly where I left off; when I want to drive the agent from my phone, let me click captchas through a PWA over WebSocket; when I need browser automation, let the model write Playwright and WebMCP code in the sandbox; when I want to run routines, schedule them through the extension's alarms API.

## Success Metrics

Number of agents installed and active on user profiles; share of agent sessions that survive MV3 service-worker restarts without state loss (the post's own durability bar); time from extension install to first task; share of sessions that lean on the optional PWA for remote control; retention measured in tasks per week per active install.

## Pricing & Monetization

The post states Rook is free to use today and the extension itself has no backend and no data collection. The author explicitly flags that the optional companion PWA — used to drive the extension from a phone and click captchas — is the surface they "might charge for in the future". Any paid tier would be on the PWA companion, not on the extension.

## Competitive Landscape

Rook sits next to hosted computer-use products that require a backend and ship user data off-machine, and next to local agent harnesses that still depend on a server runtime for durability, file isolation, scheduling or channels. Its differentiator is that the entire harness — identity, file isolation, sandboxing, scheduler, browser use, channels — is rented from Chrome MV3 instead of built and operated, which the post frames as the reason a memory-safe sandbox that "most people already have" lets the author skip standing up a backend.

## Risks & Open Questions

MV3 service-worker memory and runtime caps can still force long sessions to checkpoint via the SQLite layer or risk losing progress; the optional captcha-clicking PWA may run into store-policy friction if it ever becomes paid; relying on the OpenAI/ChatGPT surface area means model-side rate limits and policy changes affect UX directly; Slack/Discord WebSocket connections drop when the extension unloads and need a reconnect strategy that doesn't drift agent state; Chrome Enterprise is the upper bound on host controls, so a misconfigured enterprise policy could expose the model to broader web access than the user expects; pricing the PWA companion is an open question the author raised themselves.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49456492) · **Category:** show-hn · **Tags:** Show HN,Product,Problem