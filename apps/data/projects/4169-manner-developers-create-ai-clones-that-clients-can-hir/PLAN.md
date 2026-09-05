---
id: "4169"
slug: manner-developers-create-ai-clones-that-clients-can-hir
title: Manner – Developers create AI clones that clients can hire
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511046"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Manner – Developers create AI clones that clients can hire

## Tech Stack

- **A coding-agent runtime (the names the source does not provide)** that can read a repo, prepare a sandbox environment, build, run health checks, and apply a diff — the same agent surface the Manner clone wraps.
- **A per-task container runtime** that isolates each task from every other project; the source calls this "sealed off", and the runtime has to enforce that, not just document it.
- **A live-preview orchestrator** that runs the result at a real URL before production; this is the preview layer the client sees.
- **A developer-onboarding surface** that turns a developer's inputs (judgment, communication, standards, approach) into a clone configuration the marketplace can host.
- **A marketplace surface** that lists each clone with the developer's name, experience, stack, and track record; the listing is the unit of trust the marketplace sells.
- **A developer review-control surface** that gates applied changes on a diff review and sign-off when the developer has the gate turned on; the default is on.
- **An automatic-rollback path** that retries a broken change once, then restores the last known-good state from a snapshot the platform keeps.
- **A per-task delivery surface** (the prompt, the plan, the code, the tests, the preview, the applied change) that the client reads end-to-end.

## Architecture

The platform has two sides: the developer side (clone creation, marketplace listing, mid-task intervention, standards updates) and the client side (browse, hire, prompt, review, ship). The marketplace is the seam between the two.

On the developer side, the onboarding flow turns the developer's inputs into a clone configuration. The clone is the unit of trust the marketplace sells: it carries the developer's judgment, communication, standards, and approach. The marketplace lists the clone with the developer's name, experience, stack, and track record, and the developer can update the clone's standards over time. The developer can intervene mid-task (hard pause or soft override), and the developer review-control surface gates the applied change on a diff review and sign-off when the gate is on.

On the client side, the browse flow lets the client filter the marketplace by stack, experience, and track record, and the hire flow takes the client to the clone's listing. The paste-repo flow reads the client's project, prepares a sandbox environment, and gives the coding agent a real place to build and verify changes. The ask-in-plain-English flow turns the client's prompt into a task the clone executes.

The per-task container is the safety boundary. Each task runs in its own container, sealed off from every other project. The build-and-health-check step runs before any change is applied; the live-preview step runs the result at a real URL; the developer review-control step gates the applied change when the gate is on; the automatic-rollback step retries a broken change once and restores the last known-good state on the second failure.

The per-task delivery surface is the contract between the clone and the client. The client reads the prompt, the plan, the code, the tests, the preview, and the applied change end-to-end. The clone does not ship work the client cannot read.

The marketplace ranking is the unit of trust the marketplace sells. The source names experience, stack, and track record; the open question is the ranking algorithm's actual shape (track record, stack match, developer review rate, client satisfaction, paid placement). The platform does not invent a ranking the source does not name.

## Milestones

1. **M1 — Developer onboarding flow** — the inputs the developer supplies (judgment, communication, standards, approach), the clone configuration the platform hosts, the per-developer surface.
2. **M2 — Marketplace listing** — the clone's listing with the developer's name, experience, stack, and track record, the browse surface, the filter by stack/experience/track record.
3. **M3 — Paste-repo setup** — the repo reader, the sandbox-environment preparer, the coding-agent handoff that gives the agent a real place to build and verify.
4. **M4 — Per-task container** — the per-task container runtime, the sealed-off enforcement, the build-and-health-check step.
5. **M5 — Live preview** — the live-preview orchestrator that runs the result at a real URL before production, the preview's data sandboxing.
6. **M6 — Developer review-control gate** — the per-task gate, the per-clone default, the diff-review and sign-off surface, the gate-bypass log.
7. **M7 — Automatic rollback** — the retry-once-then-rollback policy, the last-known-good-state snapshot, the rollback's verification step.
8. **M8 — Per-task delivery surface** — the prompt/plan/code/tests/preview/applied-change view, the client's end-to-end read.
9. **M9 — Reference-timing benchmarks** — the three reference timings (TS migration ~35 min, test coverage ~25 min, third-party API ~20 min) as a published benchmark, not a contractual promise.

## Risks

- **Clone drift from developer** — the clone's outputs diverge from the developer's current judgment and the marketplace keeps shipping stale work. Mitigation: the developer can update the clone's standards over time; the platform surfaces the developer's last-updated timestamp on the listing.
- **Developer-review gate bypass** — the gate is on but the platform applies the change anyway. Mitigation: the gate is the developer's default; the platform logs every bypass and surfaces the bypass count on the listing.
- **Live-preview URL leaks production data** — the preview sees production data and the client sees user records. Mitigation: the preview's data sandboxing is its own milestone; the platform documents whether the preview sees production-shaped, anonymised, or fixture data.
- **Automatic-rollback failure** — the rollback restores a snapshot that itself is broken, and the project is stuck. Mitigation: the rollback verifies the restored state with the same build-and-health-check step before declaring success.
- **Cross-task contamination** — a per-task container inherits state from a previous task and the new task sees the old state. Mitigation: the per-task container runtime is the safety boundary; a contamination is a build-blocking failure and the marketplace ranking surfaces the incident.
- **Marketplace ranking gaming** — a developer pays for placement and the marketplace ranking no longer reflects track record. Mitigation: the marketplace ranking is documented; the platform surfaces paid placement as a separate signal, not a ranking input.
- **Reference-timing adherence as a contract** — clients treat the 35/25/20-minute benchmarks as a SLA and the marketplace is on the hook. Mitigation: the platform publishes the timings as benchmarks, not contractual promises; the per-task delivery surface exposes the actual wall-clock time alongside the reference.
