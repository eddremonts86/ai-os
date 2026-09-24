# SPEC.md — An agent-skill to generate preview, AppStore screenshots and campaigns

## Problem

If you are developing apps and paying 3rd party services just to generate promotional visuals or app store screenshots - stop doing it<p>I created an agent-skill which can do it for you with 3D device models (assets are CC-BY licensed) social cards&#x2F;cover, app&#x2F;play store screenshots, campaign 3d animating videos.<p>Followings are few themes you can generate<p>Themes    Total
App Store&#x2F;Play Store    10
Social Card    7
Screen Video    7
Device Video    9
Device Mockup    7
Behind the agent, it is using ThreeJS, headless Chromium, ffmpeg and nodejs to incorporate your precious contents.<p>Agent    Install
Claude Code (plugin)    claude plugin marketplace add imshaikot&#x2F;app-preview-craft-skill``claude plugin install app-preview-craft@app-preview-craft
Claude Code (skill folder)    git clone --depth 1 -b skill <a href="https:&#x2F;&#x2F;github.com&#x2F;imshaikot&#x2F;app-preview-craft-skill.git" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;imshaikot&#x2F;app-preview-craft-skill.git</a> ~&#x2F;.claude&#x2F;skills&#x2F;app-preview-craft
Codex · Cursor · GitHub Copilot · Gemini CLI · OpenCode · Amp · Goose    git clone --depth 1 -b skill <a href="https:&#x2F;&#x2F;github.com&#x2F;imshaikot&#x2F;app-preview-craft-skill.git" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;imshaikot&#x2F;app-preview-craft-skill.git</a> ~&#x2F;.agents&#x2F;skills&#x2F;app-preview-craft<p>already accepted by Anthropic community-plugin but not listed just yet<p>Prerequisite: Node.js (runs UI studio, edits screenshots, spawns other services), ffmpeg (video encoding) and Chromium (headless browser to render)<p>I have been using it myself but this is an initial version, improvements will follow.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49739407)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T11:47:51Z

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
