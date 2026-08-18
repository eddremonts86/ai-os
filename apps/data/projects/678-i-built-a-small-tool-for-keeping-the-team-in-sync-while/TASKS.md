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
## Phase 0: Scaffold

- [ ] Create `apps/678-i-built-a-small-tool-for-keeping-the-team-in-sync-while/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding CLI build artifacts
- [ ] Write SPEC.md and the matching DESIGN.md tokens (review-surface visual identity)
- [ ] Build the CLI hook skeleton (Bash + Node.js binary) and the `curl | bash` install script
- [ ] Provision Supabase: auth, the plan store, the review-thread store, the audit log
- [ ] Set up the hash-chained log-entry writer (tamper-evident)
- [ ] Wire Cloudflare R2 for diff storage and Stripe in test mode

## Phase 1: Core

- [ ] CLI hook (Bash + Node.js binary) with a single `curl | bash` install
- [ ] Per-team registration: per-team API key, per-team workspace
- [ ] Plan store (Supabase: plan body, target agent, target file, timestamp)
- [ ] Review UI: list of pending plans, per-plan thread, approve / request-changes verdict
- [ ] Audit log: plan → review → implementation diff → reviewer → timestamp
- [ ] Hash-chained log entries (tamper-evident; SHA-256 chain with per-essay keys)
- [ ] Cloudflare R2 for diff storage with signed URLs
- [ ] Stripe paywall (free / $19 per-seat) + Slack notification integration

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] 50-team closed beta via r/ClaudeCode and r/Codex
- [ ] Post-mortem at week 10
