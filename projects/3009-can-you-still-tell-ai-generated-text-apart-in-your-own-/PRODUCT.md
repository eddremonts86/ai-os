---
id: "3009"
slug: can-you-still-tell-ai-generated-text-apart-in-your-own-
title: Can you still tell AI-generated text apart in your own language?
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338865"
category: ask-hn
date: "2026-08-17"
tags: [Ask HN, Problem]
---
# Can you still tell AI-generated text apart in your own language?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

**One-liner:** Paste text in any of nine languages, see exactly which phrases tipped it off as model-written and which model family over-uses them — no English-centric black-box verdict.

The product exists because the dominant AI-text detectors are English-first and rarely honest about which phrases gave the verdict away. This MVP flips that: instead of a binary "AI / not AI" label, the user sees a dossier of the specific phrases that match a curated, per-language, per-model tell directory. A Japanese editor who is suspicious of a paragraph gets a list — 実務 appears twice, 刺さる once, 効く in a clause where it is not idiomatic — with model-family attribution per phrase. The value is granularity, not certainty.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Native Japanese (or other-language) readers | Want a detector that surfaces tells in their own language rather than misfiring on English-trained classifiers |
| Editors and translators working with multilingual drafts | Want a fast first-pass flag of suspicious phrases before human review |
| Researchers studying per-language model behavior | Want a small tool that surfaces which tell-phrases a sample is leaning on and lets them export the result |

## Jobs To Be Done

1. **Functional job** — Identify which phrases in a multilingual sample look like model-tells, attributed to specific model families, with a confidence score the user can sanity-check themselves.
2. **Emotional job** — Feel that the verdict (if any) is grounded in the text the user can see, not in a classifier's hidden scoring.
3. **Social job** — Be able to share a dossier with a colleague and have it be a defensible artifact ("three phrases matched, here they are") rather than an appeal to authority.

## Success Metrics

- **Phrase recall on a labeled test set:** For a Japanese test set of 200 known-AI paragraphs, the tool recovers at least one tell in 70% of cases.
- **Coverage honesty:** Languages with fewer than 10 directory entries report "low coverage" and refuse to issue a confidence score.
- **Time to dossier:** Median render time under three seconds for a 1,000-character sample.
- **Researcher export usage:** At least 20% of analyses end with an export-to-JSON click, signaling that the dossier is being used as evidence rather than just a verdict.
- **False-positive sanity:** On a hand-curated set of ten famous human-written essays per language, the tool matches zero tell phrases more often than it matches one.

## Pricing & Monetization

Free in v1, with a clear "research-grade, not for high-stakes moderation" disclaimer. No monetization path is assumed; if researchers want a bulk API later, that becomes a future feature.

## Competitive Landscape

The source post does not name comparable products. Existing AI-text detectors (GPTZero, Originality.ai, Copyleaks) are widely known, but the source specifically contrasts them by saying their English-centric output is unhelpful for non-English detection. Naming them as direct competitors without source warrant would be fabrication, so this comparison is left open.

## Risks & Open Questions

- **False accusations.** A phrase-based detector is the kind of tool that gets misused to flag genuine human writing. Mitigation: ship with a permanent banner — "research-grade, not for moderation" — and never expose a single confidence threshold.
- **Corpus bias in the directory.** Tell phrases are drawn from public corpora that themselves over-represent some model versions. Mitigation: every entry cites its source corpus and version.
- **Multi-language samples.** The MVP assumes one declared language per paste. Mitigation: explicit language picker, no auto-mixing.
- **The tells fade.** As models improve, the curated phrases stop being tells. Mitigation: ship a "report a miss" link per dossier so users feed back phrases the tool missed, and rebuild the directory quarterly.

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49338865) · **Category:** ask-hn · **Tags:** Ask HN,Problem
