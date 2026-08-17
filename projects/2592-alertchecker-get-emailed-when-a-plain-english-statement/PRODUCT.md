---
id: "2592"
slug: alertchecker-get-emailed-when-a-plain-english-statement
title: AlertChecker – get emailed when a plain-English statement comes true
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49317809"
category: show-hn
date: "2026-08-16"
tags: [Show HN, Product, Problem]
---
# AlertChecker – get emailed when a plain-English statement comes true

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built AlertChecker to help address a limitation with AI chatbots - they only respond when you've asked them something. You talk to them and they talk back. I wanted a way for them to tell you something of interest another time, when you're not even in a conversation.For example, type a statement like "the iPhone 16 Pro is back in stock at apple.com" or "it's going to rain in London tomorrow," and AlertChecker uses AI models with live web search to monitor it periodically. You'll then be emailed when it becomes true. No scraping rules to configure, no specific site integrations to pick, just a sentence in plain English.It's a Next.js web app with a small Node backend service doing the actual checking in a continuous loop. There's also an MCP server, so if you use Claude or ChatGPT you can create alerts by just asking in a normal conversation instead of opening the site.The number of checks is currently limited overall while I keep an eye on costs, so it's shared across everyone using it right now rather than a fixed per-account quota. I'll be raising that as I get a better sense of real usage patterns.Seems like this tool could have a very wide range of applications (given the statement can be literally anything under 4000 characters). Interested to hear about real-world uses beyond stock/price checking or weather alerts.

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

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49317809) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
