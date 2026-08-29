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

## Problem

The poster is the de facto help desk for elderly relatives who live elsewhere, and the work repeats every month: the same printer will not print, the same browser opens twenty tabs, the same email attachment is the wrong format, the same password has expired. Each call is small, but the same handful of problems show up again and again, and there is no shared place where the fix from last time can be found, replayed or followed step by step by someone who is not technical.

The capture itself is a one-line ProblemHunt problem statement with the country Serbia as its only extra detail. The title carries the rest: the actor is an adult relative acting as remote tech support, the pain is the recurrence and the monthly interruption pattern, and the missing thing is a system that handles the recurring cases without the helper having to re-explain everything from scratch every time. Without more material from the poster we cannot claim a persona's age, family size or internet speed; what we can work from is the recurring-problem shape of the title and the elderly-relative constraint, which together pin the problem to a tool that has to be operable by people who do not want another app to learn.

The implied hard parts are not technical. A relative has to be able to start a session without installing anything new, ideally by calling a phone number or tapping a single WhatsApp contact. The helper on the other end has to see a running history of what has been tried before for that relative, not just the current session, so the third repeat of the printer problem stops being a fresh conversation. Voice is part of the design, not an afterthought, because the relative in the title is described as elderly and the title's framing is the monthly call, not a chat thread.

## Objective

Ship a system that lets a designated helper handle an elderly relative's recurring computer problems by phone, WhatsApp or a single tap, without the relative installing anything and without the helper starting from zero each time the same problem returns. The capture is rich enough to fix an interaction model: phone-call and WhatsApp entry points, a per-relative history of issues and the steps that fixed them, an AI assistant that proposes the next step in plain language and a way for the helper to confirm a fix so the next occurrence is one tap shorter.

## Target Users

- Adult relatives acting as informal remote tech support for elderly family members, who recognise the title's monthly-call rhythm and the same handful of recurring problems.
- Elderly relatives themselves, whose role in the product is to start the session with one action — a phone call, a WhatsApp message, or a single screen button — and to follow short, plain-language instructions.
- Family members who want shared visibility into a parent's recurring issues without having to be the on-call person every month.
- Helpers who would rather be told by the system what they already did last time than re-derive it from memory at 9pm on a Sunday.

## MVP Scope

- Inbound phone number routed through Twilio to a FastAPI backend, so an elderly relative who can dial a saved contact reaches the system without an app install.
- WhatsApp Business API as the second entry point, since the title implies messaging as well as voice and many elderly users prefer a chat thread they can re-read.
- OpenAI Whisper transcription for voice calls and GPT-4o for generating the next-step suggestions in plain language, with the helper approving before any instruction is sent to the relative.
- A per-relative issue log persisted in SQLite, recording the symptom, the fix steps and whether the helper confirmed it worked.
- Pattern detection across that log so that, on the third occurrence of the same symptom, the system offers the previously confirmed fix as the first suggestion rather than asking the helper from scratch.
- A helper dashboard served over Tailscale so the relative's data is reachable only from the helper's devices and does not need to live on the public internet.
- Rate-limited outbound so the system cannot be used to spam a relative's phone or WhatsApp, and a hard kill switch in the helper dashboard.
- Plain-language scripts the AI can read aloud or send as WhatsApp voice notes, written so a non-technical user can follow them step by step.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The elderly relative must never be asked to install an app, create an account or remember a password; that is the line the title draws and it is not negotiable.
- The system stores transcripts and issue logs, so data minimisation is mandatory: keep the audio short, redact obvious identifiers before logging, and let the helper delete a relative's history.
- Voice and WhatsApp channels each have their own per-relative opt-in, and consent is recorded before any message is sent.
- The system must remain reachable on a domestic Serbian internet connection; outbound calls and messages go through the helper's account, not the relative's device, so a poor connection on the relative's side cannot block help.
- AI suggestions are advisory only: the helper confirms each step before it is delivered, and the relative can stop the session by hanging up or sending a single keyword.
- The product must work for one helper and a handful of relatives on a single VPS; multi-tenant SaaS is not an MVP concern.
- The AI must not be allowed to invent fix steps; it works from a small library of known patterns plus the relative's own history, and a step outside that library is flagged for the helper rather than sent.
