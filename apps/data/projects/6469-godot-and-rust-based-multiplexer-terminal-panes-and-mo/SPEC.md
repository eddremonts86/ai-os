# SPEC.md — Godot and Rust based multiplexer (terminal panes and more)

## Problem

I wanted to share my side-project: gPTY. Started off as an idea to combine Godot and Rust in a project (two stacks I wanted to use more to learn more). The base inspiration was tmux - simply allow spawning multiple PTYs and then let the user grid&#x2F;tile them how they see fit.<p>But since we have the Godot game engine at our disposal, we can do some more interesting things, like add an FPS counter, and then subsequently also let people set their preferred FPS (the idea being the potential lower power draw if someone&#x27;s running it on a laptop on battery power vs someone running it on a desktop with high&#x2F;native FPS). In its current state, with me using Oh-my-Pi a lot, it&#x27;s evolving into a terminal workspace that can be used for orchestrating autonomous AI agents by way of dogfooding (or you know, just run herdr inside of gPTY - it&#x27;s the better orchestrator and just good software - I found it after starting this project, and now I&#x27;m finding myself using it a lot).<p>Also, we&#x27;re not limited to just terminals. Since we have Godot, we have basically a 2D (and potentially a 3D) canvas to play with. We can already full-screen the app for &quot;zen&quot; mode, no taskbar, no distractions. TUI die-hards can have their media or other apps entirely in terminal panes.<p>There has been some ground-work on getting Markdowns displayed properly done and I want to work on some kind of Wiki framework for local knowledge-management next, then create more types of panes (think native audio&#x2F;video on a media pane, that sits alongside your terminal pane), and some simple 2D games (like snake) to prototype. More details are on the ROADMAP.<p>What&#x27;s not easy (and probably won&#x27;t happen) is a browser. Having done a couple of (small) projects using Electron already, the temptation to ditch Godot&#x2F;Rust (learning curve) did come up (and also the ecosystem, the ease with which I could pull components and use web technologies - development velocity would definitely be higher there). But on the flipside, given all of the available LLM and AI support that we are privileged to have today, I figured the velocity should be comparable depending on how much I leaned on those. And lean I did.<p>Godot&#x2F;Rust seemed the better call to me and my intent anyway - going with the &#x27;it&#x27;s not just the end but the journey that matters&#x27; philosophy. So yes, there has been heavy use of LLMs &amp; AI to generate a lot of the code. But I do review and steer actively, not relying solely on vibes, and there&#x27;s a few bits here &amp; there that have been human authored.<p>There are definitely a lot of polish and QoL items that need to land to make the end user experience better, but in the meantime, let me know your thoughts and&#x2F;or concerns!<p>Repository: <a href="https:&#x2F;&#x2F;github.com&#x2F;godot-pty&#x2F;gpty" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;godot-pty&#x2F;gpty</a><p>Docs&#x2F;Blog: <a href="https:&#x2F;&#x2F;godot-pty.github.io&#x2F;gpty&#x2F;" rel="nofollow">https:&#x2F;&#x2F;godot-pty.github.io&#x2F;gpty&#x2F;</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49660676)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T16:03:05Z

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
