---
id: "2540"
slug: vianj-an-app-that-makes-nj-transit-ticketing-less-painf
title: ViaNJ – an app that makes NJ Transit ticketing less painful
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49321344"
category: show-hn
date: "2026-08-16"
tags: [Show HN, Product, Problem]
---
# ViaNJ – an app that makes NJ Transit ticketing less painful

## Problem

I’m building ViaNJ because I want a more seamless experience with NJ Transit departures, ticket purchase, activation, and getting a barcode ready while boarding.It has live departures, alerts, track predictions, ticket purchase, automatic ticket recovery, Apple Wallet, and iCloud backup. The interesting technical part is making NJ Transit’s unofficial web ticket flow reliable: ViaNJ keeps purchases recoverable through redirects/failures and only considers checkout complete once the actual ticket is recovered.It’s SwiftUI with a small backend and Cloudflare services. NJ Transit still processes all ticket payments directly, and ViaNJ never stores card data.Still actively working on it, and accept any and all feedback. Fun fact, NJT is apparently a working on integrating Apple Wallet ticketing into their existing app. Unfortunately, I don’t see their app UX improving much more, but happy to be proven wrong eventually.https://www.vianj.app
https://feedback.vianj.app/

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
