---
id: "862"
slug: problem-of-automating-culturally-relevant-content-creat
title: Problem of automating culturally relevant content creation
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/pxet2490m1-problem-of-automating-culturally-relevan"
category: media
date: "2025-10-30"
tags: [Media, Marketing, AI, Business, Other]
country: Jamaica
tech: [Node.js, Hono, Bun, SQLite (better-sqlite3), FFmpeg, Whisper, Llama 3.1]
---
# Problem of automating culturally relevant content creation

## Tech Stack

- **Node.js with Hono on Bun** for the API layer because the brief-to-content pipeline is request/response with small streaming chunks, and Hono on Bun keeps cold start and runtime low without a framework weight problem.
- **SQLite via better-sqlite3** for per-account state — briefs, generated outputs, edit history, reference library and voice-library consent records — because the per-account data is small, structured and read-mostly.
- **FFmpeg** for the short-form audio post-processing: loudness normalisation, format conversion and the waveform render used in the side-by-side editor.
- **Whisper** as the reference transcription path so audio renders can be checked against the generated text before they leave the pipeline, catching the case where the TTS has dropped a word.
- **Llama 3.1 (or comparable open-weight model)** as the generation backbone, fine-tuned on a maintained Jamaican English and Patois dataset, so the model behaviour is auditable rather than locked behind a closed API.

## Architecture

A user submits a brief: topic, audience, register, format, length and any named references. The API shapes the brief into a structured prompt and calls the generation model, with the chosen register and the reference library passed as grounding context. The model returns text, which is the seed for two downstream paths. The first path lands the text in the side-by-side editor, paired with the brief and the edit history. The second path sends the text through the audio pipeline: TTS in the chosen register, with the curated voice library or the fine-tuned TTS depending on the user setting, followed by FFmpeg for normalisation and a Whisper pass that re-transcribes the audio and asserts it matches the generated text.

The reference library is a maintained table in SQLite: names, places, festivals, idioms and cultural touchpoints that the generator is allowed to use. The brief form surfaces a picker so the user can include or exclude items, and the model is constrained to draw only from the included set. Voice-library consent is also in SQLite, keyed to the voice talent record, and the consent state is read at render time so an expired consent blocks the render rather than producing a silent failure.

The export step is gated on the human-review edit. The editor records the diff between generated and exported text, and the export cannot run until that diff has been saved at least once. Audio export is gated on the Whisper re-transcription match and on the voice-library consent check, and the export step also stamps the piece with the chosen voice and the consent reference so the user has an audit trail per piece.

## Milestones

1. **M1 — Brief and text generation** — Hono endpoint, brief form, Llama 3.1 generation in Standard Jamaican English and Patois, and the confidence indicator per paragraph.
2. **M2 — Reference library** — schema, seed data for Jamaican places, festivals and idioms, and the per-brief picker that constrains generation to the included set.
3. **M3 — Side-by-side editor** — editor view with brief, generated text and edit history, and the export gate that requires at least one saved review.
4. **M4 — Audio pipeline** — TTS in both registers, FFmpeg normalisation, and the Whisper re-transcription match check before export.
5. **M5 — Voice library v1** — consent schema, a small initial roster of consenting Jamaican speakers, and the consent-state read at render time.
6. **M6 — Per-account reuse** — brief history search and the style-seed flow that lets a new brief borrow from prior briefs of the same account.
7. **M7 — Patois TTS fine-tune** — fine-tune a small TTS model on the maintained Patois dataset and route the audio pipeline through it as the default.

## Risks

- **Patois register slip** — generated text that reads as parody when it is wrong is the worst possible failure mode; the conservative-output policy plus the human-review gate is the only mitigation.
- **Voice-library consent drift** — a voice talent whose consent has expired can still be referenced in code paths that have not been updated; the consent check at render time is the load-bearing gate.
- **Cultural reference fabrication** — the model inventing a place name or festival is a brand-damaging failure; the reference library constraint is the mitigation and it has to be enforced, not optional.
- **Audio text mismatch** — TTS that drops a word or inserts one without the text catching up; the Whisper re-transcription check is the mitigation.
- **Diaspora register mismatch** — content aimed at a diaspora audience may need a different register again, and the MVP does not model that distinction; the brief form has to capture the audience clearly enough to cover the common cases.
- **Voice-talent rate pressure** — a free tier that drives high audio volume with low revenue makes the voice-library royalty cost unworkable; the pricing model has to be set before the free tier opens.
