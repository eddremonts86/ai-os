---
id: "3810"
slug: scripttap-no-root-android-automation-with-an-ai-script-
title: ScriptTap – no-root Android automation with an AI script contract
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496001"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Android automation engine, JSON script contract, AI agent integration, ADB bridge, image and pixel screen matching, Tasker intent interop]
---
# ScriptTap – no-root Android automation with an AI script contract

## Phase 0: Scaffold

- [x] Read the Show HN post to extract the contract, ADB bridge and interop claims
- [x] Write SPEC.md (this document)
- [x] Define the .scripttap.json schema and document it as the contract AIs target
- [x] Skeleton the Android app with an import dialog for script files

## Phase 1: Core

- [ ] Implement the script interpreter: taps, text entry, waits, conditions, files, variables
- [ ] Build image location and UI-element finding primitives
- [ ] Add pixel-color change detection and the capture-analyze-act loop
- [ ] Expose the ADB bridge for push, run, inspect and refine from coding agents
- [ ] Add detailed run logs per execution

## Phase 2: Deploy

- [ ] Publish home-screen shortcut export and deep-link and intent invocation
- [ ] Verify end-to-end against Tasker, MacroDroid, Automate and Samsung Routines
- [ ] Stress-test a workflow at the author's scale (roughly 5,000 commands) and publish the results
