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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4221-a-pi-extension-to-monitor-your-quota-for-opencode-go-et/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Pi extension scaffold: manifest, entry point, status-bar widget and sidebar item registrations, Pi keychain integration.
- [ ] Implement the provider-aware quota poller: the OpenCode GO endpoint, the CommandCode endpoint, the configurable cadence, the cache, the rate-limit guard.
- [ ] Build the renderer: the status-bar widget with the smaller of the two remaining quotas as a percentage, the sidebar item with both the 5-hour and the monthly readouts and a click-through to the provider's full quota page.
- [ ] Implement the warning system: the threshold check, the status-bar colour change when either window crosses the user-set threshold, the sidebar icon, the no-modal guarantee.
- [ ] Build the settings panel: the polling cadence, the warning threshold, the provider selection (OpenCode GO or CommandCode), the click-through URL override.
- [ ] Enforce the credential boundary: the credential lives in the Pi keychain, the extension never persists it, the re-authentication flow goes through Pi's keychain API.
- [ ] Add the OpenCode GO to CommandCode switch in the settings panel that does not require re-authentication.
- [ ] Write the README that documents the install path, the two windows (5-hour and monthly), the warning behaviour, the settings panel, and the credential boundary.
- [ ] Run an end-to-end test on a representative Pi session: both readouts visible, the warning fires when the threshold is crossed, the click-through opens the provider's quota page, the provider switch works without re-authentication, the credential stays in the keychain.

## Phase 2: Deploy

- [ ] Publish the extension to Pi's extension registry
- [ ] Document the install path and the credential boundary in the README so users understand the keychain integration
- [ ] Verify in production