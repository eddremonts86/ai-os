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

## Problem

The author describes Cutaway 1.5.7 as an handy, open-source, basic image editor. The post's source text names three constraints directly: the editor is for Windows, it ships under Apache 2.0, and it is BYOK (Bring Your Own Key), meaning the user brings their own credentials for the model the editor wraps. The repos the author points to are linked in their bio; the capture does not name them explicitly. The product is positioned as a basic editor with a model-backed feature that needs the user's own credentials to run.


---

## Objective

Ship a basic open-source image editor for Windows, distributed under Apache 2.0, with a BYOK (Bring Your Own Key) hook for a model-backed feature the user opts into by providing their own credentials.


## Target Users

Windows users who want a basic open-source image editor and are comfortable bringing their own credentials for the model-backed feature. Assumes the reader is on Windows, can install an Apache-licensed tool, and can obtain an API key for the model the editor wraps.


## MVP Scope

- A basic image editor for Windows with the standard primitives (open, crop, resize, annotate, save).
- Apache 2.0 licensing for the editor itself.
- A BYOK (Bring Your Own Key) hook so a user can plug their own credentials into the model-backed feature.
- A documented install path for Windows.
- A README that links to the repos named in the author's bio.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the project is Apache 2.0 and open source.
- Windows is the named platform; other platforms are not in scope.
- BYOK means the editor does not provide credentials; the user is responsible for the model API key.
- The "Repos in my bio" pointer means the source URLs are not in the capture and must be looked up in the author's bio.
