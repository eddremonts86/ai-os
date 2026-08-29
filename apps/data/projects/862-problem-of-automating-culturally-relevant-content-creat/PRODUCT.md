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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Producing content that lands as culturally relevant to a Jamaican audience requires the right register — Standard Jamaican English in some places, Jamaican Patois in others — and, for audio or video, a voice that reads naturally in that register. The mainstream generation tools handle Standard English well and treat Patois as a quirky variant they cannot reliably reproduce, which means a Jamaican marketer or creator either ships output that reads as flat, or pays for native review on every piece.

This product fills that gap. A user submits a brief and the service returns culturally relevant text and short-form audio in the chosen register, with a side-by-side editor that shows the brief, the generated text and the generated audio waveform so the reviewer can correct the output before it goes out. A maintained library of cultural references keeps the model from inventing place names or festivals. The curated voice library uses consenting Jamaican speakers, with consent state visible at selection time.

The MVP is intentionally narrow. It does not publish to any platform, does not clone the voice of a public figure and does not claim to remove the human review step. What it does do is move the bulk of the recurring cultural-relevance work off the user's plate while keeping a native reviewer in the loop on every export.

**One-liner:** JaContent turns a content brief into culturally relevant text and short-form audio for a Jamaican audience, in either Standard Jamaican English or Patois, with a side-by-side editor and a native review step that is enforced, not optional.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Small-business marketers in Jamaica | They ship social, short video and audio ads weekly and need culturally relevant copy at volume without losing the register. |
| Diaspora creators targeting Jamaica | They keep the register consistent without having to live in the dialect daily, and the curated voice library means the audio does not sound imported. |
| Tourism and cultural organisations | Both domestic and export audiences need the local register; the brief form captures the audience per piece. |
| Independent podcasters and short-form producers | Segments that need Patois and segments that need Standard Jamaican English come out of the same brief with the right toggle. |
| Community organisations and NGOs | Campaigns that need Patois outreach with audio for radio or WhatsApp distribution land in one tool rather than three. |
| Voice talent in the curated library | They get paid work and their consent state is visible at every selection. |

## Jobs To Be Done

1. **Functional job** — Turn a content brief into text and short-form audio in the chosen Jamaican register, with the cultural references correct.
2. **Functional job** — Compare the generated text and audio side by side with the brief, so the reviewer can correct the register or the references before export.
3. **Functional job** — Reuse the language style of past briefs across future content without manually re-teaching the model each time.
4. **Functional job** — Hand a human reviewer a clear, time-boxed review step before export, rather than relying on the user to remember.
5. **Emotional job** — Stop worrying that a piece will land as flat or as parody when it goes out, because the reviewer has caught the register slip before export.
6. **Social job** — Ship content that signals fluency in the local register, which is what audiences in Jamaica actually respond to.

## Success Metrics

- **Review-then-export completion rate** — share of generated pieces that go through the human review step before export, since the review gate is the feature that protects the register.
- **Reviewer edit distance** — character-level change rate between generated and exported text per register, since high edit distance means the model is missing the register.
- **Audio naturalness rating** — per-piece listener rating from a sampled review panel on whether the audio reads as a native Jamaican speaker, since that is the metric the voice library exists to deliver.
- **Reference library hit rate** — share of briefs that use at least one named reference from the cultural library, since invented references are the failure mode the library exists to prevent.
- **Voice library consent coverage** — share of audio renders backed by a voice with explicit, current consent on file, which has to be 100% to ship.
- **Per-account reuse rate** — share of briefs per account that draw on prior briefs as a style seed, since that is what makes the second piece cheaper than the first.

## Pricing & Monetization

The capture names no price. The architecture fixes a cost shape: the recurring cost is per-piece generation (LLM tokens plus an audio render that may use a voice-library talent or a TTS model) and the one-time cost is the per-account reference library and the curated voice library. A free tier with a small per-month piece cap and a paid tier above it would fit the cost structure. The voice-library talent pool introduces a separate per-render royalty cost that any pricing model has to account for. Specific tier prices are not invented here because the source did not name any.

## Competitive Landscape

- **Mainstream LLM chat tools used directly** — the most common current workflow, and the reason the product has room to exist: they handle Standard English well and treat Patois as a stylistic variant they cannot reliably reproduce.
- **Generic TTS services** — cover English voices well and offer no Patois option, so audio for a Jamaican audience either lands as imported or is recorded manually each time.
- **Hire a Jamaican copywriter or voice talent directly** — the high-quality option for one piece, but it does not scale to the weekly cadence a marketer needs.

The post names no specific competitor, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Decide whether the curated voice library or the Patois-fine-tuned TTS is the primary audio path, or whether both ship behind a per-user preference.
- [ ] Confirm the consent and rate model for voice talent is workable at the volume a free tier would generate.
- [ ] Decide how to handle the case where the reference library has no entry for a topic the brief names — refuse, fall back to a generic description, or queue for human curation.
- [ ] Establish a measurable standard for the audio naturalness rating, since the audience is the only true judge and that judgment is hard to automate.
- [ ] Decide whether the side-by-side editor exposes a diff against the brief or against the prior version, since both have value.
- [ ] Define the policy when a generated piece reads as parody of Patois to a native reviewer — block export, request a rewrite, or downgrade to Standard Jamaican English automatically.
