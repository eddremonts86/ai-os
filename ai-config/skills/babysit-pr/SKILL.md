---
name: babysit-pr
description: Watch a PR through review bots and CI until green and approved. Use when the user asks to monitor, watch, or babysit a PR.
version: 1.0.0
author: Edd
license: MIT
platforms: [linux, macos]
metadata:
  hermes:
    tags: [github, pr, review, ci]
    related_skills: [github-pr-workflow, requesting-code-review, receiving-code-review]
  scope: universal
  requires: "gh CLI authenticated"
---

# Babysit PR

Watch a pull request through review bots and CI until it is green and approved.
Adapted from Theo Browne's fleet workflow (video: "My AGENTS.md & SKILLS.md Breakdown"),
with Edd's sandbox-branch model: never push to `main`/`master`, never merge — Edd reviews
and merges himself. Babysitting means keeping the PR fresh and responding to feedback,
not landing it.

## When to use

Use when the user asks to monitor / watch / babysit a PR after filing it, or says
"file and babysit". Pairs with the filing flow the repo already uses.

## Workflow

1. **Baseline**: note the latest commit SHA on the PR branch at start. Only act on
   checks/comments newer than this push — never re-address old feedback.
2. **Monitor**: poll with `gh pr checks <num>` and `gh pr view <num> --comments` on a
   reasonable interval. Use harness notification tools when available instead of busy-waiting.
3. **Verify before changing code**: check every bot finding against the actual source.
   Bots are helpful but not always right.
4. **Fix real findings** and genuine CI failures. Distinguish repo failures from infra
   flakes (retry once for flakes; report if persistent).
5. **Dismiss false positives with a written reason** — reply on the comment explaining why,
   then resolve it. Never silently dismiss.
6. **Identify yourself**: comments posted on Edd's behalf must say so. Format:
   `<!-- agent-comment --> Responding on behalf of Edd (agent: <model-slug>).` followed by
   the actual reply.
7. **Rebase when needed**: if `main` moves in a way that overlaps this PR, rebase the
   feature branch (never main). Keep force-pushes to the feature branch only (`--force-with-lease`).
8. **Stop conditions**:
   - An overlapping PR makes this one obsolete → stop monitoring, report, ask before closing.
   - Reviewer approves + CI green → report done, leave merge decision to Edd.
   - Feedback would expand scope → see the hard rule below.

## Hard rules

- **Do not let review feedback expand the PR beyond the original goal.** Address real
  shortcomings; decline scope creep with a written reason. If a finding is worth doing but
  out of scope, note it as a follow-up issue suggestion instead of growing the diff.
- Never merge, never push to main, never delete branches. Merge is Edd's call.
- No draft PRs — drafts skip review bots. If you inherit a draft, convert to ready when
  review-requested changes are addressed.

## Anti-patterns (from real history)

- BAD: addressing every bot nit as mission-critical, tripling the diff size.
- GOOD: fix real findings, dismiss nits with reasons, keep the diff within original scope.
- BAD: commenting through the owner's account without marking it's an agent.
- GOOD: every comment identifies the agent and model that wrote it.
