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

## Tech Stack

- **An interactive session surface** (the source names no specific form factor; the surface is the session's claim) where the user drives the full SDLC.
- **A per-phase agent framework** — one agent per phase (design, build, test, ship, monitor) that hands off to the next within the session.
- **A per-phase view** that shows what each agent is doing and what it produced.
- **A per-session log** that captures every agent's work in the order it happened.
- **A pause-and-resume boundary** between phases, not within a phase.
- **A session export** that produces the same log the user sees in the surface.
- **A host-agnostic orchestrator** (the source names no specific agent framework; the orchestrator is the session's claim).
- **A retention policy** for long-running sessions (the source is silent on retention; the policy is the session's claim).

## Architecture

The session surface is a single-page application backed by three components: an orchestrator, a per-phase agent registry, and a session log store. The orchestrator walks the lifecycle phase by phase; the per-phase agent registry holds the agent for each phase; the session log store captures every agent's work in the order it happened.

The orchestrator is host-agnostic: it walks the phase list, calls the registered agent for each phase, captures what the agent did and what it produced, hands the work to the next phase's agent, and updates the session log. The user starts, pauses, and resumes sessions; a pause between phases is a resume point, a pause inside a phase is a workflow failure.

The per-phase view reads from the session log store and renders what the current agent is doing and what it produced. The view is the same surface the user scrolls back through to revisit earlier phases. A phase that hides its work is a transparency failure, not a privacy feature.

The pause-and-resume boundary persists per-phase state. A session that pauses for days resumes from the same phase boundary with the same state. The orchestrator stores the per-phase state in the session log store; the store is the source of truth for resume.

The session export reads from the session log store and produces a structured artefact that matches what the user saw in the surface. The export format is the session's claim; the source names no specific format. An export that loses the per-phase view is an export failure.

The retention policy bounds the session log's growth. A long-running session can stretch across days; the orchestrator prunes or rotates the log according to the policy. The source is silent on retention; the policy is the session's claim.

## Milestones

1. **M1 — Orchestrator** — the phase list walker, the per-phase agent call, the handoff protocol.
2. **M2 — Per-phase agent registry** — the design agent, the build agent, the test agent, the ship agent, the monitor agent.
3. **M3 — Session surface** — the interactive UI, the per-phase view, the scroll-back session log.
4. **M4 — Pause-and-resume** — the between-phase pause, the persisted per-phase state, the resume flow.
5. **M5 — Session log store** — the ordered log, the per-phase entry shape, the retention policy.
6. **M6 — Session export** — the structured artefact, the per-phase view preservation.
7. **M7 — Host-agnostic integration** — the orchestrator over the user's choice of agents, or the bundled set.

## Risks

- **Phase handoff drops work** — an agent's output does not reach the next phase. Mitigation: the handoff protocol is a structured artefact, not a free-form message; the orchestrator validates the artefact before passing it on.
- **Pause inside a phase** — the user pauses mid-phase and the resume is incoherent. Mitigation: the pause boundary is between phases; the orchestrator refuses a within-phase pause; the UI hides the pause control inside a phase.
- **Session log storage cost** — a long session bloats the log. Mitigation: the retention policy is documented; the orchestrator rotates or prunes the log; the user can archive.
- **Export loses the per-phase view** — the exported artefact does not match what the user saw. Mitigation: the export reads from the same session log store the surface reads from; the export is the same data, not a transformation.
- **Agent fails a phase** — the session is stuck. Mitigation: the orchestrator surfaces the failure and lets the user retry the phase; an unrecoverable failure aborts the session with a documented rollback.
- **Host framework incompatibility** — the orchestrator cannot drive the user's agent framework. Mitigation: the orchestrator is host-agnostic by design; an unsupported framework is a documented integration, not a silent failure.
- **Long-running session state drift** — the per-phase state is stale after a long pause. Mitigation: the orchestrator re-derives the state from the session log on resume; a stale state is a logged warning, not a silent failure.