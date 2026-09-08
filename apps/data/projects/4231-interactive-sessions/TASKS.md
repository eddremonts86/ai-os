---
id: "4231"
slug: interactive-sessions
title: Interactive Sessions
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/revolte"
category: product-launch
date: "2026-08-17"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Interactive Sessions

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4231-interactive-sessions/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the orchestrator: the phase list walker (design, build, test, ship, monitor), the per-phase agent call, the structured handoff protocol between phases.
- [ ] Implement the per-phase agent registry with one agent per phase; each agent exposes a structured artefact the orchestrator passes to the next phase.
- [ ] Build the interactive session surface with the per-phase view (what the current agent is doing, what it produced) and the scroll-back session log.
- [ ] Add the pause-and-resume boundary between phases: the pause control is hidden inside a phase, the resume reads the persisted per-phase state from the session log store.
- [ ] Implement the session log store: the ordered log, the per-phase entry shape, the retention policy that bounds long-running sessions.
- [ ] Build the session export that reads from the same log store the surface reads from, so the exported artefact matches what the user saw in the surface.
- [ ] Wire the host-agnostic integration: the orchestrator drives the user's choice of agents, or a bundled set, with a documented integration per framework.
- [ ] Enforce the phase-handoff validation: the orchestrator validates the structured artefact before passing it to the next phase; a malformed artefact is a logged failure, not a silent drop.
- [ ] Add the failure-handling flow: a phase failure surfaces in the UI and lets the user retry the phase; an unrecoverable failure aborts the session with a documented rollback.
- [ ] Write the README that documents the phase list, the handoff protocol, the pause-and-resume boundary, the export, and the host-agnostic integration.
- [ ] Run an end-to-end test on a representative SDLC session: the orchestrator walks all five phases, each agent produces a structured artefact, the next phase consumes it, the per-phase view shows each agent's work, the pause-and-resume picks up at the same phase boundary, the export preserves the per-phase view, and a phase failure surfaces in the UI.

## Phase 2: Deploy

- [ ] Ship the orchestrator and the per-phase agent registry as a hosted service
- [ ] Document the phase list, the handoff protocol, and the host-agnostic integrations in the launch material so users understand the session's scope
- [ ] Verify in production