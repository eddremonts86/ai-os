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

## Tech Stack

- **Frontend:** Astro with one island (Svelte) for the interactive paste/highlight view. The dossier is mostly static markup, which fits Astro's islands model.
- **Server endpoints:** Astro endpoints for `POST /api/analyse` and `GET /api/lookup`. Small, single-purpose handlers.
- **Phrase directory:** JSON files per language checked into the repo, loaded at boot into a single in-memory map keyed by `(language, phrase, model_family)`. No database needed because the directory is read-only at runtime.
- **Language detection:** `franc` for the auto-detect path. Override always available via a language picker.
- **Hosting:** A single small Node server (Fly.io or a personal VM). No Docker orchestration beyond a single container.

## Architecture

The browser posts the pasted text plus a language code to the analysis endpoint. The endpoint tokenizes the text, looks up each phrase in the in-memory directory, counts matches, attributes them to model families, and returns a dossier. The server writes nothing to disk — every analysis is ephemeral.

```
Browser (paste form, Svelte island)
   |  text + lang
   v
Astro endpoint
   |  tokenize + directory lookup
   v
In-memory directory (loaded from JSON at boot)
   ^
   |  dossier JSON
   |
Browser renders dossier + saves copy to localStorage
```

The directory JSON is the only persistent artifact. New phrases ship in a Git commit.

## Milestones

1. **M0 — Scaffold:** Astro project, Svelte island for the paste form, design tokens wired in.
2. **M1 — Japanese phrase directory:** 30 entries (実務, 帳簿, 効く, 刺さる, plus 26 more), each with model-family attribution and corpus citation.
3. **M2 — English directory and Chinese/Spanish/Hindi starters:** 20 English entries; 10 each for the other three.
4. **M3 — Analysis endpoint:** Tokenize, match, score, return dossier JSON with matched phrases, frequencies, model attributions, and confidence.
5. **M4 — Dossier screen and highlight view:** Inline highlights in the original text, hover-to-expand directory entries, confidence bar.
6. **M5 — Local history and export:** `localStorage` history, export-to-JSON, "report a miss" link per dossier.
7. **M6 — Dogfood and labeled test set:** Build the 200-paragraph Japanese test set and the 10 famous human essays per language; verify the success metrics before declaring v1.

## Risks

- **Phrase tokenization across scripts.** Mitigation: a per-language tokenization pass; tested against a small labeled set in each language.
- **Directory rot.** Mitigation: ship a quarterly cadence of directory refreshes; users can submit "miss" reports inline.
- **False-positive reputational risk.** Mitigation: banner ("research-grade") plus no threshold cutoffs that auto-fire on a single match.
- **Server-side analysis is a privacy surface.** Mitigation: ephemeral processing, no logs of pasted text, documented in the README.
