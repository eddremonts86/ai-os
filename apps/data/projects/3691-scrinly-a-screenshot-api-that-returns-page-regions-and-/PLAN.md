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

## Tech Stack

- **Render workers:** headless Chromium in isolated, recycled containers. Non-negotiable: the product's own pitch is that the caller does not run browsers, which means this side runs them properly — device presets, theme forcing, `fullPage`, waits and browser actions all live here.
- **API tier:** Node.js REST service, same language as the render layer so device presets and wait semantics are not reimplemented twice. It owns credit reservation, refunds and the balance headers on every response.
- **Job queue:** Redis for the `async=true` and `webhookUrl` paths, holding accepted jobs that return `202` with a pollable id. BYOK style guides bypass the queue by design, because a caller-supplied provider key is never persisted.
- **Metadata store:** Postgres for accounts, credit ledger, captures, region sets, diffs, monitors and their baselines. The ledger is double-entry style: a reservation, then either a settlement or a refund, so a refunded failure is provable rather than asserted.
- **Object storage:** Backblaze B2 by default, with S3 and R2 as caller-owned destinations on the top tier. Stored screenshots, region crops and diff visualizations return direct provider URLs; diffing and monitoring assets must stay publicly fetchable.
- **Agent surface:** an MCP server exposing four visual tools behind scoped OAuth, so a client approves screenshot, diff and usage permissions without the agent ever holding the API key.

## Architecture

A capture is one durable object that everything else references. `POST /render/screenshot` reserves credits, renders in a worker, stores the image, and records a `sha256` for it. Regions, style guides and diffs are all derivations that carry that hash forward — which is what makes the traceability claim checkable rather than decorative: a caller can match any region crop or diff visualization back to the exact capture it came from.

Add-ons are separately settled increments on the same reservation. Regions crops the stored capture into ordered sections and records each one's bounds, bytes and hash. The style guide sends crops plus a sanitised projection to the model provider — never the URL, hostname, HTML, headers, cookies, selectors or supplied page text — and then checks every returned literal (color, duration, easing, breakpoint, token) back against that projection, failing the add-on instead of publishing an unverifiable value. If an add-on fails, the caller keeps the successful screenshot and only that increment is refunded; if the browser capture itself fails, the whole charge goes back.

Monitors are a scheduled loop over the same primitives: capture, compare against the stored baseline, and on a material change emit an incident event and advance the baseline lifecycle through to recovery. Errors stay typed throughout so an agent can decide whether a retry is worth another credit.

Target validation runs before any browser starts: private-network, loopback, link-local and reserved destinations are refused, and a `robots.txt` override requires a verified domain.

## Milestones

1. **M0 — Capture primitive and credit ledger.** Screenshot render with device, theme, format and wait controls; reserve-settle-refund ledger; balance in headers; blocked-destination validation. End of week 3.
2. **M1 — Regions.** Deterministic section splitting with preserved document order, per-crop bounds, bytes and hashes tied to the parent capture. End of week 5.
3. **M2 — Diffs.** Overlay, heatmap and mask outputs as their own one-credit request against a prior capture. End of week 7.
4. **M3 — Monitors.** Scheduled captures, baseline management, diff-per-run, incident events and the recovery path. End of week 10.
5. **M4 — Visual style guide.** Sanitised projection, observed-versus-inferred labelling, the literal check that fails the add-on rather than publishing, plus the BYOK synchronous path. End of week 13.
6. **M5 — Agent surface and plans.** MCP server with four scoped tools, the published skill, batch endpoint, and the five plan tiers with monthly allowance and operating limits. End of week 16.

## Risks

- **Browser fleet economics at one credit per screenshot.** A screenshot is priced as the cheapest unit in the system while being the operation that costs real CPU, memory and wall-clock time. Slow pages, heavy waits and post-interaction states all inflate that cost against a fixed price, so worker recycling and hard timeouts are margin controls, not hygiene.
- **Refunds as an availability tax.** Charging before work starts and refunding on failure is the honest model, and it means every flaky render costs the platform twice: the compute and the refunded credit. A rising refund rate hits revenue and trust in the same quarter.
- **The style guide's failure mode is publishing a wrong literal.** Inference is allowed but must stay labelled, and the literal check exists precisely because an unchecked model value would look identical to a measured one. Weakening that gate to raise the pass rate would remove the product's reason to be trusted.
- **BYOK cannot be queued.** Never persisting a provider credential means BYOK style guides stay synchronous, which caps concurrency for exactly the callers who bring their own key because they run high volume.
- **Capture-rights liability sits with the caller.** The service blocks only private, loopback, link-local and reserved targets; cookies, auth headers and browser actions are available for pages the caller claims authorization to. That is a stated policy, not an enforceable control, so abuse response is a business risk carried by design.
- **Public fetchability of stored assets.** Diffing and monitoring require publicly fetchable assets, which is in tension with callers capturing authenticated pages. Retention follows the storage destination, so a caller-owned bucket shifts that exposure to them without removing it.
