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

## Problem

The poster needed to build a tiny webapp backend to upload to shared LAMP hosting — "they still exist, and I think they're fun despite us being well beyond 2005" — but could not face waiting for FTP to sync the thousands of files Laravel or similar frameworks need. His answer is PhpEZ, a tiny PHP framework that "gets packaged into a single file". The post lists what it contains: typed request/response handling, filesystem-based routing, object serialization, database models/schema generation, and "a little schema alignment tool". It has no Composer dependencies. The poster is candid about his own use case — "I'm using it for my own shady purposes" (his joke) — and about the ask: he published it on GitHub "in case anyone else finds the approach useful" and wants people to try it and tell him where it breaks.

## Objective

Ship the single-file framework as a credible shared-hosting path: route + typed handlers + model/schema generation, deployable as one file over FTP with zero Composer installs. The MVP is what the post lists — nothing more — hardened by the breakage reports the poster asked for.

## Target Users

- Developers who deploy to shared LAMP hosting and want a framework that fits the environment's constraints.
- People who find modern PHP framework sync/install overhead disproportionate for small backends.
- Tinkerers curious about a single-file architecture who are willing to file breakage reports.

## MVP Scope

- Single-file packaging: the whole framework uploads as one file.
- Filesystem-based routing with typed request/response handling.
- Object serialization.
- Database models and schema generation, plus the schema alignment tool.
- No Composer dependencies; a documented "what it needs to run" story for shared-hosting PHP versions.

## Constraints

- Shared-hosting reality: no long-running processes, FTP-based deploys, whatever PHP version the host offers — the framework must work inside those limits.
- Zero Composer dependencies is a stated property; the MVP must not quietly reintroduce the dependency problem.
- The post's feature list is the scope; the poster's ask (find where it breaks) is the development loop.
- Single-file packaging must not mean single-file code — the constraint is the deployed artifact, not the source layout.
