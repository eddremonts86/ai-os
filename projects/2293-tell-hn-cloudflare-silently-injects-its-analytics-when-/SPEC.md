---
id: "2293"
slug: tell-hn-cloudflare-silently-injects-its-analytics-when-
title: "Tell HN: Cloudflare silently injects its analytics when you switch nameservers"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49322107"
category: ask-hn
date: "2026-08-16"
tags: [Ask HN, Problem]
---
# Tell HN: Cloudflare silently injects its analytics when you switch nameservers

## Problem

A few hours ago I switched my nameservers to Cloudflare in order to enable R2 bucket serving through my own subdomain, and I found out that it silently had injected a JS analytics snippet in my HTML-only JS-free site textlog.cc — I had to go to the Analytics dashboard, Add the site to the analytics and then disable the snippet. I find this approach entirely invasive, you should opt-in to features like that not have to opt-out. Just a warning out there to folks who might not be aware of this.

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
