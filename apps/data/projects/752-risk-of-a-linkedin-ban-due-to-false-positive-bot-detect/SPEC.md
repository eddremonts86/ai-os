---
id: "752"
slug: risk-of-a-linkedin-ban-due-to-false-positive-bot-detect
title: "Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that warns about suspicious activity to avoid losing 11,500 followers."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/p1ecr48041-risk-of-a-linkedin-ban-due-to-false-posi"
category: marketing
date: "2026-03-26"
tags: [Marketing, Security, Productivity, AI, Other]
country: UK
tech: [TypeScript browser extension (Chrome MV3, Edge, Firefox), Manifest V3, LinkedIn DOM observers, IndexedDB local storage, optional cloud sync with end-to-end encryption]
---
# Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that warns about suspicious activity to avoid losing 11,500 followers.

## Problem

A PR / public-relations community builder (Olivia Robinson, UK) has spent several years growing a LinkedIn community to 11,500 followers; her growth strategy is frequent, manual commenting on relevant posts. LinkedIn's anti-automation system flagged her as anomalous and applied a 168-hour lock. The support form politely replied that the lock was lifted, but stated that the system had detected "anomalous activity" and could not reverse it — only wait — and warned that the next lock could be permanent. The pattern is the trap: the manual activity that actually grows her account is exactly the activity that looks bot-like to LinkedIn's classifier, and there is no warning system inside LinkedIn itself. She has tried "vibecoding" the warning tool with Claude / Cursor and could not get anything decent working. She is open to a subscription or one-time fee for a tool that analyzes her activity, warns her when her behavior starts looking suspicious, helps her stay within the platform's unwritten limits, and lets her act safely without losing engagement.

## Objective

Ship a browser extension that observes the user's LinkedIn activity in real time, scores each session against the patterns LinkedIn's classifier historically flags (frequency, regularity, action diversity, session shape), and surfaces a "risk level" indicator that turns yellow as the user approaches the unwritten thresholds and red when a session is likely to trigger a lock — so the user can self-regulate before LinkedIn's system does. The extension never automates any LinkedIn action; it is a personal radar, not a bot.

## Target Users

- Primary: PR / community builders and growth-focused LinkedIn users who rely on frequent, manual engagement (comments, posts, profile views, connection requests) and are one false-positive away from losing their account.
- Secondary: founders, salespeople, recruiters, and thought-leadership creators who run heavy manual LinkedIn workflows and have been previously locked or warned.
- Tertiary: agencies running multiple LinkedIn profiles on behalf of clients (separate workspaces per account, end-to-end encrypted sync).

## MVP Scope

- Browser extension (Chrome MV3 first, then Edge + Firefox) that injects a content script on `linkedin.com/feed`, `linkedin.com/notifications`, `linkedin.com/messaging`, and `linkedin.com/search`.
- Local activity tracker: per-day counters for comments, posts, profile views, connection requests, searches, message sends; per-session duration and action diversity.
- Risk engine: a deterministic scorer (no LLM call required for the headline indicator) that compares the local counters against a curated list of patterns historically flagged by LinkedIn's anti-automation system (sourced from public post-mortems and the user's own lock history).
- HUD overlay: a small indicator in the LinkedIn top bar that turns green → yellow → red as the user approaches the unwritten thresholds; click-to-expand shows which counters triggered the warning.
- Daily summary: at the end of each LinkedIn session, an opt-in toast shows today's totals and the risk level reached.
- Optional end-to-end encrypted cloud sync (per-user passphrase, no server-side key) so the user can see their activity history across devices.
- No automation: the extension must not post, comment, connect, or message on the user's behalf; it only observes and warns.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The extension must not perform any automated action on LinkedIn — it is a warning system, not a tool that triggers the very flag it warns about.
- All activity data stays local by default; cloud sync is opt-in, end-to-end encrypted with a user-supplied passphrase, and the server never sees plaintext.
- LinkedIn's UI changes frequently; the activity tracker must use semantic selectors and MutationObserver, not hardcoded class names that LinkedIn ships and retires weekly.
- The risk engine's "patterns" must be sourced from public post-mortems and the user's opt-in feedback, not reverse-engineered LinkedIn proprietary detection — the tool must not be marketed as "we know how LinkedIn detects bots."
- The author has not stated a price; reasonable subscription tiers ($15–$30/month or $99–$199 one-time) are within the stated willingness to discuss.
- The extension must be uninstallable in one click and leave no LinkedIn-side footprint after uninstall (no scheduled posts, no pending connection requests queued).
