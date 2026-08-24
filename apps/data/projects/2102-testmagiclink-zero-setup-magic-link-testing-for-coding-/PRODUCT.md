---
id: "2102"
slug: testmagiclink-zero-setup-magic-link-testing-for-coding-
title: testmagic.link – Zero-setup magic link testing for coding agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49374124"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# testmagic.link – Zero-setup magic link testing for coding agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built testmagic.link because Claude Code kept using my personal Gmail when testing magic-link authentication, filling my inbox with test emails.I know there are existing email testing services, but the ones I found require signing up, getting credentials, and integrating an API. That felt like overkill when I just wanted to tell Claude Code: "test the email sign-in using testmagic.link".So I made testmagic.link. No signup, no API keys, no integration. It’s basically a one-liner with a domain that’s easy to remember. I also added an llms.txt file at the root, so agents instantly know how to read the inbox without me explaining it.There’s also an optional mail-scanner simulation: add ?prefetch=1 to the inbox URL, and testmagic.link will GET each message’s magic link once before you open it, without following redirects — similar to how Outlook Safe Links or a corporate mail scanner might prefetch links. This is useful for catching magic-link flows that break when a security scanner visits a single-use link first.Would love to hear your feedback, or if you've run into any other weird email auth edge cases I should simulate. I'll be around to answer questions!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49374124) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
