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

## Problem

The author has worked on Rook on and off for about a year and considers it stable enough to release. It has only two tool sets — an execute tool for arbitrary code and a bash tool — and both run 100% in the browser. As of release it is free, and users can connect a ChatGPT subscription or an OpenAI endpoint. There is an optional companion PWA that lets the user drive the extension from a phone and relay captchas, which the author might charge for later; the extension itself has no backend and collects no data. The hard part was MV3, which limits how long or how heavy an extension can run, so the author rewrote the durable-object pattern in JavaScript: each "agent" is a Web Worker with an embedded SQLite database and a unique address, so the agent can recover from the service worker being killed at any moment. Because the agent lives inside a Chrome extension, the author does not have to solve identity (it inherits the Chrome profile, optionally sandboxed via Chrome Enterprise), file system isolation (each extension gets its own OPFS mount, with user files attached through File System Access), sandboxing (the extension sandbox API lets the model author arbitrary JS safely, with Chrome Enterprise controlling allowed hosts), browser use (the model writes Playwright and WebMCP code in the sandbox, which is what SOTA computer-use harnesses do), scheduling (the alarms API supports recurring routines), or channels (Slack and Discord connect to the extension over WebSocket, so no proxy or backend is needed). The post notes the author chose MV3 specifically because a browser is the most "memory-safe sandbox most people already have" and because the author did not want to ship or operate a backend.

## Objective

Deliver a browser-resident multi-agent harness that competes with hosted computer-use products on capability while inheriting Chrome's identity, storage, sandbox and scheduler primitives, so users get a fully capable coding and computer-use agent without standing up their own backend or surrendering control of their data.

## Target Users

Power users and indie developers who already subscribe to ChatGPT or hold an OpenAI API key, are comfortable installing a Chrome extension as a runtime, and want their agent workflow to stay local. A second segment is the same user on mobile, reached through the optional companion PWA for remote captcha-clicking and light steering.

## MVP Scope

Ship the two core tools (execute and bash) running inside the extension Web Worker with a wa-sqlite-backed per-agent address; integrate both the ChatGPT subscription and OpenAI API key providers; enable OPFS-based file isolation with File System Access directory mounts; expose Playwright/WebMCP browser use inside the sandbox; wire Slack and Discord as direct WebSocket channels to the extension; and add the optional PWA for remote captcha-clicking and phone steering.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Must remain a pure MV3 extension with no backend and no data collection; must survive MV3 service-worker restarts deterministically via the embedded SQLite + Web Worker address model rather than external infrastructure; must respect MV3 memory and runtime caps; sandboxing must be enforced by the Chrome extension sandbox API plus Chrome Enterprise host controls; everything the agent writes to disk must live inside its private OPFS unless the user explicitly mounts a File System Access directory.
