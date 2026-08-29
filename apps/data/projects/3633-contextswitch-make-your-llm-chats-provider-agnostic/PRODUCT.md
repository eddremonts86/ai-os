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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Chrome and Edge browser extension that copies a conversation from ChatGPT, Claude or Gemini and pastes it into another provider's composer, with three context-size options and a privacy posture that keeps the conversation inside the user's browser. The site's own statement — "ContextSwitch does not send conversations to a ContextSwitch server" — is the contract the value proposition rests on, and the local-first footer is the same claim restated.

The extension operates at the page level rather than against any provider's API, which is what allows the privacy posture to hold: there is no API key, no server-side proxy and no model-side hook. The cost of that choice is that site redesigns break selectors, which the page names as a known failure mode and invites users to report.

**One-liner:** ContextSwitch is a local-first Chrome and Edge extension that copies a chat from ChatGPT, Claude or Gemini into another provider's composer, with no ContextSwitch server in the path.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Multi-provider users | One-click move between ChatGPT, Claude and Gemini without retyping. |
| Privacy-first users | The page states no conversation leaves the browser; that is the product, not a footnote. |
| Provider-comparison users | Same prompt, two providers, no manual copy-paste loop. |
| Power users on rate-limited providers | Move a long thread off a provider whose window or quota is full. |
| Users who lost access to a provider | Take past threads somewhere they still pay, on their own machine. |
| Edge and Chrome users | An extension that lives one click away, not a bookmarklet or a script. |
| Users reporting broken selectors | The page invites that contact, so the report path is part of the value. |

## Jobs To Be Done

1. **Functional job** — Move a conversation from one provider to another in one click, with a chosen slice of the context.
2. **Functional job** — Stay inside the browser, with no server in the path the user did not choose.
3. **Functional job** — Open the destination provider's composer pre-filled, ready for the user to send.
4. **Functional job** — Operate without breaking every time a provider changes its layout.
5. **Emotional job** — Stop losing long threads to a single provider's pricing or policy change.
6. **Emotional job** — Trust a tool that publishes its privacy posture on its own landing page.
7. **Social job** — Compare providers on the same prompt without the manual copy-paste loop that comparison usually requires.

## Success Metrics

- **Successful transfer rate** — share of transfers where the chosen slice lands in the destination composer in the expected shape.
- **Selector breakage report rate** — broken-selector reports per thousand transfers, since redesigns are the named failure mode.
- **Network egress** — bytes leaving the browser through ContextSwitch-owned endpoints, expected to be zero by design.
- **Review pass on stores** — the public Chrome Web Store and Edge Add-ons listings, which gate distribution.
- **Manifest V3 compliance** — no remote code, no broad host permissions, no persistent background page beyond what MV3 allows.
- **Slice accuracy** — share of "last 10" and "last 20" selections that match the user's expectation of which messages count.
- **Send-action delegation** — share of transfers where the user, not the extension, clicks send, because that is the stated flow.

## Pricing & Monetization

The page names no price, no in-app purchase and no subscription; the project is a browser extension distributed through the Chrome Web Store and Edge Add-ons. The cost shape is the store's listing fee (a one-time developer registration on each store) plus the time of the maintainer. Any future paid offering would have to live alongside the free local-first extension rather than gate the privacy posture behind it.

## Competitive Landscape

- **Manual copy-paste** — the baseline the extension replaces; the value is the per-message fidelity and the one-click shape.
- **Provider-side export tools** — the official export buttons on each provider, which usually produce a download rather than a paste-into-another-provider flow.
- **General-purpose LLM API gateways** — services that proxy requests between providers; the source's positioning is that ContextSwitch sits at the page level rather than the API level, which is what keeps the privacy posture intact.
- **Bookmarklets and user scripts** — the lower-effort alternative; the extension is the version that survives a browser restart and has a proper store listing.

The page names no direct competitor, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Decide the selector-update cadence, since redesigns are the named failure mode and stale selectors silently lose content.
- [ ] Confirm the host-permission scope stays at the three named providers, because a single extra origin would violate the stated privacy posture.
- [ ] Establish the local-storage schema for the most-recent-transfer record, so re-run and audit work without leaking content into analytics.
- [ ] Decide how the extension reports a failed extraction without sending the failed content to any remote endpoint.
- [ ] Confirm the slice-counting logic for "last 10" and "last 20" matches user expectation across providers with different message grouping.
- [ ] Audit the destination-side insertion for safety against prompt-injection content that the source page might have included in the conversation.
- [ ] Verify Manifest V3 service-worker constraints do not silently disable background refresh of the selector strategy when the page is closed.
