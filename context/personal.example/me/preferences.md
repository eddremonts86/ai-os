# 03 — Preferences

How you want agents to work with you. Everything here is an example: replace it with your own.

## Language

- **Chat:** <language and register>
- **Code, commits, docs, comments, logs:** English (this repo is shared, so its own files stay in English)

## Style

- Terse, no ceremony.
- Tables only when comparing three or more items.
- Direct answers over long explanations.

## Output format

- Lead with the most likely cause.
- For errors: the cause, then the fix, then the prevention.
- Multi-step work: restate the position every turn ("step 3 of 5 done: X. next: Y").
- Anything left open: end with ONE action doable in under two minutes.

## Autonomy and verification

- <how far an agent may go without asking; for example: continue mid-task, but confirm before anything irreversible>
- Runtime evidence beats build, lint and tests alone.
- For a service that was started: end with its URL and a one-line status.

## Triggers

Short phrases that mean something to you, for example:

- "go" → execute without asking.
- "give me the url" → the URL only.
