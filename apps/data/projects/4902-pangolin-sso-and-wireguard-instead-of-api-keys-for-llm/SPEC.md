# SPEC.md — Pangolin – SSO and WireGuard instead of API keys for LLM access

## Problem

You have seen Pangolin (<a href="https:&#x2F;&#x2F;github.com&#x2F;fosrl&#x2F;pangolin" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;fosrl&#x2F;pangolin</a>) on here before for our open-source zero-trust network access suite of tools. We are launching a new AI gateway that takes a different approach to auth. Rather than authenticating requests to AI providers with API keys, it authenticates the network connection itself via a desktop app.<p>Each user gets a WireGuard tunnel back to the gateway, established after they log in through their existing identity provider (Okta, Azure, Google, etc) via a desktop app. That tunnel is the auth, so there is no key to generate, embed, rotate, or leak, because the gateway already knows who&#x27;s on the other end of the connection. Compare that to most AI gateways, which are really just a proxy in front of static bearer tokens you&#x27;d get from OpenAI or Anthropic directly.<p>This tunnel-based approach also means self-hosted and on-prem models aren&#x27;t an afterthought bolted onto the gateway. They work the same way public cloud models do. Drop a lightweight tunnel connector inside your cluster (even a DGX Spark) and it joins the same network, so on-prem models show up in the gateway next to public cloud ones. Users switch between them without changing endpoints or juggling separate credentials for internal infrastructure.<p>For machines or users who can&#x27;t run the desktop client, we still support traditional virtual keys, plus the usual gateway features: session logging, budgets, usage analytics, and governance.<p>It’s fully self-hostable. Community Edition is free for everyone. Enterprise Edition is free for individuals and small businesses. There is also Pangolin Cloud which is fully hosted.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49549747)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T13:35:01Z

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
