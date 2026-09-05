---
id: "4336"
slug: durable-workflow-20-polyglot-workflows-in-php-python-an
title: "Durable Workflow 2.0 polyglot workflows in PHP, Python and Rust"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49521517"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Durable Workflow 2.0 polyglot workflows in PHP, Python and Rust

## Problem

I built a sample app for Durable Workflow 2.0 that lets you try it out via GitHub Codespaces in your browser.What makes DW 2.0 unique? Several deployment modes.If your app is Laravel then you can embed the workflow engine inside your app and it works with the storage and queues that your app is already using. No additional infra needed.If not then you can run it in service-mode which provides a language-neutral HTTP+JSON control plane. Under the hood, it's still a Laravel app so it's fairly simple to deploy. But you don't need to worry about PHP or Laravel in service mode for the most part. There are prebuilt Docker images and Helm charts.Check out the launch article: https://durable-workflow.com/blog/durable-workflow-2-0/Feel free to ask me questions here.

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
