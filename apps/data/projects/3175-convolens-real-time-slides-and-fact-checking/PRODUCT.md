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

## Value Proposition

A Mac desktop app that records, transcribes, and analyses a meeting locally — turning the live transcript into real-time slides and a fact-check feed while you talk, and into a chat-able archive when the meeting ends — with a free tier generous enough that most users never need to pay.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Knowledge workers in heavy meetings | Want passive notes + slide recap generated without uploading audio to a cloud service. |
| Consultants / coaches | Need a quick visual recap to send clients without taking notes themselves. |
| Podcasters / lecturers | Want real-time visual aids generated from a long-form monologue. |

## Jobs To Be Done

1. **Functional job** — Leave a meeting with a slide deck, fact-check log, and searchable transcript without taking notes during it.
2. **Emotional job** — Stop the anxiety of missing something important because attention drifted for 30 seconds.
3. **Social job** — Show up to a follow-up meeting already prepared because the previous one's decisions are searchable.

## Success Metrics

- **Activation:** user records ≥ 10 minutes of meeting audio in the first session and sees ≥ 3 generated slides.
- **Weekly retention:** user opens the app to chat with a past meeting at least once per week.
- **Free-tier ceiling:** the 5-hour/month free tier is sufficient for the median user (measured by tracked local minutes, not telemetry).
- **Fact-check precision:** ≥ 70% of flagged claims are marked "verified" or "false" by the user within the same session (signal that the detector is useful, not noisy).

## Competitive Landscape

- **Otter.ai / Fireflies / Read AI** — cloud transcription + summary; strong quality but require uploading confidential audio.
- **Apple Notes transcript + Apple Intelligence summary** — on-device for some steps, but no slide generation and no fact-check feed.
- **Granola / Fathom** — meeting notes with templates; no real-time slides, no local-only mode.
- **Krisp / Krisp.ai** — noise cancellation + meeting assistant; focuses on call quality, not notes.

## Risks & Open Questions

- [ ] On-device LLM quality — local models lag frontier models on summarisation; the MVP may need a small cloud fallback for the "chat with transcript" feature behind an opt-in toggle.
- [ ] Fact-check precision — claim detection without a search round-trip is brittle; the v1 may flag too much and train users to ignore it.
- [ ] Free-tier economics — 5 hours/month of local Whisper + Llama on Apple Silicon is fine; on Intel Macs it may be too slow to be usable.
- [ ] Mic-permission friction — macOS will prompt every reinstall; the onboarding has to make the value obvious before the prompt.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49454839) · **Category:** show-hn · **Tags:** Show HN,Productivity,Meetings,macOS,Local AI
