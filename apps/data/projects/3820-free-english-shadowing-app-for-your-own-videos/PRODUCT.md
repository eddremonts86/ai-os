---
id: "3820"
slug: free-english-shadowing-app-for-your-own-videos
title: Free English shadowing app for your own videos
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494863"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Flutter, local-first video player, SRT subtitle import and matching, TTS playback, optional AI subtitle services, MIT open source]
---
# Free English shadowing app for your own videos

## Value Proposition

Shadowing practice on the videos you already love. The shadowing method works by imitating native speech line by line; this app automates exactly that: import a video and its subtitles, and each subtitle line becomes a unit you can jump to, loop, listen to and speak after — with TTS playback and optional AI-generated subtitles if you configure a service yourself. Nothing is hosted: videos, subtitles and progress stay on the device, which makes it free in both senses the title suggests — no price, and no data leaving. It is MIT-licensed Flutter, so it runs on phones and desktops alike.

**One-liner:** A free, local-first Flutter app that turns your own videos and subtitles into line-by-line shadowing practice.

## Target Users

| Stakeholder | Why they care |
|---|---|
| English shadowing practitioners | Line-by-line loop and replay over media they already own. |
| Chinese-speaking learners | Bilingual docs and zh/en subtitle pairing fit the primary audience. |
| Privacy-conscious learners | Everything local; no account, no cloud, no hosted content. |
| Flutter contributors | An MIT-licensed app with a clear resource-setup guide to build on. |

The post states no commercial market; the repo is an open-source learning tool.

## Jobs To Be Done

1. **Functional job** — Import a video with matching English (and Chinese) subtitles by filename convention.
2. **Functional job** — Practice line by line: select a subtitle line, loop it, listen and repeat.
3. **Functional job** — Generate or translate subtitles via a user-configured third-party AI service (opt-in).
4. **Emotional job** — Practice daily with content you already enjoy, knowing nothing is tracked.

## Success Metrics

- **Line-level engagement:** lines looped and repeated per session — the core practice unit.
- **Import success:** share of video and subtitle pairs matched automatically by the naming convention.
- **Local-first verification:** the app runs fully offline with zero network calls when AI features are off.
- **Cross-platform installs:** working builds across the repo's named targets (Android, iOS, desktop, web).
- **Community adoption:** stars and contributors, as the repo's stated channel is open source.

## Pricing & Monetization

None stated. The title says free; the repo is MIT-licensed and open source, with AI features delegated to third-party services the user pays for themselves if at all.

## Competitive Landscape

The post does not name competitors. The category is language-learning and shadowing apps — from subscription speaking tutors to flashcard-style listening tools; this project's position is the self-supplied-media niche within it: no content library, no account and no analytics, with the user's own videos as the curriculum and local-first as the privacy boundary.

## Risks & Open Questions

- [ ] Subtitle timing quality dominates the experience; misaligned SRTs make line-by-line practice unusable, and fixing alignment is non-trivial.
- [ ] Media ownership burden: the app cannot ship content, so a learner's practice quality depends on what they own or find.
- [ ] AI subtitle features depend on third-party services and user-supplied keys; behavior varies and can break silently.
- [ ] A solo repo (3 stars at capture time) with six build targets has a thin maintenance surface.
- [ ] Copyright expectations vary by region; the README's ownership instruction is the app's only guard.
