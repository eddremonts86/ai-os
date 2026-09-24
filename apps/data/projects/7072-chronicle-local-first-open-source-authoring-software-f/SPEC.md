# SPEC.md — Chronicle – Local-first, open-source authoring software for writers

## Problem

About a year and a half ago I started my writing journey by beginning to work on my first novella. During this time, I felt the need for different tools, like a timeline editor, a character sheet and so on, features that were not available on normal text editors. Later I discovered that I needed an Epub exporter, cover designer and more. I also wanted something AI-free, something private. It is important for me as a debut author to know that it is my writing, not an AI&#x27;s and that it wont be used for AI training. So most cloud services were an instant &quot;NO&quot; from me.<p>Being a software engineer by day, I decided that instead of paying hundreds of dollars for the needed tools, I could just make them the way I wanted them to be. Eventually I decided to bundle them together, polish them and add more feature. So, this is how Chronicle was born.<p>Chronicle is a complete writing and authoring tool for writers. It offers features that other companies charge tens or even hundreds of dollars, while delivering (in my opinion) and inferior experience.<p>I also wanted Chronicle to work fully offline, not use Gen AI in the writing process, and provide a privacy-first experience.<p>Among the features are:
- full-featured text editor with comments supports
- timeline editor
- character sheet
- locations codex
- Epub reader and exporter (including editing Epub Metadata)
- Cover designer
- Fully-local TTS using KokoroJS Text-to-Speech for help in proofreading
- Themes
- Private Cloud-storage support with WebDAV
- and many more<p>And I made Chronicle not only free, but fully open-source. You can check the source code on Github, launch the online editor which supports almost all features, or download the app for both Windows and MacOS.<p>I would love to hear feedback.<p>Disclaimer: In the development process I did use AI. The app is NOT made entirely by AI, but being a back-end developer mostly, I did use AI for parts related to the user interface, themes, fix some bugs and to bridge knowledge gaps I had.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49708069)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T05:23:08Z

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
