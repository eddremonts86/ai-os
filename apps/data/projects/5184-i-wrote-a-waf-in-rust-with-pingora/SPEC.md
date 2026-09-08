---
id: "5184"
slug: i-wrote-a-waf-in-rust-with-pingora
title: I Wrote a WAF in Rust with Pingora
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49573880"
category: show-hn
date: "2026-09-05"
tags: [Show HN, Product, Problem]
country: RBAC for endpoints on the Admin API
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I Wrote a WAF in Rust with Pingora

## Problem

The WAF is in good condition, this is my starting point:
shadow mode with reporting, replay of captured traffic
bot detection (fingerprint header)
intel threats (AbuseIPDB, AlienVault)
GraphQL: depth, complexity, batch, introspection
OpenAPI: request validation against specs
WASM plugin in sandbox (off by default)
multi-tenant PostgreSQL with per-row isolation
auth: local, OAuth2+PKCE, LDAP, SAML (XML-DSig), MFA/TOTP
RBAC for endpoints on the Admin API
Svelte dashboard, audit log, privacy editing

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
