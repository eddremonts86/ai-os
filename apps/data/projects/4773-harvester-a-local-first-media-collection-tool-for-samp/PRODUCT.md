---
id: "4773"
slug: harvester-a-local-first-media-collection-tool-for-samp
title: "Harvester, a local first media collection tool for sample based artists"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49545211"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Harvester, a local first media collection tool for sample based artists

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I make music that's entirely found sound/sample based. It occurred to me that on every social media site (particularly Instagram) I would have thousands of saved posts because of some sound or visual content that I thought I might like to sample someday.I made Harvester, a local-first Firefox extension for collecting source material for sampling, collage, VJing, editing, and research. Harvester natively preserves media from individual Instagram, Youtube, and Reddit posts as well as visible video and audio from other websites that expose ordinary audio or video. Harvester not only saves the original video to your archive but it also creates a separate audio only file in your chosen format and saves a metadata.json file containing provenance info.Harvester can scan multiple Instagram Saved collections and create oldest-first queues, allowing you to archive posts gradually in small, deliberately paced batches. Built-in limits and randomized delays help reduce the risks associated with automated activity, though no tool can guarantee that Instagram won’t restrict your account. It also supports carousel posts, grabbing each video and creating the audio only derivative for each video in the carousel.There's no Harvester account, telemetry, or other wacky stuff built in. Just a basic tool designed to help creators make use of the interesting sights and sounds we encounter online every day.This is just the first release, currently for Firefox on MacOS and it does require a local companion to work properly. I'd especially appreciate feedback about the installation process and sources where it fails.The extension is plain JavaScript, and the local Python companion uses yt-dlp and FFmpeg for bounded acquisition and media processing.https://github.com/sxrvys/harvester

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49545211) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
