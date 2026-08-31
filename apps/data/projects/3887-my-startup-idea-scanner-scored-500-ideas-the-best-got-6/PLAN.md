---
id: "3887"
slug: "my-startup-idea-scanner-scored-500-ideas-the-best-got-6"
title: "My startup-idea scanner scored 500 ideas; the best got 6.3/10"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497779"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [LLM scoring pipeline, Winnability scoring model, Market data retrieval, Solo-founder fit analysis, Vertex token metering]
---
# My startup-idea scanner scored 500 ideas; the best got 6.3/10

## Tech Stack

- **LLM scoring pipeline:** ideas are scored through a language-model pipeline on Vertex.
- **Winnability scoring model:** the scoring frame rebuilt after the false-confidence failure of v1.
- **Market data retrieval:** existing alternatives are assessed as part of winnability.
- **Solo-founder fit analysis:** scores are conditional on the user's stated background.
- **Vertex token metering:** per-scan cost accounting drives the free-versus-paid line.

## Architecture

- **Input layer:** user background, market and idea input enter the scanner.
- **Scoring layer:** the winnability model judges each idea against existing alternatives for that founder.
- **Output layer:** a small set of scored ideas, with the score distribution published as evidence.
- **Metering layer:** Vertex token usage per scan gates free versus paid access.

## Milestones

1. **M0 — Scored output.** Input, market and background yield 10 scored ideas.

2. **M1 — Winnability scoring.** The June scoring model replaces the false-confidence v1 scores.

3. **M2 — Free scan.** The account-free single scan works and converts to paid.

4. **M3 — Calibration.** The 500-idea distribution is analyzed to tune the model's harshness.

## Risks

- **Model calibration:** a median of 1.3 may be accurate or may be a too-pessimistic scorer; the author must distinguish the two.
- **Token economics:** Vertex costs per scan constrain pricing and free usage.
- **Trust:** the tool's credibility rests on the published distribution staying honest.
- **Niche demand:** founders who mostly hear no may not return for paid scans.
