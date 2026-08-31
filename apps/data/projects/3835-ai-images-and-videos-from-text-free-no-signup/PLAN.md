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

## Tech Stack

Chosen for a signup-free media generation service; the post names none of these, they are the natural building blocks.

- **Text-to-image model serving:** one or more hosted diffusion-class models behind the prompt box.
- **Text-to-video generation pipeline:** the capability the title claims, exposed as a separate generation path.
- **Generation job queue:** asynchronous jobs so slow video renders do not block image traffic.
- **React web frontend:** the single-page prompt flow the site already serves (its HTML is a React SPA).
- **Object storage for generated media:** watermark-free files need somewhere durable to live and download from.
- **Free-tier request throttling:** rate limits by session or IP, since there is no account to bill.

## Architecture

- **Frontend:** prompt input, result gallery, download links; no account state at all.
- **Queue:** generations enqueue on submit; images return fast, videos notify on completion.
- **Model workers:** image and video workers pull jobs and push outputs to storage.
- **Storage:** generated files keyed by job id, served with short-lived or public links.
- **Limits layer:** per-IP and per-session quotas enforced before a job is queued.

## Milestones

1. **M0 — Image-first free tier.** Prompt-to-image works with no signup, watermark-free downloads, and stated daily limits.
2. **M1 — Video generation path.** Text-to-video behind the same frictionless flow, even if short and low-resolution.
3. **M2 — Abuse containment.** Quota and throttling tuned from real traffic; cost per generation measured.
4. **M3 — Trust page.** Terms, output rights and commercial-use rules published in the site's own language and English.

## Risks

- **Cost blowout from anonymous heavy use:** every generation is unbilled.
- **The video path may not exist yet,** making the title a promise the product must catch up to.
- **Watermark-free downloads** invite redistribution without attribution.
- **Japanese-only UI** may stall adoption among the HN audience that found it.
