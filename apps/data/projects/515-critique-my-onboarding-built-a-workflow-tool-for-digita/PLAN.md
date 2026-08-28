---
id: "515"
slug: critique-my-onboarding-built-a-workflow-tool-for-digita
title: Critique my onboarding? Built a workflow tool for digital marketing managers
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo4lzy/critique_my_onboarding_built_a_workflow_tool_for/"
category: saas
date: "2026-08-14"
---
# Critique my onboarding? Built a workflow tool for digital marketing managers

## Tech Stack

- **Frontend:** SvelteKit (single-page app, no auth in v1).
- **Backend:** SvelteKit endpoints + Postgres for the onboarding responses and feedback.
- **Strategy generation:** an LLM call (Anthropic Claude) with a structured prompt + a fixed schema for the strategy map output.
- **Exports:** server-side PDF rendering with Puppeteer; Notion export via the Notion API.

## Architecture

The SvelteKit app renders a single multi-step onboarding, posting responses to a server endpoint that builds a prompt, calls Claude, and stores the strategy map alongside the input. A second endpoint renders that record to PDF or pushes it to Notion on demand.

```
Browser ─▶ SvelteKit (onboarding)
              │
              └─▶ endpoint ─▶ Anthropic Claude ─▶ strategy map JSON ─▶ Postgres
                                                       │
                                                       └─▶ Puppeteer (PDF) / Notion API
```

## Milestones

1. **M0 — Onboarding wireframe + schema.** End-to-end happy path with placeholder LLM output. End of week 1.
2. **M1 — Real LLM call + strategy map schema.** End of week 2.
3. **M2 — PDF + Notion export.** End of week 3.
4. **M3 — 5 US manager validation sessions.** End of week 5.

## Risks

- **LLM output drift.** Strategy maps vary in shape across runs; without a strict JSON schema, exports break. Mitigation: Zod validation + retry-with-feedback loop.
- **10-minute ceiling.** Marketing managers drop off at step 6+ in most planning tools. Mitigation: time every step in Mixpanel and cut any step that doesn't earn its seconds.
- **No-login abuse.** Without email gating, anyone can spam the API. Mitigation: rate limit per IP + CAPTCHA at step 5.
