---
id: "3029"
slug: turtle-web-browser-written-from-scratch-for-2-years
title: Turtle – Web Browser written from scratch for 2 years
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49340294"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# Turtle – Web Browser written from scratch for 2 years

## Problem

A solo developer posted their browser-engine project on Hacker News, then held back a public download for several weeks despite "lots of messages asking the download link." They finally released a pre-alpha build because the email volume kept growing. The post is candid about the state of the software: "Expect bugs, missing features, and crashes. Plenty of the web will render imperfectly or not at all. This is an early look, not a daily driver." The build is hosted at code.intellios.ai/cwbrowser and the work spans two years of single-author development.

The post does not name a specific user pain, does not name a customer, does not state a willingness-to-pay, and does not compare Turtle to existing browsers (Chromium, Firefox, Safari). What it does state: a real download exists, the project is openly called pre-alpha, and the author has been building a browser engine solo for two years.

## Objective

The build exists. The post's explicit objective is to make the pre-alpha download available and invite early feedback. Anything beyond that — stable releases, paying customers, an MVP scope — is not stated by the author and is left as out of scope here rather than invented.

## Target Users

The post does not state target users. People who asked the author for the download link by email are the only group the source names, which is too thin to call an audience. The plan does not invent one.

## MVP Scope

- Pre-alpha browser build available for download at code.intellios.ai/cwbrowser (already live per the post).
- Explicit statement in the post that bugs, crashes, and broken renders are expected — there is no promised stability target.
- No roadmap, no feature list, no promised integrations, no business outcomes. The MVP the post defines is "an early look, not a daily driver."

## Design Direction

See `DESIGN.md` for project tokens.

## Out of Scope

- Positioning vs Chromium, Firefox, or Safari — the post makes no such claim.
- Pricing, monetization, or customer type — the post does not state any.
- A "what is a browser-engine" educational layer — the post is not pitched at newcomers.

## Constraints

- Pre-alpha state is named in the post itself; the plan does not promise stability, conformance, or feature parity with shipping browsers.
- Two-year solo codebase with no co-maintainers, no roadmap, and no support channel stated in the post.
- The post is the source. Anything not stated by the author (target users, pricing, success metrics, comparisons) is left out of scope here rather than invented.
