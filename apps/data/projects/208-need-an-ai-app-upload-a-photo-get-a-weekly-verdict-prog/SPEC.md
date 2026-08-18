---
id: "208"
slug: need-an-ai-app-upload-a-photo-get-a-weekly-verdict-prog
title: "Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to retake the photo."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: ai
date: "2026-03-29"
tags: [AI, Health, Photo]
country: Greece
tech: [React Native, Python, FastAPI, Vision Transformer, PostgreSQL, Stripe]
---
# Need an AI app: upload a photo → get a weekly verdict «progress / no progress» and advice on when to retake the photo.

## Problem

A user in Greece wants a health or fitness app that compares a weekly photo of the same scene (same lighting, same angle, same clothes) and emits a verdict — progress, no progress, or regression — and tells them when to retake the photo to maintain a consistent baseline. Existing photo-tracking apps (ProgressPics, photo journal apps) require manual comparison and rely on the user to spot the change.

What is missing is the actual computer-vision logic that distinguishes a real change from a lighting or pose artefact, and a reminder flow that adapts to the user's actual variability — not a static 'every Monday' notification that gets ignored after week three.

## Objective

A mobile app that ingests a weekly comparison photo, decides whether the change is real (lighting- and pose-robust), gives a short verdict, and nudges the user only when a retake is needed — not on a fixed schedule.

## Target Users

Adults in Greece and Southern Europe who track weight, posture, body recomposition, or skin progress with weekly photos and are tired of the manual comparison step. Secondary: physios and personal trainers who want a tool to send to clients.

## MVP Scope

Mobile app (iOS first, Android second). Upload two photos (reference and current). Vision model compares, normalises for lighting, and outputs a verdict. Adaptive reminder: only ping when the photo quality is poor or the user has missed a week. No social feed in v1.

## Design Direction

Design direction for the MVP at `` follows the constraints in `208-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Photos must be stored encrypted at rest. No automatic sharing to social. Verdict must be phrased defensively ('consistent' rather than 'great') to avoid mental-health triggers. Local data deletion within 30 days of account close.
