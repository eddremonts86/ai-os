---
id: "4430"
slug: appwrite-20
title: Appwrite 2.0
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49513287"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Appwrite 2.0

## Problem

Hi HN, this is Eldad, founder and ceo at Appwrite.We started Appwrite about 7 years ago as an open-source project trying to make backend development simpler. Today we’re releasing Appwrite 2.0.This is probably the biggest release we’ve ever shipped, and in many ways it changes what Appwrite is.The original idea behind Appwrite was simple: give developers a set of easy APIs for the backend primitives almost every app needs - auth, databases, storage, functions, realtime, messaging, etc.Over time we realized that abstractions are great until you hit their limits. So with 2.0 we wanted to keep the simplicity of Appwrite, but give developers much more access to the underlying infrastructure.Some of what we shipped:* PostgreSQL as a service
* MySQL service
* DocumentsDB and VectorsDB
* S3-compatible Storage
* OAuth 2.1 + OIDC server
* Domains and DNS
* Built-in Firewall
* A completely new Console built with TanStack
* Terminal and OpenAPI-powered API Explorer built into the platoform
* A major overhaul of our runtime with much better throughput, latency and memory usage, up x7 performanceThe direction we’re taking is basically: use as much or as little abstraction as you want - it's your choice.You can use Appwrite’s database API or connect directly to Postgres. Use our Storage API or speak S3. Use Appwrite Auth or make your project an OAuth 2.1/OIDC provider.There are also a lot of smaller changes in 2.0 that I couldn’t fit here. Existing projects remain backwards compatible, and Appwrite is still open source and 100% self-hostable.Would love feedback from HN, especially criticism. We’ve been working on this for a long time and I’m curious what you think about our direction.Appwrite 2.0:
https://appwrite.io/blog/post/announcing-appwrite-2Some of the performance work behind 2.0:
https://appwrite.io/blog/post/hyperloop-b

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
