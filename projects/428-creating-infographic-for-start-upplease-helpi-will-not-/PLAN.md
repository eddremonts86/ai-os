---
id: "428"
slug: creating-infographic-for-start-upplease-helpi-will-not-
title: Creating infographic for start-up..Please Help...I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmds6q/creating_infographic_for_startupplease_helpi_will/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, Tailwind, MDX, Cloudflare Pages, Puppeteer (Node), Resend]
---
# Creating infographic for start-up..Please Help...I will not promote

## Tech Stack

Chosen for this problem:

- Next.js
- TypeScript
- Tailwind
- MDX
- Cloudflare Pages
- Puppeteer (Node)
- Resend

## Architecture

Static Next.js site hosted on Cloudflare Pages; MDX files for content; Tailwind layout primitives; Puppeteer-based PDF export triggered by a button.

## Milestones

- Lock the 8-section template and write one example filled by an imaginary founder
- Build MDX content slots with sane defaults and a clear "replace this" indicator
- PDF export endpoint that prints to A3 landscape by default
- README "fill in this, not that" with examples for each section

## Risks

- Static site PDF export quality varies by browser
- Template can be over-designed; an editorial restraint pass is planned
- Cloudflare Pages limits to mitigate cost
