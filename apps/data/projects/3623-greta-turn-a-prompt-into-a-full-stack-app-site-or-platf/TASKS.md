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

## Phase 0: Scaffold

- [x] Read the BetaList listing and separate the generation claim from the hosting and lifecycle claims
- [ ] Write the generated-project contract: file layout, where schema lives, where server routes live, what the generator may never touch
- [ ] Decide the isolation boundary for generated server code and write down the threat model it answers
- [ ] Firecracker host image with a per-project rootfs, boot budget and teardown path
- [ ] MongoDB provisioning per project, with snapshot to object storage and restore both scripted
- [ ] Temporal workflow definitions for generate, migrate and publish, each with a compensation path
- [ ] Credential broker design: internal endpoint, per-project identity, spend accounting, no keys in project source
- [ ] Caddy routing layer with on-demand TLS and a DNS verification step before issuance
- [ ] Pick the first template set small and real; record the per-template smoke test before adding a second one

## Phase 1: Core

- [ ] Prompt-to-project generation: plan, schema, server routes, screens, boot, attach preview
- [ ] Live preview that runs the project's real microVM rather than a client-side approximation
- [ ] Prompt diffing: target schema plus migration plan derived from the current file tree, not a fresh generation
- [ ] Unskippable snapshot before every migration, with automatic restore when migration or boot fails
- [ ] Data-loss test harness: seed 1,000 documents, run a schema-changing prompt, assert every document readable
- [ ] MCP client: connect a server, discover tools and data shapes, persist the surface, feed it to the generator
- [ ] MCP drift detection: re-discover on a schedule, flag projects whose generated code references a vanished field
- [ ] Stripe through the broker: generated app charges a test card with no key in its file tree
- [ ] OpenAI through the broker, metered per project, with a ceiling and a readable stop behaviour
- [ ] Asset library: upload, object-storage write, and reference rewriting inside generated markup
- [ ] Custom-domain flow: hostname entry, DNS record check, certificate issuance, plain-language failure states
- [ ] First-party analytics: event collector, per-project counters, read-back in the builder with no third-party tag
- [ ] Template gallery with real screenshots and a per-template generation smoke test in CI
- [ ] Project export: downloadable tree that runs off-platform against its own MongoDB and its own keys
- [ ] Per-project resource limits: CPU, memory, disk and request rate, enforced at the microVM boundary

## Phase 2: Deploy

- [ ] Runtime pool sized against concurrent published projects, with cold-start and idle-suspend behaviour measured
- [ ] Publish the migration guarantee as a test anyone can re-run, not as a claim on a page
- [ ] Adversarial review of the isolation boundary using deliberately hostile generated code
- [ ] Spend dashboard live before the first public app: per-project model cost, compute cost, ceiling hits
- [ ] Onboard the first projects across all three named integrations to exercise Stripe, OpenAI and MongoDB in one build
- [ ] Week 12 review: first-run success, edit survival, publish completion time, share of projects with an MCP connection
