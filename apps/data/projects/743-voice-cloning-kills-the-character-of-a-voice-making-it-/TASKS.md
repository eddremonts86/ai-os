---
id: "743"
slug: voice-cloning-kills-the-character-of-a-voice-making-it-
title: "Voice cloning kills the character of a voice, making it too perfect and lifeless. Need a way to preserve natural imperfections without sacrificing quality."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/ucs1zbnp71-voice-cloning-kills-the-character-of-a-v"
  captured: "2026-04-27"
category: ai
date: "2026-04-27"
tags: [AI, Media, Other]
country: USA
wtp:
  raw: market rates
  currency: USD
  period: month
tech: [Python, PyTorch, audio I/O via torchaudio + soundfile, WhisperX-style forced alignment, "a small controllable \"cleanliness\" controller fine-tuned on paired clean/dirty voice data"]
---
# Voice cloning kills the character of a voice, making it too perfect and lifeless. Need a way to preserve natural imperfections without sacrificing quality.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/743-voice-cloning-kills-the-character-of-a-voice-making-it-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Pick the backbone voice-clone model to support in v1 and verify the mel-spectrogram interface is stable across versions
- [ ] Build paired-data alignment pipeline: same-speaker clean studio recording ↔ natural podcast / phone recording, word-level forced alignment via WhisperX
- [ ] Collect paired data for ≥ 200 speakers with ≥ 5 minutes of clean and ≥ 5 minutes of natural speech each
- [ ] Train CleanlinessController v0 on the paired set; objective metrics (speaker embedding cosine, F0 jitter, spectral flatness) measured against held-out speakers
- [ ] Ship CLI: `clone --speaker ref.wav --text "..." --cleanliness 0.0..1.0 --out out.wav` runs end-to-end on a single GPU
- [ ] Listener study: ≥ 30 listeners, ≥ 50 utterances each, MOS for naturalness comparing backbone-default vs controller at cleanliness 0.5 and 0.8
- [ ] Eval harness reports both MOS and objective metrics side by side; controller ships with the known trade-off, not a one-number claim
- [ ] Latency budget enforced: ≤ 25% increase over backbone per-utterance on a single GPU; CLI warns when a cleanliness + length combination will blow the budget
- [ ] Use-restriction licence drafted: no impersonation of a real person without their consent, no detection-evasion marketing

## Phase 2: Deploy

- [ ] Publish Python package on PyPI with reference to backbone installation
- [ ] Ship REST wrapper for hosted inference with per-minute usage billing
- [ ] Free 14-day trial flow, 30 minutes of generated audio included
- [ ] Set up crash reporter + per-version regression dashboard for MOS and speaker similarity
- [ ] Post-mortem after week 11 with the listener-study cohort
