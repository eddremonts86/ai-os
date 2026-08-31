---
id: "3835"
slug: ai-images-and-videos-from-text-free-no-signup
title: "AI images and videos from text, free, no signup"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493020"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Text-to-image model serving, Text-to-video generation pipeline, Generation job queue, React web frontend, Object storage for generated media, Free-tier request throttling]
---
# AI images and videos from text, free, no signup

## Problem

The capture is a URL-only Show HN post pointing at seiseiai.io; the product claim is the title: AI images and videos from text, free, with no signup. What the site itself states is verifiable and narrower than the title: SeiSei AI describes itself in its own Japanese-language metadata as a free AI image generation site that requires no registration and saves images without watermarks, with commercial use considered within its terms of service. The video-generation claim appears only in the HN title, and the post body contains no details about models, usage limits, or how a free tier is funded.

## Objective

Turn the title-level promise into a verified product description: document what the free, no-signup service actually generates (the site states images; the title adds videos), and define an MVP that delivers both capabilities behind a frictionless, account-free web experience with honest usage limits stated up front.

## Target Users

- Casual creators who want an image or short clip from a text prompt without creating an account.
- People evaluating AI generation tools who are blocked by signup walls elsewhere.
- Japanese-speaking users (the site's own pages are authored in Japanese) looking for a free, watermark-free option.

## MVP Scope

- Text-to-image generation with no signup and no watermark on saved results.
- Text-to-video generation matching the title's claim, even if limited in length or daily count.
- A single-page prompt-to-result flow with no account gate anywhere in the path.
- Stated usage limits for the free tier so capacity costs stay predictable.

## Constraints

- The source post is URL-only; everything beyond the title and the site's own metadata is unverified.
- Video generation is claimed in the title but not confirmed by the captured site text.
- Free and signup-free means abuse and quota enforcement must be designed in, not bolted on.
- The site is Japanese-language; any English product description is secondary to what the site actually states.

## Design Direction

See `DESIGN.md` for this project's design tokens.
