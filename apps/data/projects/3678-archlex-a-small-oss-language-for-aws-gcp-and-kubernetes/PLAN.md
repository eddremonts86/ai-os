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

## Tech Stack

- **DSL grammar:** a small hand-written EBNF; catalog (services, aliases, relationship kinds, scope names: `account`, `region`, `vpc`, `subnet`, `cluster`, `namespace`) loaded on demand via `get_cloud_catalog`.
- **Parser/validator:** Python (stdlib only) so the parser can ship as one file alongside `mesh.py`-style distribution; emits a `hint` field on parse errors (e.g. "free-form edge text belongs in `->|label|`, not inside `-[kind]->`").
- **Deterministic SVG layout:** Rust crate (no GC, no rand) compiled to a Python extension module so the renderer is byte-stable for the same `(source, theme, direction)` tuple.
- **PNG rasterizer:** headless SVG-to-PNG step that returns a base64 image block to the MCP client when `format: "png"` is requested.
- **MCP server:** TypeScript (Cloudflare Workers, per the documented deployment), Streamable HTTP transport at `/mcp`, legacy `/sse` and `/messages` routes, `/health` and `/info` endpoints.
- **Auth:** optional `MCP_AUTH_TOKEN` env var; absent → open access; present → bearer-token required on every MCP request.
- **Playground:** static SPA (TypeScript) served from the same origin, opens from a `generate_playground_url` deep link.

## Architecture

```
MCP client (Claude Code / Codex / Cursor)
        │  Streamable HTTP POST /mcp
        ▼
┌────────────────────────────────────────────────────────────┐
│  Cloudflare Worker — MCP server                           │
│   • /health  → provider list + auth status                 │
│   • /info    → server metadata + capabilities              │
│   • /mcp     → Streamable HTTP transport                    │
│       ├─ render_diagram     (parse → validate → layout → PNG/SVG)
│       ├─ validate_diagram   (parse → validate, no layout)
│       ├─ get_cloud_catalog  (aws | gcp | k8s | all)
│       └─ generate_playground_url (deep link)
│   • Resources: archlex://examples/{aws-microservices, gcp-data-pipeline, k8s-microservices}
│   • Prompt:    architect_cloud_infrastructure {aws|gcp|k8s}
└────────────────────────────────────────────────────────────┘
        │                                       │
        ▼                                       ▼
   Rust layout crate                       Playground SPA
   (deterministic SVG)                     (paste source → live preview)
```

## Milestones

1. **M0 — Spec freeze.** DSL grammar + three providers + scope names finalized; `architect_cloud_infrastructure` prompt v1. End of week 2.
2. **M1 — Parser/validator.** Python parser with `hint` field on parse error; CLI parity with `validate_diagram`. End of week 4.
3. **M2 — Renderer.** Rust deterministic layout; `render_diagram` returns SVG; regression fixtures prove byte-identity. End of week 6.
4. **M3 — MCP server.** TypeScript Worker, Streamable HTTP transport, `/health`, `/info`, all four tools, the three example resources. End of week 8.
5. **M4 — Playground.** SPA opens from `generate_playground_url` deep link; renders the same SVG the server returns. End of week 10.
6. **M5 — Agent showcase.** Verified one-shot flows from Claude Code + Codex + Cursor: prompt → `validate_diagram` → `render_diagram` → Playground link. End of week 12.

## Risks

- **Determinism across renderer versions.** A layout crate upgrade that introduces a non-stable ordering will silently break byte-identity in the regression fixtures and any downstream `git diff` workflow. Pin the layout algorithm in a single source-controlled module and gate releases on a fixture diff.
- **MCP client compatibility.** Streamable HTTP is the documented transport, but some clients still rely on the legacy `/sse` + `/messages` routes. Keeping both live doubles the surface; deprecating them early breaks agents in the wild. Decide the deprecation date up front and document it in `/info`.
- **Catalog drift.** `get_cloud_catalog` advertises the current service list for `aws`, `gcp`, and `k8s`; when a provider ships a new service, the LLM prompt may invent syntax for it. Ship a CI test that runs the prompt against every catalog version and fails on any invented token.
- **Open-access rate-limit posture.** Free hosted access is part of the headline claim ("Built for AI agents"); an aggressive bursty agent workload can exhaust a Worker quota and degrade the Playground. Define a soft per-IP limit and a 429 with retry-after before launch so the failure mode is visible.
