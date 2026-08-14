---
id: "327"
slug: problem-of-arabic-language-support-in-digital-services
title: Problem of arabic language support in digital services
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/taootfgpp1-problem-of-arabic-language-support-in-di"
category: other
date: "2025-10-29"
tags: [Other, Localization]
country: Morocco
tech: [Python (FastAPI), Next.js 14, Postgres + pgvector, OpenAI GPT-4o + Whisper Arabic (Darija, MSA), Cloudflare, Stripe]
---
# Problem of arabic language support in digital services

## Tech Stack

- Python (FastAPI) for the chat, OCR, voice, and entity services.
- Next.js 14 + Tailwind for the SDK demo app and the developer dashboard.
- Postgres + pgvector on Hetzner (EU default; MA-region option in v2) for entity dictionaries, audit log.
- OpenAI GPT-4o + Whisper Arabic for chat, ASR, MT in Darija + MSA + French.
- ElevenLabs Arabic voices for Darija + MSA TTS.
- Cloudflare for ingress and DDoS protection.
- Stripe for billing.

## Architecture

FastAPI exposes a single localisation API: chat, OCR, voice, entity recognition, each with language code (ary-MA, ar-MA, ar-MSA, fr-MA). SDK for React / React Native / Next.js wraps the API with RTL-aware components. Entity recognition uses a curated Moroccan dictionary (names, addresses, car plates, CIN, ICE) augmented by OpenAI. Per-call audit log with explicit language code so a developer can review any failure by language.

## Milestones

1. **M0** — Spec freeze, chat layer (Darija + MSA + French) + RTL primitives. End of week 1.
2. **M1** — Arabic OCR for receipts + Moroccan CIN. End of week 4.
3. **M2** — Darija voice input/output via Whisper + ElevenLabs. End of week 7.
4. **M3** — Arabic-aware entity recognition + drop-in SDK (React + RN). End of week 10.
5. **M4** — Pilot with 5 Moroccan digital services; measure SDK integration time at week 12.

## Risks

- **Darija ASR/MT accuracy** — Mitigation: curated Moroccan training data; per-domain dictionary; human review.
- **OCR on poor-quality receipts** — Mitigation: capture-time guidance; manual edit step.
- **Cultural-tone drift** — Mitigation: anti-caricature prompt set; Moroccan cultural advisor.
