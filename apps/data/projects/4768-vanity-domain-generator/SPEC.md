---
id: "4768"
slug: vanity-domain-generator
title: Vanity Domain Generator
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49545776"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Vanity Domain Generator

## Problem

When each of my kids got to the age that they started using email and having an online presence, I got them their own vanity domain by going to a "fake word generator" and then taking the best-looking fake words and doing a registrar search for it.With my youngest son starting the process, I thought "I'll save time going back and forth and integrate the process. Surely it can't be that hard." Making it happen was easy. Making it something I would share was harder.It's implemented as a single-page app at https://vanitydomain.net, with all of the logic on the client side. It takes the top 10k words in your language's Wikipedia, and builds a Markov trigram model to make a plausable-ish word. I tried more clever things, but they were all worse.For each plausible word, it hits Cloudflare's DNS (super cheap, fast, and scalable) as a low-pass filter, then checks the definitive RDAP server if it's available. It displays the words that passed both and gives you a link to register it (not monetized; it's all good).If you know someone who might benefit from having a vanity domain with a hosting site, infinite email addresses, and control of their own online presence, this might be a fun starting point.Let me know if there are things that could make it better, or if you know of a better model for word generation. It's my fun-time project that might be a blessing to other people, so feel free to push it in a good direction.

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
