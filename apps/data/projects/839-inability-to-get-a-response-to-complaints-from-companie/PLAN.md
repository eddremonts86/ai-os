---
id: "839"
slug: inability-to-get-a-response-to-complaints-from-companie
title: Inability to get a response to complaints from companies
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: legal
date: "2025-11-14"
tags: [Legal, Other]
country: Argentina
tech: [React (Vite), TypeScript, IndexedDB via Dexie, Static hosting (Cloudflare Pages)]
---
# Inability to get a response to complaints from companies

## Tech Stack

React (Vite), TypeScript, IndexedDB via Dexie, Static hosting (Cloudflare Pages).

## Architecture

Browser-only SPA. No backend, no login. All complaint drafts and proof artifacts are stored locally and exportable as PDF.

## Milestones

- M1: complaint composer in Spanish with template library by industry
- M2: delivery proof capture (sent timestamp, registered-mail reference)
- M3: exportable escalation pack (PDF bundle)

## Risks

Local-first; the user's complaint data must live on their device or in their own cloud account, not on a third-party server.

- Template quality matters: a generic letter is as ignorable as the user's first email.
- Argentine postal/email proof-of-delivery norms vary; research carefully before claiming legal value.
