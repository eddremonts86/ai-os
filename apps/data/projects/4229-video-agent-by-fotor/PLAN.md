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

## Tech Stack

- **A chat-driven agent interface** as the primary surface, matching the source's claim that the user describes the motion in chat.
- **An LLM-backed motion planner** that translates the user's natural-language direction into a structured motion-graphics or video-edit specification.
- **A motion-graphics renderer** that executes the specification: text on motion, shape transitions, easing curves, timing, keyframes.
- **A video-editing engine** that executes the specification: trim, cut, splice, transition, audio overlay, caption placement.
- **A preview pane** that renders the agent's output before the user accepts it.
- **A per-output revision loop** where the user critiques in chat and the agent re-renders.
- **Common video export formats** (the source names no specific format; the list is the agent's claim).
- **A history of accepted outputs** the user can revisit and re-edit through the same chat surface.

## Architecture

The agent is a chat surface backed by three components: a motion planner, a renderer, and a revision loop. The motion planner parses the user's natural-language direction into a structured specification — the primitive list, the timing, the easing, the keyframes. The renderer executes the specification against a motion-graphics or video-edit pipeline and emits a watchable preview. The revision loop accepts the user's critique, feeds it back to the motion planner, and re-renders.

The chat surface is the only editor. The user does not open a timeline; the agent produces the output from the chat description. A workflow that exposes a manual timeline is a UX regression, not an optional advanced mode.

The motion-graphics renderer is a scene-graph engine that supports the precision primitives the source claims: text on motion (text animated along a path or with a transform), shape transitions (one shape morphing into another with an easing curve), easing curves (the named set: linear, ease-in, ease-out, ease-in-out, custom cubic-bezier), timing (start time, duration, delay), and keyframes (per-property keyframes at named times). The renderer is deterministic for a given specification, so the revision loop can compare the re-render to the previous one.

The video-editing engine operates on an input video (or a freshly generated motion-graphics output) and applies the edit primitives: trim (cut at start and end times), cut (remove a segment), splice (insert a clip), transition (cross-fade or named transition between two clips), audio overlay (add or replace an audio track), and captions (overlay a caption track with timing). The engine preserves the source video's framerate and resolution by default.

The preview pane renders the agent's output at the project's framerate and resolution. The user accepts or critiques; the agent either commits the output to the history or feeds the critique back to the motion planner. The history is the asset library; the user revisits any output and re-edits through the same chat surface.

The export pipeline writes the accepted output to the user's chosen video format. The format list is the agent's claim; the source names no specific format. The pipeline preserves the preview's framerate and resolution by default.

## Milestones

1. **M1 — Chat surface and motion planner** — the chat UI, the LLM-backed parser, the structured specification output.
2. **M2 — Motion-graphics renderer** — the scene-graph engine, the precision primitives, the deterministic re-render path.
3. **M3 — Video-editing engine** — the edit primitives, the input-video handling, the framerate and resolution preservation.
4. **M4 — Preview pane** — the watchable preview, the accept or critique decision surface.
5. **M5 — Revision loop** — the critique parsing, the motion-planner feedback, the re-render cycle.
6. **M6 — Export pipeline** — the common video formats, the framerate and resolution preservation.
7. **M7 — History and re-edit** — the accepted-output history, the re-edit entry through the same chat surface.

## Risks

- **Motion planner hallucinates a primitive the renderer does not support** — the user asks for an effect the engine cannot execute. Mitigation: the renderer exposes a primitive list the planner must consult; a primitive outside the list is a planner refusal, not a closest-fit.
- **Revision loop cycle time too long** — the re-render takes too long, the chat-driven workflow breaks. Mitigation: the revision loop is bounded; a long re-render is a streaming-preview option, not a blocking wait.
- **Export format coverage gap** — the user needs a format the agent does not export. Mitigation: the format list is explicit in the settings; a missing format is a milestone, not a silent failure.
- **History storage cost** — the user revisits many accepted outputs, the history bloats. Mitigation: the history is per-project; the user can prune; the storage cost is bounded by the user's plan.
- **Precision primitives not honoured** — the user specifies an easing curve and the agent ignores it. Mitigation: the renderer logs the primitive name to the preview's metadata; the user can verify the primitive is applied.
- **Long-form video split failure** — the agent produces a video longer than the supported length and the split is jarring. Mitigation: the agent warns before splitting; the split point is configurable from the chat.
- **Chat surface accidentally exposes a timeline** — a hidden manual timeline becomes the de-facto editor. Mitigation: the chat surface is the only editor; the renderer never exposes a timeline view.