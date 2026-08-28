---
id: "820"
slug: linkedin-content-creators-operate-blindly-they-see-the-
title: "LinkedIn content creators operate blindly: they see the results but don't understand the reasons behind their posts' success or failure"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/ja0oyjzdd1-linkedin-content-creators-operate-blindl"
category: media
date: "2025-12-02"
tags: [Media, Marketing, Other]
country: India
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# LinkedIn content creators operate blindly: they see the results but don't understand the reasons behind their posts' success or failure

## Tech Stack

React with TypeScript for the dashboard, TanStack Start as the Node.js API, SQLite with Drizzle ORM for posts and engagement data, deployed via Coolify and Docker. Chosen because the MVP is a personal dashboard that ingests a single creator's history and the data model is small.

## Architecture

A web app with three surfaces: an import flow that takes a LinkedIn export or manual copy-paste of recent posts and engagement numbers, an analysis view that runs a few interpretable correlations, and a weekly digest email that surfaces the latest finding.

## Milestones

- M1 — Manual import of the creator's last 30 posts with engagement numbers.
- M2 — Interpretable analysis view: length, hook type, post time, format vs. engagement, with confidence flags.
- M3 — Weekly digest email that highlights the strongest pattern from the latest 30 days.

## Risks

- Source is thin: scope is derived from the title alone until the original post is read.
- Personal-sample correlations are noisy; the product must avoid overstating its findings.
- LinkedIn ToS restrict automated scraping; v1 must use manual export or the official API.
