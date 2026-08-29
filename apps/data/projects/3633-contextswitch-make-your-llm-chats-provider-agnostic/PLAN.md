---
id: "3633"
slug: contextswitch-make-your-llm-chats-provider-agnostic
title: ContextSwitch – Make your LLM chats provider agnostic
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481375"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Manifest V3, TypeScript, Vite, chrome.storage.local, Playwright (dev-time selectors), Vitest]
---
# ContextSwitch – Make your LLM chats provider agnostic

## Tech Stack

- **Manifest V3** as the extension manifest version, because Chrome and Edge have both deprecated MV2 and any new listing has to be MV3.
- **TypeScript** for the extension's JavaScript, so the content-script selectors and the message-passing layer are type-checked.
- **Vite** with a manifest-aware plugin as the build tool, so the source maps and the unpacked extension layout stay correct.
- **chrome.storage.local** for the most-recent-transfer record, which keeps the local-first promise without a remote endpoint.
- **Playwright** as a dev-time selector-testing harness, so a site redesign can be detected before a user reports it.
- **Vitest** for unit tests on the slice-counting and the message-shape logic, which is the part that does not depend on a live provider.

## Architecture

The extension is a Manifest V3 package with a service worker for the click handler, a popup that asks for the slice size, and a content script per provider. The service worker listens for the extension-icon click, opens the popup, and dispatches the chosen slice-size action to the active tab's content script via chrome.tabs messaging.

The source-side content script runs on the three provider origins only. It walks the rendered DOM, identifies the messages, and returns them as a structured array. The selector strategy is centralised so a redesign only requires updating one selector module per provider, and the strategy is versioned so a selector that breaks can be rolled back without a full release.

The destination-side content script runs on the same three origins. It identifies the destination provider, locates the composer element, and inserts the chosen slice as text, leaving the user to click send. The insertion strategy is provider-specific, because each provider's composer has a different contenteditable shape.

The popup collects the slice-size choice — full conversation, last 10 messages or last 20 — and the destination provider. It does not collect or display conversation content, because the privacy posture says the extension does not see content beyond what the active tab's content script handles. The most-recent-transfer record is stored in chrome.storage.local with a short TTL, and contains only metadata about the transfer (source, destination, slice size) rather than the conversation text itself.

A dev-time selector harness runs Playwright against the three providers and asserts that the selector modules still extract a non-empty message list. The harness runs against the live sites on a schedule, so a redesign is detected before users report it.

## Milestones

1. **M1 — Extension skeleton** — Manifest V3 package, TypeScript build with Vite, service-worker click handler, popup stub.
2. **M2 — Source-side extraction** — one provider's content script extracting messages, with the slice-counting logic and a passing selector test.
3. **M3 — Destination-side insertion** — the provider's composer being identified and the chosen slice inserted without auto-send.
4. **M4 — Three-provider coverage** — ChatGPT, Claude and Gemini each with source and destination content scripts and selector modules.
5. **M5 — Popup flow** — slice-size choice (full / last 10 / last 20), destination choice, and the messaging between popup, service worker and content scripts.
6. **M6 — Selector harness** — Playwright-driven selector tests for each provider, run on a schedule.
7. **M7 — Store listings** — packaged extension submitted to the Chrome Web Store and Edge Add-ons, with the listings that the source page says will go live when review finishes.
8. **M8 — Privacy audit** — CI that asserts no remote endpoints are contacted by the extension at runtime and that host permissions stay at the three providers.

## Risks

- **Selector drift** — every provider redesign is a known failure mode; the schedule-driven harness is the mitigation, and a missed update is a silent data-loss bug.
- **Host-permission creep** — a single extra origin would break the privacy posture and the page's promise; the CI check has to be strict.
- **Slice-count mismatch** — "last 10" means the user's last 10, not the provider's last 10 visible message; the slice-counting logic has to handle hidden and grouped messages.
- **Manifest V3 service-worker constraints** — MV3 service workers can be torn down between events; the selector strategy and the message-passing layer have to survive that.
- **Prompt-injection in the source page** — a conversation the user copies may itself contain adversarial text that the destination provider would treat as instructions; the extension does not neutralise this and the user has to be told.
- **Store-review delay** — the public listing is gated on Chrome Web Store and Edge Add-ons review, which can take days to weeks; the deployment story is gated on external timing.
- **Manifest V3 remote-code restrictions** — any temptation to load a third-party script from the content script would fail MV3 review; the build must be self-contained.
