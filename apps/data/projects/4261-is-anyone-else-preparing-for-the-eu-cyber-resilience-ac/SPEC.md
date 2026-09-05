---
id: "4261"
slug: is-anyone-else-preparing-for-the-eu-cyber-resilience-ac
title: Is anyone else preparing for the EU Cyber Resilience Act?
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49520688"
category: ask-hn
date: "2026-09-01"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Is anyone else preparing for the EU Cyber Resilience Act?

## Problem

I run a one-person GmbH in Germany. I am thinking about selling firmware for an off-the-shelf handheld - offline, no WiFi, no network stack compiled in at all, updates by reflashing over USB. I don't sell hardware, just software.Turns out that the EU Cyber Resilience Act applies to me. The EU starts to handle software products similar to hardware products and the CRA regulates that (and from a customer's standpoint - rightfully so!).Reporting duties start this September; everything else in December 2027. So I spent some time reading the sources rather than the commentary: the Regulation itself [1], and the Commission's guidance of 27 July 2026 [2] (C(2026) 5252, around 80 pages with 67 worked examples, explicitly aimed at SMEs).This is what I found out so far, and this is where I'd like to be corrected:1. Selling software now works like selling hardware. Same regime - technical file, declaration of conformity, CE marking on a piece of software. I'd assumed CE was a hardware thing; with the CRA not anymore.2. I can't escape it by giving the software away. The exemption is for open source supplied outside commercial activity - free isn't the same as non-commercial. Firmware I publish to support a product I sell is plainly commercial, whatever I charge for it.3. There's no size threshold. A one-person company carries the same obligations as a large one. Article 33 is titled "Support measures for microenterprises and small and medium-sized enterprises" and every provision in it is help, not exemption.4. But the actual work is small. My product isn't in Annex III, so it's self-assessment: no notified body, no fee, nothing filed, nobody approves anything. The work seems to be a handful of documents I write once. You basically stick the CE label on by yourself.5. But there is Art. 13(9). Every security update you ship has to stay available for 10 years after you issue it, or the rest of the support period, whichever is longer. That's a serious amount of time into the 2040s for a product launched in 2027, maybe sold only once.6. Reporting obligations don't end when support does. The guidance is explicit (para 210): vulnerability handling stops with the support period, reporting continues afterwards.I'll stop here, but there's a couple more implications.Ah, and before you ask: it doesn't matter where you live, it matters that you sell to the EU.In a nutshell: I didn't find any 'indie' sources dealing with these matters, so my main question is - is anyone else preparing for this scenario? If so, how do you handle it? Especially interested in anyone who has actually been through this at a small scale, or anyone from a market surveillance authority.[1] https://eur-lex.europa.eu/eli/reg/2024/2847/oj[2] [digital-strategy.ec.europa.eu/en/library/commission-p…](https://digital-strategy.ec.europa.eu/en/library/commission-publishes-new-guidance-support-timely-cyber-resilience-act-implementation)

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
