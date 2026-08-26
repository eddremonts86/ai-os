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

## Problem

In work mode of the ChatGPT mobile app, if you upload a large image directly(even you choose "upload file" instead of image) for runtime processing, the image will always be highly compressed and many details would be lost.And if you choose to run it in the desktop app or pre-upload it to your imagebed to generate a url, it makes things complex-especially when you just want to extract things from some long screenshots by uploading, scripting automatically and getting the results smoothly in your phone.Tired of this, I try to build a skill that could be easily added into ChatGPT mobile apps that provides an origin-like lossless image upload experience.It works simply: every time a high-quality big image needs to be uploaded to the runtime losslessly, the session shows a temporary-imagebed upload url, you upload in the inner browser, get the url, and paste to ChatGPT to download to its runtime environment-if you have installed the Dropbox plugin it will preferentially use Dropbox for safer transfer, multiple transmissions at once, as well as no need to copy url mannually. Everything works to enhance ChatGPT image app upload, without compression, no need to switch apps, no need for cloud storage configuration.I'd like to listen to how you deal with questions like that, if there's a simple way to achieve, or any feedback to the skill itself.The skill is open-source: https://github.com/Byte-Naut/send-lossless-images-skill

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
