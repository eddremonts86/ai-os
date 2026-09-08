---
id: "4756"
slug: mitmcloak-mirror-the-client-s-tls-h2-h3-fingerprint-in
title: "Mitmcloak – mirror the client's TLS/H2/H3 fingerprint in mitmproxy"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49546984"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Mitmcloak – mirror the client's TLS/H2/H3 fingerprint in mitmproxy

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ mitmproxy cannot recreate the client's TLS, it uses python's TLS stack, so even with a real browser behind it, your connection looks like that of a python script. To solve this, I've created mitmcloak. It reads the client's ClientHello and HTTP/2 preface in real time and mirrors it with httpcloak (my other tls client library), no capture or fine tuning of the preset required.H3 is mirrored as well though QUIC only reaches the proxy in wireguard/transparent/reverse mode as a proxy setting doesn't redirect UDP by default.mitmcloak is an addon to mitmproxy, not a fork, so your setup stays exactly the same. Also it does not bypass certificate pinning, that's a different problem.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49546984) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
