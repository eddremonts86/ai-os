---
id: "2451"
slug: help-me-build-a-better-bot-blocker
title: Help me build a better bot blocker
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49265322"
category: ask-hn
date: "2026-08-11"
tags: [Ask HN, Problem]
---
# Help me build a better bot blocker

## Problem

I got annoyed enough with bot blockers making me wait several seconds to access a site or go through a CAPTCHA, that I decided to make something better.I'm doing bot filtering/blocking using only Apache config options. I started with a basic filter that blocks HTTP clients that don't support HTTP/2.0, and clients that don't support brotli. To ensure clients don't just spoof brotli support, the root index.html is only available in brotli. I'm planning to add a hidden link to a brotli bomb, since it compresses much better than gzip. A 1GB ASCII repeating sequence compresses to under 1kB. My site has low traffic, under 10k hits per day. With the h2 & br filters active for 2 days, no malicious bot crawlers are getting through.I'd like to increase bot traffic to around 100k hits per day to help test the filters. Any suggestions on how? Perhaps just posting the site here will attract bots:
https://solarsi.ca/My intention is a false positive rate of under 0.1%. Please reply with your browser version if you get blocked trying to access the site.After I've tested the blocker for a week, I'll write a MIT-licensed installer for Apache2 on Ubuntu/debian for others to try.

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
