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

## Problem

Motion graphics and video editing have traditionally required specialist software with timelines, keyframes, and a manual workflow the user has to learn before producing anything watchable. The Fotor launch post names the alternative: create and edit precision motion graphics and video by chatting with an AI agent, so the user describes the motion and the agent produces it. The post is short — a tagline and a discussion link — but it makes the agent claim explicit: the user is not editing a timeline, they are directing the agent in chat and the agent does the motion work. The source names the actor (a creator who needs precision motion graphics and video without learning a timeline editor), the pain (specialist software has a manual workflow the user has to learn), and the missing thing (a chat-driven AI agent that produces and edits precision motion graphics and video). It does not name a specific motion-graphics feature, a specific video length, or a specific export format.

## Objective

Ship a chat-driven AI agent that creates and edits precision motion graphics and video from a user's natural-language direction, so the user describes what they want and the agent produces the motion work without the user having to learn a timeline editor.

## Target Users

- Creators who need precision motion graphics and video but do not want to learn a timeline editor.
- Marketing teams producing short-form motion assets and needing a chat-driven workflow that fits their existing copy-driven process.
- Educators and explainer-video producers who need motion graphics for technical content and want to direct them in prose.
- Social-media managers producing repeatable video edits and wanting a chat workflow that does not require a per-edit specialist.
- Indie designers prototyping motion ideas and wanting a faster path from concept to a watchable preview.

## MVP Scope

- A chat-driven agent interface where the user describes the motion they want and the agent produces a motion-graphics or video output.
- Precision motion-graphics primitives: text on motion, shape transitions, easing curves, timing, and keyframes generated from the chat description.
- Video editing primitives: trim, cut, splice, transition, audio overlay, and caption placement driven from chat.
- A preview pane that renders the agent's output before the user accepts it.
- A per-output revision loop: the user critiques in chat, the agent re-renders.
- Export to common video formats (the source names no specific format; the export list is the agent's claim).
- A history of accepted outputs the user can revisit and re-edit.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The user describes the motion in chat; the agent produces it. A workflow that requires a manual timeline is a workflow failure.
- The motion is precision: the user can specify easing, timing, and keyframes by describing them. A "good enough" output the user cannot direct is a precision failure.
- The chat is the editor. The user does not need to learn a separate timeline UI. A hidden manual workflow is a UX failure.
- The export format list covers common video formats. A format the agent cannot export is a coverage gap.
- The revision loop is in chat. A "click to edit a keyframe" workflow is a UX regression.
- The user can revisit any accepted output and re-edit it through the same chat surface.