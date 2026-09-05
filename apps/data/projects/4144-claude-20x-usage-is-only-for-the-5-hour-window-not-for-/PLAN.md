---
id: "4144"
slug: claude-20x-usage-is-only-for-the-5-hour-window-not-for-
title: "Claude 20x usage is only for the 5 hour window, not for the weekly limit"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509882"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Claude 20x usage is only for the 5 hour window, not for the weekly limit

## Tech Stack

Static documentation page rendered with the existing TanStack Start stack. No backend, no database, no auth. Markdown source for the body so the disambiguation can be revised if Anthropic changes either pricing or caps.

## Architecture

One page, one document. The page renders the restated issue, the linked evidence (tweet, lawsuit coverage), a short comparison of 5-hour window vs weekly cap, and a list of dashboard signals a subscriber can use to identify which cap they are hitting. No client-side state.

## Milestones

Draft the disambiguation text, embed the tweet and lawsuit links with full attribution, list the dashboard signals (header text, reset countdown, throttling message) without inventing exact numbers, publish the page, link it back to the HN thread.

## Risks

Risk that the post's framing ages quickly: any Anthropic-side change to the 5-hour window or weekly cap would invalidate the page. Mitigate with a date stamp and a clear "as of" note. Risk that the page reads as legal commentary when it is not; the page stays descriptive and links the lawsuit URL rather than asserting claims about it.