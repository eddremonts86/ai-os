---
id: "4003"
slug: cogram-studio-cad-and-bim-workspace-for-humans-and-agen
title: Cogram Studio – CAD and BIM workspace for humans and agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49501620"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Cogram Studio – CAD and BIM workspace for humans and agents

## Problem

Hi HN,Rick and Alex here, co-founders of Cogram. We’ve been making project-management software for architects and engineers since 2023, and are now experimenting with a second product.Cogram Studio (studio.cogram.com) is a CAD and BIM workspace for AI agents to create three-dimensional models and dimensioned drawings.Studio runs FreeCAD (https://github.com/FreeCAD/FreeCAD) 1.1 headlessly, using the OpenCASCADE (https://github.com/Open-Cascade-SAS/OCCT) geometry kernel. It imports and exports STEP, IFC, STL, DXF and FCStd files. Studio exposes an MCP server, so you can operate it from Claude Code, Codex, ChatGPT, or other agents. Tools cover scripting against FreeCAD, inspecting the model visually, CRUD operations on views, tables, and sheets, importing terrain, etc. Studio also provides a built-in agent based on Pi (https://github.com/earendil-works/pi) and a basic UI for 3D model inspection, measurement, view, table, and sheet creation.There are two ways to try it:1. Bring your own agent. Point Codex or Claude Code at studio.cogram.com/skill.md and ask it to follow instructions there. This starts a one-hour Studio session and opens the modelling environment in your browser, connected to your agent. You need to confirm sign up only if you want to save the session.2. Use Studio’s built-in agent. Submit a prompt at studio.cogram.com and sign up. You receive 50 free credits.Here are two models created by agents:- A simple bookshelf (https://studio.cogram.com/view/shr_1agb21nd4) with two sheets- The Colosseum (https://studio.cogram.com/view/shr_3tm32c64y) [large, can take minutes to load], with two sheets showing dimensioned and annotated views.For now, Studio works best when you use it iteratively. If you ask an agent for a finished, complex model and “let it rip”, it may produce something that looks convincing but doesn't hold up to scrutiny. Agentic modelling feels roughly like where agentic programming was in 2024: useful for speeding up repetitive or bounded tasks but not yet reliable enough to complete long, complex jobs.
Recent models have improved at CAD. We expect progress to accelerate as models become even better at reasoning across the different representations used in architecture and engineering: geometry, drawings, images, materials, physical constraints, specifications, regulations, code, etc.Early users and our own experience suggest that agents are already useful design collaborators. They can help with repetitive CAD work, fabrication options, part sourcing and cost estimates. We expect that as models improve, agents will be able to explore many different designs, run simulations, and check constraints across an entire project. CAD will become a shared workspace for humans and agents. Because design decisions made in CAD shape much of what is eventually built, even modest improvements could have wide effects.We’d love to hear your feedback and ideas if you give Studio a try. We’re also hiring across product, engineering and commercial roles. If you’re interested in working on interesting problems involving AI and the physical world, please take a look at our open positions at https://cogram.com/about#careers.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
