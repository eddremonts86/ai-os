---
id: "4325"
slug: dashwise-a-customizable-all-in-one-homelab-dashboard
title: Dashwise – A customizable all-in-one homelab dashboard
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49522428"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Dashwise – A customizable all-in-one homelab dashboard

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I've been building Dashwise, an open-source "all-in-one" homelab dashboard for about a year.One thing that has always bothered me about homelab dashboards is configuration. Many of them look great, but setting everything up through large config files can become tedious. With Dashwise, I'm trying to make the dashboard itself easy to configure while also keeping integrations flexible.## Built-in apps* *Shortcuts:* A Spotlight-like search for your homelab. Integrations can expose actions and shortcuts directly to the search bar.
* *News:* Subscribe to RSS feeds and group multiple feeds together.
* *Notifications:* Send notifications to Dashwise from Shoutrrr-compatible applications or through plain HTTP requests.
* *Frame:* Turn the dashboard into a customizable smart display/screensaver.
* *Links:* Store and organize bookmarks. This is still in an early prototyping phase.## IntegrationsWith many dashboards, creating an integration that feels truly native requires modifying the dashboard's code rather than adding plugins.Dashwise integrations are instead defined using YAML. They can fetch data from REST APIs and display it using reusable widget templates.An additional benefit of this approach is that the integration format is simple enough for LLMs to generate integrations fairly easily.## Where it's goingI'm planning to keep expanding the integration ecosystem and experiment with more ways for external tools to interact with Dashwise.For example, one thing I'm planning is a CLI that can report the progress of long-running commands and display it directly inside Dashwise.If you have any feature requests or feedback, let me know!

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49522428) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
