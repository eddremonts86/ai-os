---
id: "714"
slug: idea-validation-how-do-you-manage-decisions-on-slack
title: "[Idea validation] How do you manage decisions on slack ?"
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpxql5/idea_validation_how_do_you_manage_decisions_on/"
category: saas
date: "2026-08-16"
---
# [Idea validation] How do you manage decisions on slack ?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hii guys, I work at a large conglomerate and we use slack a lot! All of our decisions seem to be on slack but they get deleted in like 3 months. How do you guys maintain these decisions in one place so you can refer to it later (protect you a** from people flipping around and saying they never decided this). Copying and pasting in a common google doc adds an extra step. Do you think a slack app that does this for you could add value? submitted by /u/CoupleEven3580 [link] [comments]

**One-liner:** Slack-native app that captures decisions made in chat before Slack's 3-month retention window deletes them, with a permalink + timestamp for every captured decision.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Slack-first teams at large organisations | Decisions live in chat and vanish after the retention window; the app preserves them in place. |
| Operations / PMO leads | Need an audit trail without forcing teams to switch tools. |
| People defending prior decisions | Need a permalink + timestamp to settle "we never decided this" disputes. |

## Jobs To Be Done

1. **Functional job** — Capture decisions made in Slack before the 3-month retention window deletes them.
2. **Emotional job** — Stop relying on Google Docs copy-paste as the fallback for important decisions.
3. **Social job** — Make decisions discoverable and referenceable so later conversations don't relitigate them.

## Success Metrics

The post does not publish specific numbers. Implied metrics:

- Decisions captured per workspace per week — the volume the app protects.
- Retrieval rate (how often a captured decision is fetched via slash command / search).
- Net-new installs from teams that hear about it through word-of-mouth in Slack-first communities.

## Pricing & Monetization

The post does not name a model. TODO: define the pricing shape (per-workspace subscription, per-seat, freemium with retention cap, or one-time team license). The audit-trail use case leans toward per-workspace recurring.

## Competitive Landscape

- _Not researched beyond what the source names._ The post frames the alternative as "copying to a Google Doc," which the founder rejects as an extra step.
- TODO: cite comparable Slack-native decision-log apps (e.g. compliance/audit products that already capture Slack messages for retention) once a direct competitor is found.

## Risks & Open Questions

- [ ] Slack app review and OAuth scope friction — capturing all messages requires elevated scopes that Slack reviews carefully.
- [ ] The founder is still validating whether the problem is real for enough teams to pay; the post is itself the validation probe.
- [ ] Retention compliance: if the app captures messages, it becomes a data store with its own compliance scope (GDPR, SOC 2).

---

_Source:_ [Reddit r/SaaS](https://www.reddit.com/r/SaaS/comments/1vpxql5/idea_validation_how_do_you_manage_decisions_on/) · **Posted:** 2026-08-16T13:57:32+00:00
