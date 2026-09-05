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

## Problem

mitmproxy cannot recreate the client's TLS, it uses python's TLS stack, so even with a real browser behind it, your connection looks like that of a python script. To solve this, I've created mitmcloak. It reads the client's ClientHello and HTTP/2 preface in real time and mirrors it with httpcloak (my other tls client library), no capture or fine tuning of the preset required.H3 is mirrored as well though QUIC only reaches the proxy in wireguard/transparent/reverse mode as a proxy setting doesn't redirect UDP by default.mitmcloak is an addon to mitmproxy, not a fork, so your setup stays exactly the same. Also it does not bypass certificate pinning, that's a different problem.

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
