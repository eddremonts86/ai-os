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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A natural-language prompt ("design a resilient AWS event-ingestion system, validate it, and open the result in ArchLex Playground") produces a deterministic, accessible SVG diagram whose nodes and edges carry real AWS / GCP / Kubernetes semantics, exposed through an MCP server that any agent can call — without learning a heavy DSL or owning a Lucidchart seat.

## Target Users

| Stakeholder | Why they care |
|---|---|
| AI-coding-agent users (Claude Code / Codex / Cursor) | They want diagrams as a side-effect of the same prompt that writes Terraform or Helm, validated before render, and returned as deterministic SVG/PNG. |
| Platform / SRE / DevOps engineers | They need diagrams that survive `git diff` and code review and that semantically describe the topology (provider, scope, relationships), not just boxes and arrows. |
| Technical writers / solution architects | They need accessible SVG output with node/edge metadata they can re-style and embed in docs, instead of flat raster images from Lucidchart/draw.io. |
| Cloud vendors (AWS, GCP) | Indirect: an open canonical diagram grammar that their service teams can map into without each lab rolling its own DSL. |

## Jobs To Be Done

1. **Functional job** — Describe a cloud architecture in natural language and get back a validated, deterministic, accessible SVG plus a Playground URL the team can share.
2. **Emotional job** — Stop fighting a diagramming tool every time the architecture changes; trust that the diagram in the PR matches the code that produced it.
3. **Social job** — Look like a team that ships infra "as code" even for the picture, instead of forwarding screenshots from Lucidchart.

## Success Metrics

- **Activation:** ≥ 60% of Playground visitors trigger at least one `render_diagram` MCP call within their first session, and ≥ 30% open a `generate_playground_url` deep link from a non-MCP client.
- **Validation coverage:** ≥ 80% of MCP `render_diagram` calls run with `validation` set to `normal` (not `off`), and < 5% return a `hint` field because parse errors surfaced upstream.
- **Determinism:** two renders of the same source + theme + direction produce byte-identical SVG for 100% of regression fixtures.
- **Provider coverage:** `/health` reports `aws`, `gcp`, and `k8s` healthy on ≥ 99% of weekly probes.

## Pricing & Monetization

Open-source DSL, parser, renderer, and Playground; the hosted MCP server (`mcp.archlex.dev`) is free by default (open access). Paid tier: managed MCP deployments with `MCP_AUTH_TOKEN` gating, private catalogs, and an SLA, billed per workspace per month. No transaction fees on diagram rendering.

## Competitive Landscape

- **Lucidchart / draw.io / Excalidraw** — visual editors; produce non-semantic pictures that cannot be authored from a prompt and do not survive `git diff`.
- **Diagrams-as-Code (mingrammer/diagrams, HariSekhon/Diagrams-as-Code, KubeDiagrams)** — Python DSLs that render to cloud icons but are not designed for agent-driven authoring and produce non-deterministic layouts.
- **Amazon Q Developer / Stitch / MCP-driven diagram generators** — vendor-tied to a single cloud and a single agent runtime; ArchLex targets all three providers (`aws`, `gcp`, `k8s`) behind one grammar.
- **Structurizr DSL** — text-based architecture-as-code for C4-style diagrams, but a different abstraction (workspaces, models, views) and not built around cloud-provider catalogs.

## Risks & Open Questions

- [ ] Confirm that `render_diagram` returning `format: "png"` as a base64 image block is consistently supported by every MCP client (the docs note `format: "svg"` is intended for text-only or CLI clients).
- [ ] Decide whether the deterministic renderer should ship as a Rust binary or stay in Python for contributor friendliness — affects packaging size and CI time.
- [ ] Validate that the three example resources (`aws-microservices`, `gcp-data-pipeline`, `k8s-microservices`) actually exercise every relationship kind listed by `get_cloud_catalog` so the `architect_cloud_infrastructure` prompt does not hallucinate unsupported syntax.
- [ ] Confirm the hosted MCP server's rate-limit posture for free access; if it caps renders, the "open" promise breaks for the bursty workload an agent generates.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49485987) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
