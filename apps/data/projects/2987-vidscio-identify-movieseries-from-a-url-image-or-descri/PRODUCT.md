---
id: "2987"
slug: vidscio-identify-movieseries-from-a-url-image-or-descri
title: "VidScio – Identify movie/series from a URL, image or description"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49432642"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# VidScio – Identify movie/series from a URL, image or description

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ VidScio is a web app to identify movie/series names and it's details from links (like YouTube, Instagram, etc.), images, or descriptions. It started as a Chrome extension (now available in the Chrome Store) to identify movies/series while I was watching videos or shorts on YouTube. I simply grabbed the HTML and passed it to an LLM API to get the name. I started with gemini-2.5-flash-lite, and it worked surprisingly well.Then I created a watchlist feature to store the movies I liked directly in the extension and added the OMDb API to get movie details like director, cast, etc.The UI space in the Chrome extension was small, so when Kiro and Antigravity launched with free credits, I used them to create a web UI, moved the API calls to a Python server, and added Supabase for storage, Google Auth, etc. Since then I made many changes to increase accuracy like adding vision API for images, yt-dlp for urls etc, and recently added a chat feature where users can provide more clues if the first attempt fails to try again. Chat feature might be a bit unstable, still fixing bugs on it.Currently, the app uses a consensus-based approach where at least two LLMs must agree on the movie name to reduce incorrect results caused by hallucinations from a single model. In case of a mismatch, it queries additional models to reach a consensus.It works well with YouTube links, Instagram links, images, and descriptions, but not very well with TikTok and X links. I use yt-dlp to get details for non-YouTube links and YouTube data API for YouTube links.I recently published the findings of the June identification benchmark on the blog: https://www.vidscio.com/blog/movie-identification-report-jul...Please try it and share your feedback on what is working and what is not working, what you like and dislike, and any extra features you would like to see, etc.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49432642) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
