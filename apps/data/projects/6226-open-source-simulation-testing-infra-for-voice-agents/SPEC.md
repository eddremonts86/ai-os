# SPEC.md — Open-source simulation testing infra for voice agents

## Problem

Hey HN, we’re Nischal &amp; Naman. We’re brothers, and together we’re building an open-source platform for simulation based testing of voice agents (try it out in 5 mins - <a href="https:&#x2F;&#x2F;docs.egma.ai&#x2F;docs&#x2F;get-started&#x2F;quickstart" rel="nofollow">https:&#x2F;&#x2F;docs.egma.ai&#x2F;docs&#x2F;get-started&#x2F;quickstart</a>, 2 min demo video - <a href="https:&#x2F;&#x2F;youtu.be&#x2F;wgDWEe5UAUY" rel="nofollow">https:&#x2F;&#x2F;youtu.be&#x2F;wgDWEe5UAUY</a>)<p>Platforms that help you do simulation testing already exist. But they all charge a heavy premium on top of inference costs. We believe if the industry truly wants to scale simulation testing of voice agents, we need to stop charging a premium on inference and start providing infrastructure to scale simulations. The project is built in a way that allows you to bring your own STT, LLM, and TTS provider keys while also providing a way for us to provide inference directly within the platform at a 0% markup so you don’t have to wrestle with multiple keys&#x2F; rate limits.<p>A bit on why’re we’re building this -<p>We started working on voice agents in early 2024 and since then, have worked on numerous voice ai systems - like screenless voice-powered hardware for kids[1], AI receptionist deployed in healthcare practices like med spas &amp; therapy clinics and personal accountability coaches. Some of these were full-fledged startups others were just side projects.<p>But we kept on encountering similar issues all throughout. One of the most frustrating parts was calling the agent again and again, reciting the same script to test its behavior. We also kept on encountering new issues all the time in production that we couldn&#x27;t have simulated pre launch.<p>This frustration led us to a bigger question: how can developers trust the voice agents they’re shipping?<p>We believe building that trust takes two things - 
- First, you need a way to test the major scenarios your agent will face in production before you release it, without having to make every call yourself. But you can’t test for everything. Real world is too messy to predict in advance.
- Which brings us to the second: you need a way to find issues once your agent is in production, whether it’s handling a few dozen conversations or millions.  Detect drift in known behaviors AND surface unknown-unknown ways in which your agent is going wrong.<p>We think it’s a really hard problem to solve. And having felt it firsthand, we’re deeply motivated to take a shot at it.<p>Today we’re launching the simulation testing side of the platform. We feel it’s mature enough that real teams can depend on it. For eval design, we took inspiration from anthropic’s evals design[2] and extended it to voice systems. For technical &amp; business model design we borrowed ideas from Langfuse[3]. Our stack is postgres, clickhouse &amp; minio. Its easy to self-host[4] &amp; the code has a permissive MIT license. We also have managed cloud version.<p>We’ve written more about our [testing](<a href="https:&#x2F;&#x2F;docs.egma.ai&#x2F;docs&#x2F;core-philosophies&#x2F;testing-philosophy" rel="nofollow">https:&#x2F;&#x2F;docs.egma.ai&#x2F;docs&#x2F;core-philosophies&#x2F;testing-philosop...</a>) and [monitoring](<a href="https:&#x2F;&#x2F;docs.egma.ai&#x2F;docs&#x2F;core-philosophies&#x2F;monitoring-philosophy" rel="nofollow">https:&#x2F;&#x2F;docs.egma.ai&#x2F;docs&#x2F;core-philosophies&#x2F;monitoring-philo...</a>) philosophy in the docs.<p>We’d love feedback from the HN community and people building voice agents - how are you testing today, what’s working and what’s frustrating? We’ll be in the comments. Thanks!<p>[1] <a href="https:&#x2F;&#x2F;x.com&#x2F;theBhulawat&#x2F;status&#x2F;1966200231705595932?s=20" rel="nofollow">https:&#x2F;&#x2F;x.com&#x2F;theBhulawat&#x2F;status&#x2F;1966200231705595932?s=20</a>
[2] <a href="https:&#x2F;&#x2F;www.anthropic.com&#x2F;engineering&#x2F;demystifying-evals-for-ai-agents" rel="nofollow">https:&#x2F;&#x2F;www.anthropic.com&#x2F;engineering&#x2F;demystifying-evals-for...</a>
[3] <a href="https:&#x2F;&#x2F;github.com&#x2F;langfuse&#x2F;langfuse" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;langfuse&#x2F;langfuse</a>
[4] <a href="https:&#x2F;&#x2F;docs.egma.ai&#x2F;self-hosting&#x2F;get-started" rel="nofollow">https:&#x2F;&#x2F;docs.egma.ai&#x2F;self-hosting&#x2F;get-started</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49646928)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T17:01:14Z

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
