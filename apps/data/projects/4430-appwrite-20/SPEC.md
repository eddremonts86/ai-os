# SPEC.md — Appwrite 2.0

## Problem

Hi HN, this is Eldad, founder and ceo at Appwrite.<p>We started Appwrite about 7 years ago as an open-source project trying to make backend development simpler. Today we’re releasing Appwrite 2.0.<p>This is probably the biggest release we’ve ever shipped, and in many ways it changes what Appwrite is.<p>The original idea behind Appwrite was simple: give developers a set of easy APIs for the backend primitives almost every app needs - auth, databases, storage, functions, realtime, messaging, etc.<p>Over time we realized that abstractions are great until you hit their limits. So with 2.0 we wanted to keep the simplicity of Appwrite, but give developers much more access to the underlying infrastructure.<p>Some of what we shipped:<p>* PostgreSQL as a service
* MySQL service
* DocumentsDB and VectorsDB
* S3-compatible Storage
* OAuth 2.1 + OIDC server
* Domains and DNS
* Built-in Firewall
* A completely new Console built with TanStack
* Terminal and OpenAPI-powered API Explorer built into the platoform
* A major overhaul of our runtime with much better throughput, latency and memory usage, up x7 performance<p>The direction we’re taking is basically: use as much or as little abstraction as you want - it&#x27;s your choice.<p>You can use Appwrite’s database API or connect directly to Postgres. Use our Storage API or speak S3. Use Appwrite Auth or make your project an OAuth 2.1&#x2F;OIDC provider.<p>There are also a lot of smaller changes in 2.0 that I couldn’t fit here. Existing projects remain backwards compatible, and Appwrite is still open source and 100% self-hostable.<p>Would love feedback from HN, especially criticism. We’ve been working on this for a long time and I’m curious what you think about our direction.<p>Appwrite 2.0:
<a href="https:&#x2F;&#x2F;appwrite.io&#x2F;blog&#x2F;post&#x2F;announcing-appwrite-2" rel="nofollow">https:&#x2F;&#x2F;appwrite.io&#x2F;blog&#x2F;post&#x2F;announcing-appwrite-2</a><p>Some of the performance work behind 2.0:
<a href="https:&#x2F;&#x2F;appwrite.io&#x2F;blog&#x2F;post&#x2F;hyperloop-b" rel="nofollow">https:&#x2F;&#x2F;appwrite.io&#x2F;blog&#x2F;post&#x2F;hyperloop-b</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49513287)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T18:42:56Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
