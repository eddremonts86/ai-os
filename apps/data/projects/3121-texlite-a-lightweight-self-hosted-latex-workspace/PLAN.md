---
id: "3121"
slug: texlite-a-lightweight-self-hosted-latex-workspace
title: TexLite – A lightweight self-hosted LaTeX workspace
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450500"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# TexLite – A lightweight self-hosted LaTeX workspace

## Tech Stack

Not stated by the source. A self-hosted LaTeX web app would typically pair a browser editor with a backend that runs a TeX distribution (TeX Live or TinyTeX) and serves the compiled PDF. Specifics are TODO.

## Architecture

A web frontend (editor + preview) talks to a backend that runs LaTeX compilation jobs and stores projects. Storage is plausibly filesystem or S3-compatible; auth is unstated.

## Milestones

- [ ] Repo at SWUFE-DB-Group/TexLite builds and runs as documented.
- [ ] A new project can be created, edited, and compiled to PDF.
- [ ] Anything beyond a single-user workspace (multi-user sharing, history, real-time collab) is not implied by the source.

## Risks

The defining risk is TeX distribution weight — "lightweight" claims need to hold up against the reality of full LaTeX packages.
