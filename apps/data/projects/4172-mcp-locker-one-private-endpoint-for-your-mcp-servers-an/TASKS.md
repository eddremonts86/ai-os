---
id: "4172"
slug: mcp-locker-one-private-endpoint-for-your-mcp-servers-an
title: "MCP Locker: One private endpoint for your MCP servers and skills"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511022"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# MCP Locker: One private endpoint for your MCP servers and skills

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4172-mcp-locker-one-private-endpoint-for-your-mcp-servers-an/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the landing page with the three pricing tiers (Free up to 5 MCP servers, Pro up to 100 MCP servers at $5/mo, Teams Unlimited unbounded at $25/mo), the signup form, and the Privacy Policy consent gate.
- [ ] Build the account and authentication flow: signup, account credential, the audit trail for consent records.
- [ ] Build the encrypted-at-rest storage layer with the user's account credential as the decryption key, and the audit surface the user can check to verify the encryption.
- [ ] Build the user-facing management surface: add/remove/rotate/revoke MCP server registrations, the per-tier cap display, the upgrade prompt when the cap is approached.
- [ ] Build the private link generator and the rotation flow; document the agent's re-registration path after a rotation.
- [ ] Build the routing surface: receive an MCP call on the private link, dispatch to the right registered server, return the response; measure and surface the routing latency to the user.
- [ ] Build the account-activity email layer: signup confirmation, password reset, billing events, security alerts; enforce the no-marketing policy.
- [ ] Build the subscription billing layer for Pro ($5/mo) and Teams Unlimited ($25/mo), with the upgrade path on cap approach and the grace period on billing failure.
- [ ] Run an end-to-end test: a Free-tier user signs up, adds 5 MCP servers, registers a single private link with a mock agent, sees one tool in the agent's context window, calls the tool and sees the locker dispatch to the right server; the user attempts to add a 6th server and is prompted to upgrade.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish the public landing page at `mcplocker.com` with the pricing tiers and the signup form
- [ ] Document the encryption-at-rest claim, the audit surface, and the no-marketing email policy on the Privacy Policy page
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
