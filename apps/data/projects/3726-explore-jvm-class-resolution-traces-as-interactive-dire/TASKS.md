---
id: "3726"
slug: explore-jvm-class-resolution-traces-as-interactive-dire
title: Explore JVM class-resolution traces as interactive directed graphs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487721"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Java, JVM, JVMTI, self-contained HTML, d3.js or cytoscape]
---
# Explore JVM class-resolution traces as interactive directed graphs

## Phase 0: Scaffold

- [x] Create the project folder under `apps/`
- [x] Initialise the git repo
- [x] Copiar `edd-app-template` → `apps/3726-explore-jvm-class-resolution-traces-as-interactive-dire/`
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md (tokens + visual direction)
- [x] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [x] Set up the development environment
- [x] Lock the agent mechanism (JVMTI / instrumentation API), the trace format, and the JVM support matrix

## Phase 1: Core

- [ ] Implement the JVMTI / instrumentation agent that records class-resolution events
- [ ] Implement the trace file writer with a versioned schema
- [ ] Implement the renderer: single HTML file with the four lens toggles
- [ ] Vendor the graph library so the rendered HTML has zero network requests
- [ ] Document capture overhead so "with the agent" measurements are not silently invalidated

## Phase 2: Deploy

- [ ] Publish the CLI: attach → capture → render, end-to-end
- [ ] Verify the no-network contract on the rendered HTML (Network tab = empty after load)
- [ ] Document supported JVM versions and the trace-size limit the renderer handles smoothly

---

_Generated automatically by Lúa on 2026-08-29_
