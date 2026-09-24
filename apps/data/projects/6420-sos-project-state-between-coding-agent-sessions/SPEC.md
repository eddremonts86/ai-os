# SPEC.md — SOS – Project state between coding agent sessions

## Problem

I started working on SOS because noticed that during long-term projects, Codex often loses track of the current status and gets confused. I frequently had to explain what we had already done, which decisions were still valid, and what needed to be re-verified. Simple file-based governance didn&#x27;t fully solve this problem.<p>SOS stores a clearly defined &quot;latest state&quot; of the project within the repository. A current or new session retrieves this state via MCP. If something changes after a verification step, the previous result remains in the history but no longer influences the future development trajectory.<p>This isn&#x27;t automatic chat memory; the state must be explicitly saved and accepted. Missing information isn&#x27;t filled in via guesswork.<p>We have currently prepared an open-source alpha version focused on Codex; Claude support is planned for future releases. Linux is the primary supported OS. It has also been tested and works on macOS, while the Windows adapter is currently undergoing certification and will be available soon.<p>SOS runs locally or on a server, if you prefer to work directly there. We do not use telemetry.<p>I designed the system to be &quot;agent-first,&quot; meaning you can delegate the setup to Codex simply by providing the repository link. The user just needs to provide confirmation at the appropriate steps.<p>I’m interested to see how other users maintain agent state during long-term projects or when switching between agents. Do you find `AGENTS.md` or hand-off notes sufficient? Does governance solve the issue for you, and what challenges do you face?<p>I am particularly interested in scenarios where an old instruction or a previously successful verification is no longer relevant to the current project.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49657908)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T13:16:15Z

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
