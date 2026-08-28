---
id: "3282"
slug: backprompter-create-test-and-deploy-agents-without-a-ba
title: "Backprompter – create, test, and deploy agents without a back end"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49466321"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Backprompter – create, test, and deploy agents without a back end

## Problem

Hi everyone,I am a professor in AI, and I often build AI apps as a hobby and for academic projects. I felt that I was wasting too much time setting up backends, DB, and secrets for each app, and testing the prompts, updating them, and redeploying seemed tedious. So I built Backprompter to do all this without any setup.You can create agents, track different versions, test them, create mock users, simulate conversations, and track your evaluations. It supports usual agent setups - model selection, prompts, RAG, and tools (currently, HTTP API calls). Agents can also be combined by simply tagging them and describing the orchestration in natural language.For production, there is a single-click deployment of a chatbot interface, no setup needed. Also, developers can integrate the agents with their own frontend (Backprompter handles authentication and data management), or with their own backend if they want more control over authentication and data management. With one click, you can deploy your edited agent to production.I think there are broad applications for hobbyists, small teams, and organizations who want to integrate AI but don't have the time or expertise to set up backend, secrets, databases, and evaluation workflows.I started building this about 9 months ago. This is a solo project, so I would love some feedback. It's free to start, but with some limits. If you want to test more, I am happy to provide more credits for free.Also, looking for advice on what features to add next: Would the ability to deploy your agent to Slack or ChatGPT (as a custom GPT) be an important feature?https://backprompter.com/I also built a version that can be self-hosted for complete privacy and for deploying apps within the network.

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
