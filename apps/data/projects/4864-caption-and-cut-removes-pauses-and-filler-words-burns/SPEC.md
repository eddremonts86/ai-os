# SPEC.md — Caption and Cut removes pauses and filler words, burns in captions

## Problem

I&#x27;m owner of a software agency. I try to make content for getting more clients, but i&#x27;m lazy. I have ideas but when i build my idea, write a script, get a good place for filming, make equipment ready, filming in small bits, reading everything on the way and talking again, i get frustrated af. Then afterwards i have to cut every pause, make the captions, export, upload. Ugh!<p>I built a webapp which makes it more easy. I just talk to the camera and a server &#x2F; or the browser locally (depends on preference) does the cutting of pauses, eliminates fillers, sees what i mistakenly doubled or mispoke and gives me the captions. I can also directly publish it into Buffer with an api key. So now i film (also wrote an app which shows me a teleprompter and films me), then upload it to captionandcut.app and just click it into the queue to Buffer.<p>It was tricky at first with all the removing and silencing, i did start with a second worker machine at home for the heavy work, but in the end it is simple:<p>1) the audio goes to whisper and comes back as words with timings.<p>2) i do NOT cut on those timings. they look exact and they are not, in my tests up to 0.9s off, and that is exactly why some tools cut the last letter off a word. instead i measure where there is really sound in the original file and put the cuts there. the transcript is only used for the caption text.<p>3) then everything that should go gets marked: the pauses, the fillers, the doubled takes. i see all of it struck through before anything is rendered and can click any word or any pause back in. that part matters the most to me. a tool that silently throws away a real sentence has ruined the video and you only hear it afterwards.<p>The rendering runs in the browser now (WebCodecs), so for the cut itself the video does not leave the machine. Only the audio goes out for the transcript, that part is not local and i would rather say it than pretend.<p>3 Videos are for free, its a shot if somebody needs it and i really appreciate good and bad feedback so i know early if its only for me to use. Thanks for the read!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49552511)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T16:18:18Z

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
