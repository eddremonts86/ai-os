---
id: "3623"
slug: greta-turn-a-prompt-into-a-full-stack-app-site-or-platf
title: "Greta – Turn a prompt into a full-stack app, site, or platform fast"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/greta-2?utm_campaign=startup-181017&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Next.js, Firecracker microVMs, MongoDB, S3-compatible object storage, Caddy with on-demand TLS, Temporal]
---
# Greta – Turn a prompt into a full-stack app, site, or platform fast

## Tech Stack

- **Next.js** for both the builder shell and the generated apps: one framework for server routes and screens means the generator emits one project shape instead of two, and the preview can run the real thing rather than an approximation.
- **Firecracker microVMs** for per-project runtimes, because generated server code is untrusted by construction and a container boundary is a weaker promise than a VM boundary for that threat.
- **MongoDB** as the generated app's database, following the integration the listing names; a document store also absorbs prompt-driven schema drift better than a migration-per-column relational table.
- **S3-compatible object storage** for the asset library and for project snapshots taken before every prompt-driven migration.
- **Caddy with on-demand TLS** for custom-domain publishing: it issues and renews certificates on first request for a verified hostname, which is what makes "minutes" achievable without a manual certificate step.
- **Temporal** to run generation, migration and publish as durable workflows, so a failed step resumes or compensates instead of leaving a project half-migrated.

## Architecture

The builder is a Next.js app holding projects, prompts, connections and analytics. A prompt starts a Temporal workflow rather than a request: plan, then emit schema, then emit server routes and screens, then boot the runtime, then attach the preview. Making it a workflow is what allows a generation to be resumed, cancelled or compensated, and it is also what lets the user watch progress per step instead of per spinner. The generator's inputs are the prompt, the chosen template, the project's current file tree, and — the part that changes the design — the discovered tool and data surface of any connected MCP server. That discovery result is treated as ground truth: the generator writes code against fields the connected service actually advertises rather than fields the prompt implied.

Each project gets a Firecracker microVM holding its file tree and process, plus its own MongoDB database and object-storage prefix. Generated code never receives Stripe or OpenAI credentials. Instead, the runtime calls a platform-side broker over an internal endpoint; the broker holds the keys, enforces the per-project spend ceiling, and forwards the call. That indirection is what makes an export safe to hand out and a leaked project source non-fatal.

Editing is the path that has to be right. A second prompt is diffed against the current project: the generator produces a target schema and a migration plan, the workflow snapshots the project's database to object storage, applies the migration, redeploys, and only then swaps the live runtime. If the migration or the boot fails, the workflow rolls back to the snapshot. Publishing writes the hostname to the routing layer; Caddy verifies the DNS record points at the platform, then issues the certificate on first request and terminates for the project's runtime. Analytics events from generated apps land on a collector that writes per-project counters read back in the builder, which keeps the promised analytics first-party and avoids putting a third-party tag inside a customer's app.

## Data Model

- `project` — owner, name, template origin, runtime state, published hostname, spend ceiling.
- `prompt` — project, text, workflow ID, resulting file diff, migration plan, outcome.
- `snapshot` — project, taken-before prompt, database dump location, restore state. Every migration has one.
- `connection` — project, kind (MCP, Stripe, OpenAI), credential reference held platform-side, discovered surface for MCP.
- `asset` — project, object-storage key, mime type, dimensions, references from the generated tree.
- `domain` — project, hostname, DNS verification state, certificate state, last error in plain text.
- `event` — project, name, timestamp, properties, for the first-party analytics read-back.
- `spend` — project, period, model calls, cost, ceiling, action taken when the ceiling was reached.

## Integrations

- **MCP servers** — connect, discover tools and data shapes, feed that surface to the generator and to the running app.
- **Stripe** — payment flows inside generated apps, keys held by the broker and never emitted into project source.
- **OpenAI** — runtime model calls from generated apps, metered per project against a ceiling.
- **MongoDB** — the generated app's database, one per project.
- **DNS and ACME** — custom-domain verification and certificate issuance through the routing layer.

## Milestones

1. **M0 — One prompt, one running full-stack app.** Prompt produces schema, server routes and screens; the app boots in an isolated microVM and the preview is the real runtime. Exit criterion: a form submitted in the preview writes a document to that project's MongoDB and reads it back on reload.
2. **M1 — Editing without data loss.** Second prompt diffs, snapshots, migrates, redeploys, rolls back on failure. Exit criterion: an app with 1,000 existing documents survives a schema-changing prompt with every document still readable, and a deliberately broken migration restores the snapshot automatically.
3. **M2 — Publish on a custom domain.** DNS verification plus on-demand certificate issuance. Exit criterion: a hostname the user controls serves the project over valid HTTPS, and a wrong DNS record produces a plain-language error rather than a stuck state.
4. **M3 — Connections and the credential broker.** MCP discovery feeding the generator; Stripe and OpenAI calls routed through the broker with a per-project ceiling. Exit criterion: a generated app charges a test card and makes a model call while no key exists anywhere in its file tree, and hitting the ceiling stops the calls with a readable error.
5. **M4 — Templates, assets, analytics and export.** Template gallery, asset library referenced from generated markup, first-party events read back in the builder, and a downloadable project. Exit criterion: an exported project runs outside the platform against its own MongoDB and its own keys.

## Risks

- **Multi-tenant execution of generated server code.** This is the platform's largest exposure and it exists from the first published app. A weak isolation boundary is not a bug to be found later, it is the product being unsafe.
- **Migration on live data.** Prompt-driven schema change over documents a business depends on will lose data at least once unless snapshot-and-rollback is structural. The snapshot must be unskippable, including on a generation the user marks as trivial.
- **MCP surface drift.** A connected server that renames or drops a field breaks generated code that was written against it. Without detection, the failure appears as a broken app with no local cause.
- **Runtime model spend.** Generated apps call OpenAI per request and the platform fronts the bill. Ceilings, alerting and a defined stop behaviour are required before public launch.
- **Certificate and DNS failure modes.** Publishing is the moment a non-technical user is most exposed to infrastructure. Every failure needs a cause in plain language or support absorbs it.
- **Template maintenance.** Over 100 templates is 100 codebases that must keep generating and keep booting after every generator change; without automated per-template smoke tests the gallery rots quietly.
- **Export as an honest promise.** If the exported project cannot run without the platform's broker, the export is a gesture and lock-in is the real model.
