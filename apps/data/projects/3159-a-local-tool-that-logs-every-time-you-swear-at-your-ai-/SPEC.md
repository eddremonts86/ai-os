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

## Problem

The poster open-sourced biomass-conversion-index-monitoring-system (github.com/fireinbelly/biomass-conversion-index-monitoring-system), a local tool that logs every time the user swears at their AI coding assistant. The HN post body gives no further detail beyond the repo.

## Objective

Log, locally, every time the user swears at their AI coding assistant: a tongue-in-cheek 'frustration counter'.

## Target Users

Developers who want a private, local-only record of how often their AI coding assistant is making them swear.

## MVP Scope

Local CLI that captures audio or watches the terminal, detects expletives, and appends a timestamped log entry.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Audio-based detection on a laptop mic raises obvious privacy concerns in shared spaces.
