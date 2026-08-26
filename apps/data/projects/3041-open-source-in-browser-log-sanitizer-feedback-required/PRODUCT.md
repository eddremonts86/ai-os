---
id: "3041"
slug: open-source-in-browser-log-sanitizer-feedback-required
title: "Open source in-browser log sanitizer, feedback required"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49445741"
category: ask-hn
date: "2026-08-26"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Open source in-browser log sanitizer, feedback required

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Just released a framework-agnostic log sanitizer working in browsers and Node.js. It's designed to sanitize log files before they are sent to third-party platforms for processing, analysis, or troubleshooting. Use Case? thing HuggingFace breach, would you feed any AI your usernames, passwords, PII, configs etc?The sanitizer redacts secrets, identifiers, and PII and replaces each value with a stable HMAC token to reduce the risk of accidentally exposing sensitive or confidential information contained in logs.This library is already integrated into LogTotal and runs directly in the browser, allowing logs to be sanitized locally before they leave the user's environment.If you require a fully controlled and isolated data sanitization environment, you can deploy and run this library within your own infrastructure. The sanitizer can also be installed and used in air-gapped environments, ensuring that sensitive log data remains within an environment you fully control.The library has no runtime dependencies. The same compiled rules run in a browser tab and in a Node.js CLI. Complete instructions how to install it are on git.Tokens are HMAC-SHA-256 of ruleId || 0x00 || original, truncated to 16 hex chars. Same key + same value + same rule ⇒ same token. A different key produces different tokens. Generated keys use encoding hex; pasted keys default to utf8.How do we know what to sanitise? This is based on SOC Prime dataset of over 1 million detection rules.Does it solve log sanitation 100%? No, there are edge cases, and hence I ask for your feedback here.Tool is open source under Apache 2.0. and will remain so.I've spent over 20 years dealing with SIEM, log management, data lakes and now data pipelines and was amazed there is no such tool out there. So we made one and would appreciate any feedback!This is a first step towards a larger community free service, logtotal.open source in-browser log sanitizer, feedback requiredhttps://github.com/socprime/logtotal-sanitizer

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49445741) · **Category:** ask-hn · **Tags:** Ask HN,Problem
