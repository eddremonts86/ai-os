---
id: "2247"
slug: my-mac-slept-through-its-cron-jobs-so-i-made-goguma-a-m
title: "My Mac slept through its cron jobs, so I made goguma, a menu bar app"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49361399"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# My Mac slept through its cron jobs, so I made goguma, a menu bar app

## Problem

Hi HN, like many of you likely do, I run cron jobs throughout the day/night, but can't afford to have my laptop open all day.So, I decided to build goguma, a free, open-source Mac menu bar app that wakes your Mac only when a cron job/automation is scheduled to run. Unlike caffeinate, Amphetamine, or Adrafinil, which can only keep an awake machine awake, goguma can wake a sleeping machine.It automatically imports all your jobs across launchd, crontab, Hermes, etc, alongside detecting agent activity through hooks. The Mac menu bar app will also show you which job it'll next wake for.It remains safe by skipping wake-ups if it's lower than a battery threshold, and lets the mac sleep if it starts overheating.Happy to hear any feedback and suggestions!

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
