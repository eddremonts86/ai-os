---
id: "4616"
slug: cleanmymedia-organize-decades-of-photos-with-local-face
title: "CleanMyMedia – organize decades of photos, with local face recognition"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49536130"
category: show-hn
date: "2026-09-02"
tags: [Show HN, Product, Problem]
country: Eduardo
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# CleanMyMedia – organize decades of photos, with local face recognition

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have a collection of over 20 years of photos and videos scattered over different devices. Over the years, I've been upgrading cell phones, and I've been saving copies on external hard drives. I've also tried Google Photos to later realize that I lost my originals. I never really get a chance to remove duplicates, near-duplicates, or organize my content. It's frustrating and overwhelming since I have thousands of items.About 3 years ago, I started implementing some scripts to remove duplicates, and organize my content by date. Eventually, I captured the photos information on a database, the content/files on a single directory on an external HD, and I put a frontend to run a local server. Everything ran on my laptop. It kind of worked for me, but when I told neighbors and friends what I was working on, they would tell me: "I need something like that, I have a mess that I need to back up and organize" I had no easy way of sharing what I had since I run my scripts from the command line.I had learned a lot in the process, so I decided to restart the project from scratch, but with the goal to share the project. I took some ML classes, and I wanted to use what I learned to organize my content. I started with a simple MVP project for me and my family. Then, I scaled it up to make it into a SaaS app with support for different platforms. One of the main requirements has been privacy, so every account is isolated with its own database, and everything on the cloud is encrypted at rest with a per-account key.The end result became CleanMyMedia.com. It does most of what I wanted: organize my content with privacy in mind, so the users own their content. Users are free to leave anytime with their content (No strings attached). It does face recognition entirely on local models. Your content is never used to train any models. Users can merge groups of baby photos with adult photos of the same person. Also, it organizes content by date, but if it gets it wrong, the user can edit the date. Albums can be shared with a private link and a code. Local cleanup is free and you can try all the features for 14 day just with you email (no credit card). After that, it’s $29/yr or $2.99/mo. It imports from Mac, Windows, Linux, iPhone(USB), Android, or the browser. Unfortunately, the Windows build is unsigned, so SmartScreen warns on the first run. Also, on Linux the AppImage needs a one-time `sudo apt install libfuse2t64` before first launch.I’m hoping it helps people the way it has helped me. I've found photos and videos of my kids and events that bring back memories. To me they are priceless. I hope I get some feedback, and I'll be available for technical questions.Thanks in advance,
Eduardo

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49536130) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
