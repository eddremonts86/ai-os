---
id: "2532"
slug: hands-rust-mcpcli-that-sees-the-windows-desktop-and-cli
title: Hands-Rust MCP/CLI that sees the Windows desktop and clicks real Chrome
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49405405"
category: show-hn
date: "2026-08-23"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Hands-Rust MCP/CLI that sees the Windows desktop and clicks real Chrome

## Problem

I built Hands because I wanted a coding agent to use this Windows PC and a real Chrome profile the way I do: look at the screen, move the real mouse, type, click , without turning Chrome into an automation browser.It is a Rust MCP/CLI. A harness (Grok, Codex, Claude Code, OpenCode, etc.) calls tools like observe, click, type, scroll. Observe is a screenshot path plus a small element list (UIA + optional Chrome DOM ids). Click is OS SendInput on a Bézier path, not a Chrome DevTools click.There is no Playwright, no Puppeteer, no remote debugging port. Daily Chrome is launched with no extra flags, or attached if it’s already open. Sites that key on CDP/automation flags mostly don’t see that. They can still see injected input (LLMHF_INJECTED).A tiny unpacked Chrome extension can fuse page structure (chr: ids, listing cards) so the model isn’t guessing from pixels. Sideload is manual. Fusion dies if the service worker goes inactive; reload the card.What it is good for: personal research on your own desk. “Find a Camry on cars.com,” read a page, fill a ZIP, dismiss a cookie banner.What it is not:
• Not a sandbox. It can click whatever is on screen, including checkout and Easy Apply.
• Confirm-before-money is best-effort classification in the binary, not a guarantee. Prompt injection from the screenshot/DOM is real; the binary treats that text as untrusted, the model might not.
• Not a CAPTCHA solver on daily Chrome. Two visible tries, then it yields and waits for the puzzle to go away.
• Windows only.
• Install is: build the exe, register a native-messaging host, sideload the extension, point an MCP client at hands mcp. README is the runbook. Missing an API key does not fail the build; do_task is optional.
• Logs live under %LOCALAPPDATA%\hands\logs\. The extension asks for so it can map the tab you’re looking at.Repo: https://github.com/Ryan-AI-Studios/hands (MIT)Happy to answer how observe/fusion/the fence work. If you try it, Pause/Break is the kill switch.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
