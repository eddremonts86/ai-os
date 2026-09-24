# SPEC.md — Sparrow-2 – Noise cancellation isn't designed for conversational AI

## Problem

Hey there, I’m Brian. I&#x27;ve been shipping conversational models at Tavus for the past two years. I want to tell you about our latest audio-understanding&#x2F;turn-taking model: Sparrow-2! It’s a new category of model and a unique new approach to conversational flow understanding.<p>Earlier this year we launched Sparrow-1, (at the time) our SoTA turn-taking model. Since our Sparrow-1 launch, I’ve spent a lot of time listening to humans talking and trying to really understand how people know when to talk, when to listen, and when to wait. I’ve also been hunting down failure modes of the current SoTA models. And while Sparrow-1 is great, there are some failure patterns I see. We tried solving the problems with existing approaches, but solving one problem only created another.<p>Current turn-taking models (like Sparrow-1) use noise cancellation to strip background sound, leaving only basic prosody and phonetic word cues to manage turns. Non-transcribable audio such as breathing, sighs, and environmental sounds provides critical context that humans use to hold or signal turn changes. This is because these models are primarily focused on verbal activity. Treating non-verbal audio as background noise discards vital conversational data, destroying the natural flow of dialogue.<p>Now, with Sparrow-2, instead of modelling just the primary speaker’s verbal audio, we’ve trained a model with access to all the sounds and let it decide what matters and what does not when it comes to conversational flow. Our new model continuously streams in audio and is able to understand semantics, prosody, timing, speaker identity, sighs, breaths, back-channels, interruptions, background speech, and unintelligible audio with the goal of understanding what the agent should do given the state of the audio. Sparrow-2 recently ranked #1 on Sesame’s new Turnbench, but that’s only part of the equation when it comes to good conversation flow.<p>Turn-taking is good for timing, but models should provide more information downstream especially in situations where noise impacts conversational quality. Sparrow-2 fits into our larger model family and is semi-duplex. For example if the user is in a room that’s too noisy, now the bot can ask the user to move to a quieter space. It also considers the timing of sound in relation to the AI speech as well as the user’s. This helps it to disentangle normal speech from interruptions and back-channels.<p>Another added benefit of our approach to Sparrow-2 is to finally crack the cocktail party problem: how to have human-like conversations 1:1 in noisy environments, without losing the signals we rely upon for conversational flow. By allowing all sound to be learned, the model naturally learns to focus on what matters and transcends the rest. Noise understanding lets voice AI filter out background speech and ambient chaos, whether it&#x27;s a kiosk in a noisy lobby, a shop assistant on a busy floor, or an interviewee in a cafe. When noise overwhelms the audio, the AI behaves like a human: it simply asks you to speak up, move, or swap mics.<p>I’d love for you guys to give it a try and let me know what you think and feel. You can try it here: <a href="https:&#x2F;&#x2F;sparrow2.tavuslabs.org&#x2F;" rel="nofollow">https:&#x2F;&#x2F;sparrow2.tavuslabs.org&#x2F;</a><p>I also wrote up some technical details about the model architecture here: <a href="https:&#x2F;&#x2F;www.tavus.io&#x2F;blog&#x2F;sparrow-2">https:&#x2F;&#x2F;www.tavus.io&#x2F;blog&#x2F;sparrow-2</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49612459)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T16:16:58Z

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
