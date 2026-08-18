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

## Tech Stack

React Native for both platforms. Python + FastAPI backend. Vision Transformer (DINOv2 or similar) for the comparison. PostgreSQL for the photo metadata and verdict history. Stripe for the subscription. Encrypted blob storage for the photos themselves.

## Architecture

Mobile upload → preprocessing (alignment, lighting normalisation) → vision model → verdict + confidence → push notification if a retake is needed. Verdict history accessible to the user. Mental-health-aware copy library per verdict type.

## Milestones

M0 — model that distinguishes a real change from a lighting artefact on a holdout set. M1 — mobile app with upload and verdict. M2 — adaptive reminder. M3 — 100 users in private beta. M4 — public launch with a mental-health review of the copy.

## Risks

Computer-vision false positives on lighting changes. Risk of triggering eating-disorder patterns in vulnerable users. Photo storage cost can grow fast for heavy users. Verdict phrasing must be reviewed by a mental-health professional before launch.

## Data Model

## Integrations

React Native for both platforms. Python + FastAPI backend. Vision Transformer (DINOv2 or similar) for the comparison. PostgreSQL for the photo metadata and verdict history. Stripe for the subscription. Encrypted blob storage for the photos themselves.
