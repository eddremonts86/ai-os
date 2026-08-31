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

## Phase 0: Scaffold

- Scaffold the Electron app with the embedded Harness Web UI.
- Add the system tray icon with quick actions.
- Wire the sandboxed terminal child process with IPC.
- Add the Edge WebView2 browser panel; fall back gracefully on older Windows.
- Implement the API-key prompt and one-click installer.
- Document the PolyForm Perimeter licence obligations in the README.
- Hand-test on Windows 10 and Windows 11.

## Phase 1: Core

- All MVP Scope items shipped end-to-end.
- User can install, enter an API key, and use the harness from the desktop app.
- System tray, browser panel, and sandboxed terminal work without crashes.
- PolyForm Perimeter licence is correct in the repo.
- Test coverage on the IPC bridge and the browser-panel lifecycle.

## Phase 2: Deploy

- Publish the installer behind an auto-update channel.
- Solicit feedback on what the V2 custom workbench should replace.
- Document the build pipeline so a fork maintainer can rebuild the installer.
- Plan the macOS / Linux V2 once the Windows variant is stable.
