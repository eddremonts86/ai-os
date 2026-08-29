---
id: "768"
slug: a-startup-founder-loses-focus-and-productivity-juggling
title: "A startup founder loses focus and productivity juggling 5-7 tools for a single project. Existing «all-in-one» platforms don't provide the feel of a unified workspace."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/nglbafr5o1-a-startup-founder-loses-focus-and-produc"
category: productivity
date: "2026-02-09"
tags: [Productivity, Startups, Other]
country: India
tech: [Tauri, Rust, TypeScript, Solid.js, SQLite, CRDT (Automerge), Local-first sync]
---
# A startup founder loses focus and productivity juggling 5-7 tools for a single project. Existing «all-in-one» platforms don't provide the feel of a unified workspace.

## Tech Stack

- **Tauri** for the desktop shell, chosen because local-first storage is the design constraint and a Tauri app gives the founder a real desktop surface without an Electron-sized binary.
- **Rust** for the storage and sync layer, because the local-first merge engine and the cross-reference index are concurrency-critical and benefit from Rust's predictability.
- **TypeScript** for the application layer, because the workspace modules share enough UI primitives that one typed module surface is the cheapest way to keep them unified.
- **Solid.js** as the renderer, because Solid's fine-grained reactivity matches the live cross-reference model — a task that links to a note must update without re-rendering the whole workspace.
- **SQLite** as the local store, because one workspace for one project is a single-file database on the founder's machine and SQLite is the smallest workable option.
- **Automerge** for the CRDT layer, because sync-across-devices with two machines and offline work has to merge without conflicts and CRDTs are the right tool for that.
- **Local-first sync** as the architecture shape, because the source names a workspace that feels unified and any always-online required design breaks that for an Indian founder's connectivity pattern.

## Architecture

The workspace is one project, one folder on disk, one SQLite database. The database has one table per module (tasks, notes, docs, calendar events, contacts) and one cross-reference table that records any link from any entity to any other, with both directions materialised. The link table is the difference between this workspace and the stitched alternatives: a link written once is queryable from either side, and a UI render of one entity knows about the cross-references in the same frame.

The render surface is Solid.js inside the Tauri shell, with the workspace shell itself being one keyboard command palette, one left rail listing entities by module, and one main pane rendering whatever the founder selected. The right rail exists only on demand — typically to show cross-references for the current entity — and the bottom surface exists only on demand for the daily strip. Every visible affordance has to justify itself against the loss-of-focus cost; modals and settings detours are gated behind an explicit `cmd-,` keystroke.

Local-first storage means every action the founder takes is local, then propagates via Automerge to other devices. A founder on a flight works without connectivity and the merge on landing is conflict-free at the entity level because Automerge is a CRDT; cross-references resolve deterministically by entity id, so a note created offline on one device and a task created offline on the other merge into a single graph rather than two parallel graphs. A second device is the simplest sync case; a two-person founding team would need a relay, which is out of scope for MVP.

Search is one index across all modules, with a relevance model that prefers the entity the founder is most likely to mean. The index is built on entity title plus first-paragraph plus cross-reference text, and surfaces results across modules, so 'the task about onboarding' returns a task named something else but cross-referenced from the onboarding note.

## Milestones

1. **M1 — Workspace shell** — Tauri shell, Solid.js workspace shell, one command palette, one left rail, one main pane.
2. **M2 — Local store** — SQLite schema with modules and a unified cross-reference table; bi-directional cross-reference queries.
3. **M3 — Five modules** — Tasks, notes, docs, calendar events, and a lightweight contact record, each rendering in the main pane.
4. **M4 — Cross-references live** — Live cross-reference rendering in both directions; one keystroke to create a link from the current entity.
5. **M5 — Search** — One workspace-wide index with relevance ranking that prefers the founder's intent.
6. **M6 — Sync** — Automerge CRDT layer for sync-across-devices with conflict-free merge.
7. **M7 — Import and share** — Import paths for CSV (tasks, contacts) and Markdown (notes, docs); a viewer-only share link for any doc.
8. **M8 — Daily surface** — A week view combining calendar events with tasks-due-today; quick-capture keystroke that opens a task or note without a modal.

## Risks

- **Seam tax is a feeling as much as a flow** — even when every cross-reference is live both directions, a UI that loads modules one at a time or styles them differently reproduces the seam; design discipline is part of the technical work.
- **Local-first merge correctness** — Automerge is a CRDT but cross-reference resolution depends on entity ids being stable across merge; an id strategy that changes is a merge bug.
- **Search trust** — a search that returns plausible-but-wrong results is worse than a search that returns nothing; ranking needs a model the founder can predict.
- **Modal creep** — every modal added to the workspace adds a focus tax the post names explicitly; the keystroke discipline has to be a reviewable property of every PR.
- **Solo-to-team transition** — a workspace shaped for a solo founder scaling to a two-person team adds a seam if collaboration is bolted on later rather than supported from the start.
- **Import scope** — founder history is in formats the workspace cannot read; an import path that drops 60% of history is a productivity regression rather than an improvement.
- **Sync relay absence** — sync-across-devices without a relay is fine for one founder on two machines, but any second user needs a relay whose trust model is a real decision.
- **Cross-reference UI clutter** — a workspace where every entity has a cross-reference sidebar that obscures the main pane adds clutter instead of removing it; density has to be tuned.
