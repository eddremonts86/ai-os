---
id: "4902"
slug: pangolin-sso-and-wireguard-instead-of-api-keys-for-llm
title: Pangolin – SSO and WireGuard instead of API keys for LLM access
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49549747"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Pangolin – SSO and WireGuard instead of API keys for LLM access

## Problem

You have seen Pangolin (https://github.com/fosrl/pangolin) on here before for our open-source zero-trust network access suite of tools. We are launching a new AI gateway that takes a different approach to auth. Rather than authenticating requests to AI providers with API keys, it authenticates the network connection itself via a desktop app.Each user gets a WireGuard tunnel back to the gateway, established after they log in through their existing identity provider (Okta, Azure, Google, etc) via a desktop app. That tunnel is the auth, so there is no key to generate, embed, rotate, or leak, because the gateway already knows who's on the other end of the connection. Compare that to most AI gateways, which are really just a proxy in front of static bearer tokens you'd get from OpenAI or Anthropic directly.This tunnel-based approach also means self-hosted and on-prem models aren't an afterthought bolted onto the gateway. They work the same way public cloud models do. Drop a lightweight tunnel connector inside your cluster (even a DGX Spark) and it joins the same network, so on-prem models show up in the gateway next to public cloud ones. Users switch between them without changing endpoints or juggling separate credentials for internal infrastructure.For machines or users who can't run the desktop client, we still support traditional virtual keys, plus the usual gateway features: session logging, budgets, usage analytics, and governance.It’s fully self-hostable. Community Edition is free for everyone. Enterprise Edition is free for individuals and small businesses. There is also Pangolin Cloud which is fully hosted.

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
