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

## Problem

The poster believed for the duration of their subscription that the $200 Claude plan delivered roughly 4x the usage of the $100 plan. In reality the multi-hour-or-daily multiplier applies only to the rolling 5-hour window, not to the weekly cap — so a heavy week still hits the weekly limit on the same schedule as the $100 plan, just with more burst headroom in any 5-hour slice. The poster flags that nearly every subscriber appears to have misread the offer in the same way, points to a public tweet that surfaced the issue, and notes an active lawsuit alleging false advertising around Claude Max subscription usage limits. The downstream effect is that subscribers paid for capacity they did not receive on a weekly basis, and the only place to discover the gap is by hitting the wall during a heavy week.

## Objective

Surface the gap between advertised multiplier framing and weekly-cap behaviour so that any prospective or current Claude Max subscriber can make the call with eyes open, and so the framing in marketing copy vs dashboard copy can be compared at a glance.

## Target Users

Current or prospective Claude Max subscribers who want to understand whether the higher tier buys them a higher weekly cap or only higher burst headroom. Secondary reader: anyone writing or reviewing AI subscription comparison content who needs to point at a concrete disambiguation.

## MVP Scope

A short write-up that restates the issue, links the primary tweet and the lawsuit coverage, contrasts the 5-hour-window behaviour with the weekly-cap behaviour, and lists the actual visible signals a subscriber can use to tell which cap they are hitting (header text, reset countdown, throttling message). No new product, no subscription manager.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The post gives one tweet and one lawsuit URL as evidence; the underlying Anthropic billing-internal logic is not disclosed in the source, and any specific weekly-cap number quoted must come from outside the post or be left labelled as unknown. The post also does not quantify how much real-world usage difference the misunderstanding has cost subscribers, so any financial-impact estimate is outside the source.