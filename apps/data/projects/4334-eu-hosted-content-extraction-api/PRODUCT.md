---
id: "4334"
slug: eu-hosted-content-extraction-api
title: EU-hosted content extraction API
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49521632"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# EU-hosted content extraction API

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built Danubia, a web scraping and content extraction API, hosted in the EU.Why: I used to build crawler infrastructure for a search engine company. I wanted to apply my knowledge to building a clean text extraction API, in part because was it fun to do (why else do we program things, if not for fun?) and in part because I felt I could build something good: a scraping API, with genuinely good content extraction, hosted in the EU, and no subscription needed to use it.The thing does this:You give it a URL, and it gives you back clean markdown (or HTML, or plain text), no ads, no boilerplate. You can do that on-demand, or you can do that in batch. If you do it in batch, you save credits.The whole thing is backed by a shared crawling layer, which is capable of enforcing politeness (concurrent downloads, robots.txt filtering, crawl delay and retries) at scale. The content extraction layer is a library which I built from scratch. I used Trafilatura as a starting point but rewrote it so I could own the extraction process and improve it continuously. I run a benchmark of my extraction lib against Trafilatura, Readability, Turndown, and Firecrawl and try to do match if not beat them. The tech stack is Typescript + Effect.For now, I'm offering free credits to anyone who would like to try it. In the future, I'd like to offer paid credits top-up. No subscription.I am in a validation phase, so I'm not charging for credits. Anyone who signs up get 500 credits immediately, no credit card needed. I only wish to collect some feedback. If you build something with Danubia, message me and I will give you more credits. I'm also really curious to know what you're building!I also have ideas for the next steps: I don't want to stop at clean text extraction, I want structured data extraction too and I'm already working on it

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49521632) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
