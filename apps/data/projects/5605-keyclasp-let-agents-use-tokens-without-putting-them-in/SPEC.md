# SPEC.md — Keyclasp – Let agents use tokens without putting them in prompts

## Problem

Hi HN, I kept running into the same problem: either I’d have the agent give me the command, run it myself with the credentials, and copy-paste the output back, or I’d let the agent run it and keep finding secrets in its output.<p>I looked into alternatives and asked friends, but the only workable approach I found for my workflow was writing custom wrappers around CLIs to handle authentication. I got tired of the back-and-forth, rotating leaked tokens, and maintaining wrappers, so I built Keyclasp. I&#x27;ve been using it for two months now and I don&#x27;t see how could do without.<p>Keyclasp stores credentials in a local encrypted vault. The agent works with secret names and selects what a command needs:<p><pre><code>    keyclasp run --project myapp --environment dev --env API_KEY -- npm test
</code></pre>
The child process receives the requested token through its environment. The agent can list available secret names, but cannot retrieve the values. I also include a skill that explains the workflow. You can optionally require operator authorization when passing secrets. Everything is local and open source.<p>The command still needs to be trusted: it receives the real credential and can write it to disk or send it over the network. Keyclasp doesn’t sandbox commands or isolate secrets from other processes running as your OS user.<p>An output guard scans stdout and stderr for exact injected values of at least eight characters. If it detects one, it redacts the match, stops forwarding output, and attempts to terminate the process group. Shorter values, encoded values, and fragments are outside that protection. Keyclasp was built by me and didn&#x27;t have a professional third-party security audit.<p>You can install it with:<p>npm install -g keyclasp@beta<p>The README has a walkthrough using a dummy credential in a temporary vault, so you can try it without touching real keys. It currently supports Apple Silicon Macs and glibc Linux on arm64&#x2F;x64, with Node 24 or 26.<p>It’s MIT licensed and began as a fork of <a href="https:&#x2F;&#x2F;keyblind.dev&#x2F;" rel="nofollow">https:&#x2F;&#x2F;keyblind.dev&#x2F;</a>, created by Mohammed Aarif Shaikh.<p>How are you handling credentials for local coding agents today? I’d be interested in approaches I missed and places where this workflow falls short.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49603278)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T21:43:08Z

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
