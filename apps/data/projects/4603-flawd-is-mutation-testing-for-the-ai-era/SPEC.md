# SPEC.md — Flawd is mutation testing for the AI era

## Problem

Hey, all! Flawd is a mutation testing tool that can target five languages (Python, JS, TS, Go, Rust) and it runs locally as a single binary on your machine. Importantly (for many), your code never leaves your machine and all processing takes place directly on your dev box or CI runner.<p>Mutation testing is a process in which faults (known as mutants) are intentionally injected into your codebase, tests are run and any faults which are not detected by your tests are known as survivors (or surviving mutants). Survivors can often indicate that your test assertions are not focused on expected behavior or might be missing altogether. Whereas code coverage can tell you which code was exercised during a test run, mutation testing can provide some insight regarding the strength of the assertions and whether or not certain classes of bugs would be caught.<p>With increasingly more code and tests being authored by coding agents, it seemed like a good time to build a tool like this. Mutation testing is not new, but many of the tools are either single-language specific or haven’t been designed with an agentic workflow in mind, so those are itches we wanted to scratch. Models continue to become more powerful and effective, but at some point there is still a “who watches the watchmen” scenario and we hope Flawd can provide one check towards that balance.<p>We recently ran Flawd against 10 established open source projects and you can find the full writeup here: <a href="https:&#x2F;&#x2F;fixture.dev&#x2F;writing&#x2F;we-mutation-tested-10-projects" rel="nofollow">https:&#x2F;&#x2F;fixture.dev&#x2F;writing&#x2F;we-mutation-tested-10-projects</a><p>Also, you can see what a sample report looks like here: <a href="https:&#x2F;&#x2F;fixture.dev&#x2F;flawd&#x2F;sample-report" rel="nofollow">https:&#x2F;&#x2F;fixture.dev&#x2F;flawd&#x2F;sample-report</a> . Flawd can also generate machine readable reports that can be handed off to coding agents for test strengthening tasks.<p>Feel free to ask my anything about Flawd and thanks for having a look!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49536607)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T14:16:55Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
