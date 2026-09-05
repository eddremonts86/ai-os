---
id: "5116"
slug: xfinity-silently-blocks-lots-of-new-domains
title: Xfinity silently blocks lots of new domains
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49568385"
category: ask-hn
date: "2026-09-04"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Xfinity silently blocks lots of new domains

## Problem

We built a site for a launch and it was unreachable for anyone on an Xfinity router. We only found out because we have an Xfinity router at home. There's no notice to the site owner.Xfinity's Advanced Security draws on third-party domain reputation lists and blocks at the gateway. We found out a blacklist called SURBL had flagged us. Not sure exactly what tripped it. Since then I've hit the same block on 10+ unrelated sites and told the site owner. Now sharing with everyone here.How to check whether it's happening to you:https://spa.xfinity.com/check_url_status
If blocked, look for the upstream list: https://mxtoolbox.com/blacklists.aspx
Report at https://spa.xfinity.com/report and call them nonstop (reviews take ~3 business days) and get off the upstream list too.Trying to help get this out there so it happens to less people who are launching products.

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
