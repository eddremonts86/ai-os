# SPEC.md — Deiko – point at your screen, talk, and hand the brief to your agent

## Problem

macOS, 0.4.5, free to try: curl -fsSL <a href="https:&#x2F;&#x2F;deiko.app&#x2F;install.sh" rel="nofollow">https:&#x2F;&#x2F;deiko.app&#x2F;install.sh</a> | sh<p>I kept losing time explaining my own screen to Claude Code. Screenshot, crop,
paste, then type three paragraphs describing which dropdown I meant. The
context was all right in front of me and I was transcribing it by hand.<p>Deiko: double-tap Right Option, and it listens while following your cursor.
Hover what you mean while you talk — &quot;this dropdown closes when I scroll, keep
it open&quot;. Each thing you point at gets cropped and labelled. Tap Option to
stop, and you get a brief plus the screenshots, which you drag into whatever
agent you use. Works with two languages mixed in one sentence, which is how I
actually talk.<p>Screenshots and briefs never leave the Mac. Audio is transcribed then deleted;
first 30 minutes use cloud transcription, after that it runs on-device forever.<p>Things you should know before installing:<p>- It&#x27;s signed with a self-signed cert, not an Apple Developer ID, because I
  haven&#x27;t paid the $99. That&#x27;s why there&#x27;s an install script: macOS quarantines
  the bundle, and the GUI &quot;Open Anyway&quot; misses the Node runtime nested inside,
  which then fails silently minutes later mid-transcription. The script is one
  `xattr -dr com.apple.quarantine` and a copy to &#x2F;Applications. Read it first,
  it&#x27;s short.
- The bundle is ~110MB, mostly that Node runtime.
- macOS 14+, Apple Silicon and Intel.
- Pro ($3.99&#x2F;mo) adds cloud transcription back and your own Sarvam&#x2F;Groq key.
  Everything else is free and always will be.<p>The thing I&#x27;m least sure about is whether pointing-while-talking actually beats
just typing for people who aren&#x27;t me. If you try it and it felt slower, I&#x27;d
genuinely like to hear that.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49731089)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T18:34:33Z

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
