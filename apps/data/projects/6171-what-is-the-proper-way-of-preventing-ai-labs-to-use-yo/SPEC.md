# SPEC.md — What is the proper way of preventing AI labs to use your private data

## Problem

Recent discussions show that most people (including myself) are uneducated about the privacy policies of these AI companies.<p>People talk about the &quot;opt-out&quot; button in the settings and assume this will be enough. But even the text on the toggle implies this is not the full story.<p>ChatGPT: &quot;Improve the model for everyone&quot; (But are they free to use my data internally, i.e. &quot;not for everyone&quot;)<p>Claude: &quot;Help improve our AI models&quot; (When you click Learn More [0], they admit they may use them to train internal security models etc. if their security classifiers they run on every conversation flag us [with what criteria])<p>On top of that Codex and Claude Code have different security options and basically they can gain access to everything we have. What is an easy way to do a proper setup for consumer subscriptions.<p>[0] https:&#x2F;&#x2F;privacy.claude.com&#x2F;en&#x2F;articles&#x2F;12109829-how-do-i-change-my-model-improvement-privacy-settings

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49641616)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-10T11:00:16Z

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
