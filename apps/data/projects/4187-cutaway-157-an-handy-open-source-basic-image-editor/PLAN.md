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

## Tech Stack

The desktop editor is the deliverable; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the BYOK provider catalogue. Coolify hosts the docs behind Docker.

## Architecture

A desktop image editor exposes the standard primitives; the BYOK hook accepts a model API key from the user and routes the model-backed feature through that credential. The docs site is a TanStack Start app Coolify hosts behind Docker; the BYOK provider catalogue is a Drizzle-managed SQLite store.

## Milestones

- M1 — Basic image editor for Windows with open, crop, resize, annotate, save.
- M2 — Apache 2.0 LICENSE file in the repo.
- M3 — BYOK hook accepts and routes through the user-provided credentials.
- M4 — Documented install path for Windows.
- M5 — Public release.

## Risks

- Windows is the only named platform; users on macOS or Linux are out of scope.
- BYOK shifts credential management to the user; a leaked key is the user's problem, but the editor must not store it in plaintext.
