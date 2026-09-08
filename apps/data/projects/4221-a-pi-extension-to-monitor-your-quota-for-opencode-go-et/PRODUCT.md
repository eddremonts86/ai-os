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

## Value Proposition

A Pi extension that surfaces the user's remaining quota for OpenCode GO and CommandCode across the 5-hour and the monthly reset windows, inside the Pi editor, so the user never has to switch to a web console to check how much quota is left. The extension polls the provider on a configurable cadence, warns when either window crosses a user-set threshold, and opens the provider's full quota page on click.

The extension is read-only: it surfaces quota, it does not change the user's plan, billing, or provider state. The credential lives in the Pi keychain or the platform-native secret store, never in the extension's own storage. The two readouts are the 5-hour and the monthly windows; a window the provider does not expose is a coverage gap, not a bug.

**One-liner:** The quota readout Pi users on OpenCode GO and CommandCode open the web console to find, in their editor.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Pi users on OpenCode GO | Need the 5-hour and monthly quota readouts visible without leaving the editor. |
| Pi users on CommandCode | Same need on a different tier, same extension. |
| Heavy Pi users | Want a heads-up before the next call fails mid-task. |
| Teams on shared Pi installs | Want each seat's quota surfaced in one place. |
| Engineers comparing tiers | Want the 5-hour and monthly readouts side by side. |

## Jobs To Be Done

1. **Functional job** — Open Pi and see the remaining quota for the 5-hour and the monthly windows without switching apps.
2. **Functional job** — Set a warning threshold and have the extension flag when either window drops below it.
3. **Functional job** — Click the readout to land on the provider's full quota page for the per-window breakdown.
4. **Functional job** — Switch between OpenCode GO and CommandCode without reconfiguring the extension beyond the provider setting.
5. **Emotional job** — Stop the feeling of being surprised by a quota wall mid-session because the readouts were nowhere in the editor.
6. **Social job** — Be the team whose Pi setup has the quota readout visible to every seat, so nobody has to ask "how much is left?" in chat.

## Success Metrics

- **Readout coverage** — share of sessions where both the 5-hour and the monthly readouts are visible inside the editor. A session with one of the two missing is a coverage gap.
- **Warning accuracy** — share of threshold crossings that produce a visible warning within one poll of the threshold being crossed. A missed warning is a missed signal.
- **Click-through rate** — share of warning events followed by a click-through to the provider's full quota page. A low rate means the readout answered the user's question without the deeper dive.
- **Polling overhead** — share of polls that complete within the provider's rate-limit budget. A poll that gets rate-limited is a setup failure.
- **Install success** — share of installs that complete without the user re-entering their provider credential. A re-entry is a keychain gap.
- **Provider switching** — share of users who switch between OpenCode GO and CommandCode in the settings panel without re-authenticating. A re-authentication is a settings gap.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The extension is a Pi add-on for two provider tiers; the price surface belongs to the providers, not the extension. Any future monetization has to be measured against the readout coverage and the warning accuracy, because those are the metrics the source ties to the extension's value.

## Competitive Landscape

- **The provider's web console** — authoritative, but requires the user to leave the editor to check quota.
- **Generic Pi quota plugins** — surface a single number, do not split the 5-hour and the monthly windows the way OpenCode GO and CommandCode need.
- **Status-line snippets** — show the last call's usage, not the window-level quota the user is budgeting against.
- **Manual polling** — the user opens the provider's page, reads the number, returns to the editor; the cadence is whatever the user remembers, not what the quota window requires.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the polling cadence the provider's rate limiter accepts. The default is conservative; the open question is whether a slower cadence still gives the user a useful warning window.
- [ ] Define the warning threshold's default. A threshold that is too high warns too often; a threshold that is too low warns too late. The source names no default; the open question is whether the extension ships with a default or requires the user to set one.
- [ ] Validate the click-through target. The extension opens the provider's quota page; the open question is whether the URL is the same for the 5-hour and the monthly windows, or whether the extension has to pick the right one.
- [ ] Decide how the extension handles a credential that has expired. The provider's quota API rejects the call; the open question is whether the extension prompts for re-auth or surfaces a clear "re-auth needed" state.
- [ ] Establish the behaviour when a window the provider exposes changes. The 5-hour and monthly windows are the source's claim; the open question is whether a new window (e.g. a daily cap) becomes a coverage gap or a new readout.
- [ ] Confirm the extension does not store the credential outside the Pi keychain. The source's claim is platform-native secret storage; the open question is whether Pi's secret API is the right boundary or whether the extension should use the OS keychain directly.
- [ ] Define the policy on a provider outage. The extension polls; the provider returns an error; the open question is whether the extension surfaces the error or silently shows the last known value.