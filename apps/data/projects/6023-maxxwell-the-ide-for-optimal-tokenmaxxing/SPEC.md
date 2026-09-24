# SPEC.md — Maxxwell – The IDE for Optimal Tokenmaxxing

## Problem

Hi HN! I’m Michael, one of the founders of Rindler (YC S26). We built Maxxwell, which helps you manage a dozen coding-agent sessions’ progress, context, and blockers. This lets you spend more time with the actual high-leverage decisions (and gives you more confidence in stepping away from your computer).
We were originally building browser agents that log in to sites with a cached representation of the site to make for cheap and reliable repeat runs. There were a ton of hard challenges like mapping sites, getting past bot defenses, and handling credentialing and 2FA. There was a huge maintenance surface, and we were getting bogged down with technical deliverables.<p>We tried Cursor, Claude Code, Conductor, and even built an internal Devin. These tools either felt like they were too slow to iterate through large tasks, or became black boxes that I just couldn’t trust with their decisioning (you can’t just tell Devin to “improve the site mapper” and call it a day, unfortunately). So, we eventually settled on twelve Claude Code sessions running across our terminal panes. You get more control over the work being done while still multiplying your output volume, albeit at a cost: you.<p>Answering questions across twelve terminals is really draining. Also, a lot of the questions are niche code choices that crowd out the stuff actually worth your opinion. It’s not immediately obvious which sessions are making progress, which are stuck on something trivial, or which are getting lost in the sauce of making up new goals. Lastly, I just felt less like a conductor of agents and more like just the human medium connecting Claude to my workspace.<p>In the pursuit of touching grass again, we jerry-rigged our own system, which has an orchestrator agent focused on keeping other sessions aligned towards their goals and parsing through the agent noise. Now, I primarily message that one orchestrator session alone. It tells me what’s landed, what’s been decided for me, and what actually needs my input. Every worker is an unmodified Claude or Codex process in a real PTY, so you can still attach to any session and interface with it. This functionally results in all the productivity and quality benefits of multiplexing sessions while hopefully keeping you sane.<p>Here&#x27;s a 90 second walkthrough of the IDE: <a href="https:&#x2F;&#x2F;www.loom.com&#x2F;share&#x2F;125c58d597234685b1a632839a83813a" rel="nofollow">https:&#x2F;&#x2F;www.loom.com&#x2F;share&#x2F;125c58d597234685b1a632839a83813a</a><p>In the last month that we’ve been using this, merged PRs per prompt (at similar semantic weight) has gone from 0.9 to 5, and our revert rate of said PRs has fallen from 0.56% to 0.20%. We are confident letting the orchestrator manage our agent sessions for hours at a time, and it works quite well for overnight runs too.<p>Maxxwell is BYOK or subscription, and otherwise free and fully local. We’re considering making a hosted service as well to save your local machine’s memory.
Check it out! If you’re already running several agent sessions at once, I’d especially like to know:<p>- What would make you trust that an unattended session stayed aligned? We currently have per-goal checklists that the orchestrator monitors to ensure adherence.<p>- What’s your preferred balance of agent autonomy and control?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49625975)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T13:10:30Z

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
