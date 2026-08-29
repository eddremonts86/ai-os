---
id: "3645"
slug: yuktaai-turn-visitor-intent-into-revenue-with-agentic-a
title: YUKTAAI – Turn visitor intent into revenue with Agentic AI conversion intelligence
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/yuktaai?utm_campaign=startup-180510&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [TypeScript, Node.js (NestJS), PostgreSQL, Redis, OpenAI API, LangGraph, WhatsApp Cloud API, Next.js]
---
# YUKTAAI – Turn visitor intent into revenue with Agentic AI conversion intelligence

## Tech Stack

- **TypeScript on Node.js (NestJS)** for the agent runtime and the channel adapters, because the work is request–response, conversational state and webhook handling rather than compute.
- **LangGraph** for the agent's state machine, since the product's claim is that the agent takes actions (qualify, recommend, book, hand off) rather than only answering, and that needs an explicit graph.
- **OpenAI API** as the model layer, used for both the conversational reply and the structured qualification step.
- **PostgreSQL** for the per-operator catalogue, the qualification results and the conversation history, since the natural shapes are tabular and the operator's catalogue is the source of truth.
- **Redis** for the live conversation state and the rate limits on outbound messages, since each channel (especially WhatsApp) imposes its own quotas.
- **WhatsApp Cloud API** for the WhatsApp surface, because it is the only supported path for a server-side agent on WhatsApp.
- **Next.js** for the website widget and the operator console, since the widget is a small client-side script and the console needs a server-rendered shell.
- **No deploy target named** beyond the channel APIs — the agent runtime is a long-lived server that talks to channels, not a public website.

## Architecture

An incoming message from any of the three surfaces lands at the same channel adapter and is normalised into a common envelope: visitor identifier, channel, text or event payload, timestamp. The envelope is fed to the agent runtime, which loads the visitor's conversation state from Redis, runs the LangGraph state machine, and decides the next action. The graph has four named branches: qualify, recommend, book, hand off. Each branch writes back to state so the next turn continues from where the last left off.

Qualification is a structured step. The agent asks for inputs the operator has configured (budget, intent, timeline), stores the answers against the visitor record, and only moves to recommend when the operator's required fields are filled. Recommendation reads the operator's catalogue from PostgreSQL, filters by the qualification result, and returns one or more candidates. Objection handling is another branch that surfaces the catalogue again with a different framing — typically price, fit and timing — rather than ending the conversation.

Booking writes the appointment to the operator's calendar through a per-operator integration, returns a confirmation, and marks the conversation as booked. Handoff packages the conversation history and the qualification result into a human queue. The human picks up with the context already loaded.

The conversion-likelihood signal is a small ranking layer. Each candidate action is scored against the visitor's current state, and the highest-scoring action is the one the agent takes. The scoring is uncalibrated at MVP and is improved as real conversation data accumulates. The point is not that the lift is known; the point is that the agent is making a stated choice rather than emitting the most fluent reply.

## Milestones

1. **M1 — Channel adapters** — website widget, WhatsApp Cloud API and at least one business-app surface feeding the same envelope.
2. **M2 — State machine** — LangGraph graph with the qualify, recommend, book and hand-off branches.
3. **M3 — Catalogue** — per-operator editable catalogue with an admin surface, used as the source of truth for recommendations.
4. **M4 — Qualification step** — structured inputs the operator configures, persisted against the visitor.
5. **M5 — Booking integration** — per-operator calendar integration with a confirmation message.
6. **M6 — Handoff** — human queue with the conversation history and qualification result attached.
7. **M7 — Conversion-likelihood layer** — a stated ranking over the candidate actions, even if uncalibrated, so the choice is visible.
8. **M8 — Cross-surface continuity** — the same visitor identifier carries state from the website to WhatsApp and back.

## Risks

- **Vendor-copy drift** — marketing language leaking into the engineering surface means features promised on the site that the agent does not actually do.
- **WhatsApp policy violations** — sending free-form messages outside the 24-hour window or using unapproved templates can get the channel suspended.
- **Catalogue drift** — the operator's catalogue changes; the agent recommending stale entries is a real product-quality problem.
- **Uncalibrated ranking** — a conversion-likelihood signal that has not been measured against real outcomes is a guess dressed up as a score, and the page should say so.
- **Handoff overload** — a low bar for human handoff negates the agent; the rule needs to be tuned against the operator's actual capacity.
- **Conversation history sensitivity** — the agent collects structured inputs the visitor types, which is a privacy and retention posture the operator has to own.
- **Multi-surface state drift** — the same visitor identifier across web and WhatsApp is harder than it looks, and a session that resets across surfaces breaks the product's main claim.
