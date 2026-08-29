---
id: "3742"
slug: seendiff
title: seendiff
status: draft
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/seendiff"
category: product-launch
date: "2026-08-25"
tags: [ProductHunt, Product Launch]
tech: [Vue 3 + Vite, TanStack Start ingestion API, Postgres + Drizzle ORM, Cloudflare R2 for diff raw storage, Monaco editor for the split view]
---
# seendiff

> Source capture: a one-line ProductHunt entry reading "Code diff viewer with progress tracking" with a `Discussion | Link` tail. The capture names two capabilities — rendering a diff and tracking progress against it — but provides no diff source (local file, GitHub PR, paste, command-line), no progress unit (file count, line count, comment count, review status), no review-role split, and no retention promise. Honest gap markers are left for the varying sections that depend on those unknowns; the Problem section captures everything the post actually states.

## Problem

The captured ProductHunt blurb for seendiff reads: "Code diff viewer with progress tracking." The post positions the product around the moment a developer is reading a non-trivial change and needs two things at once: a *legible view of what changed* (the diff) and *evidence the reviewer has worked through every part of it* (the progress tracker). The implicit job is one most reviewers already do informally — open a diff, scroll, lose track, miss a section — and the product claims to give the reviewer a way to *see* and *prove* they covered the change. The capture does not name any *diff source* (local file, pasted patch, GitHub PR, command-line wrapper), any *progress unit* (file checked, file read, comment left, line inspected), any *reviewer-vs-author split* (does the author also get a progress view of the review?), or any *deployment shape* (web app, desktop app, browser extension). It states only the two surfaces: a diff viewer and a progress tracker that lives on top of it.

## Objective

## Target Users

## MVP Scope

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints
