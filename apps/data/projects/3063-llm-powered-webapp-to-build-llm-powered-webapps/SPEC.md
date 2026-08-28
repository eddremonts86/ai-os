---
id: "3063"
slug: llm-powered-webapp-to-build-llm-powered-webapps
title: LLM-powered webapp to build LLM-powered webapps
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49444234"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# LLM-powered webapp to build LLM-powered webapps

## Problem

Hey all,The goal is to earn on token margins for LLM calls when you build an AI-powered webapp. I proxy OpenAI and Anthropic calls so that when you deploy a site to a subdomain, your users token usage will be tracked. I charge 2x the token cost to the end user, where the webapp creator gets 80% of the profit and I get 20%. The idea is to ramp your revenue from simple AI apps directly with your popularity and real usageI've built this over the last 3 years. The system behind it is kind of crazy: I use Abstract Syntax Trees and have the LLM write AST transformation code to implement code changes to files. I haven't benchmarked it in a while, but last time I did, it cost more in tokens but produced more targeted code changes (as compared to other agent harnesses). I wrote a blog post about this idea when I first built it: https://codeplusequalsai.com/static/blog/prompting_llms_to_m...Your development project is run inside a docker container, and you can publish it to make it public and get users, and hopefully earn revenue. The real big goal is to make it easier to build small LLM webapps and not worry about revenue model: as users grow (and token costs grow), so does your revenue, proportionally.Do please tell me what you think about the idea and my implementation!

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
