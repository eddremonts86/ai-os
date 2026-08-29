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

## Tech Stack

- **Capture agent:** a Java agent built on the standard JVM Tool Interface (JVMTI) or the instrumentation API, loaded with `-javaagent:` or `-agentlib:` and recording class-resolution events into a trace file.
- **Trace format:** a documented, versioned format the renderer can read; the choice (JSON-Lines, a custom schema, or a columnar format) is a repo-level decision.
- **Renderer:** a single HTML file with embedded CSS and JavaScript that reads the trace and renders it as an interactive directed graph using a vendored graph library (d3.js, cytoscape.js, or equivalent — vendored, not loaded from a CDN).
- **CLI:** a small launcher that attaches the agent to a target JVM or runs the capture against a packaged jar, then invokes the renderer to produce the final HTML.
- **Lenses:** four views surfaced as toggles in the renderer — startup behavior, app/runtime boundary, dependency coupling, and unexpected loads.
- **JVM support matrix:** the README must state which JVM vendors and versions are tested.

## Architecture

```
┌────────────┐    ┌────────────┐    ┌────────────┐    ┌────────────┐
│ Target JVM │───▶│ JVMTI      │───▶│ Trace file │───▶│ Self-      │
│ (java -    │    │ agent      │    │ (on disk)  │    │ contained  │
│  javaagent)│    │            │    │            │    │ HTML       │
└────────────┘    └────────────┘    └────────────┘    └────────────┘
```

Capture and rendering are decoupled: the agent writes a trace file, the renderer reads it. The user can re-render the same trace with different lens toggles without re-running the JVM.

## Milestones

1. **M0 — Capture agreement.** Lock the agent mechanism (JVMTI / instrumentation API), the trace format, and the JVM support matrix. These are repo-level decisions, not product features.
2. **M1 — Working capture + render.** Attach the agent to a sample JVM, emit a trace, render it to an interactive HTML file. The four lenses are present.
3. **M2 — Self-contained contract.** Verify the rendered HTML has zero network requests after opening, and document the test in the README.
4. **M3 — Scale honesty.** Document the trace size the renderer handles smoothly; add a degradation strategy (filtering / virtualization) for larger traces.

## Risks

- **JVM version drift.** New JDK releases sometimes shift JVMTI behavior; the support matrix must be honest about what is tested vs. best-effort.
- **Capture overhead.** The agent itself changes timing; the MVP must publish the overhead so "with the agent" measurements are not silently invalidated.
- **Trace size.** Large applications resolve millions of classes; the renderer must handle this without freezing.
- **"Self-contained" pressure.** A future feature (remote fonts, a hosted viewer, an analytics endpoint) would break the headline promise. The constraint is a contract, not a roadmap item.
- **Lens scope creep.** The post lists four lenses; expanding to "full JVM observability" silently inflates the MVP and dilutes the focus.
