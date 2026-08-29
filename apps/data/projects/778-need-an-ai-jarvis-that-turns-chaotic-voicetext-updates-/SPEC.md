---
id: "778"
slug: need-an-ai-jarvis-that-turns-chaotic-voicetext-updates-
title: "Need an AI «Jarvis» that turns chaotic voice/text updates into automatically structured tasks, projects, and dashboards for managing all of life and work."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/kmtor7kz31-need-an-ai-jarvis-that-turns-chaotic-voi"
category: ai
date: "2026-01-21"
tags: [AI, Productivity, Other]
country: USA
tech: [Python, FastAPI, Whisper, LangGraph, PostgreSQL, pgvector, Redis, BullMQ, Next.js, Tailwind CSS, Docker]
---
# Need an AI «Jarvis» that turns chaotic voice/text updates into automatically structured tasks, projects, and dashboards for managing all of life and work.

## Problem

The capture is a one-line problem statement: the author wants an AI "Jarvis" that turns chaotic voice or text updates into automatically structured tasks, projects and dashboards for managing life and work. The title is the entire ground truth; the only other metadata is the `country: USA` tag, which the post does not reference but which is consistent with the English-language phrasing.

The word "chaotic" in the title is doing real work. It says the input is not a tidy meeting transcript or a formatted task — it is a half-spoken voice memo while driving, a late-night to-do dump, a stream of consciousness message, the kind of input that defeats a system expecting clean bullet points. The word "Jarvis" is doing equal work: the author is reaching for an assistant that anticipates structure rather than waiting to be told where each update belongs.

The capture does not name a target platform, a price, a competitor or a metric. It does not distinguish personal from professional use. It does not specify what "structured" means — a task list, a Kanban board, a calendar entry, a project plan. The honest reading of the source is therefore that the author wants one assistant that listens to anything they throw at it and decides, in the moment, what each fragment is and where it goes.

## Objective

Ship a single assistant that takes a stream of voice or text updates and turns them into a structured surface the user can act on — tasks grouped into projects, projects placed on a dashboard, and the day's view recomputed every time a new fragment arrives. The unit of success is that the assistant decides structure without being told which bucket each update belongs to, and that a user who has not opened the product in a week can come back and find a dashboard that still reflects what they said.

## Target Users

- Solo operators and freelancers whose day is a stream of voice memos and Slack messages and who want one place where the stream becomes a plan.
- Knowledge workers whose job is coordination — managers, consultants, founders — and who already live in task tools but spend too much time re-sorting what they typed the day before.
- Couples and small households who want a shared capture surface for "we need to do X" without forcing everyone into a Kanban habit.
- People with executive-function load who need the system to do the categorisation that a tired brain will not do at 11pm.
- Privacy-sensitive professionals who want the assistant to run on infrastructure they control rather than inside a vendor's task app.

## MVP Scope

- Voice capture on iOS, Android and the web using the platform's native microphone, with transcripts produced locally where possible and a server fallback when the device cannot.
- A text inbox that accepts pasted paragraphs, forwarded emails and Slack messages and treats them as raw input.
- A LangGraph pipeline that classifies each fragment into task / project update / person reference / question / scheduling note and routes it to the right surface.
- A projects view that groups fragments into living project records, with the user able to split or merge projects by hand when the model is wrong.
- A today view that surfaces tasks due, follow-ups overdue and recently closed loops, refreshed every time a new fragment lands.
- Vector search over past fragments via pgvector so the user can ask "what did I say about the Lisbon trip" and get the relevant fragments back.
- Per-user encryption at rest and an export to plain Markdown, because the post calls out "all of life and work" and that promise requires the user to be able to leave.
- A self-host shape where the same Docker stack runs on a single node, because the post's framing assumes the user trusts the system with everything they say.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Voice capture must be opt-in and per-session; the device microphone is never listening in the background.
- Classification must be reversible: when the model puts a fragment in the wrong project, the user can move it and the correction is fed back into the next routing decision.
- The product must not lock the user's data; an export path exists from day one that produces a usable Markdown archive.
- Latency from "I sent the fragment" to "I see it on the dashboard" must be short enough that the user does not start a second capture while the first is still routing.
- The system must remain useful on a single self-hosted node; a deployment that requires horizontal scale to keep up with a heavy week defeats the privacy promise.
- The model must not invent commitments on the user's behalf: a fragment that says "maybe I'll look at X" is not the same as a task; the routing layer has to preserve that distinction.
- The dashboard recompute must be deterministic for the same input, so a user who reads the dashboard on their phone and their laptop sees the same state.
