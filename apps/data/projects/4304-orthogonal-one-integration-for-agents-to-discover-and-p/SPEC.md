---
id: "4304"
slug: orthogonal-one-integration-for-agents-to-discover-and-p
title: Orthogonal – One integration for agents to discover and pay for APIs
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49523765"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Orthogonal – One integration for agents to discover and pay for APIs

## Problem

Hey HN, we're Bera and Christian, and we're building Orthogonal.Orthogonal gives AI agents one integration to discover, access, and pay for APIs. Think OpenRouter for the APIs that AI agents use.We currently have 50+ API providers and 700+ API endpoints across company, people, financial, and web data, available through our MCP server and SDK on a pay-as-you-go basis. We started with GTM related APIs and are now expanding the catalog.You can try at https://www.orthogonal.com/. You'll need to create an account to use the chat or connect the MCP/SDK.An example prompt for the chat or MCP:
 Find AI infrastructure startups that recently raised a Seed or Series A and return their founders, LinkedIn profiles, and relevant company data.When we heard about https://x402.org/, we saw an opportunity to make APIs easier for agents to pay for. Instead of an agent needing to manage an API key and billing for every API, what if it could just pay for each request?So we started onboarding existing API providers onto x402. Then we realized an agent cannot pay for an API it doesn’t know exists. It also needs to figure out which API can complete the task and how to use it.We also found that putting every small API payment on-chain did not always make sense. If both sides already have accounts with Orthogonal, settling internally is simpler. So we separated API discovery and access from the payment rail.Today, payments can happen through Orthogonal credits, x402, https://mpp.dev/, or https://www.circle.com/nanopayments.The problem we're working on now is API selection.If five APIs can answer the same request, which should the agent use? The cheapest might have worse coverage. Another might be more accurate but slower.We're working on using price, latency, reliability, and result quality to help agents make those decisions.How are you currently giving agents access to paid APIs?And if you gave an agent a budget, would you trust it to choose which API provider to spend it on?

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
