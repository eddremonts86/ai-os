---
id: "520"
slug: how-we-decide-what-to-build-next-after-rice-completely-
title: How we decide what to build next after RICE completely fell apart for us
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo3np0/how_we_decide_what_to_build_next_after_rice/"
category: saas
date: "2026-08-14"
---
# How we decide what to build next after RICE completely fell apart for us

## Tech Stack

- **Backend:** Rails + Postgres for fast CRUD and a clean audit log.
- **Frontend:** Hotwire (server-rendered) for the team UI; a small static page for the public board.
- **Auth:** Devise + OmniAuth (Google + GitHub).
- **Notifications:** a weekly email with the "what changed" diff.

## Architecture

A single Rails app handles the workspace, initiatives, scoring, and audit log. The public board is a read-only Rails route that renders the same data with a stripped-down layout.

```
Browser ─▶ Rails (workspace UI)
              │
              ├─▶ Postgres (initiatives, scores, weights, audit_log)
              │
              └─▶ Public board route (read-only)
                       │
                       └─▶ Weekly email diff (sidekiq cron)
```

## Milestones

1. **M0 — Workspace + initiative CRUD.** End of week 2.
2. **M1 — Scoring + ordered backlog.** End of week 4.
3. **M2 — Audit log + public board.** End of week 6.
4. **M3 — Weekly email diff.** End of week 8.
5. **M4 — 3 design partner teams.** End of week 12.

## Risks

- **Framework drift.** A new framework is just another spreadsheet if the team doesn't commit to it. Mitigation: design partners sign a "use it for one quarter" agreement.
- **Audit log noise.** Every change generates an entry; if the log is unread, it adds friction. Mitigation: roll up the weekly diff into a single email instead of a per-change feed.
