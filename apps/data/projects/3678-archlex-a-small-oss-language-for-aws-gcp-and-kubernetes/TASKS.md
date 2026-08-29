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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Define DESIGN.md (Playground chrome, SVG theme tokens, MCP `info` payload)
- [ ] Lock DSL grammar draft: top-level `provider`, scopes (`account`, `region`, `vpc`, `subnet`, `cluster`, `namespace`), edge syntax `-[kind]->` and `->|label|`
- [ ] Bootstrap Rust layout crate + Python parser module + TypeScript MCP Worker
- [ ] Decide the canonical deployment target (Cloudflare Worker, with optional `MCP_AUTH_TOKEN`)
- [ ] Wire the three example resources (`aws-microservices`, `gcp-data-pipeline`, `k8s-microservices`)

## Phase 1: Core

- [ ] Python parser returns a structured AST and a `hint` string on parse failure (e.g. "free-form edge text belongs in `->|label|`, not inside `-[kind]->`")
- [ ] CLI parity with `validate_diagram`: `archlex validate FILE --provider aws|gcp|k8s`
- [ ] Rust layout crate: deterministic SVG output for `(source, theme, direction)`; expose via Python extension module
- [ ] PNG rasterizer stage that returns base64 image block when MCP `format: "png"`
- [ ] MCP server tools: `render_diagram`, `validate_diagram`, `get_cloud_catalog`, `generate_playground_url` (Streamable HTTP at `/mcp`, legacy `/sse` and `/messages`)
- [ ] MCP `/health` endpoint returning `aws`, `gcp`, `k8s` in the provider list and the active auth status
- [ ] MCP `/info` endpoint documenting capabilities, transport URLs, and the `MCP_AUTH_TOKEN` policy
- [ ] `architect_cloud_infrastructure` prompt accepting `aws|gcp|k8s` and asking the model to return valid ArchLex source
- [ ] Regression fixtures: 50+ `archlex://examples/*` snapshots with byte-identical SVG diffs
- [ ] End-to-end test: from Claude Code, prompt → `validate_diagram` → `render_diagram` → Playground deep link

## Phase 2: Deploy

- [ ] Ship the hosted MCP server at `https://mcp.archlex.dev/mcp` with `/health` returning all three providers
- [ ] Publish the Playground SPA behind the same origin; verify `generate_playground_url` deep links open it
- [ ] Document the `MCP_AUTH_TOKEN` deployment option in the security section
- [ ] Publish the DSL reference + the three example resources on the docs site
- [ ] Post-launch: monitor `/health` weekly and update the catalog when AWS/GCP/Kubernetes ship new services
