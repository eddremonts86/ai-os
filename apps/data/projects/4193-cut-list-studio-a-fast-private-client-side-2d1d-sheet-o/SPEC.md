---
id: "4193"
slug: cut-list-studio-a-fast-private-client-side-2d1d-sheet-o
title: "Cut List Studio – A fast, private, client-side 2D/1D sheet optimizer"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509619"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Cut List Studio – A fast, private, client-side 2D/1D sheet optimizer

## Problem

Woodshops and small fabrication studios lose 20–35% of their plywood and lumber stock because they sketch cutting plans on paper or estimate yields by eye. Common oversights include forgetting saw blade kerf (1/8" per pass on a table saw), ignoring grain direction on visible panels, dropping edge-banding thickness into the raw cut size, and skipping factory-edge trim. s0lve.it's Cut List Studio runs the two-dimensional bin packing and one-dimensional cutting stock problems entirely in the browser, no upload, with kerf compensation, grain matching, edge-banding deductions, factory-edge trimming, guillotine-safe cut plans, and topological batch sawing into DAG-organized setups. The source page lists standard material sizing (4×8 plywood, 5×5 Baltic birch, 9.2×6.8 oversized melamine, dimensional lumber, T-slot aluminum extrusion) and shows a Simple Mode (2-step fast flow for DIY cuts) versus an Advanced Studio Mode (3-step professional suite with multi-material workspace, fullscreen workshop mode, and master quotation summary).

## Objective

Give a woodworker or cabinet shop a browser-only tool that turns a parts list and a raw stock size into a printable guillotine-safe cut diagram, a saw step sequence, a batched setup list, and a project cost breakdown, with zero project data ever leaving the local browser.

## Target Users

- DIY woodworkers building cabinets, bookcases, or shop furniture from standard plywood and 2×4 lumber
- Small cabinet and joinery shops that quote multi-sheet projects and need fast, repeatable nestings
- Architectural millwork and interior contractors mixing sheet goods, dimensional lumber, and aluminum extrusions
- Makers cutting T-slot frames for 3D printers, CNC machines, and enclosures

## MVP Scope

- Simple Mode: enter raw sheet size, paste a parts list, get a numbered cutting diagram and saw sequence
- Advanced Studio Mode: multi-material workspace mixing 2D sheets, 1D lumber, and hardware line items
- Kerf, grain direction, edge-banding, and factory-edge-trim inputs
- Guillotine-only cut plans with rip-first and cross-cut-first sequencing
- Topological batch sawing (DAG) that groups identical cuts across sheets into unified setups
- Interactive nesting diagram with numbered cut badges, edge-banding stripes, and hatched waste area
- Printable PDF cut plans, sawyer checklists, BOM, and quotation breakdown
- Local-only persistence in browser storage; no server, no account

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- 100% client-side; no project data, part dimensions, or customer quotes leave the browser
- Guillotine-only — table saws, track saws, and panel saws cannot do internal plunge cuts
- Standard material dimensions must cover 4×8 plywood, 5×5 Baltic birch, oversized melamine, 2×4 lumber, T-slot aluminum
- No SaaS account, no upload, no telemetry