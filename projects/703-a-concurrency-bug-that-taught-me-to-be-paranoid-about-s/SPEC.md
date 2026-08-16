---
id: "703"
slug: a-concurrency-bug-that-taught-me-to-be-paranoid-about-s
title: A concurrency bug that taught me to be paranoid about shared state in real-time systems
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vq0gkr/a_concurrency_bug_that_taught_me_to_be_paranoid/"
category: saas
date: "2026-08-16"
---
# A concurrency bug that taught me to be paranoid about shared state in real-time systems

## Problem
 Sharing this because it's a good example of a bug class that's easy to introduce and hard to catch until you have a real concurrent load. I run Flowagenz, a small dev studio, and I'm building a real-time voice AI pipeline for one of our products (STT → LLM → TTS, streaming). One of the TTS providers I use as a fallback has a quirk: if speech synthesis runs slow, I had logic that would automatically shorten the reply length for the rest of that interaction, reasonable UX call on its own, keep the conversation snappy if the backend is struggling. The bug: the flag controlling this was a plain module-level variable in Python. Not scoped to a session, not scoped to a request, just a single shared boolean for the entire running process. In a single-user test environment, this is completely invisible. You never have two things happening at once, so you never notice the flag is global instead of per-call. The moment you have two or more real concurrent users, though, it becomes a landmine: one user's bad network moment flips the flag, and every other concurrent conversation on the platform silently degrades, shorter replies, worse experience, for users who did nothing wrong and have no idea why. And it doesn't reset until the process restarts. Found it during a deliberate concurrency-focused code review, not from a bug report, which is honestly a little unsettling, since it means it could easily have shipped and just looked like "occasionally the AI gives weirdly short answers" with no obvious cause, the worst kind of bug to debug from user reports alone. Fix was straightforward once identified: use Python's contextvars.ContextVar instead of a module-level variable, so the flag is scoped per async task instead of shared globally. A few lines of change, but it required actually going looking for this class of bug rather than waiting to trip over it. The broader lesson I took from this: anything you build and test as a single user, alone, on your own machine, will hide global-state bugs by default, because there's never a second concurrent "you" to expose the collision. If you're building anything with real concurrency in its future, it's worth an explicit pass specifically looking for module-level and global variables that should be scoped narrower, before real traffic finds them for you. Curious if others have run into this class of bug, shared state that only misbehaves under concurrent load and stays invisible until then. What's your go-to way of catching these before they ship? submitted by /u/flowagenz [link] [comments]

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
