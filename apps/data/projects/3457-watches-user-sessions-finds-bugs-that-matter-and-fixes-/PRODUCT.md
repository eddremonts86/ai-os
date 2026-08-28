---
id: "3457"
slug: watches-user-sessions-finds-bugs-that-matter-and-fixes-
title: "Watches user sessions, finds bugs that matter, and fixes them"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49466704"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Observability, Agent, Open Source]
tech: [TypeScript, PostgreSQL, ClickHouse, OpenTelemetry, Docker Compose]
---
# Watches user sessions, finds bugs that matter, and fixes them

## Value Proposition

Opslane is an open-source agent that combines error tracking with session recording, ranks issues by users affected instead of raw event counts, watches recordings for rage clicks / dead clicks / abandoned forms, and only opens a pull request when it can **verify** the fix it proposes. It is self-hostable from a single Docker Compose file and ships an MCP server so a coding agent can drive issue resolution instead of an engineer opening a dashboard.

For an engineering team that lives in a Sentry-style dashboard, the headline is "fewer false positives, fewer false negatives, and a PR you can trust."

## Target Users

| Stakeholder | Why they care |
|---|---|
| Small / mid engineering teams with Sentry fatigue | Tired of dashboards full of low-impact errors; want ranking by users affected. |
| Solo founders / indie teams | Need observability but cannot afford enterprise contracts; the open-source posture fits. |
| Engineering leads running agent-in-the-loop | Want the coding agent to ask "what broke for users this week" via MCP instead of human triage. |
| End-users of the host product | Are the source of session recordings and issue signals; the system exists to catch problems *they* hit. |

## Jobs To Be Done

1. **Functional job** — Surface the user-facing issues that actually matter, ranked by users affected, and propose (or open) a fix.
2. **Emotional job** — Stop declaring quarterly bug-bankruptcy on a Sentry backlog; bring the list down to a number a team can finish.
3. **Social job** — Demo to a security review that the system can catch things error trackers miss (dead clicks, silent dropdown breakage) without leaking customer recordings.

## Success Metrics

- **Open-source activation** — number of self-hosted installs from the public Docker Compose file in the first quarter.
- **Issue noise reduction** — median ratio of "issues needing attention" to "raw events ingested," measured per week.
- **Frustration-signal yield** — count of false-negative bugs (no exception thrown) caught by session-recording analysis per install per month.
- **PR trust** — share of agent-opened PRs that pass CI on first push (the verification gate is the load-bearing claim).
- **Agent-loop usage** — share of users who trigger the "what broke for users this week" MCP flow at least once a week.

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee). The post explicitly states open source and self-host but is silent on any hosted SaaS or paid tier; absent beats invented.

## Competitive Landscape

- **Sentry** — the dominant error tracker Abhishek calls out by name; Opslane is positioned as "Sentry built in 2026," answering the false-positive / false-negative gap the post describes.
- **Session-replay tools (LogRocket, FullStory, PostHog)** — cover the session side of the loop but do not auto-open PRs and do not, in the post's framing, error-track in the same product.
- **Coding-agent observability stacks (Langfuse, Helicone, agent-tracing tools)** — specialize in tracing the agent itself rather than the product the user is touching; overlap is plausible but the post does not position Opslane against them.

## Risks & Open Questions

- [ ] Confirm the "only opens a PR when it can verify the fix" gate actually rejects bad fixes in practice — false confidence here undermines the headline claim.
- [ ] Decide the redaction / PII policy for session recordings; ship the policy and the tooling in v1, not later.
- [ ] Validate that the dashboard-noise reduction number holds for projects that already ship heavy telemetry.
- [ ] Determine whether to offer hosted multi-tenant SaaS in v2 or stay self-host-only.
- [ ] Define the OSS license carefully — permissive enough for adoption, defensive enough against cloud resellers.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49466704) · **Category:** show-hn · **Tags:** Show HN, Observability, Agent, Open Source
