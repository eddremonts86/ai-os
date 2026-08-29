---
id: "3666"
slug: agentctl-terraform-for-your-agent-harnesses
title: Agentctl – Terraform for your agent harnesses
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482426"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Go, Terraform-style HCL dialect, SQLite, Cobra CLI, opencode CLI adapter, Claude CLI adapter, agy CLI adapter]
---
# Agentctl – Terraform for your agent harnesses

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3666-agentctl-terraform-for-your-agent-harnesses/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Define the HCL declaration schema: global config, per-CLI overrides, and the supported fields (skills, model setup, guardrails)
- [ ] Implement per-CLI adapters for opencode, Claude and agy, each translating the declaration into the CLI's native config layout
- [ ] Build the apply step with SQLite-backed state, a state-hash check, and a `plan` command that shows the diff without applying
- [ ] Render the diff surface so the user sees what would change in each per-CLI config before apply, with an abort path
- [ ] Ship the sync transport as a documented choice (git, file copy, dedicated store), keeping the layer simple
- [ ] Keep the "just experimenting" caveat visible in the project, with MVP scope (the three named CLIs) and roadmap framed separately
- [ ] Prove apply idempotency with a test harness that asserts no diff on repeated runs against the same declaration
- [ ] Document the CLI scope honestly: the three named CLIs in MVP, the architecture open to additional adapters, the supported versions published
- [ ] Document the rejection of the shared-folder approach so the architectural stance is explicit, not implicit
- [ ] Treat the declaration file as the single source of truth and refuse hand-edits to the per-CLI native configs that drift away from it

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
