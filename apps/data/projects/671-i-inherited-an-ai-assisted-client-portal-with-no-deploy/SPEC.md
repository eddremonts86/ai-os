---
tags: ["saas", "incident-response", "ai-governance", "devops"]
tech: ["Next.js", "TypeScript", "PostgreSQL", "Drizzle ORM", "Docker", "1Password CLI"]
id: "671"
slug: i-inherited-an-ai-assisted-client-portal-with-no-deploy
title: I inherited an AI-assisted client portal with no deployment history. Where should the cleanup end and ownership begin?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpur3q/i_inherited_an_aiassisted_client_portal_with_no/"
category: saas
date: "2026-08-16"
---
# I inherited an AI-assisted client portal with no deployment history. Where should the cleanup end and ownership begin?

## Problem

A product engineer at a mid-sized B2B SaaS company inherited an AI-assisted customer onboarding portal that a former teammate built in three days using Enter Pro for the prototype and personal Copilot / Windsurf accounts for the production wiring. There is no repository history for the final version, almost no test coverage, no documented deployment path, customer database structures were copied into personal AI workspaces without masking, and internal API keys sit in environments IT cannot review. A large prospect's security questionnaire exposed the gap; the portal cannot currently be turned off because Customer Success already depends on it. Management has asked the engineer to stabilize, document, and hand the portal off without changing scope or deadlines on their existing roadmap. The poster is asking whether to split this into a bounded containment phase and a separate permanent-ownership decision, and what minimum documentation and exit criteria would justify the handoff.

## Objective

Define a two-phase service product for the same incident class: a containment phase that produces a verified inventory, a credential-rotation plan, and a frozen baseline; and a stabilization phase that produces a reproducible build, a documented deployment, a tested rollback, and written exit criteria for transferring permanent ownership to a named team. The product is the playbook and the tool set, not the portal itself.

## Target Users

- **Primary:** mid-sized B2B SaaS companies (50-500 employees) that have shipped an internal or customer-facing service via AI-assisted development without the same governance as their other production systems.
- **Secondary:** engineering leads who have inherited an undocumented service from a former teammate and need an off-ramp that does not collapse the roadmap.
- **Tertiary:** CTOs and VPs of Engineering who need a defensible audit trail before a customer security review or a SOC 2 audit cycle.

## MVP Scope

- **Containment playbook:** freeze non-essential changes, preserve current logs and build artifacts, inventory every credential and external connection, document the data flow, rotate credentials with a verified-after rotation, remove personal AI accounts from the production path.
- **Stabilization playbook:** reproducible build from a clean environment, every schema change captured in a migration history, restore-from-backup drill, rollback drill, monitoring routed to a named on-call team, deployment documentation.
- **Tooling:** a structured containment questionnaire (data-flow mapper, credential inventory, code-vs-running diff), and an exit-criteria checklist that names the artifacts and the tests that must pass before permanent ownership transfers.
- **Deliverable format:** a written handoff document with the inventory, the rotation log, the migration history, the rollback drill, and the exit criteria — owned by the receiving team, signed by both sides.
- **Excluded in v1:** permanent operational ownership (the buyer is the playbook, not the operator); penetration testing; SOC 2 audit execution; vendor consolidation.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single audit-document surface — a sidebar with the containment checklist, a centre pane with the inventory and rotation log, a right-hand panel with the exit-criteria checklist and the rollback drill. No marketing-site chrome; the product is the audit trail.

## Constraints

- Containment must not break customer-facing flows the CS team already depends on; freezes apply to non-essential changes only.
- Credential rotation must be verifiable post-rotation; a rotation that cannot be verified is not a rotation.
- The exit-criteria checklist must be testable, not aspirational; every item names a concrete artifact, a concrete test, and a concrete owner.
- The product must not become a permanent operational owner of the inherited service; that is the explicit handoff the playbook is designed to enable.
