# SPEC.md — Put an AI agent on a FaceTime audio/video call (open source, WebRTC)

## Problem

Hey everyone, Gary here from Chert (YC P26). We just open-sourced a framework for putting AI agents on FaceTime audio&#x2F;video calls: <a href="https:&#x2F;&#x2F;github.com&#x2F;cherthq&#x2F;chert-facetime-opensource" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;cherthq&#x2F;chert-facetime-opensource</a>. There&#x27;s also a managed inbound&#x2F;outbound API if you don&#x27;t want to run it yourself: <a href="https:&#x2F;&#x2F;www.trychert.com&#x2F;facetime">https:&#x2F;&#x2F;www.trychert.com&#x2F;facetime</a>.<p>Demo you can try right now: <a href="https:&#x2F;&#x2F;www.trychert.com&#x2F;facetime">https:&#x2F;&#x2F;www.trychert.com&#x2F;facetime</a>
Demo of the BYOR (Bring Your Own Room) feature: <a href="https:&#x2F;&#x2F;screen.studio&#x2F;share&#x2F;v0KPoTpm" rel="nofollow">https:&#x2F;&#x2F;screen.studio&#x2F;share&#x2F;v0KPoTpm</a><p>Why video, and why FaceTime specifically: An agent that can see and show unlocks things voice and text can’t, such as screen sharing, live coaching, or even just a more immersive experience. But every video agent tool today puts you into either an embedded widget or a Zoom&#x2F;Google Meet link. Those feel salesy and formal. There’s clearly a missing deployment layer.<p>FaceTime is the opposite. It is the most personal, trusted, and familiar video channel millions of people already use. For WebRTC and video agents to truly become as widespread as VoIP, they need to meet people where they already are.<p>Why it’s hard: FaceTime not only doesn’t have an open API, but it&#x27;s not even scriptable with AppleScript. We solved this by driving the FaceTime UI programmatically and routing the agent&#x27;s audio and video through physical loopback machines. It&#x27;s an early prototype, but we think it&#x27;s the right bet. Video agents and WebRTC will eventually replace VoIP as the dominant channel of human-agent interaction, and when that happens, they have to meet people where they&#x27;re already most comfortable.<p>Please try it out and share any feedback or anything interesting you build on FaceTime. All comments welcome!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49728749)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T15:41:02Z

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
