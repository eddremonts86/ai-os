---
id: "3660"
slug: hi-agent-run-npx-microfeedcli-manage-to-deploy-cms-on-c
title: "Hi agent – run `npx microfeed/CLI manage` to deploy CMS on Cloudflare"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482843"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js CLI, Cloudflare Workers, Cloudflare Pages, D1 (SQLite on Cloudflare), R2 object storage, Wrangler]
---
# Hi agent – run `npx microfeed/CLI manage` to deploy CMS on Cloudflare

## Tech Stack

- **TypeScript with a Node.js CLI** for the `manage` command, because the post's `npx microfeed/CLI manage` invocation implies an npm-distributed CLI and TypeScript covers both the CLI and the worker.
- **Cloudflare Workers** for the CMS runtime, so the serverless path fits the agent-driven deploy story and Cloudflare's free tier is the architectural commitment.
- **Cloudflare Pages** for any static-site rendering layer if the design separates static from dynamic, served from the same Wrangler-managed deploy.
- **D1 (SQLite on Cloudflare)** for the content store, so the runtime stays on Cloudflare without an external database and the SQL surface is the well-known SQLite dialect.
- **R2 object storage** for any binary assets the CMS hosts (images, audio, enclosures), so the storage scales without paying for egress.
- **Wrangler** as the underlying deploy mechanism, with the CLI composing Wrangler commands rather than replacing them so the operator can drop down when needed.
- **A declarative configuration file** (YAML or JSON) that describes the full deploy state and is the single source of truth the agent reads and writes.

## Architecture

The agent-friendly story is the architecture. The CLI is the entry point and the operator surface; everything the CMS does — provision, deploy, configure, publish, tear down — goes through it. The CLI is a TypeScript binary distributed via npm, with subcommands for each phase of the lifecycle. Running `npx microfeed/CLI manage` with no subcommand runs the default flow: read the configuration file, compare the declared state to the actual Cloudflare state, and converge — provision what is missing, update what has drifted, leave what is correct.

The configuration file is the single source of truth. It declares the site name, the content collections, the Cloudflare account and zone references, the Worker bindings, the D1 database bindings, the R2 bucket bindings, and any auth tokens the deploy needs. The CLI reads the file, computes the diff against the live Cloudflare state, and applies the diff. Idempotency is a property of this diff-and-apply loop: running it twice produces the same Cloudflare state, with no duplicated resources and no orphaned routes. The diff step is what makes the CLI safe to run unattended, because there is no destructive operation that has not first been compared to declared intent.

The runtime is a Cloudflare Worker that serves the CMS. Static pages (the rendered site) are served via Cloudflare Pages, with the Worker handling any dynamic routes (RSS feeds, JSON APIs, write paths). Content is stored in D1 with a schema that fits the content model — posts with timestamps, optional enclosures for podcasts, tags or categories — and any binary assets are stored in R2. The publishing flow is data-in, CLI-run, site-reflects: an agent writes a new content record to the configuration or to a content file, runs the CLI, and the new content appears on the site.

Auth for the CLI itself is two-mode. In developer mode, the CLI runs `wrangler login` interactively to attach the operator's Cloudflare account. In agent mode, the CLI reads a token from an environment variable or from a non-interactive config block, so an agent can run the CLI without a browser. Auth for the CMS itself is public-read by default with an optional write token for any path that mutates content; the capture does not name a specific model, so the plan ships the simplest honest shape.

Destructive operations require explicit confirmation flags or are gated behind a separate `destroy` subcommand. The CLI never silently tears down a deployed site, because an agent that runs the wrong command should not orphan the user's data. The destroy path is documented and tested, so an experiment can be cleaned up without leaving Cloudflare resources behind.

## Milestones

1. **M1 — CLI scaffold and config schema** — the npm-distributed CLI, the declarative configuration file format, and the diff-and-apply loop against Cloudflare state.
2. **M2 — Idempotent deploy** — Workers, Pages, D1 and R2 provisioning that survives repeated runs without drift; a published idempotency test.
3. **M3 — CMS runtime** — the Worker serving the content from D1, with a content model that fits what "microfeed" plausibly covers.
4. **M4 — Publishing flow** — an agent can write a content record, run the CLI, and see the site reflect the change; documented end-to-end.
5. **M5 — Unattended auth** — token-based auth for the CLI so an agent can run it without a browser; documented alongside the developer-mode flow.
6. **M6 — Destroy path** — a `destroy` subcommand that cleans up all Cloudflare resources created by the deploy, with a completeness test.
7. **M7 — Free-tier fit** — measured Workers, D1 and R2 usage on a reference deploy, published so the free-tier claim is anchored.
8. **M8 — CMS auth** — public read by default with an optional write token for any mutating path, documented.

## Risks

- **Non-idempotent deploy** — the headline failure of any agent-driven CMS; the diff-and-apply loop has to be tested under repeated runs and against partial-failure scenarios.
- **Destructive operations** — an agent that runs the wrong command should not orphan the user's data; destructive paths need explicit confirmation flags and a separate `destroy` subcommand.
- **Cloudflare API drift** — Wrangler and the Cloudflare APIs change; the CLI has to pin versions or document the supported Cloudflare API surface.
- **Free-tier drift** — Cloudflare's free-tier limits change; the architecture has to fit within the limits, not just at launch.
- **Config-file drift** — the configuration file can become out of date relative to live Cloudflare state if someone bypasses the CLI; the CLI has to detect drift and reconcile.
- **Auth complexity** — two-mode auth (developer + agent) is a real surface; the docs have to make the failure modes visible.
- **Content model assumptions** — scoping a content model from "microfeed" without a stated schema is a guess; the plan keeps the model minimal and extension points explicit.
