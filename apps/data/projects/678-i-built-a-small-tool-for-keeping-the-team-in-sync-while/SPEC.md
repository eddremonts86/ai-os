---
id: "678"
slug: i-built-a-small-tool-for-keeping-the-team-in-sync-while
title: I built a small tool for keeping the team in sync while using coding agents
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpto26/i_built_a_small_tool_for_keeping_the_team_in_sync/"
category: saas
date: "2026-08-16"
tags: [saas, dev-tools, ai-agents, code-review]
tech: [Next.js, TypeScript, Supabase, Cloudflare R2, Stripe, Node.js]
---
# I built a small tool for keeping the team in sync while using coding agents

## Problem

A solo developer was using coding agents on a product where they needed to explain the architecture they were about to implement to their senior / lead before coding started, and at the same time share the API structure and the collection shapes with a teammate working on the frontend. As coding agents accelerated the implementation, the coordination layer — the plan, the review, the shared understanding — became the bottleneck. The poster built Planlog, a hosted log that coding agents push plans into before implementing; the team can review, approve, or annotate the plan; the implementation result is logged alongside it. The implicit product: a single-command CLI hook (`curl | bash`) that every coding agent can call to push a plan into a shared workspace before writing code.

## Objective

Define a hosted coordination workspace for dev teams using Claude Code, Codex, Cursor, or any other coding agent: the agent pushes a plan, the team reviews, the implementation result is logged alongside it. The MVP is the CLI hook + a review UI + an audit log.

## Target Users

- **Primary:** small dev teams (2-5 engineers) using coding agents daily who need a coordination layer above the agent's output.
- **Secondary:** tech leads who want to review what the agent is about to do before it does it.
- **Tertiary:** open-source maintainers who want a public log of agent-driven changes to their projects.

## MVP Scope

- A single-command CLI install (`curl | bash`) that registers a hook in the user's coding agent of choice (Claude Code, Codex, Cursor).
- A web UI for plan review: list of pending plans, per-plan review thread, approve / request-changes verdict.
- An audit log: plan → review → implementation diff → reviewer → timestamp.
- A per-team workspace with email-based invites.
- Free tier: 1 team, 50 plans/month. Pro at $19/seat/month: unlimited plans, audit-log export, Slack integration.
- Excluded in v1: AI-generated review summaries, plan-quality scoring, GitHub PR auto-link, multi-tenant.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single review surface — a sidebar with the plan queue, a centre pane with the plan body and the review thread, a right-hand panel with the implementation diff and the audit-log entry. No marketing-site chrome; the product is the review.

## Constraints

- The CLI hook must work on macOS and Linux; Windows is a stretch goal.
- The hook must be a single command (`curl | bash`); any complex setup will not be installed by the target user.
- The audit log must be append-only; tampering is the failure mode, not the design constraint.
