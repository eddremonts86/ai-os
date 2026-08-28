---
id: "1133"
slug: releasaurus-software-versioning-and-release-automation-
title: Releasaurus – software versioning and release automation tool
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49351178"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Releasaurus – software versioning and release automation tool

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built Releasaurus after struggling with limitations of existing tools.- release-please: only works on github- releaser-pleaser: no support for monorepos- release-plz: rust projects only- git-cliff: changelog only, no tagging, no releasingReleasaurus works entirely through forge APIs, so no local clone is required, or git for that matter. Although it does offer an optional hybrid mode that will use a locally cloned repo for git operations and forge API calls for PR and release creation.Here are some features I included:- Supports Github, Gitlab, Gitea, Forgejo (Codeberg), AzureDevops (experimental)- Monorepo support with independent versioning for each configured package- Customizable CHANGELOG.md generation- Customizable Release notes- Choose from semantic or date based versioning strategies - Semantic: "x.x.x" Uses conventional commits standard to analyze commits

 - Date: `year.month.day-time`

- Customizable prerelease strategies - versioned: "x.x.x-."

 - static: "x.x.x-"

- Explicit support for version file updates for the following languages - Go

 - Java

 - Node (supports workspaces)

 - Php

 - Python

 - Ruby

 - Rust (supports workspaces)

There are a handful of commands you can use to automate your releases. Here are
a few:- release-pr: analyzes commits and generates a release PR for review- release: finds merged release PRs, tags the appropriate shas, and generates Releases for the target forge- release-direct: Combines all analysis, committing, tagging, and releasing into a single flow and skips generating release PR for review- get next-release: outputs json for the upcoming projected release - useful for generating notification prior to release- get recompiled-notes: feed modified json from "get next-release" back in to regenerate changelog notes. Can also be useful for generating notifications.GitHub: https://github.com/robgonnella/releasaurusDocs: https://releasaurus.rgon.ioHappy to answer questions

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49351178) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
