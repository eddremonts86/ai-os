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

## Tech Stack

- **Python with FastAPI** for the API and the classification pipeline, because the LangGraph orchestration and the Whisper fallback are Python-native and FastAPI's async story fits the capture-to-surface latency budget.
- **Whisper** for voice transcription, runnable both on-device for low-latency captures and on the server when the device cannot sustain a real-time decode.
- **LangGraph** as the agent orchestration layer, chosen because routing a fragment into task / project / question / scheduling note is a graph-shaped decision rather than a single prompt.
- **PostgreSQL with the pgvector extension** for storage, full-text search and the per-user embedding index; a single relational store covers projects, fragments, classifications and the vector recall in one transaction model.
- **Redis with BullMQ** for the background job queue that runs classification, embedding and the dashboard recompute off the request path.
- **Next.js + Tailwind CSS** for the dashboard and the capture inbox, served from the same Docker stack so a self-host deployment is one compose file.
- **Docker** for packaging, with the deployment shape designed so a single node can serve a heavy personal user without horizontal scale.

## Architecture

A fragment enters through one of three paths: the iOS / Android app recording a voice memo and uploading the audio plus a Whisper-on-device transcript when available; the web capture inbox accepting a pasted paragraph or a forwarded email; and a Slack / email inbound webhook for users who already live in those surfaces. Every fragment lands in a `raw_fragments` table with the source, the timestamp and the original payload, so the classifier can later be re-run on the same raw input without losing history.

The LangGraph pipeline is the heart of the system. It runs as a BullMQ job per fragment, reads the raw payload and the user's recent project context, and emits a routing decision: which project this fragment belongs to, whether it is a task or an update or a question, and which fields to extract (a date, a person, a follow-up). The decision is written back to the fragment as a structured record, and any new project surfaced by the decision is upserted. The dashboard recompute reads the last N fragments per project on each request and renders the today view from that set, so a fragment that just landed is visible without a separate write.

Storage is split deliberately. PostgreSQL holds the relational state — users, projects, fragments, classifications, the per-user settings. pgvector holds the per-fragment embedding that powers "what did I say about X". Redis holds the queue and the short-lived cache for dashboard recomputes. The encryption layer sits in front of PostgreSQL with a per-user key, so a database snapshot alone is not enough to read a user's stream — the export path holds the same key on behalf of the user and ships a self-contained Markdown archive that anyone with the export password can read.

## Milestones

1. **M1 — Capture surfaces** — web inbox plus iOS / Android voice capture, with Whisper transcription falling back to the server path when the on-device decode is unavailable.
2. **M2 — LangGraph routing** — classifier that emits a routing decision per fragment, with the project upsert and the dashboard recompute wired through.
3. **M3 — Projects and today view** — dashboard surfaces the today view, the projects list and the per-project fragment history, with the move-and-correct path.
4. **M4 — Search and recall** — pgvector-backed "what did I say about X" plus a basic date and source filter on the inbox.
5. **M5 — Encryption and export** — per-user encryption at rest and a Markdown export that preserves project structure.
6. **M6 — Self-host reference** — one Docker compose file that boots the whole stack on a single node, documented as the worked example.

## Risks

- **Classifier mis-routes silently** — a fragment that lands in the wrong project without surfacing the doubt is worse than one the user has to move, because the user stops checking.
- **Whisper latency on mid-range phones** — on-device decode that takes longer than the user is willing to wait will push everything to the server and erode the privacy story.
- **Dashboard divergence across devices** — a recompute path that can produce two views of the same input is a trust collapse; the determinism requirement has to be tested, not assumed.
- **Self-host install friction** — a Docker stack that requires the operator to understand pgvector and Redis before it boots will fail the install-success metric; the compose file has to be the whole install.
- **Export loses structure** — a Markdown dump that flattens projects back into a single stream invalidates the leaving-the-product promise and undermines the privacy-sensitive buyer.
- **Queue starvation under burst** — a heavy day of captures can pile up classification jobs faster than a single-node deployment drains them; a back-pressure path that surfaces the backlog to the user is required, not optional.
