---
id: "3771"
slug: deepseekgui-a-windows-desktop-client-for-deepseeks-codi
title: "DeepSeekGUI – A Windows desktop client for DeepSeek's coding agent"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488865"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Electron, Node.js sidecar for the sandboxed terminal, Microsoft Edge WebView2 for the embedded browser, electron-builder for the Windows installer, PolyForm Perimeter licence]
---
# DeepSeekGUI – A Windows desktop client for DeepSeek's coding agent

## Tech Stack

TypeScript, Electron, Node.js sidecar for the sandboxed terminal, Microsoft Edge WebView2 for the embedded browser, electron-builder for the Windows installer, PolyForm Perimeter licence.

## Architecture

Electron main process owns the window, tray, and installer. The official Harness Web UI runs in an embedded view. A sandboxed terminal is a separate child process bridged over IPC. The visible browser panel is an Edge WebView2 control.

## Milestones

- **M0:** SPEC + DESIGN approved.
- **M1:** Electron shell + Harness Web UI embed.
- **M2:** System tray + sandboxed terminal + browser panel.
- **M3:** Windows installer + PolyForm Perimeter release.

## Risks

- PolyForm Perimeter: confirm distribution and commercial-fork clauses before scale.
- Edge WebView2: shipped with recent Windows; need a fallback for older Windows.
- Sandboxed terminal: child-process isolation must be air-tight.
- V2 custom workbench is a scope risk; V1 must stay small.
