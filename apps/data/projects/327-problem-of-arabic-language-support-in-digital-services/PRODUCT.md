---
id: "327"
slug: problem-of-arabic-language-support-in-digital-services
title: Problem of arabic language support in digital services
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/taootfgpp1-problem-of-arabic-language-support-in-di"
category: other
date: "2025-10-29"
tags: [Other, Localization]
country: Morocco
tech: [Python (FastAPI), Next.js 14, Postgres + pgvector, OpenAI GPT-4o + Whisper Arabic (Darija, MSA), Cloudflare, Stripe]
---
# Problem of arabic language support in digital services

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Moroccan (or pan-MENA) digital service drops in the Arabic-first SDK and gets correct Darija + MSA chat, RTL layout, Arabic OCR, Darija voice, and Arabic-aware entity recognition — without rebuilding for Arabic from scratch.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Moroccan end user of a digital service | Wants Darija chat, RTL layout, and OCR that actually works. |
| Pan-MENA digital service product team | Wants one localisation layer for Maghreb, Levant, and Gulf. |
| Moroccan digital agency | Wants a turnkey Arabic-localisation library for client work. |

## Jobs To Be Done

1. **Functional job** — Get an Arabic-first experience without rebuilding the whole product.
2. **Emotional job** — Stop the 'this app was not built for me' feeling that Moroccan users carry.
3. **Social job** — Have a digital service that a Moroccan user can hand to their grandmother without a tutorial.

## Success Metrics

- Drop-in integration time ≤ 1 day for a Next.js or React Native app.
- Darija ASR word-accuracy ≥ 85% on clean speech.
- Arabic OCR field-extraction accuracy ≥ 90% on Moroccan receipts and CINs.
- Customer (developer) NPS ≥ 50 at month 3.

## Pricing & Monetization

Free tier: 1,000 SDK calls/month, 1 app. Startup (USD 99/month): 50,000 calls, 5 apps, voice support. Enterprise (custom): unlimited calls, on-prem option, custom entity dictionaries.

## Competitive Landscape

- Cloud translation APIs (Google, Azure) — strong on MSA, weak on Darija, no entity awareness.
- RTL CSS frameworks (Tailwind, Material) — layout primitives, no chat/OCR/voice.
- Custom in-house localisation — slow, expensive, every team rebuilds it.

## Risks & Open Questions

- [ ] Darija ASR/MT accuracy — Mitigation: curated Moroccan training data; human review of low-confidence outputs; per-domain dictionary.
- [ ] OCR on poor-quality receipts — Mitigation: capture-time guidance; manual edit step before saving.
- [ ] Cultural-tone drift — Mitigation: explicit anti-caricature prompt set; Moroccan cultural advisor on retainer.

---

_Source:_ [manual](https://problemhunt.pro/en/other/taootfgpp1-problem-of-arabic-language-support-in-di) · **Category:** other · **Tags:** Other, Localization
