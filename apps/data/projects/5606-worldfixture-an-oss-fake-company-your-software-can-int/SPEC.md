# SPEC.md — Worldfixture – An OSS fake company your software can interact with

## Problem

WorldFixture gives you emulated third-party services, object storage, and email, all backed by the same fake company so the data and API responses feel real.<p>So, for example, if your app uses Stripe, Gmail, Slack, and GitHub, you can call the same APIs through WorldFixture and get responses containing data from the fake company. The data is organized so it tells a coherent story across the different services, making the test&#x2F;demo feel real. Moreover, you can stream events over time so the app feels &quot;alive.&quot;<p>It is useful for integration and E2E testing, as well as interactive demos.<p>It was originally part of droplive.io, which lets you try hosted open-source software in a time-boxed microVM. I realized that demos with no data kind of suck, so I started adding data and emulated third-party services, which eventually became WorldFixture.<p>You can also create your own datasets&#x2F;worlds if the default fake company is not what you need.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49603266)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T21:42:13Z

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
