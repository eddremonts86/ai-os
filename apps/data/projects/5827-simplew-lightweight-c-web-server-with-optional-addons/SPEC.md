# SPEC.md — SimpleW – Lightweight C# Web Server with optional addons

## Problem

Hi HN,<p>I’m the author of SimpleW, an MIT-licensed .NET web server for standalone or embedded applications.<p>I shared it here last year (<a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=44797834">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=44797834</a>). Since then, I’ve rewritten it from scratch, removing the NetCoreServer dependency.<p>The biggest change is the addon architecture: the core stays small, with no third-party dependencies, and you add what you need (JWT, OpenID Connect, automatic Let’s Encrypt certificates, Swagger, Razor, dependency injection, or logging integrations).<p>Even the network engine is replaceable, with an optional io_uring addon for Linux, powered by ioxide. Benchmarks are available on <a href="https:&#x2F;&#x2F;http-arena.com" rel="nofollow">https:&#x2F;&#x2F;http-arena.com</a>.<p>I wanted a server I could understand and modify easily, while keeping extra functionality in separate packages.<p>You can try it by following the quickstart: <a href="https:&#x2F;&#x2F;simplew.net&#x2F;guide&#x2F;getting-started.html" rel="nofollow">https:&#x2F;&#x2F;simplew.net&#x2F;guide&#x2F;getting-started.html</a><p>I’d love feedback on the addon design and what you’d build with it.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49617184)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T21:16:25Z

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
