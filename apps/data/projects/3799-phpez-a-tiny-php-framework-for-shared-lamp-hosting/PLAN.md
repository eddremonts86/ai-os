---
id: "3799"
slug: phpez-a-tiny-php-framework-for-shared-lamp-hosting
title: PhpEZ – A tiny PHP framework for shared LAMP hosting
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49491968"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [PHP, single-file packaging, filesystem-based routing, typed request/response handling, database schema generation, zero Composer dependencies]
---
# PhpEZ – A tiny PHP framework for shared LAMP hosting

## Tech Stack

Chosen for the constraint that defines the product — shared LAMP hosting with FTP deploys; every item comes from the post.

- **PHP:** the framework is PHP by definition; it must run on whatever PHP version shared hosts offer.
- **Single-file packaging:** the deployed artifact is one file — the whole point of the exercise.
- **Filesystem-based routing:** routes derive from the filesystem layout instead of a route table.
- **Typed request/response handling:** the handler contract the post names.
- **Database schema generation:** models and schemas are generated, with the schema alignment tool alongside.
- **Zero Composer dependencies:** no install step, nothing to fetch on the host.

## Architecture

- **Source layer:** the framework's codebase (layout unstated in the post) compiles or packages into the single distributable file.
- **Runtime layer:** the packaged file receives a request, resolves the route from the filesystem, runs the typed handler, and returns the response.
- **Persistence layer:** generated models and schemas talk to the host's database; the alignment tool reconciles schema drift.

There is no long-running process, no queue and no daemon — the framework lives entirely inside the request cycle, which is what shared hosting supports.

## Milestones

1. **M0 — Single-file deploy.** The packaged file uploads via FTP and serves a route on a shared LAMP host.
2. **M1 — Typed core.** Request/response typing and filesystem routing are covered by tests.
3. **M2 — Data layer.** Models and schema generation work on a real shared-host database; the alignment tool is exercised against schema drift.
4. **M3 — Breakage loop.** Publish with the "tell me where it breaks" ask; fix the reports in order of severity.

## Risks

- **PHP-version ceiling:** unstated minimum PHP version decides the actual shared-host audience; too new, and most shared hosts are excluded.
- **Routing edge cases:** filesystem routing needs clear precedence and security rules (no serving unintended files).
- **Schema tooling danger:** alignment against live databases is the highest-risk feature; a wrong diff could alter production data.
- **Packaging opacity:** single-file output without a documented build step makes contribution and auditing harder.
- **Solo maintenance:** one author, one joke about shady purposes, no community yet; testers are the first step to durability.
