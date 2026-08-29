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

> Product brief for the JVM class-resolution tracer linked from the Show HN post.

## Value Proposition

A JVM developer can attach the agent to a Java process, capture every class-resolution event during a run, and open a single self-contained HTML file to see — interactively — what got loaded, when, by whom, and what is unexpectedly coupling their modules. The output is shareable as one file.

**One-liner:** A JVM class-resolution tracer that ships its analysis as a single HTML file you can email.

## Target Users

| Stakeholder | Why they care |
|---|---|
| JVM library authors | Want to show what their dependency footprint actually looks like at the class level. |
| Performance engineers | Diagnosing slow startup, fat-jars, or class-loading regressions. |
| Framework / runtime authors | Want a teaching artifact to show what Spring, Quarkus, GraalVM, or OSGi actually loads. |
| Curious developers | Want to understand a third-party jar they did not write, class by class. |

The source frames the user as someone who wants a shareable local artifact, not a hosted observability dashboard.

## Jobs To Be Done

1. **Functional job** — Capture class-resolution activity from a running JVM and emit a single interactive HTML file the developer can open and click around in.
2. **Functional job** — Surface the four lenses the post names: startup behavior, app/runtime boundary, dependency coupling, and unexpected loads.
3. **Functional job** — Let a developer hand the HTML file to a colleague without standing up a shared backend.
4. **Emotional job** — Make class-loading visible, so the JVM stops feeling like a black box during startup.

## Success Metrics

- **Activation:** attach agent to a sample JVM process → produce HTML → open in browser, end-to-end in under 15 minutes.
- **Lens coverage:** the four lenses in the post are each a toggleable view in the rendered graph, not hidden behind a "coming soon."
- **Shareability:** the rendered HTML works offline, with no CDN or network call after the file is opened.
- **Scale honesty:** the renderer states the trace size it can handle smoothly and degrades (filters / virtualization) rather than freezing the browser.

The post does not state a revenue target; the project is delivered as a local tool, not a hosted product.

## Pricing & Monetization

The post does not name a price or business model. The "self-contained HTML" framing implies the tool is free and offline; any monetization (a hosted collaborative viewer, a paid enterprise tier) would be a post-MVP addition and is out of scope for this plan.

## Competitive Landscape

- **Async-profiler / JFR** — excellent for CPU and allocation profiling, but the artifacts are not designed to be "click around in a graph of class resolution" — they are timelines and flame graphs.
- **Java agents for class-loading traces** (the JDK's own `-verbose:class`, `-Xlog:class+load`) — produce text output, not interactive graphs.
- **APM tools (Datadog, New Relic, etc.)** — cover class-loading only as a side-effect of full request tracing; they require a hosted backend and an account.

The project's differentiator is the explicit "JVM class-resolution → interactive directed graph → single self-contained HTML file" framing: it sits between the JDK's text flags and a full APM stack, with no infrastructure to run.

## Risks & Open Questions

- [ ] The post does not name the capture mechanism (JVMTI, javaagent, instrumentation API); the README must state which one and which JVM versions are supported.
- [ ] A class-resolution trace on a large application can be very large; the renderer must degrade gracefully rather than freeze the browser.
- [ ] Capture overhead can perturb the very startup behavior being measured; the MVP must publish the overhead so users know what "with the agent attached" means.
- [ ] The post lists four lenses; the MVP must deliver them and resist scope creep into "full JVM observability."
- [ ] "Self-contained HTML" is a contract; the renderer must not silently require a CDN, a font, or a remote stylesheet.
