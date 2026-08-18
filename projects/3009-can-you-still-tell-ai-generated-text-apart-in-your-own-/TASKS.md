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

## Phase 0: Scaffold

- [ ] Create project folder `apps/3009-can-you-still-tell-ai-generated-text-apart/`
- [ ] Initialize Astro project with the Svelte integration
- [ ] Wire design tokens from DESIGN.md into the global stylesheet
- [ ] Build the paste form: textarea, language picker, submit button, loading state
- [ ] Add a `franc` fallback that auto-detects language when the picker is left at default
- [ ] Add a minimal README documenting the ephemeral-processing promise

## Phase 1: Core

- [ ] Author the Japanese phrase directory (30 entries) with model-family attribution and corpus citation per entry
- [ ] Author the English phrase directory (20 entries)
- [ ] Author starter directories for Chinese, Spanish, Hindi (10 entries each)
- [ ] Load the directories into memory at server boot and expose `/api/lookup`
- [ ] Implement `/api/analyse`: tokenize, match, score, return dossier JSON
- [ ] Build the dossier screen: matched-phrase list, frequencies, model attributions, confidence bar
- [ ] Build the highlight view: every matched phrase inlined in the original text, hover-to-expand entry
- [ ] Add `localStorage`-backed history: save dossier after each analysis, list on a small history screen
- [ ] Add the export-to-JSON button and the "report a miss" link on every dossier
- [ ] Build the 200-paragraph Japanese labeled test set and the 10 famous human essays per language
- [ ] Wire the success metrics into CI as regression checks against the test sets
- [ ] Add a permanent banner across the UI reading "research-grade, not for moderation"
- [ ] Dogfood for two weeks with real multilingual drafts before declaring v1

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to a single Fly.io app or personal VM behind HTTPS
- [ ] Wire CI: type-check + endpoint tests + test-set regression checks on every push
- [ ] Add a quarterly cadence for directory refreshes (calendar reminder in the repo)
- [ ] Verify the deployed instance passes the same test-set checks as local
