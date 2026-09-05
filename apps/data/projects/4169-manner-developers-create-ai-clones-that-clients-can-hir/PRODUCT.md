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

## Value Proposition

A marketplace where developers create AI clones that carry their judgment, communication, standards, and approach to unfamiliar code, and clients hire the clone on demand. Each task runs in a sealed container with build and health checks before any change applies, a live preview at a real URL before production, developer-set review controls, and automatic rollback. The clone is not a generic agent with the developer's name on it — the marketplace names the developer behind every clone, lists the developer's experience, stack, and track record, and the developer reviews the work the clone ships.

The three reference timings the source publishes are the platform's claim: a 150-file TypeScript migration in roughly 35 minutes (vs 3–5 days), full test coverage in roughly 25 minutes (vs 1–2 days), and a third-party API integration end-to-end in roughly 20 minutes (vs 1–2 days). These are reference timings against the developer-day equivalents the source quotes, not a contractual promise.

**One-liner:** A marketplace where developers create AI clones that carry their judgment and clients hire the clone on demand, with sealed per-task containers, build checks, live preview, developer-set review controls, and automatic rollback.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developers whose hours are the bottleneck | Want their judgment to scale beyond their hours without becoming an agency. |
| Clients who chose a developer, not a generic agent | Want the specific developer's way of working on demand, with the developer's review on every shipped change. |
| Engineering teams maintaining ongoing projects | Need continuity — the same judgment that started the project is the judgment that keeps it current. |
| Independent developers scaling beyond one client | Want their track record, stack, and standards to compound as a marketplace listing, not as a personal network. |
| Clients burned by generic coding agents | Want a clone with a career behind it, a track record, and accountability when the work breaks. |

## Jobs To Be Done

1. **Functional job** — Hire a specific developer's way of working on demand, paste a repo, ask in plain English, get back a task that ships through code, tests, preview, and delivery.
2. **Functional job** — Review the change before it ships — see the diff, see the live preview at a real URL, approve or reject.
3. **Functional job** — Recover automatically when the change breaks the build; the platform retries once and rolls back to the last known-good state on the second failure.
4. **Emotional job** — Stop the feeling that hiring a developer means waiting for the developer's hours and that hiring a generic agent means accepting a judgment you did not choose.
5. **Social job** — Be the team whose ongoing maintenance work is done by the same judgment that started the project, with the developer's name on the clone and the developer's review on the work.

## Success Metrics

- **Reference-timing adherence** — share of tasks whose wall-clock time is within the source's reference timings (TS migration ~35 min, test coverage ~25 min, third-party API ~20 min). The metric is a benchmark, not a contract.
- **Per-task container isolation** — share of tasks where the container is sealed off from every other project. A cross-project contamination is a build-blocking failure.
- **Build-and-health-check pass rate** — share of changes that pass the build and health checks before they are applied. A low pass rate is the signal the clone is shipping broken work.
- **Live-preview reach rate** — share of applied changes that have a live preview the client saw before production. A preview the client did not see is the signal the gate was bypassed.
- **Developer-review-gate coverage** — share of tasks where the developer's review-and-sign-off gate was active and the gate fired. A gate the developer set but never fires is the signal the gate was bypassed.
- **Automatic-rollback success rate** — share of broken-change attempts where the rollback restored the last known-good state. A failed rollback is the signal the platform's safety net is leaking.
- **Clone-with-named-developer share** — share of marketplace listings that name the developer behind the clone. A clone without a named developer is a generic agent and is not listed.

## Pricing & Monetization

The source names no fee, no rate, and no tier. The marketplace takes a cut of the task price the developer sets, but the source does not name the cut, the task price, or the subscription shape. The three reference timings are benchmarks, not contractual promises. Any future monetization has to be measured against the reference-timing adherence and the clone-with-named-developer share, because those are the metrics the source actually ties to the marketplace's value proposition.

## Competitive Landscape

- **Traditional freelancer marketplaces (the names the source does not provide)** — host real developer judgment, but bounded by the developer's hours and attention.
- **Generic coding-agent products (the names the source does not provide)** — available instantly, but no specific developer behind them, no track record, no accountability when the work breaks.
- **AI app builders (the names the source does not provide)** — fast for starting something new, but not a developer's judgment applied to ongoing maintenance.
- **In-house engineering teams** — have continuity and judgment, but the team's hours are bounded by headcount and budget.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the developer-onboarding flow actually captures a developer's judgment, not just their surface preferences. The source names judgment, communication, standards, and approach; the open question is how the marketplace measures "this clone carries the developer" rather than "this clone is a fine-tuned base model".
- [ ] Define the developer-review gate's contract. The source says the developer can require a diff review and sign-off; the open question is whether the gate is per-task, per-clone, per-developer, or a combination.
- [ ] Validate the automatic-rollback policy. The source says "retries — then restores the last known-good state"; the open question is whether the platform retries on the same fix attempt, a different fix attempt, or both, and what counts as a "healthy project" for the rollback decision.
- [ ] Establish a documented escalation path when the developer disagrees with the clone's work mid-task. The developer can intervene; the open question is whether the platform supports a hard pause (developer takes over the keyboard) or a soft override (developer rewrites the plan).
- [ ] Confirm the live-preview URL is sandboxed from production data. The preview runs the result at a real URL; the open question is whether the preview sees production-shaped data, anonymised data, or fixture data.
- [ ] Decide the policy on a clone that the client wants to keep working after the developer's hours change. The clone carries the developer's judgment; the open question is what happens when the developer updates their standards and the clone's outputs shift.
- [ ] Define the marketplace ranking algorithm. The marketplace lists clones by experience, stack, and track record; the open question is whether ranking is by track record, by stack match, by developer's review rate, or by client satisfaction, and whether the developer can pay for placement.
