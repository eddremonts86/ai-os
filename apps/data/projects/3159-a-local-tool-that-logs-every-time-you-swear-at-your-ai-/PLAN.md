---
id: "3159"
slug: a-local-tool-that-logs-every-time-you-swear-at-your-ai-
title: A local tool that logs every time you swear at your AI coding assistant
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447045"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# A local tool that logs every time you swear at your AI coding assistant

## Tech Stack

Local CLI in Rust or Go (single static binary).
Append-only JSONL log on the user's machine.
Pluggable word lists so users can edit what counts as 'swearing'.

## Architecture

Single-process deliverable: Local CLI that captures audio or watches the terminal, detects expletives, and appends a timestamped log entry.

## Milestones

MVP local CLI with terminal/keystroke-based detection (not audio).

## Risks

Audio-based detection on a laptop mic raises obvious privacy concerns in shared spaces.
