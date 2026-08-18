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

## Problem

A native Japanese speaker notices that AI-generated Japanese is still readable as AI by its word choice — 実務 (practical work) and 帳簿 (a ledger) show up far more than they should, and casual terms like 効く (to work well) and 刺さる (to resonate) get used where another word would normally be the first choice. They compare these to the English "delve" — a giveaway phrase that trained models over-rely on. They note that AI-generated English has improved a lot recently and is harder to spot, ask what native English speakers see, ask the same for Chinese (heavily trained), Spanish, and Hindi, and report that model choice matters far more outside English (Anthropic Opus 4.6 and Fable 5 outside coding hold up in long-form Japanese, Google's models hold up across registers, OpenAI's and Opus 4.8/5 in coding sessions sound too geeky). The post is a discussion prompt, not a build request, but the pattern — language-specific AI tells that a multilingual detector could surface — is concrete.

## Objective

Build a per-language AI-tell detector that takes a sample of text plus its declared language, returns the most likely AI-tell phrases it contains (with frequency), the model-family that most over-uses those phrases based on a public corpus, and a confidence score. The MVP focuses on the languages the source explicitly names (Japanese first, English second) and supports the model families the source calls out (Anthropic, OpenAI, Google). It does not try to be a generic "AI or not" classifier; it shows the user the specific phrases that gave it away, in their own language.

## Target Users

- A native Japanese reader (or any multilingual reader) who wants to spot AI-generated text in their own language without relying on English-centric AI detectors.
- Editors and translators working with mixed-language drafts who need a quick first-pass check that flags the suspicious phrases before they hand-edit.
- Researchers studying per-language model behavior who want a small tool that surfaces which tell-phrases a given text is leaning on.

## MVP Scope

- A web form that accepts pasted text plus a declared language (auto-detected with `franc` or similar as a default, overridable).
- A curated per-language phrase directory: at least 30 entries for Japanese (the tells the source names plus others), 20 for English, and starter sets of 10 for Chinese, Spanish, Hindi. Each entry has the phrase, its English gloss, and the model family that most over-uses it based on a public corpus.
- A scoring screen: list of matched tells (with frequency), model-family attribution, and a 0–100 confidence label that the text is model-generated.
- A "show me the sentences" highlight view: every matched phrase inlined in the original text with the directory entry expanded on hover.
- A small per-user history of past analyses (local storage only).
- An export-to-JSON button so researchers can grab their analyses.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49338865` follows the constraints in `3009-.../SPEC.md`. The visual language is reference-like: a left column for the analyzed text with inline highlights, a right column for the dossier. The dossier reads like a research card, not a marketing verdict.

**Color** — neutral surface, one accent reserved for matched-tell highlights, one muted accent for the confidence bar.

**Type** — one display family for the dossier title, one text family for prose, one mono family so the matched phrases can be visually separated from the rest of the text.

**Density** — medium. The dossier should fit alongside a 500-word sample without scrolling.

**Motion** — none beyond the highlight hover state. The tool reads like a static reference.

## Constraints

- The MVP does not make a definitive "this is AI" verdict. It always frames findings as phrase-level evidence and confidence, never as a black-box classification.
- The phrase directory is curated from public sources, not scraped from a single vendor. Each entry cites the corpus it came from.
- The MVP does not store user text on a server. Analysis runs server-side over an ephemeral request and writes nothing to disk.
- Languages beyond Japanese and English ship as starter directories only; the tool will say "low coverage" rather than fabricate confident results.
