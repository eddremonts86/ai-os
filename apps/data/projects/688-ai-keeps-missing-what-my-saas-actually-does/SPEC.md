---
id: "688"
slug: ai-keeps-missing-what-my-saas-actually-does
title: AI keeps missing what my SaaS actually does
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vppqhm/ai_keeps_missing_what_my_saas_actually_does/"
category: saas
date: "2026-08-16"
tags: [saas, ai, video-generation, marketing]
tech: [Next.js, TypeScript, Playwright, Anthropic Claude, Remotion, ElevenLabs, Cloudflare R2, Supabase, Stripe]
---
# AI keeps missing what my SaaS actually does

## Problem

The poster built a video generator for SaaS companies: feed it a website, it creates a demo video. The first version used an AI to scan the homepage and pulled the obvious copy ("Streamline your workflow. Boost productivity.") — generic marketing language that says nothing about what the product actually does. The real value is hidden deeper: a Slack integration buried in the pricing page, a customer quote about fixing their Asana problem three clicks deep. The poster built a scraper that crawls the entire site, maps features to problems, and tries to figure out what the product actually solves versus what the marketing team wrote. The output is a video that highlights the actual differentiators (a Gantt chart feature for teams frustrated with a specific workflow). The implicit product: a SaaS demo video generator that uses a depth-crawl scraper to extract the real value props, not the homepage copy.

## Objective

Define a SaaS demo video generator that crawls the entire site, maps features to problems, and produces a video highlighting the actual differentiators. The plan treats the source as a working MVP with a clear quality bar; the focus is on the depth-crawl scraper and the feature-to-problem mapping.

## Target Users

- **Primary:** SaaS marketing teams that need demo videos for landing pages, sales decks, and social without paying a video editor.
- **Secondary:** indie hackers and solo founders who want a demo video for their SaaS without learning video editing.
- **Tertiary:** SaaS sales teams that need a custom demo video per prospect.

## MVP Scope

- A depth-crawl scraper that follows every link from the homepage to a configurable depth, captures text, screenshots, and feature lists.
- A feature-to-problem mapper: per scraped page, classify the content as feature, problem, customer-quote, pricing, or marketing-copy; produce a structured manifest.
- A video synthesizer: turn the manifest into a 60-90 second demo video using a Remotion template, stock footage, ElevenLabs voiceover, and the customer's preferred branding.
- Web-first; no native editor in v1.
- Free tier: 1 video/month, 720p, watermark. Paid at $49/month: 10 videos, 1080p, no watermark, custom branding.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single submit-URL surface — a URL bar, a depth selector, a template picker, a render button. The product is the URL bar.

## Constraints

- The depth-crawl must respect robots.txt and rate limits.
- The feature-to-problem mapper must surface the buried differentiators, not just the homepage copy; this is the quality bar the source post sets.
- The per-video inference cost must stay under $2.00 at default settings.
