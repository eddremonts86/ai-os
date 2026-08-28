---
id: "3094"
slug: oneenv-govern-shared-config-with-pr-style-reviews-and-p
title: OneEnv – Govern shared config with PR-style reviews and per-service approval
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/oneenv?utm_campaign=startup-184259&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# OneEnv – Govern shared config with PR-style reviews and per-service approval

## Tech Stack

The BetaList post and the frontmatter both surface this stack — React + TypeScript frontend, TanStack Start as the Node.js API, SQLite with Drizzle ORM for persistence, Coolify + Docker for self-hosting. The choice lines up with the product's governance-first positioning: TanStack Start gives a single full-stack surface for the workspace UI and the branch/merge backend without an SPA-plus-separate-API split, and SQLite-via-Drizzle keeps the self-host story a single file the customer backs up with their existing ops. Coolify + Docker is the deploy artifact: `docker compose up` is the install.

## Architecture

- **Workspace + branch model** as the source of truth for pending config changes. Every edit lands on a branch; the branch carries the diff for env values, DB structure, API routes, and validation rules in one shape.
- **Workspace-level review gate** — one reviewer clicks "merge branch" once. The post frames this as a single review before fan-out, not a per-service review.
- **Per-service approval gate** — after the workspace merge, each downstream service has its own consent step. The audit log records both gates, so the trail shows who approved what when at both levels.
- **Impact / risk scoring** — derived from the diff (services touched, schema-affected, validation-affected). Computed in the API layer, surfaced in the UI before merge.
- **GitHub importer** — parses service topology from imported repos so the workspace knows what a change touches.
- **Format-flexible exporter** — produces config in the team's formats so deploy tooling (Terraform, Helm, Kustomize, raw `.env`) consumes the merged result without re-keying.
- **Audit log + rollback targets** — every change has a history row and a target it can roll back to.
- **Workspace search** — single search surface across services, envs, and rules.

## Milestones

1. **M0 — Branch + review (2 wk).** Workspace + branch model, single-review gate, audit log row per merge. TanStack Start API + SQLite schema. Internal alpha.
2. **M1 — Per-service approval (2 wk).** Add the per-service approval step. UI for service owners. Audit log captures both gates. Internal beta with 2 design-partner workspaces.
3. **M2 — Impact scoring (1 wk).** Diff → impact score. Surface before merge. Internal beta validates the score against actual incidents.
4. **M3 — GitHub import (2 wk).** Topology parser + import flow. Validated against 5 representative repos (monorepo, polyrepo, mixed). Activation metric defined.
5. **M4 — Format exporter (2 wk).** Export to Terraform / Helm / Kustomize / raw `.env`. Validated with 2 deploy-pipeline partners.
6. **M5 — Self-host release (1 wk).** Coolify + Docker image, single-binary install, README + 10-min setup. Public beta.
7. **M6 — Pricing + paid tier (1 wk).** Freemium + paid tier with audit-log retention + SSO. Validate with 5 platform-team interviews; pin the price.

## Risks

- **Per-service enforcement at deploy time.** The MVP must hook into the customer's deploy pipeline (or run an agent at deploy) to actually enforce "nothing goes live without consent." If the gate lives only in the editor, the value collapses into "yet another audit log" and Doppler/Infisical already cover that.
- **GitHub-import scope.** Real repos are messy (monorepos, polyrepos, generated files, private submodules). If topology detection requires manual mapping, activation breaks and the 14-day metric slips.
- **Self-host + compliance.** SOC 2 / ISO 27001 buyers expect retention controls in the product, not just an audit log. Without retention defaults, the first 5 enterprise deals each renegotiate it.
- **Single-review + per-service approval UX.** The two-step gate has to read as "one click of trust" at the workspace level and "I, the service owner, own my part" at the per-service level. If it feels like double review, adoption stalls.
- **Pricing absent from post.** The post names no price. Treat the 6.0 Money ceiling as anchored on the workflow-shape, not the recurring signal, until 5 platform-team interviews confirm it.
