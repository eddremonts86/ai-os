# SPEC.md — Malinois – Open-Source iOS Unattended-Device Tamper Detection

## Problem

Built for evil-maid&#x2F;insider-access scenarios where your device passcode may be known.<p>Malinois’ singular objective is to guarantee, to the greatest extent possible, that you either return to an unattended device in the same state you left it, or know that unauthorized access was attempted (or succeeded).<p>With Guided Access on, Side Button option off, and iOS set to ask before new wired accessories connect, there is no viable scenario (short of an already compromised device) where a tamper can occur without an indication.<p>Designed around the iOS Guided Access feature, which is novel in the space as far as I can tell.  This solves the iOS backgrounding issue that relegated the Guardian Project’s now-defunct Haven app to Android, and though the app’s goal is different, a lot of the same functionality exists.<p>My goal with the post is feedback and hopefully some small, interested user base covering scenarios different from mine: This is a personal project, I am not an iOS developer, and the code is 100% Claude. My workflow is basically build with Claude, review and red-team with GPT&#x2F;Deepseek&#x2F;etc., then device testing with personal devices, and that can only take me so far.<p>I think the concept and GA differentiating it from existing apps is real, but I also think the models are a bit sycophantic when it comes to discussing that, and would love to have people smarter than me poking holes in my premises and assumptions, not to mention the code.<p>Guided Access: <a href="https:&#x2F;&#x2F;support.apple.com&#x2F;en-us&#x2F;111795" rel="nofollow">https:&#x2F;&#x2F;support.apple.com&#x2F;en-us&#x2F;111795</a><p>Haven: <a href="https:&#x2F;&#x2F;guardianproject.info&#x2F;apps&#x2F;org.havenapp.main&#x2F;" rel="nofollow">https:&#x2F;&#x2F;guardianproject.info&#x2F;apps&#x2F;org.havenapp.main&#x2F;</a><p>App Store: <a href="https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;malinois-device-anti-tampering&#x2F;id6797636246">https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;malinois-device-anti-tampering...</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49609648)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T12:49:26Z

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
