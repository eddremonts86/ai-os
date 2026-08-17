---
id: "2434"
slug: what-are-githubs-push-farm-botnets-for
title: "What are GitHub's push-farm botnets for?"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49270205"
category: ask-hn
date: "2026-08-12"
tags: [Ask HN, Problem]
---
# What are GitHub's push-farm botnets for?

## Problem

Every hour GH Archive records ~160K public GitHub events, and right now ~64% of the pushes are spam. Thousands of auto-created accounts (word+digits usernames like smithhoward5868, gibberish repo names) push hundreds of times an hour to fresh repos, 24/7. One repo, LiamBruhin/SillyStuff, pushed 690 times in a single hour from ONE actor, and has kept that up for 13+ hours straight.I built a live radar that had to detect these farms to rank honestly, and I've been tracking them for 34 hours. Live: https://github-pulse.surge.sh — full writeup with charts and the farm ledger: https://github-pulse.surge.sh/report.html — open-source single script: https://github.com/Atheistam/github-pulseBut I genuinely don't know what they're FOR. No stars, no forks, no issues, no PRs, no meaningful README — just endless pushes to fresh gibberish repos. SEO? GitHub Actions reselling? Training-data poisoning? Has anyone seen this pattern before, or does anyone know what the endgame is?

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
