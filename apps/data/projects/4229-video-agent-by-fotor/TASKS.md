---
id: "4229"
slug: video-agent-by-fotor
title: Video Agent by Fotor
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/fotor"
category: product-launch
date: "2026-08-17"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Video Agent by Fotor

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4229-video-agent-by-fotor/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the chat surface as the only editor; no manual timeline UI is exposed.
- [ ] Implement the LLM-backed motion planner that translates the user's natural-language direction into a structured specification (primitive list, timing, easing, keyframes).
- [ ] Build the motion-graphics renderer with the precision primitives (text on motion, shape transitions, easing curves, timing, keyframes) and a deterministic re-render path.
- [ ] Build the video-editing engine with the edit primitives (trim, cut, splice, transition, audio overlay, captions) and the input-video handling that preserves framerate and resolution.
- [ ] Add the preview pane that renders the agent's output before the user accepts it.
- [ ] Wire the revision loop: the user critiques in chat, the motion planner parses the critique, the renderer re-renders, the preview updates.
- [ ] Build the export pipeline for the common video formats the agent claims, preserving the preview's framerate and resolution.
- [ ] Add the history of accepted outputs and the re-edit entry that starts a new revision loop on the same chat surface.
- [ ] Enforce the primitive-list boundary: the motion planner refuses a primitive the renderer does not support, instead of producing a closest-fit.
- [ ] Write the README that documents the chat-driven workflow, the precision primitives, the edit primitives, the revision loop, and the export formats.
- [ ] Run an end-to-end test on a representative motion-graphics request and a representative video-edit request: the chat description produces a watchable preview, a precision direction (easing, timing, keyframes) is honoured, a critique produces a re-render, the export writes a valid video file, and the re-edit on an accepted output starts a new revision loop on the same chat surface.

## Phase 2: Deploy

- [ ] Launch the agent as a public service
- [ ] Document the precision primitives, the edit primitives, and the export formats in the launch post so users understand the agent's scope
- [ ] Verify in production