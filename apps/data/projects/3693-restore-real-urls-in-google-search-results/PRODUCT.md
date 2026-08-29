---
id: "3693"
slug: restore-real-urls-in-google-search-results
title: Restore real URLs in Google Search results
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484118"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [JavaScript browser extension (Chrome MV3, Edge, Firefox WebExtension, Safari), Manifest V3 service worker, TypeScript]
---
# Restore real URLs in Google Search results

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A power Google Search user gets back the link they expect to see: when a result points to `example.com/guides/clean-links`, the hover preview, the copied URL, and the middle-click target all show that real destination instead of `google.com/goto?url=…`. The extension is a single click to install, free, no account, no telemetry, runs in the browser on Chrome, Edge, Firefox, and Safari — and the only network request it makes is to Google's own `/goto` endpoint to resolve.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Researcher / journalist / analyst | Copies search-result links into notes, docs, citation managers; needs the link to be the real destination, not Google's redirect wrapper. |
| SEO / content analyst | Scrapes or exports Google results; `google.com/goto?…` URLs break downstream tools that expect real destination URLs. |
| Power Google Search user | Hover-previewing 10 results and pasting the most useful one wants to see where it actually goes before clicking. |
| Privacy-conscious user | Prefers the visible link to reveal the destination at a glance rather than relying on a redirect they have to trust. |

## Jobs To Be Done

1. **Functional job** — Copy a Google Search result link and get the real destination URL on the clipboard.
2. **Emotional job** — Stop second-guessing whether the link you just copied is a Google redirect or the real page, and stop having to "click first, copy from the address bar" to be sure.
3. **Social job** — Share a link with a colleague that opens to the page it claims to open to, without the recipient seeing a Google redirect.

## Success Metrics

- **Activation:** ≥ 60% of Chrome Web Store installers click the toolbar button or trigger at least one rewritten link within their first session.
- **Coverage:** ≥ 95% of `google.com/goto?url=…` anchors on a live Google Search results page are rewritten to their real destination within 250 ms of page load.
- **Retention:** ≥ 30% weekly active installers 4 weeks after install; ≥ 20% 12 weeks after.
- **Cross-browser share:** Firefox and Safari downloads combined account for ≥ 25% of installs by month 3, validating the multi-browser claim.
- **Support signal:** GitHub Issues / store reviews ratio of "works as advertised" stays ≥ 90% of submissions.

## Pricing & Monetization

Free, no monetization in v1. The extension is a small utility with no server cost beyond what the user's browser already does; a paid tier would add no value the user would pay for. Optional future offerings (a "pro" build with multi-engine coverage beyond Google) are out of scope until user demand validates them. The author has not stated a willingness-to-pay figure on the Show HN thread.

## Competitive Landscape

- **Manual copy-after-click** — what power users do today when the link looks suspicious. Reliable, but breaks the "scan results before clicking" workflow and adds a click per result.
- **Unshorten services / web dashboards (e.g., unfurlers)** — work for one link at a time outside the search page; do not integrate into the Search Results Page UX and require round-tripping through a third-party server, which is the opposite of the no-middleman posture.
- **Redirect-tracer browser tools (e.g., Redirect Path)** — show the redirect chain in DevTools; do not rewrite the link the user copies, so the clipboard still contains the `google.com/goto?url=…` form.
- **Custom userscripts (Tampermonkey / Greasemonkey)** — what motivated users paste together themselves. Brittle, single-browser, no signed distribution, and no cross-browser install path.
- **DuckDuckGo / Bing / Brave Search** — competing search engines that do not currently apply the same redirect. Not a direct substitute for users who need Google results, but a valid alternative for users who can switch.

## Risks & Open Questions

- [ ] Confirm the rewrite keeps working after Google's MV3 service-worker model swaps the content script in/out; regression risk on tab-suspend and navigation events.
- [ ] Validate the Firefox signing flow and the Safari notarization flow end-to-end before the v1.0 release; both have historically been gating steps for new publishers.
- [ ] Decide whether to extend coverage to other engines (DuckDuckGo, Bing) once they adopt the same `goto`-style redirect, or stay Google-only and document the limit.
- [ ] Monitor Google's response: if Google adds a no-rewrite header or rate-limits the `/goto` resolution requests from extensions, the product needs a fallback (cached resolved-URL store, or a per-result preflight).
- [ ] Establish an automated test that loads a saved Google results HTML fixture and verifies rewrite coverage ≥ 95%, so a Google layout change cannot silently break the extension.
