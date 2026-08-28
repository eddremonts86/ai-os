---
id: "2981"
slug: a-skill-for-uploading-full-resolution-images-to-chatgpt
title: A skill for uploading full-resolution images to ChatGPT mobile runtime
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49433155"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A skill for uploading full-resolution images to ChatGPT mobile runtime

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ In work mode of the ChatGPT mobile app, if you upload a large image directly(even you choose "upload file" instead of image) for runtime processing, the image will always be highly compressed and many details would be lost.And if you choose to run it in the desktop app or pre-upload it to your imagebed to generate a url, it makes things complex-especially when you just want to extract things from some long screenshots by uploading, scripting automatically and getting the results smoothly in your phone.Tired of this, I try to build a skill that could be easily added into ChatGPT mobile apps that provides an origin-like lossless image upload experience.It works simply: every time a high-quality big image needs to be uploaded to the runtime losslessly, the session shows a temporary-imagebed upload url, you upload in the inner browser, get the url, and paste to ChatGPT to download to its runtime environment-if you have installed the Dropbox plugin it will preferentially use Dropbox for safer transfer, multiple transmissions at once, as well as no need to copy url mannually. Everything works to enhance ChatGPT image app upload, without compression, no need to switch apps, no need for cloud storage configuration.I'd like to listen to how you deal with questions like that, if there's a simple way to achieve, or any feedback to the skill itself.The skill is open-source: https://github.com/Byte-Naut/send-lossless-images-skill

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49433155) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
