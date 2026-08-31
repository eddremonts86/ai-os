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

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the feature list and the shared-LAMP motivation
- [x] Write SPEC.md (this document)
- [x] Implement single-file packaging with a documented build step
- [x] Verify an FTP deploy of the packaged file serves a route on a shared LAMP host

## Phase 1: Core

- [ ] Harden filesystem-based routing with precedence and security rules
- [ ] Test typed request/response handling and object serialization
- [ ] Test database model and schema generation on a real shared-host database
- [ ] Exercise the schema alignment tool against drift scenarios

## Phase 2: Deploy

- [ ] Publish on GitHub with the "tell me where it breaks" ask and a minimum-PHP-version statement
- [ ] Triage breakage reports, starting with routing and schema-tooling issues
- [ ] Document the shared-hosting constraints (FTP, PHP version, no long-running processes)

---

_Generated automatically by Lúa on 2026-08-29_
