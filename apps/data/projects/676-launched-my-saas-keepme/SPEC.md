---
id: "676"
slug: launched-my-saas-keepme
title: Launched my SaaS - KEEPME
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vptxt6/launched_my_saas_keepme/"
category: saas
date: "2026-08-16"
tags: [saas, consumer, ai, content-saver]
tech: [Next.js, TypeScript, SwiftUI, Supabase, Anthropic Claude, AWS, Stripe]
---
# Launched my SaaS - KEEPME

## Problem

The poster has built a personal-link-and-video-saver app with an AI layer, currently free and not yet live. The first 1,000 waitlist users will get 500 credits (≈ 500 minutes of stored content). The poster describes this as their first SaaS and is explicitly asking for criticism. The implicit problem: a single-founder B2C content-saver app with an AI layer, free pricing, AWS-credit-funded hosting, and an unstated post-launch monetisation question.

## Objective

Define the MVP scope, the credit-pack pricing model, and the post-launch monetisation path for a personal content-saver app with an AI layer. The plan treats the source as a thin brief and focuses on the product shape that can survive the AWS-credit window.

## Target Users

- **Primary:** knowledge workers who save links and videos "to themselves" and want to retrieve them at the right moment without a complex tagging system.
- **Secondary:** students and researchers building a personal library of source material.
- **Tertiary:** creators who want a private "swipe file" of references.

## MVP Scope

- Save a link or a video URL with a one-line note.
- AI-generated tags and a retrieval-friendly search.
- A credit system: 1 credit = 1 minute of stored video content or 1 saved link.
- Free tier: 100 credits on signup; paid tier $7.99/month or $59/year: 1,000 credits/month.
- iOS + web first; Android deferred.
- Excluded in v1: social sharing, public collections, team workspaces, browser extension.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single capture-and-retrieve surface — a "save" button at the centre, a library list below, an AI-search bar at the top. No marketing-site chrome; the product is the save button.

## Constraints

- Hosting must stay inside the AWS-credit window for the first 12 months.
- The AI layer must not call a third-party inference API on every save; the cost of inference must be bounded per user per month.
