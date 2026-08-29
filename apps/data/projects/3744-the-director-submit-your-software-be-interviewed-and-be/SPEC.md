---
id: "3744"
slug: the-director-submit-your-software-be-interviewed-and-be
title: "The Director – Submit your software, be interviewed, and be remembered"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/the-director?utm_campaign=startup-181540&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [TypeScript (SvelteKit for the terminal UI), TypeScript (TanStack Start for the public dossier pages), Postgres + Drizzle ORM, Crawlee (site crawl), LLamaIndex (RAG over crawled pages), Cloudflare R2 (badge image hosting)]
---
# The Director – Submit your software, be interviewed, and be remembered

## Problem

Software directories are an information-retrieval surface disguised as a product. A submitter types a tool name into a search box, scans a list, clicks a card, and lands on a static page with a feature list, a logo, and a link. The directory's job is to be indexed and ranked; the submitter's job is to be visible. The relationship is one-shot — there is no character in the directory, no voice, no reason to come back, and no reason for the submitter to *care* about the entry beyond the dofollow backlink. The Director's BetaList pitch frames the alternative directly: "Every software directory is a database with a search box. The Director is a character." The product replaces the search box with a CRT-styled terminal that talks back. The submitter types a URL; an AI named ARCHIVE-9 crawls the site, asks questions about the tool in a "calm, dry, and faintly menacing" register, and files the result as a `.REC` record. Verdicts are not numbers — they are words ("REMARKABLE," "RESPLENDENT"); every record gets a permanent server-rendered dossier page and an embeddable badge that the submitter drops on their own site, and that badge is the friction-free way the back-link from the dossier becomes a dofollow backlink. The pitch states "3,900+ records on file. Free." — the directory is already populated, the product is already running, and the open question is which of those 3,900+ entries was the pilot that proved the model.

## Objective

Ship a software-directory product where the discovery surface is not a search box but a *character*. The product's MVP should be reachable as a CRT-styled terminal in which a submitter types a URL; ARCHIVE-9 (a HAL-9000-toned AI) crawls the linked site, prompts the submitter through a short interview about the tool, and files the result as a named `.REC` record with a dofollow backlink to the submitter's site. The directory's content — every record — is rendered server-side as a permanent dossier page with its own URL, suitable for being linked to from outside the directory. The directory ships free to submitters, with the model stated in the source ("Free"). Verdicts on records are always kind words (e.g., "REMARKABLE," "RESPLENDENT"), never numbers or star ratings, so the directory's tone is the directory's product. Every record also serves a small embeddable badge image that, when placed on a submitter's site, points a dofollow link back to the dossier — the badge is the directory's growth loop, not a feature buried in a footer. The MVP measure of done is a submitter can: (1) submit a URL, (2) answer ARCHIVE-9's questions in under five minutes, (3) receive a `.REC` URL and a badge snippet, (4) embed the badge on their own site, and (5) confirm the dossier URL ranks and the back-link resolves.

## Target Users

- **Primary:** indie founders and small-team product owners who want their tool listed in a software directory that is *character-driven* rather than database-driven, and who care about a dofollow backlink that is earned by the submitter placing a badge on their own site (not bought or spammed).
- **Secondary:** people who already use the directory as a visitor — readers who arrive at a `.REC` page from social or search, who enjoy the HAL-9000-styled voice enough to click through to other records, and who occasionally submit their own tool after a visit.
- **Tertiary:** crawlers and link-graph readers (search engines, AI assistants citing software directories) who consume the dossier pages as canonical record entries and whose traffic is itself an upstream driver of the directory's discovery.

## MVP Scope

- A CRT-styled terminal UI (monospace, slow line-by-line text rendering, optional terminal beep) at the submitter's entry point. Submitter types a URL; the directory accepts it.
- A crawler that, given a URL, pulls a representative subset of pages from the target site, summarises the salient ones (title, meta description, key feature claims, pricing if present), and packages them as context for the interview.
- An LLM-driven interview loop named ARCHIVE-9, with system prompts set to a calm, dry, faintly menacing HAL-9000 register. The interview asks ≤ 5 short questions about the tool the submitter is filing; each answer is append-only.
- A `.REC` writer that, on completion of the interview, names the record (`REC-####`, ordered after the 3,900+ records already on file), assigns a verdict word ("REMARKABLE" / "RESPLENDENT" / "NOTEWORTHY" / etc.), and persists the record.
- A server-rendered dossier page at `/{slug}-{rec-number}` for each record (permanently available, with the crawled excerpts inlined as evidence and the verdict word featured prominently). No client-side fetch.
- An embeddable badge (a small SVG / PNG hosted on the directory) that links back to the dossier page. The submitter drops a snippet on their own site.
- A self-serve plan: no human review before a record is filed; the directory is "Free" per the source. Public records.

## Design Direction

See `DESIGN.md` for this project's design tokens (a Supabase-derived palette with a monospace face for the terminal — appropriate for a product whose personality is the typewriter at the other end of the conversation).

## Constraints

- **One verdict per record, and it is a word.** Verdicts are "kind words" ("REMARKABLE," "RESPLENDENT"); the MVP must never write a numeric score, a star rating, or a percent. The voice *is* the verdict.
- **Every record has a public dossier URL.** Dossiers are server-rendered at canonical paths; clients do not assemble them at request time. The URL is the artefact.
- **Embeddable badge is the dofollow growth loop.** The submitter drops a badge image linking back to the dossier; that back-link is the way the directory distributes authority. The badge must exist and be easy to embed from the dossier page itself.
- **Character-driven entry surface.** The submitter's entry point is the CRT terminal, not a form with fields. The "submit a URL, answer the AI's questions" loop is the entire UX; replacing it with a search box would be a category regression.
- **Free.** Per the source, the directory is free to submitters; the MVP must not introduce a paywall on submission, on embed, or on dossier access.
