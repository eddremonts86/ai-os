---
id: "4211"
slug: we-tried-to-recover-blurred-pixelated-and-redacted-text
title: "We tried to recover blurred, pixelated and redacted text (480 cases)"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508614"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# We tried to recover blurred, pixelated and redacted text (480 cases)

## Value Proposition

A 480-case empirical study that quantifies how much blur is needed to stop an attacker from reading back sensitive text from a screenshot, plus a 100%-local blur tool that defaults to solid-box redaction — the only treatment that leaked nothing in the study.

## Target Users

- Security teams producing screenshots and recordings for documentation
- Support agents sharing screen recordings with customers
- Engineers posting screenshots to GitHub issues or Slack
- Anyone who has shared a "blurred" screenshot and wondered if it was safe

## Jobs To Be Done

- When I share a screenshot, I want a tool that defaults to solid-box redaction so I do not accidentally leak a card number or API key
- When I am tempted to use a "blur", I want a parametric rule tied to font size so I know if it actually works
- When I want to verify the study, I want the dataset and code under CC-BY so I can re-run it

## Success Metrics

- 100,000 weekly active users of the blur tool within the first quarter
- Zero reported leaks from a default solid-box export
- Study cited in security guidelines within 6 months

## Pricing & Monetization

_TODO:_ source did not state a price. The site is free; the underlying tool is free; the study is CC-BY. Possible Pro tier for teams or for an SDK.

## Competitive Landscape

- Screenshot tools with built-in blur (CleanShot X, Cleanshot) — UX over correctness
- Open-source redaction libraries (OpenCV, ffmpeg) — easy to misuse
- Manual blur in Photoshop — frequently wrong radius
- Security awareness training — anecdotal, not parametric

## Risks & Open Questions

- Parametric rule is for known font / size / position; real attacks may be stronger
- JPEG recompression is one of many downstream paths (Slack, Discord, screenshots)
- Local tool may be bypassed by users who pick a blur treatment
- Study does not cover video redaction; only still images