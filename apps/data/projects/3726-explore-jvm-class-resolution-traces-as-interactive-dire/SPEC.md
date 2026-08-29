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

## Problem

The Show HN post is a short prose body:

> ClassTrace Explorer captures JVM class-resolution activity and turns it into an interactive, self-contained HTML graph. It helps explain startup behavior, application/runtime boundaries, dependency coupling, and unexpectedly loaded code.

Reading the post literally, the problem is that JVM startup behavior and class-loading are opaque. A developer trying to understand why their application is slow to start, where the application/runtime boundary sits in a fat-jar deployment, how tightly coupled two modules are at the class level, or why a particular class was loaded at all has no good off-the-shelf tool. The post frames ClassTrace Explorer as the answer: capture the trace, render it as an interactive directed graph in a single HTML file the user can open and click around in.

The post does not name the capture mechanism (JVMTI, javaagent, an instrumentation library), the graph library used, or the supported JVM versions. Those choices live in the project, not in the post.

## Objective

Build a tool that records JVM class-resolution activity during a run and emits an interactive, self-contained HTML graph that a developer can open in any browser to explore what got loaded, when, and by whom. The MVP targets the "explain startup behavior, app/runtime boundaries, dependency coupling, and unexpected loads" framing. It does not target production profiling, real-time monitoring, or a hosted observability backend.

## Target Users

- JVM developers and library authors trying to explain their dependency footprint at the class level.
- Performance engineers diagnosing slow startup, large fat-jars, or unexpected class loads.
- Framework and runtime authors (Spring, Quarkus, GraalVM, OSGi) who want a teaching artifact to show what their runtime actually loads.

The post does not name ops, SRE, or production-monitoring use; the "interactive self-contained HTML" framing implies offline, share-by-file workflows.

## MVP Scope

- A capture stage: a Java agent or JVMTI-based tool that records class-resolution events from a running JVM, producing a trace file.
- A renderer: a single HTML file (with embedded CSS/JS) that reads the trace and renders it as an interactive directed graph.
- Filters and views: the four lenses the post names — startup behavior, application/runtime boundary, dependency coupling, unexpected loads — surfaced as toggleable views.
- A CLI that takes a Java process or a packaged jar, runs the capture, and emits the HTML.

The MVP does not include a hosted observability backend, real-time streaming, or a paid tier. The deliverable is local and share-by-file.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Self-contained HTML: the rendered graph must work when double-clicked from disk, with no network calls. The renderer cannot quietly require a CDN.
- JVM version honesty: the agent must declare which JVM versions it supports; an unsupported JVM should fail loudly, not produce a misleading trace.
- Capture overhead: the agent must not change the timing of the very startup behavior the user is trying to measure. The MVP needs to be honest about capture cost.
- Trace file scale: large applications can resolve millions of classes; the renderer needs to handle the resulting graph without freezing the browser.
- Honest framing: the post lists four lenses, not "full observability." The MVP must deliver the four and not promise a fifth one.
