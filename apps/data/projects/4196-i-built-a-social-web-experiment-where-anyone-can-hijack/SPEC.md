---
id: "4196"
slug: i-built-a-social-web-experiment-where-anyone-can-hijack
title: "I built a social web experiment where anyone can hijack my domain"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509486"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I built a social web experiment where anyone can hijack my domain

## Problem

Domain squatting and one-way traffic capture are normally a one-sided affair. The poster flips the social contract: stealmytraffic.lol accepts $5 from anyone, points the entire domain at that buyer's URL, and lets the next buyer do the same. The page shows live counters — 3 hijacks total, 280 redirects sent last 24 hours, $5 per hijack. A leaderboard records cumulative spend per participant, with the rule "your total on the leaderboard stays; that one nobody can take." Recent activity listed: York School of Defence took it from Message Bottle (.xyz); Message Bottle took it from Pointer Pointer; Pointer Pointer claimed the domain. The experiment is paid for via Whop and pays no attention to what the destination is, only to the dollar amount on top.

## Objective

Turn a domain into a live, paid, leaderboarded rotating billboard where anyone can claim the traffic for $5 and previous buyers keep their cumulative leaderboard spend forever.

## Target Users

- Indie hackers running link-in-bio or vanity domains who want a joke and a recurring leaderboard
- Small businesses willing to pay $5 for a few days of redirected traffic from a meme domain
- Curious HN readers who want to participate in a social experiment for the price of a coffee
- Whop creators looking for a fun example of a paid redirect loop

## MVP Scope

- $5 purchase flow via Whop, no account creation on the site itself
- Automatic 301 redirect of stealmytraffic.lol to the buyer's URL
- Per-buyer cumulative leaderboard that survives subsequent takeovers
- Live activity log showing recent hijacks and dollar totals
- "Report this destination" button for abuse handling

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Whop handles payments; no PCI scope on the site itself
- Leaderboard totals are immutable; spend history cannot be deleted by subsequent hijackers
- Domain DNS must remain under the owner's control at all times
- Abuse reporting must reach a human within a reasonable window (24h)