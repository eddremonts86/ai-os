---
id: "786"
slug: a-beginner-in-online-business-needs-not-a-course-but-a-
title: "A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/h0x8gh7a71-a-beginner-in-online-business-needs-not"
category: ai
date: "2026-01-18"
tags: [AI, Business, Startups, Other]
country: USA
tech: [Remix, TypeScript, SQLite (better-sqlite3), Anthropic Claude API, Trigger.dev background jobs, PostHog analytics, Fly.io]
---
# A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan.

## Tech Stack

- **Remix with TypeScript** for the conversational UI, because loaders and actions map cleanly to the chat-shaped data flow and the same route serves the onboarding and the plan view.
- **SQLite via better-sqlite3** for plan history, onboarding answers and step reports, because the data per beginner is small and a single file fits the one-beginner-per-deployment MVP.
- **Anthropic Claude API** as the plan and step generator, because the artefact is a personalised step-by-step plan and a model that follows long, structured instructions is what makes the personalisation honest.
- **Trigger.dev** for weekly reviews, step-summarisation and the daily check-in prompts, because the chat loop must stay responsive and these jobs do not belong inside the request path.
- **PostHog** for step-completion funnels, time-between-steps and drop-off-step analytics, because the personalisation only improves if the generator is tuned against real beginner behaviour.
- **Fly.io** for hosting the single deployment, because the MVP is one beginner per app and a small persistent machine beats a serverless cold-start for a long-running chat session.

## Architecture

The onboarding flow is a Remix loader that pulls a beginner's prior answers from SQLite and a series of actions that record new answers until the onboarding is complete. Once the onboarding is complete, a Trigger.dev job calls the Anthropic Claude API with the full situation and asks for a plan with a small number of steps, each phrased as a single concrete action. The plan is persisted in SQLite as a list of step rows tied to the beginner.

The chat loop is the centre of the app. Each turn the beginner sends is appended to a session thread; a Remix action calls Claude with the thread, the current step and the beginner's plan history, and asks for either an updated step, a new step or a continuation message. Step completion is recorded when the beginner explicitly confirms, and that confirmation is what triggers the next-step generation. Manual overrides let the beginner rewrite a step in their own words; the AI then continues from the rewritten step rather than the original.

Background jobs on Trigger.dev handle the things that must happen but cannot block the chat: a daily check-in prompt posted to the beginner's inbox, a weekly review summarising completed steps and a drift detector that flags plans where the beginner has stopped responding. PostHog captures step completion, drop-off and time-between-steps, and those numbers feed back into how the prompt is tuned over time. The hard parts are the discipline of personalisation — not handing the beginner a templated plan dressed up as theirs — and the cost of the Claude API if a beginner never returns after onboarding.

## Milestones

1. **M1 — Onboarding and plan generation** — Remix onboarding flow, SQLite schema for beginner answers and plans, and the first end-to-end call to Claude that turns the onboarding into a concrete step-by-step plan.
2. **M2 — Conversational step loop** — chat UI, step-completion confirmation and the next-step generation that adapts to the beginner's report.
3. **M3 — Plan revision and overrides** — manual step rewrites, the AI continuing from the rewritten step, and the audit that flags plans which the AI has rewritten more than a threshold.
4. **M4 — Daily check-in and weekly review** — Trigger.dev jobs for the daily prompt and the weekly summary, with quiet-mode rules so the check-in does not become nag-ware.
5. **M5 — Analytics and tuning** — PostHog funnels for step completion and drop-off, with the prompt tuned against real beginner behaviour rather than guesses.
6. **M6 — Plan reset path** — a deliberate "this plan is not working" exit where the AI proposes a different shape instead of forcing the existing plan to continue.

## Risks

- **Templated plan in disguise** — pulling from common plan structures is tempting; if every beginner sees the same five-step shape, the personalisation claim collapses.
- **Hallucinated figures** — Claude inventing market sizes or revenue projections that the beginner did not supply is the kind of confident mistake a beginner will trust; the prompt must forbid it and a guardrail must catch it.
- **Drop-off after onboarding** — a beginner who never returns after the plan is generated has cost the API budget for zero engagement; the onboarding must keep the first step small enough that it is done in the same session.
- **Nag-ware check-in** — a daily prompt that does not adapt to silence becomes noise and gets muted; the drift detector has to know when to stop prompting.
- **Cold-start latency on Fly.io** — a chat session that loses state across a restart is a beginner that does not return; the deployment shape must hold the session.
- **Privacy of situation data** — idea, budget and location are personal; PostHog must capture funnel events without recording the underlying conversation content.
