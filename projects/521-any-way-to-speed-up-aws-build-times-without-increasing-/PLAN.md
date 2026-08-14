---
id: "521"
slug: any-way-to-speed-up-aws-build-times-without-increasing-
title: Any way to speed up AWS build times without increasing infrastructure costs?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo3ket/any_way_to_speed_up_aws_build_times_without/"
category: saas
date: "2026-08-14"
---
# Any way to speed up AWS build times without increasing infrastructure costs?

## Tech Stack

- **Frontend:** Next.js (App Router).
- **Backend:** Node.js (Fastify) + Postgres for the analyzer rules, snippet library, and per-repo history.
- **YAML parser:** js-yaml + a custom AST walker for the CodeBuild / GitHub Actions shapes.
- **Analytics:** a simple in-app chart (no charting library, just SVG).

## Architecture

The Next.js app accepts a YAML paste, posts it to the analyzer endpoint, and renders the ranked wins. The history view reads from Postgres. There is no live infra integration in v1.

```
Browser ─▶ Next.js (analyzer UI + history)
              │
              └─▶ Fastify ─▶ analyzer rules engine ─▶ ranked wins + snippets
                                                       │
                                                       └─▶ Postgres (per-repo history)
```

## Milestones

1. **M0 — YAML analyzer with 5 rules.** End of week 2.
2. **M1 — Snippet library + per-repo history.** End of week 4.
3. **M2 — Before/after measurement (manual paste).** End of week 6.
4. **M3 — 5 design partner teams.** End of week 10.

## Risks

- **Rule generality.** CodeBuild and GitHub Actions have overlapping but distinct concepts; one rule set will miss some shapes. Mitigation: ship the most-common 5 first, expand based on partner feedback.
- **Snippet drift.** AWS and GitHub change cache key formats occasionally. Mitigation: snippet library versioned + last-verified date per snippet.
