# SPEC.md — Disconnect – an iOS app blocker only a friend can unlock

## Problem

Disconnect is an app blocker for iOS that lets you put a friend in control of granting you access to blocked apps.<p>Like many, I&#x27;ve personally struggled a lot with phone and social media addiction over the years. I tried the usual tactics to get over this addiction -- deleting the apps (they make their way back in somehow), deactivating my accounts (they get reactivated again somehow), even tried some existing screen time blocking apps as well. Nothing worked. The final thing that worked for me was the following:<p>1- I changed my passwords to something random, on all the social media apps I wanted to get rid of. Didn&#x27;t note down these passwords anywhere.<p>2- Changed the password recovery routes for these accounts to email and phone number of my partner&#x27;s. Gave them the explicit instruction not to hand over the reset code when I ask, unless I&#x27;ve a compelling reason.<p>3- Signed out completely.<p>The above worked surprisingly well. Knowing I can&#x27;t access the apps myself and have to go through convincing my partner to let me back in, was a significant hurdle to get over.<p>Disconnect embodies the same mechanism. It lets you pair up with a friend. When you put a hard block on apps, you can only get access to them if your buddy grants you access. You can send an access request from within the Disconnect app.<p>The app uses system Screen Time APIs on iOS, and all your app usage analytics stays on your device. Your buddy doesn&#x27;t get any analytics either, beyond the name of the block rule you choose at time of rule creation.<p>App is free to download, with a pro tier for unlimited rules and unlimited buddies.<p>Would love your feedback.<p>A short demo here: <a href="https:&#x2F;&#x2F;youtu.be&#x2F;zzybd_qYWcE" rel="nofollow">https:&#x2F;&#x2F;youtu.be&#x2F;zzybd_qYWcE</a><p>More info: <a href="https:&#x2F;&#x2F;disconnectapp.co" rel="nofollow">https:&#x2F;&#x2F;disconnectapp.co</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49711466)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T12:22:43Z

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
