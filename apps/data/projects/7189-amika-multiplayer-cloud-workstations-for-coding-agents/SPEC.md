# SPEC.md — Amika – Multiplayer cloud workstations for coding agents and humans

## Problem

---
title: &quot;Show HN: Amika – Multiplayer cloud workstations for coding agents and humans&quot;
---<p>Hi Hacker News!<p>My cofounder and I are building amika.dev (<a href="https:&#x2F;&#x2F;www.amika.dev&#x2F;">https:&#x2F;&#x2F;www.amika.dev&#x2F;</a>), which provisions multiplayer cloud workstations for coding agents and humans to share.<p>We call these VM workstations &quot;Rigs&quot;. Each Rig is loaded with your git repo(s), development environment, and choice of coding agent(s). You and your teammates can steer the same agents from anywhere: the web (desktop or mobile), Slack or Linear, SSH, CLI, API, or apps like Codex and Cursor.<p>Here&#x27;s a demo: <a href="https:&#x2F;&#x2F;youtu.be&#x2F;o4tLUOb8Vvk" rel="nofollow">https:&#x2F;&#x2F;youtu.be&#x2F;o4tLUOb8Vvk</a><p>We built this after we started running many long-running agent tasks in parallel. Setting up isolated environments was tedious, work stopped when we closed our laptops, and triggering tasks from tools like Sentry or Linear was awkward. Sharing changes meant copy-pasting screenshots or asking each other to check out a branch and restart their dev servers.<p>So, we tried to fix that! Amika has the basics you&#x27;d expect from a cloud agent: expose preview URLs, share agent chat sessions, and chat with agents from Slack or Linear.<p>It also does some things differently:<p><pre><code>    - run 1 or more agents simultaneously per rig, using any harness
    - direct control over the agents and the VMs
    - control things programatically, or with human-in-the-loop UI
    - connect from the Codex app, Cursor, or cmux
    - let rigs and their agents communicate with each other and create new rigs and agents
    - run rigs on Amika&#x27;s cloud or your own cloud or computers
</code></pre>
Each rig can be short-lived or persistent, depending on whether you want it to disappear when your PR is done, or whether you want to keep it around more permanently.<p>Importantly, this is NOT an agent harness, nor a sandbox provider.<p>We want Amika to run any agent harness on any computer, whether that&#x27;s a desktop in your closet, an AWS Kubernetes cluster, or a sandbox cloud. Underneath the app, Amika schedules VMs on those hosts (via our sandbox router) and networks the VMs and their agents together.<p>Our core is open source at <a href="https:&#x2F;&#x2F;github.com&#x2F;gofixpoint&#x2F;amika" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;gofixpoint&#x2F;amika</a><p>Our goal is to make the OSS really easy to self-host for individuals, while having a cloud platform for teams. The self-hosted story is not feature-compatible right now, but we&#x27;re working to improve that.<p>Right now, we&#x27;re giving all HN signups 2 VMs free for 2 weeks, then it&#x27;s $30 &#x2F; month + compute hosting costs. You can sign up at <a href="https:&#x2F;&#x2F;amika.dev">https:&#x2F;&#x2F;amika.dev</a>. If you want to run on compute or cloud accounts you already own, it&#x27;s cheaper. Send me an email at dylan+hn@amika.dev if you want to get BYOC or self-hosting working and I&#x27;ll help you out.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49716282)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T17:58:41Z

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
