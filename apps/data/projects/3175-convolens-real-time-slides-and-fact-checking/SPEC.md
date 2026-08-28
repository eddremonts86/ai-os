---
id: "3175"
slug: convolens-real-time-slides-and-fact-checking
title: Convolens – Real time slides and fact-checking
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49454839"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Productivity, Meetings, macOS, Local AI]
tech: [Swift (macOS), Whisper.cpp, llama.cpp, CoreData, AppKit, Apple Foundation Models]
---
# Convolens – Real time slides and fact-checking

## Problem

The poster loses focus during meetings and needs a way to glance at a screen and see exactly where the meeting is and what happened during the brief moments they checked out. The proposed product is a Mac desktop app that records and transcribes the conversation on-device, and from that transcript produces real-time slides, fact-checks, and infographics. The use case is broader than just catching up: after the meeting, the user can chat with the recording, ask questions, and research anything mentioned.

## Objective

Ship a Mac desktop app that records a meeting locally, transcribes on device, and produces real-time slides, fact-checks, and infographics from the running transcript, with a chat interface for post-meeting Q&A and a generous free tier.

## Target Users

- Primary: knowledge workers and consultants who spend a large share of their week in meetings and want a passive notetaker + slide generator that runs on their own machine, not in someone else's cloud.
- Secondary: podcasters / interviewers / lecturers who want real-time visual aids generated from a conversation without a human editor; small teams that can't afford a notetaker subscription.

## MVP Scope

- On-device audio capture from the Mac's microphone (and system audio if permitted).
- On-device speech-to-text with rolling transcript displayed in a side panel.
- Real-time slide generator: every few sentences the app produces a slide (title + bullet summary) using a local model; slides are scrollable in a separate pane.
- Fact-check panel: claims detected in the transcript are flagged with a confidence score and a link to a search; the user can mark them verified.
- Post-meeting chat: ask the transcript questions ("what did we decide about the timeline?") and get answers grounded in the recording.
- Export to PDF / Markdown of the slides + transcript.
- Out of scope: cloud sync, multi-user meetings, mobile capture, video recording.

## Design Direction

Native macOS app with three panes in a single window: live transcript (left), slides (centre), fact-checks (right). Monochrome with one accent for fact-check warnings. The system menu bar shows a small status icon with a single dot indicating "recording / paused / idle". No cloud account required; no telemetry.

## Constraints

- All audio, transcription, and LLM inference must run on-device; no audio leaves the Mac.
- The app must work offline; no required cloud round-trip for the MVP feature set.
- Free tier must be usable for at least 5 hours of meetings per month without paid upgrade.
- App Sandbox + microphone permission must be requested explicitly the first time recording starts.
