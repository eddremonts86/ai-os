---
id: "3732"
slug: staats
title: Staats
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/staats-3"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Staats

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

When the person shipping is a coding agent and the person reading the charts is a human, the chart layer is in the wrong place. Staats replaces it: the same analytics stream a dashboard would consume is exposed as evidence the coding agent can call directly. The agent measures each deploy against a baseline, flags the deploys that moved a metric, and proposes the next deploy — with the underlying numbers attached, not hidden behind a chart. The PostHog / Mixpanel "Similar Products" rail on the ProductHunt listing makes the contrast explicit; Staats sits in the same category but addresses the agent rather than the human. Cookieless by design, so the EU cookie-banner problem does not return on every install.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo founder shipping with Claude Code / Codex / Cursor | Wants the agent to also tell them what to build next instead of opening a separate analytics tab. |
| "Deployer + reader" engineer on a small team | Wants the deploy, the metric movement, and the read to live in one place the agent can call. |
| Indie hacker / bootstrapped founder | Needs a feed of evidence-backed suggestions, not a dashboard to learn. |
| Coding agent (Claude Code, Codex, etc.) | Needs a structured endpoint to ask "what shipped, what changed, what's next" and get an answer with evidence, not charts. |
| EU site owner | Wants site analytics without re-introducing a cookie banner. |

## Jobs To Be Done

1. **Functional job** — Answer "did the last deploy move the metric?" from inside the agent's working environment, without opening a dashboard.
2. **Emotional job** — Stop the "I shipped at midnight, did it actually do anything?" anxiety by attaching evidence to every deploy automatically.
3. **Social job** — Be able to tell a co-founder, an investor, or a customer "ship X, here is the chart" without explaining that the chart is buried in five dashboards.

## Success Metrics

- **Activation:** a user installs the script and connects their first deploy source within one session (proxy: the path from "see the product" to "have an evidence card" is reachable without help).
- **Agent calls / day:** the median active workspace generates ≥ 1 evidence-backed suggestion per working day from its own deploy stream (proxy: the agent is actually using the surface, not just routed there once).
- **Suggestion quality:** ≥ 60% of "deploy moved metric by X" suggestions are confirmed by a follow-up deploy or a human reply (proxy: the agent is producing useful, corroborated signals, not noise).
- **Cookieless compliance:** zero PII or per-user identifiers stored; no cookie banner is required on a Staats-instrumented page in the EU (verified by an external scan, not self-reported).

## Pricing & Monetization

The ProductHunt listing does not state a price, a tier, or a free-vs-paid split, so no `wtp` field is set. Plausible monetisation surfaces for an agent-native analytics product in this position:

- **Per-site subscription** — flat monthly fee per site, scaled by traffic.
- **Agent-tier upgrade** — a higher plan that exposes richer evidence cards, longer baselines, or more concurrent deploy sources.
- **Self-host / single-tenant** — a higher plan that lets a security-sensitive team run Staats in its own environment.

## Competitive Landscape

- **General website analytics (PostHog, Mixpanel, Plausible)** — the literal "Similar Products" rail on the listing is PostHog and Mixpanel. They expose dashboards; Staats exposes evidence to the agent.
- **Cookieless analytics (Plausible, Fathom, Simple Analytics)** — already tackle the cookie-banner problem, but they still target a human with a dashboard. Staats targets the agent.
- **Deploy-marker tools (LinearB, Sleuth, DeployHub)** — focus on DORA metrics and deployment frequency; orthogonal to user-facing analytics.
- **Product intelligence suites (Amplitude, Heap)** — heavier and chart-driven; the audience is product managers, not coding agents.
- **A coding agent without analytics (vanilla Claude Code / Codex)** — has no awareness of what shipped last week, and the human has to remember it. Staats is what the agent is missing.

## Risks & Open Questions

- [ ] "Agent-native" only matters if the coding agents actually call it. If the MCP / endpoint integration is poorly documented, makers will skip it and the product collapses back into "another dashboard." The first 90 days should be measured on agent calls per workspace, not on signups.
- [ ] Cookieless measurement creates a ceiling on per-user funnel analysis. Users who later want per-user attribution will need an alternative product; Staats should be honest about this so the upgrade to a heavier tool is a deliberate choice, not a letdown.
- [ ] "Evidence" is a strong claim. If the change-detection layer produces false positives (a deploy "moved the metric" by 0.4% in a noisy week), the agent will trust the surface less each time. A precision/recall target should be set against a labelled deploy set before public launch.
- [ ] The agent is the consumer, not the producer. Prompt-injection on a partner page must not be able to influence what the agent is told about the site; the analytics layer has to be observational only and structurally insulated from any user-controlled content.
