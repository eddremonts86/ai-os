---
id: "3470"
slug: alphie-see-whos-on-your-website-and-chat-with-them-from
title: "Alphie – see who's on your website and chat with them from Slack"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49473503"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Alphie – see who's on your website and chat with them from Slack

## Problem

Hi HN, Yura here, co-founder of Alphie.In my previous YC company, we got a lot of good traffic, but only about 3% of it ever converted to demos.We tried RB2B and many other visitor resolution tools - but weren't happy with the accuracy.So, after that company was acquired, we decided to build our own platform.We've found a way to achieve a much higher ID rate and accuracy than most of the previous-generation visitor ID tools.Company-level visitor identification is about 3 times more accurate than individual-level. We use a waterfall of several data providers to boost it a bit further. Then an agent analyzes your ICP, figures out the decision-makers - and closes the loop by enriching their data. The thing is, for B2B, knowing who was the actual person that visited your website matters less than knowing that a certain company is in the market.An unexpected side effect is that about 30% of companies can be identified via reverse IP lookup, which takes less than a second.This allows you to do two key things for conversion:Display content uniquely tailored to this visitor (e.g. a fintech startup sees a case study for a Series B payment platform).
Rank them against your ICP - so you know if an important buyer is currently browsing your pricing page.Alphie does the personalization in the chatbot only so far, personalizing answers and showing relevant bits of content, but potentially it could be possible to generate a whole personalized version of the landing page.The ICP ranking is super interesting, because it allows you to pull in a human rep while the buyer is still on the website - the moment of highest intent.We're currently running 16 pilots, 10 of them with YC companies.Would love to hear your thoughts. Happy to answer anything, especially on the identification accuracy tradeoffs and the privacy architecture.
Video Demo: https://www.youtube.com/watch?v=ZFjQwGfsR0k
Interactive demo: https://meetalphie.com/demo/app.html

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
