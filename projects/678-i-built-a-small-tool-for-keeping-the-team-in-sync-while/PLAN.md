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

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **CLI hook:** Bash + a small Node.js binary, distributed via a single `curl | bash` install.
- **Backend:** Supabase (auth + the plan store + the review thread store + the audit log).
- **Storage for diffs:** Cloudflare R2 (cheap, immutable).
- **Payments:** Stripe (per-seat subscriptions).

## Architecture

Web UI + Supabase + R2. The CLI hook posts a plan to a per-team endpoint and signs it with a per-team key.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-plan demo. End of week 1.
2. **M1 — CLI hook + plan store + review UI.** End of week 4.
3. **M2 — Audit log + R2 diff storage.** End of week 6.
4. **M3 — Stripe paywall + Slack integration.** End of week 8.
5. **M4 — Public beta.** 50 dev teams via r/ClaudeCode + r/Codex. End of week 10.

## Risks

- **Coding-agent vendor blocks the hook** — the integration surface is the hook; if a vendor blocks it, the product breaks for that agent.
- **Audit log must be tamper-evident** — append-only is not enough; the log must be hash-chained so tampering is detectable.
