---
id: "3821"
slug: turn-your-github-activity-into-a-receipt
title: Turn your GitHub activity into a receipt
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494693"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [GitHub REST API integration, receipt-style rendering, web service, OAuth authorization, shareable artifact generation, multi-platform stat adapters]
---
# Turn your GitHub activity into a receipt

## Problem

The capture is a URL-only Show HN by sleepy_duck pointing at receipthub.io/github; the post text is just the link, so the product claim is the title. The linked page reads "Your GitHub activity, itemized" and points visitors at sister pages for Chess.com, Lichess.org and Last.fm stats — so the service is ReceiptHub, and the GitHub path is one of several platform adapters that render a user's activity as an itemized receipt. The joke is the medium: the familiar receipt format (itemized lines, totals, store header) applied to contributions, commits, streaks or whatever activity metrics the adapter pulls, turning a developer's year of work into something that looks like a grocery till printout. The capture contains no feature list, no pricing and no technical detail; the multi-platform adapter family is the only structural fact beyond the GitHub title.

## Objective

Build the GitHub receipt as the flagship adapter of ReceiptHub: pull a user's GitHub activity via the API, itemize it into receipt lines, and render a shareable receipt — with the Chess.com, Lichess.org and Last.fm pages as proof the adapter pattern repeats.

## Target Users

- Developers who want a playful, shareable summary of their GitHub year.
- Social-media posters who share wrapped-style stats in a novel format.
- ReceiptHub itself: GitHub is the funnel into the other platform adapters.

## MVP Scope

- GitHub authorization (OAuth) to read a user's activity.
- Activity ingestion via the GitHub REST API (contributions, repos, commits or events).
- Itemized receipt rendering: lines, quantities, totals, store-style header.
- Shareable output (image or link).
- Cross-links to the Chess.com, Lichess.org and Last.fm adapters shown on the page.

## Constraints

- The capture is a title plus a one-line page; the exact metrics itemized are unverified and must stay flexible in the plan.
- GitHub API rate limits and token scopes bound what the receipt can show.
- "Activity" is ambiguous (commits vs contributions vs events); the MVP must pick a defensible definition and state it.
- No pricing or data policy appears anywhere in the capture.

## Design Direction

See `DESIGN.md` for this project's design tokens.
