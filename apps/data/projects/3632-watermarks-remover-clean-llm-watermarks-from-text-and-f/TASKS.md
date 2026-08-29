---
id: "3632"
slug: watermarks-remover-clean-llm-watermarks-from-text-and-f
title: "Watermarks Remover: Clean LLM watermarks from text and files"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481577"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python 3.11+, stdlib http.server, Pillow (EXIF/XMP), c2patool (C2PA), Claude Agent Skill, Docker]
---
# Watermarks Remover: Clean LLM watermarks from text and files

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3632-watermarks-remover-clean-llm-watermarks-from-text-and-f/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Python stdlib HTTP service on http.server with an asyncio front end and the four endpoint stubs
- [ ] Define the request and response JSON shapes with a per-class removal count
- [ ] Implement the invisible-Unicode classifier with the safe-mode default and the audit list in the response
- [ ] Implement the EXIF/XMP stripper over Pillow with the per-deployment allowlist
- [ ] Implement the C2PA stripper over c2patool and surface the verifier-invalidation flag
- [ ] Implement the best-effort statistical surface for the four named families with the author's qualifier preserved
- [ ] Author the Claude agent skill package so each HTTP operation has a tool equivalent
- [ ] Verify the skill tool descriptions carry the same qualifiers the HTTP responses carry
- [ ] Add the Dockerfile packaging the stdlib service and the skill package
- [ ] Add CI that greps for the best-effort qualifier alongside every statistical-class claim in the docs
- [ ] Add CI that asserts the stdlib dependency stays stdlib and that a new third-party import fails the build
- [ ] Write the operator-facing copy that states the "files you own" contract and the no-guarantee framing

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
