---
id: "2923"
slug: canaster-is-a-canvas-based-visual-workspace
title: Canaster is a canvas based visual workspace
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49436551"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Canaster is a canvas based visual workspace

## Problem

Canaster is a canvas based visual workspace (think high performance hierarchical miro board).I had a particular vision for workspace I wanted where I can put my documents including pdfs/markdowns/tables/checklists in a visual hierarichal workspace.I started with a DOM based approach but that quickly hit its limits of responsiveness in terms on interaction, so i built this one with webgl and my main priority was a consistent 120+ fps rendering (you can see the fps number by clicking the (i) icon in the bottom right, the other buttons there are for refit/rearrange panels).You can drop pdfs/markdown files as it is organize them. Each 'panel' can the canvas can be maximised to interact with it and can inline edit with double clicking. You can also embed other websites (the ones which allow it)Workbooks can be private or public. Here are a bunch of documents I have created as a demohttps://canaster.in/d/naruto-casefiles/how-come-these-three-...
https://canaster.in/d/admin/thirty-six-views-one-mountain--0...(ps, documents have original images which can be large and depending on your location might be slow to load since its running on a single server in 1 location)there are more things I am adding like email to a workbook (each account gets their own email account @canaster.in) and can connect panes to each other (have not created a good demo for it yet)you can switch dark/light theme, and can set image for the panel/canvas background as well (cmd/ctrl + k to bring up the command menu). canaster is optimized for usage on mobile as well.https://x.com/phparth/status/2077397341674627470 (a screen recording from past when it was in dev)

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
