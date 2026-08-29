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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Agentctl is an experimental Terraform-style tool that manages the configurations of multiple distinct agent CLIs (opencode, Claude, agy) from a single declared file. The user declares the global configuration (skills, model setup, guardrails) once and overrides it per tool where needed; an apply step converges the per-CLI native configs with the declared state, so the same setup works across tools without copying files by hand.

The author explicitly rejects the shared-folder fix — the assumption that the CLIs will converge on a single config layout — the same way he would not wait for GCP and AWS to unify their APIs. The architecture manages distinct CLI configs, not a unified home. The closing caveat — "just experimenting with idea, not sure where will it go" — stays visible, because the project is shared as an idea rather than a finished product.

**One-liner:** Agentctl declares your agent configuration once and applies it across the distinct CLIs you actually use, without assuming they will share a config home.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developers using several agent CLIs | The same setup across tools without copying files by hand. |
| Multi-machine users | The configuration follows them, rather than being rebuilt per device. |
| Operators who want a single declaration | Skills, model setup and guardrails declared once and applied across tools. |
| Experimenters and reviewers | An honest experiment caveat rather than a launch announcement. |
| Adopters of additional CLIs | A documented CLI scope with the architecture open to more adapters. |

## Jobs To Be Done

1. **Functional job** — Declare the agent configuration once and have it apply across the distinct CLIs in use.
2. **Functional job** — Sync the declaration between machines so the configuration follows the user.
3. **Functional job** — See what would change before applying, since apply touches the per-CLI configs the user already has.
4. **Emotional job** — Trust the apply step because it is safe to run repeatedly and produces the same state on the second run.
5. **Social job** — Add another CLI without giving up the declared-config workflow.

## Success Metrics

- **Apply idempotency** — share of apply runs against the same declaration that produce no diff, since idempotency is the load-bearing claim.
- **CLI adapter coverage** — share of the three named CLIs (opencode, Claude, agy) that have working adapters in MVP, since the scope is named.
- **Sync simplicity** — measured steps to sync the declaration to a new machine, since "simple" is in the framing.
- **Diff visibility** — share of apply runs preceded by a diff the user could review, since apply touches configs the user already has.
- **Documented experiment caveat** — visibility of the "just experimenting" caveat to the user, since overpromising an experiment is a credibility failure.
- **Scope adherence** — share of features added beyond the three named CLIs that are framed as roadmap, not silently promoted to MVP.

## Pricing & Monetization

The capture names no price, no tier and no monetization shape; the project is shared as an experiment. The architecture fixes only the cost shape: any future paid shape (if the experiment lands) would have to be priced around managed CLIs or sync storage, not per seat, because the user is the developer in front of the keyboard, not a team member behind a login.

## Competitive Landscape

- **Shared-folder approaches** — the explicit alternative the author rejects; the value here is managing distinct CLI configs without assuming convergence.
- **Per-CLI dotfile repositories** — what users do today to sync a single CLI's config; the cost is per-CLI rather than cross-CLI.
- **Terraform and similar declarative tools** — the inspiration, not a competitor; the differentiator is the domain (agent CLIs) and the small surface, not the declarative pattern.

The capture names no specific competitor, so the comparison stops here.

## Risks & Open Questions

- [ ] Keep the "just experimenting" caveat visible, since promoting an experiment to a roadmap would overpromise.
- [ ] Respect the author's explicit rejection of the shared-folder fix: the architecture manages distinct CLI configs.
- [ ] Make apply idempotent under repeated runs and prove it with a test, since this is a Terraform-style tool's load-bearing claim.
- [ ] Ship the diff surface so the user sees what would change before applying, since apply touches configs the user already has.
- [ ] Keep sync simple; a heavy sync layer would defeat the framing.
- [ ] Document the CLI adapter fragility: CLIs change their config layout, and the adapters have to be updated with the CLIs.
- [ ] Scope MVP to the three named CLIs and document the open CLI list honestly.
