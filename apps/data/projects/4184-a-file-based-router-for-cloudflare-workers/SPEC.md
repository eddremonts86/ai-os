---
id: "4184"
slug: a-file-based-router-for-cloudflare-workers
title: "A file-based router for Cloudflare Workers"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509922"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# A file-based router for Cloudflare Workers

## Problem

The repo at github.com/yusuke99/vite-plugin-cloudflare-router is a Vite plugin that gives a Cloudflare Workers project a file-based router. A developer drops a file into a routes folder, the plugin picks up the file shape and wires it into the Workers handler. The repo page lists the project as MIT-licensed with a CI status badge. The post is the plugin itself: a Vite-side affordance that brings the file-based routing convention (popular in Next.js / Remix / TanStack Start) to a Cloudflare Workers deployment.


---

## Objective

Ship a Vite plugin that brings file-based routing to a Cloudflare Workers project, so a developer can define a Workers route by dropping a file into a routes folder the way they would in Next.js or Remix.


## Target Users

Developers building Cloudflare Workers who are used to file-based routing from Next.js / Remix / TanStack Start and want the same affordance on Workers. Assumes the reader is comfortable with Vite and Cloudflare Workers.


## MVP Scope

- A Vite plugin that reads a `routes/` folder and emits a router handler.
- Support for the standard file conventions (index, dynamic segments, catch-all).
- A typed route table so a developer can navigate by typed handle.
- A README that documents the file shape and the deploy story.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing or hosting posture; the repo is MIT-licensed.
- Cloudflare Workers' runtime is the only target; the plugin does not need to support every edge runtime.
- The file conventions have to match developer expectations from Next.js / Remix, not invent new ones.
