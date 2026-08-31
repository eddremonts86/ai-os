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

## Problem

The author built a desktop client for DeepSeek Harness, DeepSeek's open-source coding agent. V1 wraps the official Harness Web UI in an Electron shell with desktop additions — installer, system tray, built-in browser panel (visible Edge so the user can watch the agent browse), and a sandboxed terminal. One-click install with just an API key. V2 is in development and replaces the upstream Web UI with a custom workbench built for desktop. Source is under PolyForm Perimeter. The author wants feedback on what users want from a desktop coding agent client.

## Objective

Ship a Windows desktop client for DeepSeek Harness that turns the web harness into a first-class desktop application with a system tray, a visible browser panel for agent browsing, and a sandboxed terminal — then iterate on a custom workbench in V2.

## Target Users

1. **DeepSeek Harness user on Windows** — the primary user; wants the harness as a real desktop app, not a browser tab.
2. **Agent-builder on Windows** — wants to watch the agent browse the web in a visible side panel.
3. **Self-hoster / fork maintainer** — wants a desktop shell they can extend.

## MVP Scope

- Electron shell around the official Harness Web UI.
- One-click installer with the API key prompt.
- System tray icon with quick actions.
- Built-in browser panel that shows the agent's browsing in real time.
- Sandboxed terminal for harness commands.
- Source under PolyForm Perimeter.
- V2 stretch: replace the upstream Web UI with a custom workbench.

## Design Direction

See DESIGN.md for design tokens.

## Constraints

- Windows is the explicit target; macOS / Linux are out of scope for V1.
- Source under PolyForm Perimeter: redistribution is allowed; commercial forks need to read the licence carefully.
- The custom V2 workbench is a stretch; V1 ships with the wrapped web harness.
