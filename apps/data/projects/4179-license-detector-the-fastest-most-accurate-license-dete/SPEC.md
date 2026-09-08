---
id: "4179"
slug: license-detector-the-fastest-most-accurate-license-dete
title: "License Detector – the fastest, most accurate license detection tool"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510297"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# License Detector – the fastest, most accurate license detection tool

## Problem

At a previous job (Shogun), the author was handed a compliance task: collect every LICENSE file across the codebase to confirm legal compliance. It required multiple CLI tools, merging their results, and manual verification. Years later, the author shipped License Detector: a tool that detects licenses across 21 ecosystems (basically every major language), free for any open/public repo on the web app. The CLI is also free; benchmarks included in the repo show the tool is ~80x faster than licensee and matches or beats askalono and scancode-toolkit on accuracy.


---

## Objective

Detect every license in a repository across 21 language ecosystems in one pass, fast enough to run in CI, and accurate enough that compliance teams do not have to double-check by hand.


## Target Users

Software compliance teams and engineering teams that need a fast, accurate inventory of licenses across a multi-language repo. Assumes the team is comfortable running a CLI or installing a GitHub App.


## MVP Scope

- Detection across 21 ecosystems covering basically every major language.
- Web app that runs the detector on any open/public repo for free.
- Free CLI (`go install go.licensedetector.com/cmd/license-detector@latest`).
- GitHub App integration.
- Published benchmarks comparing against licensee, askalono and scancode-toolkit.
- ~80x speed improvement over licensee's existing CLI is part of the value claim.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Free for open/public repos on the web app; paid or hosted-license model for private repos is not detailed in the source.
- Accuracy claims are presented against three named incumbents; those benchmarks are included in the repo.
- Speed claim (~80x faster than licensee) is part of the marketing surface and should be verifiable in the published benchmarks.
- Source does not state pricing for the CLI or for private repos.

