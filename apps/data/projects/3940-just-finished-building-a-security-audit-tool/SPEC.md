---
id: "3940"
slug: just-finished-building-a-security-audit-tool
title: Just finished building a security audit tool
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49504798"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Just finished building a security audit tool

## Problem

Just finished building a security audit tool
It started because I kept running my site through Mozilla's Observatory and wanted to understand exactly how it scored things. If you read their docs, they explain how the scoring blocks break down and if you dig deeper, how the individual bits inside those blocks are scored too. So I reflected that same scoring into my own tool.
Then came the grind: run my site through Observatory, change one thing, test again, over and over, until my scores matched theirs section by section. Once it lined up with Mozilla, I had a scoring chart that mirrored Observatory for every parameter.
From there I started building depth into it, DNS, mail-spoofing protection (SPF/DMARC/DKIM), known software vulnerabilities via the CVE database, the stuff Observatory doesn't touch. So now it does everything Observatory does, plus a fair bit more.
I've tested it against 200 of the internet's biggest sites and CMS platforms to make sure it holds up, real varying scores, no false positives, no rubber-stamping everyone as fine.
My own page scores 135/A+ on Observatory, so I must have got something right. That's Mozilla's tool, not mine, so it's easy to verify.
The other thing that shocked me was how many security scanners out there are absolute crap.
While building this I ran my own site through loads of them, and some just made things up, one reckoned I had a server and missing headers my site doesn't even have, another failed me for having no CAA record when I've clearly got one.
That's half the reason I was so dead set on no false positives, most of these tools cry wolf, and that's worse than telling you nothing.
The tool page is locked right down and it should be, it's my own audit page, so it'd be a joke if that one wasn't tight.
Now I'm working through the rest page by page. The write-up page still sits at 73 because I've not tightened its CSP yet, and I've left that on show on purpose, no point building a tool that flags weaknesses if I go and hide my own.

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
