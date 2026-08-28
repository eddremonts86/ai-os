---
id: "3134"
slug: prompt-builder-free-templates
title: Prompt Builder – Free Templates
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449363"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, AI, Prompts, Templates]
tech: [TypeScript, Next.js, PostgreSQL, Prisma, OpenAI API]
---
# Prompt Builder – Free Templates

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3134-prompt-builder-free-templates/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up PostgreSQL via Docker with the Prisma schema applied
- [ ] Confirm the BYO-key model call works against an OpenAI-compatible endpoint

## Phase 1: Core

- [ ] Templates schema in Prisma: templates, categories, variable schemas
- [ ] Public templates index with category filter and search
- [ ] Template detail page with the prompt, the variable form, and copy-to-clipboard
- [ ] Renderer that expands `{{variable}}` placeholders and rejects unfilled ones on send
- [ ] "Send to model" path using the user's BYO key
- [ ] Admin path to add a template from Markdown with variable extraction
- [ ] HTML sanitiser on every user-supplied field
- [ ] Static-export fallback for SEO

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
