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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3660-hi-agent-run-npx-microfeedcli-manage-to-deploy-cms-on-c/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the npm-distributed CLI scaffold with subcommands for the deploy lifecycle
- [ ] Define the declarative configuration file format and the diff-and-apply loop against Cloudflare state
- [ ] Implement idempotent provisioning of Workers, Pages, D1 and R2 so repeated runs produce the same state
- [ ] Build the CMS runtime on Cloudflare Workers with a content model that fits what "microfeed" covers
- [ ] Implement the publishing flow so an agent can write a content record, run the CLI, and see the change live
- [ ] Add token-based CLI auth for unattended agent runs alongside the developer-mode interactive flow
- [ ] Build the `destroy` subcommand with a completeness test that cleans up all Cloudflare resources
- [ ] Add a documented CMS auth posture: public read by default with an optional write token
- [ ] Measure Workers, D1 and R2 usage on a reference deploy and publish the numbers so the free-tier claim is anchored
- [ ] Publish the idempotency test and the documented destroy path so the agent-driven story is verifiable

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
