---
id: "3691"
slug: scrinly-a-screenshot-api-that-returns-page-regions-and-
title: Scrinly – A screenshot API that returns page regions and visual diffs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484191"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Headless Chromium render workers, Node.js REST API, Postgres, Redis job queue, Backblaze B2 with S3 and R2 support, MCP server with scoped OAuth]
---
# Scrinly – A screenshot API that returns page regions and visual diffs

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

One capture, three layers: the pixel-accurate page as users saw it, ordered regions a vision model can actually read, and a labelled visual style guide when the workflow needs it. Screenshots, regions, style guides and diffs all point back to the same image, with hashes and metadata that let a caller check where each result came from — and no Chromium to operate on their side.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent developer | An agent needs to see a page; a full-page image compressed into one frame is unreadable to a vision model, and ordered regions are the fix. |
| MCP client user (Codex, Claude Code, Gemini, Cursor) | Wants the agent to capture and compare without handing it an API key — scoped OAuth grants screenshot, diff and usage permissions only. |
| Release / QA engineer | Needs to catch visual regressions between releases and monitor critical pages, with a record of what changed and where. |
| Designer doing a brand or design audit | Wants a page's colors, typography, spacing and motion as structured data instead of reading its CSS by hand. |
| Anyone who has run a screenshot service | Knows the real cost is the browser fleet, the queue and the retries, not the screenshot. |

## Jobs To Be Done

1. **Functional job** — Turn a live URL into visual evidence an agent or a pipeline can act on: image, readable regions, diff against a baseline.
2. **Emotional job** — Stop operating a Chromium fleet, sizing containers and babysitting a render queue to get one picture of a page.
3. **Social job** — Show a colleague what changed between two releases with an annotated overlay, not a description of the difference.

## Success Metrics

- **Free-to-paid crossing:** share of accounts that exceed the 100 free monthly credits and start a paid plan, since the free tier is the whole acquisition path (no card required).
- **Regions attach rate:** share of screenshot calls that also request `regions`. That add-on is the differentiator; if callers only take plain screenshots, the product is a commodity renderer.
- **Refund rate:** share of charged credits refunded for failed captures or failed add-ons. This is the reliability number the credit model exposes publicly, so it is also the trust number.
- **MCP-originated calls:** share of billable calls arriving through the MCP server rather than the REST API — the reading on whether "built for AI agents" describes usage or only positioning.
- **Monitor retention:** monitors still active after 30 days. A monitor is a recurring commitment; abandoned ones mean the incident events were not worth acting on.
- **Style-guide literal-check pass rate:** share of style-guide generations that pass the literal check instead of failing the add-on. Every color, duration, easing, breakpoint and token literal is matched back to the screenshot projection; excess unknown values, a missing heading or truncated output fails the add-on rather than publishing it.

## Pricing & Monetization

Credit-based, and the unit prices are stated: a screenshot costs one credit, `regions` adds two, a platform `styleGuide` generation adds three, a cached style guide or BYOK adds one, and a visual diff is its own request at one credit. Free gives 100 credits a month with no card. Five tiers exist — Free, Startup, Pro, Business, Prime — differing only by monthly allowance and operating limits, with Prime adding three times the allowance and storage on the caller's own bucket. Yearly billing is advertised as saving up to $1,200 a year. The tiers' actual monthly prices are not stated on the captured page, so they are an open question rather than a figure to fill in.

## Competitive Landscape

- **Self-hosted Playwright or Puppeteer** — what most teams do today. Free until the browser fleet, the queue and the flaky retries become someone's job.
- **Generic screenshot APIs (urlbox, ScreenshotOne, ApiFlash and similar)** — solve capture. They return the image; they do not return model-sized ordered regions, a labelled style guide, or a monitor lifecycle over the same evidence.
- **Percy, Chromatic and visual-testing suites** — strong at regression diffing inside CI for component libraries, priced and shaped for test pipelines rather than for an agent asking about an arbitrary public URL.
- **Uptime and page-change monitors** — tell you something changed. The differentiator claimed here is knowing what changed, where, and whether it needs attention.

## Risks & Open Questions

- [ ] Publish the per-tier monthly prices. The credit costs are public but the plan prices are not, and "up to $1,200 a year" saved implies a tier expensive enough that the number matters to the buyer.
- [ ] Quantify the regions add-on's value against its price: it triples the cost of a capture, so callers need a measurable accuracy gain in their vision-model step.
- [ ] Capture rights sit with the caller by design. Decide what abuse-response process exists when that obligation is ignored, given only private, loopback, link-local and reserved targets are blocked outright.
- [ ] BYOK style guides must stay synchronous because a provider credential is never persisted. Confirm this does not cap throughput for the callers most likely to use BYOK — the high-volume ones.
- [ ] The Show HN post carried 1 point and no comments at capture. Whether agent developers will pay per credit for regions is untested by that thread.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49484191) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
