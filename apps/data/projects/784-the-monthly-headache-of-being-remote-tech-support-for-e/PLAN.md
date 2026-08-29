---
id: "784"
slug: the-monthly-headache-of-being-remote-tech-support-for-e
title: The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/u9prt4av11-the-monthly-headache-of-being-remote-tec"
category: ai
date: "2026-01-20"
tags: [AI, Other]
country: Serbia
tech: [Python, FastAPI, SQLite, Twilio Voice + WhatsApp Business API, OpenAI Whisper + GPT-4o, Tailscale, systemd on a VPS]
---
# The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems

## Tech Stack

- **Python** for the backend because the work is glue — Twilio webhooks, Whisper, a small database, an LLM call — and Python's library coverage of those moving parts is broader than any alternative.
- **FastAPI** for the HTTP layer because the webhook surface is small, the call-routing logic is plain async, and the dashboard is served by the same process behind a Tailscale-only listener.
- **SQLite** as the per-helper store, because the MVP is one helper with a handful of relatives; a single file is enough and avoids standing up a database server on a domestic VPS.
- **Twilio Voice** for the phone number and inbound call routing, because it is the cheapest reliable way to give an elderly relative a memorable number to call in Serbia.
- **WhatsApp Business API** via Twilio as the second channel, because the title implies messaging and many elderly users prefer a chat thread they can scroll back through.
- **OpenAI Whisper** for call transcription and **GPT-4o** for plain-language step generation, chosen because the suggestion loop needs both audio-to-text and a model that can write step-by-step instructions a non-technical user can follow.
- **Tailscale** on the helper's devices and the VPS so the dashboard is reachable only from the helper, satisfying the private-data constraint without exposing the system to the public internet.
- **systemd on a single VPS** for hosting, because the deployment shape is one helper and a small set of relatives, not a horizontally scaled SaaS.

## Architecture

An inbound phone call hits a Twilio number and is routed to a FastAPI webhook that resolves the caller to a known relative and starts a session row in SQLite. The audio is streamed through Twilio's media streams to a worker that pipes it through OpenAI Whisper in near real time, producing a rolling transcript that lands in the session row. A second worker watches the transcript and the relative's prior issue log; when it sees a match to a previously confirmed fix, it proposes that fix to the helper via a small dashboard page that is served over Tailscale only. The helper reads the proposal, edits it if needed, and clicks Approve, at which point the system speaks the step to the relative through Twilio's text-to-speech or sends it as a WhatsApp message depending on the channel the relative used to start the session.

Every confirmed fix is written back to the relative's history with the symptom, the steps and a marker for whether the helper confirmed it on this call. Pattern detection is a small job that runs after each session: it groups new issues against prior issues for the same relative using simple keyword overlap plus the helper's confirmation marker, so the third occurrence of the same symptom pulls up the first confirmation rather than asking the helper from scratch. There is no cross-relative learning, since one helper's parents and another helper's parents should not contaminate each other's history.

The dashboard is intentionally minimal — a list of relatives, the open sessions and the history per relative — because the elderly-relative constraint on the user side is mirrored on the helper side: the helper is one person answering the phone, not an operations team running a triage queue. The hard parts are consent on the first call, transcription quality on accented elderly speech, and the discipline of not letting the AI invent a fix outside the relative's own history.

## Milestones

1. **M1 — Call in, session out** — Twilio number, FastAPI webhook, SQLite schema for relatives and sessions, and the per-relative routing that maps an inbound caller to a known relative.
2. **M2 — Voice to text to history** — Whisper streaming transcription, the helper dashboard over Tailscale, and the per-relative history view with last-confirmed fixes.
3. **M3 — AI suggestion loop** — GPT-4o proposes the next step from the transcript plus history; helper approves before the step is sent; the step is sent as voice or WhatsApp depending on channel.
4. **M4 — Recurrence-to-known** — pattern detection that groups new issues against prior issues for the same relative and surfaces the prior fix as the first suggestion.
5. **M5 — Consent and data hygiene** — first-call consent flow, retention rules for transcripts and audio, a deletion path the helper can offer the relative, and a hard kill switch in the dashboard.
6. **M6 — Domestic-connection test** — run the full loop on a deliberately poor Serbian connection so the relative's bandwidth never blocks the helper from acting.

## Risks

- **Consent miss** — recording or transcribing an elderly relative's call without an unambiguous first-time consent step is a privacy failure that no amount of feature work repairs.
- **Transcription error compounding** — Whisper mishearing a Serbian accent once means the AI proposes a wrong fix, which a non-technical relative will follow; the helper dashboard must surface the raw transcript next to every suggestion.
- **AI inventing a fix** — the model is tempted to generalise outside the relative's history; the prompt must forbid that and the system must flag unknown symptoms rather than guess.
- **Tailscale not running** — if the helper's Tailscale drops, the dashboard is unreachable and the system is dead until it reconnects; a small public status page reachable without Tailscale reduces this risk.
- **WhatsApp template rejection** — the message shapes the helper needs may not match an approved template; the system must degrade to plain session-window messages rather than silently failing.
- **Domestic bandwidth on the relative's side** — voice over a poor connection degrades fast, and the relative cannot fix their own network; the system must tolerate choppy audio rather than hang up.
