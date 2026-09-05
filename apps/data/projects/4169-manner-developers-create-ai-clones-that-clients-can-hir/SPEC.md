---
id: "4169"
slug: manner-developers-create-ai-clones-that-clients-can-hir
title: Manner – Developers create AI clones that clients can hire
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511046"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Manner – Developers create AI clones that clients can hire

## Problem

A developer's hours run out before their judgment does. Traditional freelancers carry real developer judgment, but that judgment is bounded by one person's availability and attention. Generic coding agents are available instantly, but they do not represent the developer the client chose — they have no career, no stack history, no track record behind the work. AI app builders are fast for starting something new, but they are not a specific developer's judgment applied to ongoing work. The Manner pitch is a fourth shape: an AI version of a real developer — built around their judgment, their communication, their standards, and how they approach unfamiliar code — that a client hires on demand.

The source is the Manner landing page (manner.run). A clone is set up by pasting a repo link; the platform reads the project, prepares its environment, and gives the coding agent a real place to build and verify changes. The client picks a clone from a marketplace that names the developer behind it; every clone comes from a specific developer — their experience, stack, standards, and track record. The client asks in plain English; the request becomes a task; the task ships through code, tests, a live preview, and delivery.

Each task runs in its own container, sealed off from every other project. Build and health checks run before any change is applied; a live preview shows the result running at a real URL before it reaches production; developer-set controls can require a diff review and sign-off; automatic rollback retries a change that breaks a healthy project, then restores the last known-good state. The source publishes three timing comparisons: a 150-file legacy module migration to TypeScript goes from 3–5 days to roughly 35 minutes; full test coverage for an untested service unit + edge cases goes from 1–2 days to roughly 25 minutes; integrating a third-party API end-to-end (auth, webhooks, retries) goes from 1–2 days to roughly 20 minutes.

The source names the actor (a developer whose hours are the bottleneck, and a client who wants the developer's judgment on demand), the pain (the developer's hours are gone, and a generic AI agent does not carry the developer's judgment with it), and the missing thing (a way for the developer's judgment to outlast their hours). It does not name a specific developer, a specific clone, a specific pricing tier, or a specific marketplace ranking algorithm.

## Objective

Build a marketplace where developers create AI clones that carry their judgment, communication, standards, and approach to unfamiliar code, and clients hire the clone on demand — with each task running in a sealed container, build and health checks before any change applies, a live preview before production, developer-set review controls, and automatic rollback.

## Target Users

- Developers whose hours are the bottleneck and whose judgment, communication, and stack standards are what the client is paying for.
- Clients who want a specific developer's way of working on demand, not a generic AI agent.
- Engineering teams whose ongoing maintenance work needs continuity (the same judgment that started the project is the judgment that keeps it current).
- Independent developers who want their judgment to scale beyond their hours without becoming an agency.
- Clients who tried generic coding agents and found the output had no career behind it, no track record, and no accountability when the work broke.

## MVP Scope

- A developer onboarding flow that turns a developer's judgment, communication, standards, and approach into a clone the marketplace can host.
- A marketplace surface where each clone names the developer behind it, lists the developer's experience, stack, and track record, and is browsable by clients the way a freelancer directory is browsable.
- A repo-paste setup that reads the client's project, prepares a sandbox environment, and gives the coding agent a real place to build and verify changes.
- A per-task container that runs sealed off from every other project, with build and health checks before any change is applied.
- A live-preview surface that runs the result at a real URL before it reaches production, so the client sees what the agent built before it ships.
- A developer-set review control that requires a diff review and sign-off before any change is applied (the developer chooses whether the gate is on or off per task).
- An automatic-rollback path that retries a change that breaks a healthy project and restores the last known-good state on the second failure.
- A per-task delivery surface that the client can read end-to-end: the prompt, the plan, the code, the tests, the preview, and the applied change.
- The three timing comparisons the source publishes (150-file TS migration ~35 min; full test coverage ~25 min; third-party API integration ~20 min), documented as the platform's reference timings against the developer-day equivalents the source quotes.
- A developer-side surface where the developer sees the clone's work, can intervene mid-task, and can update the clone's standards and approach over time.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Each task runs in its own container, sealed off from every other project. Cross-project contamination is a bug, not a feature.
- Build and health checks run before any change is applied. A change that breaks the build is not applied; the rollback path kicks in instead.
- A live preview runs at a real URL before the change reaches production. The client sees the running result, not just the diff.
- Developer review controls are the developer's choice. The platform does not silently remove a review gate the developer set; the developer can turn it off per task, but the default is on.
- Automatic rollback restores the last known-good state on the second failure, not the first. The first failure retries; the second failure rolls back.
- Every clone names the developer behind it. A clone without a named developer is a generic agent in disguise, and the marketplace does not list it.
- The marketplace's timing comparisons are the developer's per-task time, not the client's wait. The source's numbers (35 min, 25 min, 20 min) are reference timings; the marketplace does not promise them as a contract.
- The clone carries the developer's judgment, not the developer's identity. The platform does not impersonate the developer outside the clone's task context; the developer reviews and signs off the work, the clone does not.
