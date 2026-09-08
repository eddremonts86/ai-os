---
id: "4576"
slug: powblock-proof-of-work-microservice-for-any-server
title: POWBlock proof-of-work microservice for any server
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49538792"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# POWBlock proof-of-work microservice for any server

## Problem

Hello everyone! Longtime HN lurker, first time real contributor.I'm the lead programmer behind the POWBlock project. Back in 2024 we started developing something that didn't exist: A universal, stack-agnostic bot blocking gate that you can attach to any server like a high-performance sidecar. The idea was to create a PoW defense system for Varnish/Vinyl Cache because nobody ever made a vmod for it, and we didn't want more proxies stuffed into our stack. But as the final spec developed - "stateless, lockless, HTTP header controlled microserver and PoW validator" we made the decision to drop all assumptions about the Varnish stack and make it truly universal.The first deployments went live around December '24 and a few sites have been quietly running it ever since, giving us feedback, and letting us use them as live-traffic testbeds as we iterated on the concept. It was closed-off, private software for use just by ourselves and our friends for a long time, but we finally did a public release several weeks ago with the very proven 1.8x series. We had about a dozen people jump on it. We took one bug report and a few feature requests, and released an updated version to the repo a few days ago.I'd love to answer your questions!

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
