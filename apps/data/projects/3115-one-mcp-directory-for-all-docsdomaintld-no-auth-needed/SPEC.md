---
id: "3115"
slug: one-mcp-directory-for-all-docsdomaintld-no-auth-needed
title: One MCP directory for all docs.domain.tld (No auth needed)
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447616"
category: ask-hn
date: "2026-08-26"
tags: [Ask HN, Problem]
---
# One MCP directory for all docs.domain.tld (No auth needed)

## Problem

The poster has been using MCP servers for Stripe, Cloudflare and others. While building, many of those servers asked them to sign in or grant authorisation, even though the poster only wanted to consult the documentation. Docs are a useful source of truth for LLMs because they are kept up to date. The poster finds auth-gated MCP servers risky — leaking credentials or accidentally running destructive actions against their own servers. They ask whether others feel the same and propose a single docs-only MCP directory that needs no authentication.

## Objective

There is a soft product idea (a single docs-only, auth-free MCP directory) but it is offered as a proposal for discussion, not a working product.

## Target Users

LLM-using developers who want to query vendor documentation without handing the tool credentials to act on their accounts.

## MVP Scope

No MVP. The proposal is at the "would you like this" stage. Any MVP would have to scrape or federate vendor docs and expose them through a single MCP endpoint, which is non-trivial and not specified by the poster.

## Constraints

Vendor documentation is hosted by each vendor and may change format at any time; no auth model today guarantees docs are read-only.
