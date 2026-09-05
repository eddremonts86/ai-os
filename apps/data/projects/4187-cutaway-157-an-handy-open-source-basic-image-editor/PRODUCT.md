---
id: "4187"
slug: cutaway-157-an-handy-open-source-basic-image-editor
title: "Cutaway 1.5.7 – An handy, open-source, basic image editor"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509758"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Cutaway 1.5.7 – An handy, open-source, basic image editor

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Cutaway is a basic open-source image editor for Windows, distributed under Apache 2.0, with a BYOK hook for the model-backed feature the user wants to use. The user owns the credentials; the editor does the editing.


## Target Users

Windows users who want a basic open-source image editor and are comfortable bringing their own credentials for the model-backed feature. Assumes the reader is on Windows, can install an Apache-licensed tool, and can obtain an API key for the model the editor wraps.

## Jobs To Be Done

- When I edit images on Windows, I want an open-source editor so I am not tied to a closed-source product.
- When the editor uses a model, I want to BYOK so my credentials do not leave my machine.
- When I install, I want a documented Windows path so setup is one download and one README.


## Success Metrics

- Number of downloads per release.
- Time from install to first edit.
- Coverage of the BYOK hook (which model providers are documented).


## Pricing & Monetization

Source post does not state pricing or monetisation beyond what is named in the live product page (which is referenced where relevant in the Value Proposition). Treat pricing as unstated until the author publishes a model.

## Competitive Landscape

Closely related work includes other open-source image editors (GIMP, Krita) and Apache-licensed image tools. The captured source post positions Cutaway around the BYOK contract for the model-backed feature and the Windows-first packaging, but does not enumerate specific competitors by name.


## Risks & Open Questions

- Windows is the only named platform; users on macOS or Linux are out of scope.
- BYOK shifts credential management to the user; a leaked key is the user's problem, but the editor must not store it in plaintext.
