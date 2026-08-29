---
id: "3678"
slug: archlex-a-small-oss-language-for-aws-gcp-and-kubernetes
title: "ArchLex: a small OSS language for AWS, GCP, and Kubernetes diagrams"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485987"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Python (parser/validator), Rust or Go for deterministic SVG layout, Streamable HTTP MCP server]
---
# ArchLex: a small OSS language for AWS, GCP, and Kubernetes diagrams

## Problem

Existing infrastructure-diagram tools either produce non-semantic pictures (Lucidchart/Excalidraw/draw.io boxes with no machine-readable meaning) or expect the user to author structured DSLs that are too heavy to drive from natural language. Teams that adopt AI coding agents (Claude Code, Codex, Cursor) need a way to ask "draw me a resilient AWS event-ingestion system" and get back a diagram that is both a deterministic, accessible SVG and a validated model whose nodes and edges have real cloud semantics. The ArchLex landing page (https://archlex.dev/) frames this gap as "Diagrams that know what they mean. Built for AI agents." and ships a hosted MCP server (`https://mcp.archlex.dev/mcp`) that exposes `render_diagram`, `validate_diagram`, `get_cloud_catalog`, and `generate_playground_url` to any MCP client. The MCP documentation explicitly lists `render_diagram` accepting `theme`, `direction`, `validation`, and `format` (default `png` or `svg`) and `validate_diagram` returning parse hints such as "free-form edge text belongs in `->|label|`, not inside `-[kind]->`".

## Objective

Ship an open-source DSL + deterministic renderer + MCP server that lets an AI agent author, validate, and render semantically correct AWS, GCP, and Kubernetes diagrams from a natural-language prompt, returning either a base64 PNG or raw SVG plus diagnostics and a playground deep link. Validate end-to-end with a hosted MCP server, a Playwright-based playground, and a typed CLI for offline use, so the same source string produces an identical diagram in every client.

## Target Users

- Primary: AI-coding-agent users (Claude Code, Codex, Cursor) who want to author and validate cloud diagrams in natural language without learning a heavy DSL.
- Secondary: platform / SRE / DevOps engineers who want a deterministic, text-version-controlled alternative to Lucidchart or draw.io for AWS, GCP, and Kubernetes architecture diagrams.
- Tertiary: technical writers and solution architects who need an accessible SVG (semantic node/edge metadata) instead of a flat raster image.

## MVP Scope

- A small textual DSL with three top-level providers (`aws`, `gcp`, `k8s`) and the scope grammar documented by the MCP server (`account`, `region`, `vpc`, `subnet`, `cluster`, `namespace`).
- A parser/validator that emits diagnostic hints on parse failure (e.g. `hint` field documented for `validate_diagram`).
- A deterministic SVG renderer with configurable `theme` (light/dark) and `direction` (layout direction).
- A PNG rasterizer that returns a base64 image block to MCP clients.
- A hosted MCP server (Streamable HTTP at `/mcp`, with `/sse` and `/messages` legacy routes) exposing the four documented tools plus the `architect_cloud_infrastructure` prompt and the three example resources (`archlex://examples/aws-microservices`, `archlex://examples/gcp-data-pipeline`, `archlex://examples/k8s-microservices`).
- A web Playground that opens from a `generate_playground_url` deep link, so a non-MCP user can paste the same source and see the same SVG.
- A `health` endpoint that returns the active provider list and auth status so MCP clients can verify a healthy server reports `aws`, `gcp`, and `k8s`.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The hosted MCP server is the canonical implementation; the language must remain open-source and the playground must be reachable without an account.
- Server must default to open access; only deployments that set `MCP_AUTH_TOKEN` should require a bearer token (per the documented security model).
- Renderer must be deterministic — the same source string + theme + direction must produce byte-identical SVG output, so diagrams can be diffed in git and embedded in PRs.
- The DSL must remain small enough to fit in a single prompt (`architect_cloud_infrastructure`) so an agent can author valid source without an external catalog; the catalog is fetched on demand via `get_cloud_catalog`.
