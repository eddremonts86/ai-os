---
id: "856"
slug: need-simple-application-testing-tool-without-programmin
title: Need simple application testing tool without programming
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/ved547b251-need-simple-application-testing-tool-wit"
category: dev
date: "2025-11-04"
tags: [Dev, AI, No-Code, Other]
country: Kenya
tech: [Tauri (Rust + WebView), TypeScript, Node.js (Fastify), SQLite, Playwright (CDP), WireMock, Sentry, Cloudflare R2, M-Pesa (Daraja API sandbox), Coolify, Docker]
---
# Need simple application testing tool without programming

## Problem

The capture is a category-level problem statement from ProblemHunt: the `## Problem` body carries only the country name Kenya, and the title — "Need simple application testing tool without programming" — is the entire problem statement. Nothing else in the capture adds detail: no description, no quoted persona, no specific application type, no current tool named, no test count or budget cited. The honest ground truth is therefore the title plus the `Dev, AI, No-Code, Other` tags plus the country.

The problem the title names is real and recurring across Kenyan software teams, especially the many small teams and solo developers building web and mobile apps for the domestic market and for clients abroad. Application testing is a discipline that small teams skip because the mainstream tooling — Selenium, Cypress, Playwright in script mode, JUnit — assumes the user can write code, can read English-language error output, and can maintain a test suite over time. The friction is not that testing is impossible, it is that the entry points are steep and the daily workflow is heavy for a team whose primary job is to ship features. The result is a working app that has been hand-tested by the developer once or twice and never regressed against.

The product implication, without inventing specifics, is that a Kenyan developer or small team needs a way to record a click-and-type journey through their own application, replay that journey as a regression test, and see failures in plain language — without ever writing a line of test code, without a complex CI integration, and without paying for a hosted test grid. The MVP is a record-and-replay tool with a desktop client and a small backend; it is not a SaaS test grid, it is not a code-generating tool, and it does not require a programming-language skill to use day to day. Country-specific facts the capture does not state — current Kenyan payment-processor integrations for the paid tier, Kenya-specific test environments for mobile money, the exact browsers and devices the Kenyan market actually uses, or any Kenyan data-protection rule that applies to recorded test sessions — are flagged as open questions rather than asserted.

## Objective

Ship a record-and-replay application testing tool for Kenyan developers and small teams, with a desktop client and a small backend, that lets a user record a click-and-type journey through their own application in a real browser, save it as a named test, replay it as a regression run, and see failures in plain language with a screenshot, a step description and the moment the journey diverged from the recording. The MVP must not require the user to write a line of test code, must work against any web application reachable from the user's machine, and must run entirely locally or on a single self-hosted backend.

## Target Users

- Kenyan solo developers and small-team developers building web and mobile apps for the domestic and export market, who currently ship features without a maintained regression suite.
- Kenyan junior developers and graduates who have been told to "write tests" without a working tool to do it with, and need a no-code entry point.
- Kenyan software bootcamps and short-course instructors who need a testing tool their students can use in week one without a programming prerequisite.
- Kenyan product teams at non-tech firms (banks, insurers, telecoms, government digital services) who maintain internal apps and need a regression check that does not require a dedicated QA hire.
- Kenyan freelance developers building apps for international clients, who need a repeatable QA artefact to hand back with each delivery.
- Kenyan hackathon and weekend-project builders who want a regression check they can leave running without committing to a CI pipeline.

## MVP Scope

- A desktop client built on Tauri that records a click-and-type journey in a real Chromium browser via the Chrome DevTools Protocol, and saves it as a named test in a local project.
- A replay engine that runs a saved test against the same or a different environment and reports each step as pass, fail or warn with a screenshot and a step description.
- A plain-language failure view that names the step that diverged, the expected versus observed DOM state, and the moment in the recording where the divergence happened.
- A project-local library of named tests, organised by feature area, with the ability to run a single test, a folder of tests or the whole project.
- A self-hosted backend that holds the project's tests, run history and screenshots, with SQLite as the default store so a single-machine deployment is one process.
- A scheduled-run option that replays the project suite on a configurable interval and surfaces failures by email or webhook.
- A no-code selector strategy that prefers stable attributes (data-testid, name, aria-label) and falls back to text content with a warning, so test brittleness is visible rather than silent.
- An explicit non-load-testing disclaimer on every run, naming that the tool is a regression-check tool and not a performance or load test.
- An export-and-share feature that produces a runnable artefact a colleague can replay on their own machine, without a hosted account.
- Audit logging of every record, replay and edit, with the project and test versions referenced.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The tool is a regression-check tool only; it does not perform load testing, security testing, or penetration testing, and the disclaimer must be visible on every run.
- The desktop client records against a real browser via the Chrome DevTools Protocol; it does not synthesise DOM events that bypass browser security, and tests must run in a real browser to count as a regression check.
- Selectors chosen during recording are heuristics; the no-code selector strategy must prefer stable attributes and flag brittle ones rather than silently producing a flaky suite.
- Recorded journeys may include credentials and personal data the developer types into their own app; the local project and the self-hosted backend must apply a documented retention policy and must not transmit recordings to a third-party service.
- The MVP must not require the user to write a line of test code; if a user can only use the tool by writing JavaScript or Python, the MVP has failed its own purpose.
- The capture names Kenya, and the default browser and device matrix must reflect the Kenyan market rather than a US default; the exact matrix is left as an open question until a pilot user is on-boarded.
- A hosted SaaS test grid is not in scope at MVP; the architecture is desktop client plus self-hosted backend, and any later hosted tier must be a separate decision.
