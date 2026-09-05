---
id: "4221"
slug: a-pi-extension-to-monitor-your-quota-for-opencode-go-et
title: A Pi extension to monitor your quota for OpenCode GO et CommandCode
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507224"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A Pi extension to monitor your quota for OpenCode GO et CommandCode

## Tech Stack

- **Pi's extension API** as the host runtime, matching the source's claim that the extension is a Pi add-on.
- **TypeScript** for the extension code, matching Pi's extension language.
- **Node fetch** for the provider's quota API calls, configured with the user's existing provider credential.
- **Pi's status-bar widget API** for the always-visible readout and **Pi's sidebar item API** for the per-window breakdown.
- **Pi keychain (or platform-native secret store)** as the credential boundary, matching the source's claim that the credential never leaves the editor's secret store.
- **A polling loop** with a configurable cadence and a default the provider's rate limiter accepts.
- **A settings panel** for the polling cadence, the warning threshold, and the provider (OpenCode GO or CommandCode).
- **A README** that documents the install path, the two windows, and the warning behaviour.

## Architecture

The extension is a single Pi module with three components: a quota poller, a renderer, and a settings panel. The poller calls the provider's quota API on a configurable cadence and caches the last response. The renderer reads the cache and updates the status-bar widget and the sidebar item. The settings panel writes the polling cadence, the warning threshold, and the provider selection to the extension's local config.

The quota poller is provider-aware. For OpenCode GO it calls the GO quota endpoint with the user's credential; for CommandCode it calls the CommandCode quota endpoint with the same credential (the source treats the credential as the user's, not the tier's). The poller never logs the credential and never persists it outside the Pi keychain.

The renderer has two surfaces: a status-bar widget that shows the smaller of the two remaining quotas as a percentage, and a sidebar item that shows both the 5-hour and the monthly readouts with a bar per window. The status-bar widget is the always-visible signal; the sidebar item is the per-window detail. A click on either opens the provider's full quota page in the browser.

The warning system reads the same data the renderer has and emits a visible state when either window crosses the user-set threshold. The warning is a status-bar colour change and a sidebar icon, not a modal — the source's claim is the user reads quota, not a popup. The polling cadence default is conservative enough to avoid the provider's rate limiter; the user can tighten it from the settings panel.

The credential lives in the Pi keychain, not in the extension's own storage. A re-authentication is a Pi keychain flow, not an extension flow. The extension never sees the raw credential beyond the one call to the provider's API.

## Milestones

1. **M1 — Pi extension scaffold** — the manifest, the entry point, the status-bar widget and sidebar item registrations.
2. **M2 — Quota poller** — the provider-aware polling loop, the cache, the rate-limit guard.
3. **M3 — Renderer** — the status-bar widget, the sidebar item, the click-through to the provider's full quota page.
4. **M4 — Warning system** — the threshold check, the status-bar colour change, the sidebar icon.
5. **M5 — Settings panel** — the polling cadence, the warning threshold, the provider selection.
6. **M6 — Credential boundary** — the Pi keychain integration, the re-authentication flow, the no-raw-credential enforcement.
7. **M7 — README** — the install path, the two windows, the warning behaviour, the settings panel.
8. **M8 — Provider switching** — the OpenCode GO to CommandCode switch in the settings panel without re-authentication.

## Risks

- **Polling rate-limited by the provider** — the cadence is too tight, the provider rejects the call. Mitigation: the default cadence is conservative; the settings panel exposes the limit; the renderer surfaces a clear "rate-limited" state.
- **Credential stored outside the keychain** — the extension or a transitive dependency leaks the credential to disk. Mitigation: the credential boundary is the Pi keychain only; the extension's code is reviewed for any persistence path; the README documents the boundary.
- **Warning threshold too sensitive** — the user is warned on every call, the warning becomes noise. Mitigation: the default threshold is conservative; the user can raise it from the settings panel.
- **Warning threshold too lax** — the user is warned too late, the quota wall hits mid-session. Mitigation: the threshold is configurable; the renderer surfaces the last-known value even when the poll fails.
- **Provider outage** — the quota API returns an error, the readouts go stale. Mitigation: the cache shows the last known value with a clear "stale" indicator; the settings panel exposes a manual refresh.
- **Window the extension does not support** — the provider adds a third window (e.g. daily cap). Mitigation: the extension surfaces the two known windows; the README names the coverage boundary; a new window is a new milestone, not a silent failure.
- **Click-through URL drift** — the provider changes the quota page URL. Mitigation: the click-through target is configurable from the settings panel; the default is the source's claimed URL; a drift is a config update, not a code update.