---
id: "3809"
slug: runcoder-a-coding-workspace-for-android
title: RunCoder – A Coding Workspace for Android
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496003"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Android mobile IDE, Kotlin, online code execution API, terminal emulator, C/C++/Java/Python template library, Play Store subscriptions]
---
# RunCoder – A Coding Workspace for Android

## Tech Stack

Inferred from the listing's stated behavior, not from source code, which the capture does not include.

- **Android app:** a native Android client (Kotlin is the default assumption for a modern Play Store IDE app) hosting the editor and workspace UI.
- **Online code execution API:** the compile-and-run backend the listing calls "online code execution", reached over HTTP from the app.
- **Built-in terminal emulator:** renders stdout and stderr from the execution service inside the app.
- **Template library:** 385+ stored programs in C, C++, Java, Python, HTML, CSS and JavaScript, served to the client.
- **Play Store subscriptions:** Google Play Billing for the RunCoder Pro tier (ad-free, unlimited executions).
- **File import paths:** Android document pickers over Downloads, WhatsApp, Telegram, email attachments and the file manager.

## Architecture

- **Editor workspace:** multi-file project tree, syntax highlighting and font settings, all client-side.
- **Execution client:** the Run button packages source into a request to the cloud compiler and streams output back to the terminal view.
- **Template catalog:** a browsable library (language, difficulty level) whose entries load straight into the editor.
- **Import layer:** picker-based intake of files from chat apps, downloads and mail into the workspace.
- **Pro gating:** a subscription check that toggles ads, template tiers, fonts and execution limits.

## Milestones

1. **M0 — Editor and workspace.** Syntax-highlighted multi-file editor with import paths working on a test device.
2. **M1 — Cloud execution loop.** Run compiles and executes C, C++, Java, Python, HTML, CSS, JavaScript and returns terminal output.
3. **M2 — Templates and Pro.** The 385+ template catalog browsable by language and difficulty; Play Billing gating Pro benefits.
4. **M3 — Roadmap features.** AI Coding Assistant and GitHub integration, the two features the listing names as coming.

## Risks

- **Backend cost without pricing:** unlimited Pro executions is an unbounded cost commitment unless execution quotas or pricing absorb it.
- **Runtime ambiguity:** the unanswered C++ version question suggests users cannot verify which compilers run their code.
- **Thin capture:** no source code, architecture or team information exists to validate maintainability.
- **Mobile UX ceiling:** typing and navigating code on a phone is the category's core constraint; the app lives or dies on editor ergonomics.
- **AI roadmap pressure:** advertising AI features before shipping them sets an expectation the MVP does not meet.
