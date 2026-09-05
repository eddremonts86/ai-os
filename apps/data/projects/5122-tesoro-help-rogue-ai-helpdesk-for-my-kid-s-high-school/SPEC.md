---
id: "5122"
slug: tesoro-help-rogue-ai-helpdesk-for-my-kid-s-high-school
title: "Tesoro.help – rogue AI helpdesk for my kid's high school"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49569854"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Tesoro.help – rogue AI helpdesk for my kid's high school

## Problem

My kid just started high school. The way they communicate information is absolutely insane. So I built a web scraper + MCP to aggregate it all, then layered on a snarky chatbot with a PG-13 Dave Chappelle personality.The number of communication channels are just insane:
- email
- Google Docs
- Canvas
- PDFs
- School Messenger
- the official school website
- 5 different other websites that they don't tell you about (eg athletics website)
- 22 (!) Instagram accounts for various school clubs & sports
- district website & calendarOh, and if you call the school office, they say "look at the website" or "that's handled by a different department." The whole system is just insane.So I did something about it. With AI. Last weekend.- Scraper: indexes all the public PDFs, GDocs, websites and Instagram accounts they have 4x per school day. It even transcribes images, because yes, they announce important deadlines over Instagram... as images!!!
- MCP server: makes all of the above available to any AI.
- Chatbot: Gemini 3.7 Flash with a "PG-13 Dave Chappelle" persona that answers legit questions helpfully and cracks jokes. All answers are grounded in the MCP and web search as a fallback. Trolls you if you go off-topic. Threatens to lookup your IP and report you to the principal if you ask for homework help. Prompt is loaded with deep research on the school and surrounding area as a fodder for jokes.It's awesome. I'm proud. And finally I know what the hell is going on with my kid's school!

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
