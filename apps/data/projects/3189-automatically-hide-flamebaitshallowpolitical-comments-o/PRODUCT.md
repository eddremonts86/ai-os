---
id: "3189"
slug: automatically-hide-flamebaitshallowpolitical-comments-o
title: Automatically hide flamebait/shallow/political comments on HN
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452362"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Automatically hide flamebait/shallow/political comments on HN

## Value Proposition

I love HN, but lately I have been sick of reading the same dismissive criticisms over and over again. Along with political arguments that have been litigated to death, people's issues with smooth scrolling on blogs, etc. Many of these comments do not get flagged for whatever reason. So I made a service to automatically classify whether comments violate (a modified form of) the HN guidelines automatically. In addition there's a Chrome extension to collapse these comments (if they violate your score thresholds) so you don't have to read them too. You can also just watch guideline violating comments come in as they are posted on the website.Here's more info on how it works: https://classify.stylometry.net/how-it-works

**One-liner:** A personal-reading classifier that scores every HN comment against (a modified form of) the HN guidelines, with a Chrome extension that collapses the ones above your own threshold and a live page where you can watch flagged comments arrive.

## Target Users

- Primary: heavy HN readers who are tired of re-reading the same dismissive one-line rebuttals, political arguments that have been "litigated to death", and micro-complaints that do not get flagged. They want a tool that gets those out of their way without leaving the site.
- Secondary: lighter HN readers who would rather watch the flagged stream than configure an extension. The live page is the entry point for that audience.

## Jobs To Be Done

1. Functional — collapse or hide comments that the classifier flags above the reader's personal threshold so the thread is readable again.
2. Emotional — let the reader skip the predictable, repetitive comment patterns that have made them "sick of reading the same dismissive criticisms over and over again."
3. Social — let the reader keep participating on HN without either ignoring the comment thread entirely or having to scroll past a wall of low-signal replies each time.

## Success Metrics

- Classifier agreement with the author's own sense of "this should have been flagged" on a held-out set of recent HN threads (the source does not give a number).
- Chrome extension install-to-active-user retention (do people keep the threshold enabled after the first install).
- Live page usage: how many readers come back to the flagged stream without installing the extension.

## Pricing & Monetization

Not stated in the source. The poster says "I made a service" but does not mention plans to charge, advertise, or limit features behind a paywall.

## Competitive Landscape

Not stated in the source. HN itself runs user-flagged moderation; this is a per-user overlay on top of that, but the source does not name any competing tool.

## Risks & Open Questions

- Classifier accuracy drift: HN comment styles change over time; a model trained on past comments may miss new patterns or over-flag evolving legitimate discussion.
- Threshold sensitivity: a threshold that filters too aggressively turns the extension into a personal echo chamber. The product must make the threshold visible and easy to relax.
- HN terms of service: any scraping or automation that touches HN should stay inside what the site allows for end users; the source does not address this.
- The poster notes "many of these comments do not get flagged for whatever reason" — the classifier is its own definition of what counts, not a perfect mirror of HN moderation.
