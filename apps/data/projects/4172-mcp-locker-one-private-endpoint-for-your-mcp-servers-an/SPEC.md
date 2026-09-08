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

## Problem

Agents that work with private MCP servers and skills usually have to register each server individually with the agent, which means the agent's tool surface grows by one per server, the agent's context window fills with one tool description per server, and the user's private endpoints are exposed to the agent's tool-discovery layer one by one. MCP Locker collapses all of the user's private MCP servers and skills behind a single private endpoint so the agent sees one tool and the locker routes the call to the right server.

The source is the mcplocker.com landing page. The pricing tiers are named explicitly: Free for up to 5 MCP servers, Pro for up to 100 MCP servers at $5/mo, Teams Unlimited at $25/mo. Every endpoint is "private & encrypted at rest", and the company emails only about account activity — no spam. The setup flow gives the user a private MCP link (e.g. `mcplocker.com/my/28gK5cL4…`) that the agent registers as a single tool.

The source names the actor (a user running an AI agent against multiple private MCP servers and skills), the pain (one tool registration per server, one tool description per server in the agent's context window, one privacy boundary per server), and the missing thing (a single private endpoint that fronts the user's whole MCP library). It does not name a specific agent framework, a specific MCP server, or a specific privacy certification.

## Objective

Build a private MCP endpoint service that fronts the user's whole MCP server and skill library behind a single private link the agent registers as one tool, with the locker routing the call to the right server, and with tiered plans that cap the number of MCP servers per account.

## Target Users

- Users running an AI agent against multiple private MCP servers who want one tool in the agent's context window instead of one per server.
- Teams running an internal MCP library and wanting a single private endpoint they can rotate, audit, and revoke without changing the agent's tool registration.
- Privacy-conscious users who want their MCP endpoints encrypted at rest and the locker to email only about account activity.
- Power users with a few MCP servers on the Free tier, growing into Pro as their library grows past 5 servers.
- Teams with an unbounded MCP library on the Teams Unlimited tier who need a flat per-team price instead of a per-server cap.

## MVP Scope

- A hosted service at `mcplocker.com` that lets a user register MCP servers and skills behind a single private link (e.g. `mcplocker.com/my/28gK5cL4…`).
- A Free tier that supports up to 5 MCP servers per account.
- A Pro tier that supports up to 100 MCP servers per account at $5/mo.
- A Teams Unlimited tier that supports an unbounded number of MCP servers per team at $25/mo.
- A private-link setup flow that asks for Privacy Policy consent and emails the user only about account activity, never marketing.
- An encrypted-at-rest data layer for the user's MCP server registrations and skill registrations.
- A routing layer that the agent calls via the single private link, with the locker dispatching the call to the right registered MCP server.
- A user-facing surface for adding, removing, rotating, and revoking MCP server registrations.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The endpoint is private. The user must consent to the Privacy Policy before the link is generated; the consent record is part of the audit trail.
- The endpoint is encrypted at rest. The MCP server registrations and skill registrations are stored encrypted; the decryption key is the user's account credential.
- The agent sees one tool. The locker routes the call to the right MCP server; the agent's context window holds one tool description, not one per server.
- The Free tier caps MCP servers at 5 per account. Adding a 6th server requires a Pro upgrade or a server removal; the locker surfaces the cap on the setup flow.
- The Pro tier caps MCP servers at 100 per account at $5/mo. The Teams Unlimited tier is the only tier without a per-team cap.
- The locker emails the user only about account activity. Marketing email is not in the product; the signup flow does not collect marketing consent.
- The pricing tiers are public. The source publishes the Free, Pro ($5/mo), and Teams Unlimited ($25/mo) tiers on the landing page; the plan does not invent a tier the source does not name.
