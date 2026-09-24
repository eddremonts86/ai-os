# SPEC.md — Notula for Google Meet

## Problem

Hi HN. I built this because quite often all these tools that transcribe save it somewhere in their own storage, so you have to pay for it. And if not the payment, another bigger issue is that this storage is in another place, where I need to copy from. And of course I don&#x27;t want to pay for storage that I&#x27;m not going to use, because I have my own place for such documents and transcriptions.<p>Once I met a nice tool that just records the transcription and does nothing else. You copy the transcription and paste it wherever you want. But at some point it stopped working properly.<p>Then there&#x27;s another issue. I used it a lot, but it requires you to keep the transcription open all the time, and it takes up space on the Google Meet page. For instance, if someone shares their screen, it&#x27;s smaller because of the transcription, which I only needed for the extension.<p>So I wanted to make it better, and that&#x27;s why I built it. On transcription it does the same, it just saves locally, but it doesn&#x27;t keep the transcription open at all, so you get the full space of your browser in Google Meet. You can copy the transcription to your clipboard and paste it in your place, or download the MD file, whatever you want.<p>And just recently I updated it and made it save to my git repository automatically. You pick the repository, you pick the folder, and it is saved there. That part goes via Notula, my desktop editor, but I don&#x27;t want to force on you some extra tools that I don&#x27;t need myself, so everything else works without it.<p>It used to be called MeetScribe, and two identifiers inside it still say meetscribe. They have to. They are how two content scripts find each other, and renaming them breaks every Meet tab that is open at the moment the update lands.<p>I would love it if you would kick the tires and let me know what you think of it. Happy meetings!<p>---<p>Website: <a href="https:&#x2F;&#x2F;notula.org&#x2F;meet&#x2F;" rel="nofollow">https:&#x2F;&#x2F;notula.org&#x2F;meet&#x2F;</a><p>Chrome Web Store: <a href="https:&#x2F;&#x2F;chromewebstore.google.com&#x2F;detail&#x2F;notula-for-google-meet&#x2F;egpbmkbnahnhjggmeemnkbblnpedcfkj" rel="nofollow">https:&#x2F;&#x2F;chromewebstore.google.com&#x2F;detail&#x2F;notula-for-google-m...</a><p>GitHub: <a href="https:&#x2F;&#x2F;github.com&#x2F;anetrebskii&#x2F;meetscribe" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;anetrebskii&#x2F;meetscribe</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49683993)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T13:48:27Z

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
