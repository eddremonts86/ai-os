---
id: "3064"
slug: propose-and-dual-control-for-dns-changes
title: Propose and Dual-Control for DNS Changes
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49444218"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Propose and Dual-Control for DNS Changes

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey, Hacker News. I just want to pick your brain for a feature we're working on.I don't know whether you have seen this as a pain point, but when I work in a company, a lot of times I try to launch something and need to change a DNS record.It's always a source of friction in the organization. I have to email someone or give a link to a co-worker. They have to figure out how to do it, but also whether I have a business justification for doing it.So, when we built this platform, we're trying to come up with a feature that makes it easier. Someone can send you a proposal for DNS record updates. Our system will take the instructions, whether they come from a website, copy and paste, email, or Slack. Anything put in here becomes a proposal for a DNS change, and then someone can approve it.In addition, we believe that for sensitive DNS record changes, it is good to treat them like a bank transfer.So we are building a new feature for dual control, two-person control, or multi-person control of the approval flow, as well as an audit history of who proposed what, who approved something, the date and time, and what changes were made.In addition, we also want to get feedback. I have observed the design slop of the AI that I use, ChatGPT.There are multiple problems. This is the one-shot outcome, and then we massively simplified it to this. Basically, the summary is that it keeps using very bold and solid colors that are very attention-grabbing. The AI also tends to print out a lot of text that is noisy to the user.AI doesn't really understand the structure of the system or the relationship between which components contain which conversations.For example, this requirement for person approval probably fits best in the system where you approve or reject something, right? It is also very verbose. So it took us a little bit of iteration to improve the design.I'm not a designer. I would love to get feedback about the design and whether the observation of AI slop is the same. Have you experienced the same thing?There are other kinds of AI slop. That's it. Thank you.(AI Disclosure: ChatGPT 5.6 Luna was used for grammar fix and spell check)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49444218) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
