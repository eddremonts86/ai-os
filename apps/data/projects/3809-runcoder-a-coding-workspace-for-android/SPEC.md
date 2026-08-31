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

## Problem

The capture is a URL-only Show HN by harshal_shinde that points straight at the RunCoder listing on Google Play; the post itself carries no description beyond the title. What the linked listing states is a mobile coding IDE for Android: write, run and manage code entirely from a phone, covering C, C++, Java, Python, HTML, CSS and JavaScript. Execution is cloud-based ("online code execution"), so programs compile and run without a traditional computer, with results shown in a built-in Terminal. The listing also describes 385+ ready-made coding templates across four difficulty levels, a workspace with multi-file management and imports from Downloads, WhatsApp, Telegram and email attachments, and a student focus summed up as "Code Anywhere. Learn Faster. Build More." A paid RunCoder Pro tier removes ads, unlocks pro templates, ten extra fonts and unlimited executions, and grants early access to upcoming AI features; the roadmap names an AI Coding Assistant, smart suggestions and GitHub integration. The only comment on the thread asks which C++ version the app actually runs, which the capture does not answer.

## Objective

Turn the store-listed app into a product plan with a defensible core: a phone-first coding workspace whose MVP is the listed feature set (editor, cloud execution, templates, workspace) and whose named roadmap items (AI assistant, GitHub integration) become later milestones rather than launch promises.

## Target Users

- Engineering students doing college practicals and assignments who do not want to carry a laptop.
- Beginner programmers learning C, C++, Java or Python who only have an Android phone.
- Hobbyists who want a quick sandbox to test an idea or run a template experiment.

## MVP Scope

- Code editor with syntax highlighting, multiple open files and customizable fonts.
- Run button wired to the online execution backend, with output in the built-in terminal.
- 385+ templates browsable by language and difficulty, editable and runnable in place.
- Workspace file management: create, open, import (Downloads, WhatsApp, Telegram, email), rename, delete.
- RunCoder Pro tier with the listed benefits (ad-free, pro templates, fonts, unlimited executions).

## Constraints

- Verification is limited to the Play listing text and the one-line HN post; there is no source code or architecture description to check.
- Cloud execution means the phone is a client to a compiler backend; offline or self-hosted execution is not part of the stated design.
- The C++ version question raised in the thread is unanswered in the capture and must stay unresolved in this plan.
- Honesty about claims: template counts, language support and Pro benefits are the listing's own statements, not independently measured.

## Design Direction

See `DESIGN.md` for this project's design tokens.
