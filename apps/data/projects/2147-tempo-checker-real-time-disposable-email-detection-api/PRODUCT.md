---
id: "2147"
slug: tempo-checker-real-time-disposable-email-detection-api
title: Tempo Checker – Real-time disposable email detection API
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49369968"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Tempo Checker – Real-time disposable email detection API

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN, I’m Rami. I recently built Tempo Checker to help developers identify and block disposable, temporary, or burner email addresses during user registration.I built the core logic using Go and Python. To make the detection as accurate as possible, the system relies on a multi-layered validation approach:Live MX DNS Checks: It verifies the domain actually has mail exchange records configured and can receive mail.Domain Blocklists: It cross-references the domain against an aggregated list of known disposable and temporary email providers.I built this because I wanted a fast, straightforward API to handle fake signups without adding unnecessary overhead to backend flows.I'd love for you to test it out. I'm especially open to feedback on handling edge cases with MX records, ways to improve the blocklist methodology, or any general performance critiques.Thanks!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49369968) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
