---
id: "3900"
slug: photo-manager-that-find-and-organize-screenshots-with-p
title: "Photo Manager That Find and Organize Screenshots with Private, Local AI"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496500"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [on-device OCR, local embedding model, image classification, local vector index, native desktop app, SQLite]
---
# Photo Manager That Find and Organize Screenshots with Private, Local AI

## Problem

The capture for this plan is a URL-only Show HN submission pointing at https://ringlochid.me/imagesage/index.html. The product claim carried by the title is a photo manager that finds and organizes screenshots using private, local AI — meaning the analysis happens on the user's machine, not in a cloud service. The capture states nothing further: no supported operating systems, no model details and no pricing.

## Objective

Build the MVP the title promises: a desktop tool that watches the user's screenshots, reads and indexes what each one contains using local models, and answers two questions without any cloud round-trip — find this screenshot, and file these screenshots where they belong. Privacy is the product constraint, not a feature flag.

## Target Users

- People with years of accumulated screenshots who cannot find anything.
- Researchers and support staff who capture screens constantly for reference.
- Privacy-conscious users who refuse to upload personal captures to cloud photo services.
- Developers who screenshot bugs and docs all day and want them searchable.

## MVP Scope

- A watched folder for screenshots.
- On-device OCR of text inside images, so screenshots are searchable by content.
- Automatic organization into categories (receipts, errors, docs, chat).
- Full-text and semantic search, entirely local.

## Constraints

- The source is a bare URL plus title; every design decision below is ours.
- Local AI means real resource budgets: OCR and embeddings must run on modest hardware.
- The privacy claim is absolute: no uploads, no telemetry that leaks content, stated and held.
- No platforms, model choices or pricing exist in the capture; none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
