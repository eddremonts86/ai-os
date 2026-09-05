# SPEC.md — I Wrote a WAF in Rust with Pingora

## Problem

The WAF is in good condition, this is my starting point:
shadow mode with reporting, replay of captured traffic
bot detection (fingerprint header)
intel threats (AbuseIPDB, AlienVault)
GraphQL: depth, complexity, batch, introspection
OpenAPI: request validation against specs
WASM plugin in sandbox (off by default)
multi-tenant PostgreSQL with per-row isolation
auth: local, OAuth2+PKCE, LDAP, SAML (XML-DSig), MFA&#x2F;TOTP
RBAC for endpoints on the Admin API
Svelte dashboard, audit log, privacy editing

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49573880)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-05T07:02:25Z

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
