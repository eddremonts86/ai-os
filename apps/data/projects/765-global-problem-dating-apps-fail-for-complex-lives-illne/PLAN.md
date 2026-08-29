---
id: "765"
slug: global-problem-dating-apps-fail-for-complex-lives-illne
title: "Global problem: Dating apps fail for complex lives (illness, relocation, unfulfilled youth). A platform is needed for matching based on life path compatibility."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/8bua20bf01-global-problem-dating-apps-fail-for-comp"
category: social
date: "2026-02-11"
tags: [Social, Psychology, Other]
country: Russia
tech: [Elixir, Phoenix LiveView, PostgreSQL, Neon, Tigris (S3-compatible), Vector embeddings, Fly.io]
---
# Global problem: Dating apps fail for complex lives (illness, relocation, unfulfilled youth). A platform is needed for matching based on life path compatibility.

## Tech Stack

- **Elixir with Phoenix LiveView** for the web app, because the matching and chat experience is stateful and event-driven in a way that fits the BEAM better than per-request Node-style handlers.
- **PostgreSQL** as the primary store, because the life-path record is heavily relational (events, contexts, trajectories, mutual matches) and the audit trail for sensitive disclosures has to be queryable.
- **Neon** for hosted Postgres, because the source capture is one short paragraph with no preference on hosting and a serverless Postgres makes sense for a product whose traffic is match-load rather than always-on.
- **Tigris (S3-compatible)** for photo and attachment storage, chosen because the source does not name a cloud preference and Tigris is a region-selectable S3-compatible store with no egress lock-in.
- **Vector embeddings** for life-path similarity scoring, because the matching engine needs to compare non-numeric life-path profiles in a way that ranks overlap above present-tense signals.
- **Fly.io** for the host, because the source names no platform and the team's ability to colocate the Elixir runtime near the Postgres replica is a real benefit for chat latency.

## Architecture

The user record carries two parallel structures: a public profile (name, age range, photos, headline) and a life-path record (events, ongoing contexts, trajectory). The life-path record is the primary signal for match scoring; the public profile is a surface for human judgement. Both records are owned by the user, both are visible at the level the user selects, and the matching engine is the only thing that scores across both.

Onboarding seeds the life-path record through a structured questionnaire rather than a free-text bio. Each question maps to a field in the life-path model — chronic illness (with the user's level of disclosure), recent relocation, trajectory markers (career, study, recovery, caregiving), and an optional narrative. The user can mark any field as locked, brief, or full, and the matching engine uses the brief version by default and the full version only on a mutual reveal. This is the gating mechanism that makes the disclosure model workable: the engine sees enough to score, the user sees nothing until they choose to.

The match engine computes a score from the life-path record first and the public profile second. A pair of users whose life-path overlap is high is matched regardless of photo-order, because the post's missing piece is precisely the model that ranks by photo. Vector embeddings let the engine rank at a sensible cost over a user base that is small at launch and grows over months. The reveal step is two-way and platform-mediated, so the only path to direct contact is through the platform's chat and the chat history is preserved on platform-only.

Moderation is the workload the platform exists to be good at. Reports of sensitive disclosures or boundary violations route to a small moderator console with redaction tooling, and moderator action is recorded against the user record and the report id. A user who requests redaction of a sensitive entry has it redacted without the user's account being removed; that is the operational promise that backs the privacy model.

## Milestones

1. **M1 — Account and profile** — Registration, the dual-record model (public profile plus life-path record), and the disclosure-level controls per field.
2. **M2 — Onboarding questionnaire** — Structured questionnaire that seeds the life-path record, with explicit skip and lock controls per question.
3. **M3 — Match engine** — Vector-embedding similarity scoring that ranks life-path overlap above present-tense signals, with the engine weights published on a per-field basis.
4. **M4 — Reveal and chat** — Platform-mediated two-way reveal step, chat history persistence, and the moderation hooks for sensitive disclosures.
5. **M5 — Moderation console** — Redaction tooling, report queue, and audit trail of moderator actions against users and reports.
6. **M6 — Data export and portability** — Plain-text export of the user's life-path record at any tier, plus account deletion that purges the record within a stated window.

## Risks

- **Sensitivity handling** — a life-path model that mishandles disclosure creates the very harm it is built to prevent; the moderation console is a launch requirement, not a post-launch feature.
- **Engine opacity** — if the match engine's weights are private, the platform drifts back toward the existing model's ranking behaviour; published per-field weights are a constraint on product changes.
- **Cold start at launch** — without enough life-path records, the matching engine has nothing to rank on; the launch window needs the questionnaire to be short and to seed its own record set.
- **Off-platform handoff incentive** — every incentive on a dating app pushes toward direct contact; if the platform's chat is worse than a chat app, users leave and the moderation layer is bypassed.
- **Trajectory change blindness** — a user who joined two years ago and re-opens the app appears unchanged to a match scoring on life-path; without a 'what changed since you joined' surface, the score goes stale.
- **Moderator load** — a platform built on sensitive disclosures has a moderator workload that mainstream dating apps do not have; staffing has to scale with reports, not with users.
- **Data export compliance** — the export has to remove internal identifiers and respect the user's deletion preferences; a careless export is a privacy failure.
