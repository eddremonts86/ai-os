---
id: "3094"
slug: oneenv-govern-shared-config-with-pr-style-reviews-and-p
title: OneEnv – Govern shared config with PR-style reviews and per-service approval
status: draft
source:
  name: BetaList
  url: "https://betalist.com/startups/oneenv?utm_campaign=startup-184259&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# OneEnv – Govern shared config with PR-style reviews and per-service approval

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3094-oneenv-govern-shared-config-with-pr-style-reviews-and-p/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Workspace + branch data model in SQLite (Drizzle): workspaces, branches, services, pending changes, audit rows
- [ ] TanStack Start API: branch CRUD, diff endpoint, merge endpoint, per-service approval endpoint
- [ ] React workspace UI: branch list, diff view, single-review merge button
- [ ] Per-service approval UI: service-owner consent flow
- [ ] Audit log viewer with both-gate history and rollback targets
- [ ] Impact scoring: diff → services touched / schema-affected / validation-affected
- [ ] GitHub importer: parse topology from imported repos, attach services to workspace
- [ ] Format exporter: Terraform / Helm / Kustomize / raw `.env` outputs
- [ ] Workspace search: services, envs, rules

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
