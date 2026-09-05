---
id: "4417"
slug: popsql-and-seekwell-were-shutting-down-so-i-built-the-r
title: "PopSQL and SeekWell were shutting down, so I built the replacement"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49514362"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# PopSQL and SeekWell were shutting down, so I built the replacement

## Problem

My team used PopSQL and SeekWell to get data from our DBs into Google Sheets on a schedule while also sharing a library of company specific SQL queries. Both were shutting down, so I built a replacement covering just the parts we actually used: connect a database, write and share SQL, schedule the results to Sheets or Slack.Yes, a cron job running a python script does the same thing for free. But getting non-technical teammates to use that is the hard part, and that's really what this solves.Another thing I strongly believe is that data belongs to everyone in the company. People will figure out use cases when they have access to the data, and people are way more productive when the access is not gatekeeped.It's narrow on purpose, and I'm happy to build almost anything people need in a tool like this. What would you want to see?

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
