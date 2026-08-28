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

## Tech Stack

- Next.js (TypeScript) for the public pages and the minimal admin path; SSR keeps the templates indexable.
- PostgreSQL for templates, categories, and template variables; the dataset is small but relational.
- Prisma as the ORM because the schema is simple and migrations need to be reviewable.
- A pure-frontend template renderer that expands `{{variable}}` placeholders without any server round-trip for the copy-to-clipboard path.
- The user's own model endpoint via BYO key for the "send to model" path; the site never stores the user's key.

## Architecture

- A templates service reads from PostgreSQL and serves the index page (category filter, search) and the detail page (template body + variable schema).
- A renderer on the client parses the template and renders a form for each variable; "copy" serialises the expanded text to the clipboard, "send" posts to the user's own model endpoint.
- A small admin route adds new templates by uploading Markdown; the parser extracts variable names and produces a typed schema for the form.
- A static export of the templates index so search engines can crawl it without invoking the dynamic route.

## Milestones

1. PostgreSQL schema for templates, categories, and variable schemas.
2. Public templates index page with category filter and search.
3. Template detail page with the prompt, the variable form, and copy-to-clipboard.
4. "Send to model" path using the user's BYO key (OpenAI-compatible API).
5. Admin path to add a template from Markdown with `{{variable}}` extraction.
6. Static-export fallback for SEO indexing.

## Risks

- The renderer must reject templates with unfilled variables; a regex pass on the expanded text confirms zero `{{...}}` substrings before allowing "send".
- The BYO-key path means the user's key lives in the browser; an XSS on the public site would expose it. The renderer must escape template output carefully.
- Markdown parsing for templates can be hostile to user-supplied content; a sanitiser is mandatory on every field that ends up as HTML.
- Category taxonomy can drift; a "no category" default and a clear admin workflow prevent silent sprawl.
