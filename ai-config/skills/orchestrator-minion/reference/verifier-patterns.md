# Verifier Patterns: Explicit Rejects vs Blind Reproduction

The orchestrator-minion contract defines that a worker produces an artifact
and a verifier checks it before the orchestrator accepts it. The contract
deliberately does NOT prescribe one verifier pattern — different tasks
call for different verifications. This document is the menu.

Two patterns dominate practice, with very different failure surfaces:

| Pattern | What the verifier sees | What the verifier returns | Strong at |
|---|---|---|---|
| **Explicit rejects** | the worker's scope, the artifact, the orchestrator's `rejects_if` list | `{"verdict": "yes" \| "no", "reasons": [...]}` | mechanical correctness, schema compliance, well-specified criteria |
| **Blind reproduction** | only the **original user request** (the same request the orchestrator started with), no scope, no `rejects_if`, no worker's retelling | evidence that the request was satisfied, or a `{"verdict": "no", "reasons": [...]}` | catching scope drift, original-misunderstanding, the "looks good but answers the wrong question" failure mode |

The default in this skill's `reference/examples/prompts/` is **explicit
rejects** — the verifier is told what to check. It is fast, deterministic,
and the contract is easy to reason about. It is also the pattern most
prone to "verification theater" (pitfall #8): if the rejects list is
vague, the verifier says yes to anything that looks vaguely right.

The **blind reproduction** pattern (popularized by Fable Foreman, see
`reference/decision-menu.md#related-implementations`) is a stronger
default for tasks where the worker's success is hard to enumerate in
advance. The verifier does not see the worker's scope or the
orchestrator's `rejects_if`. It sees the original user request, a fresh
context, and is told: *reproduce the evidence that the request is
satisfied. If you cannot, reject.*

## When to use which

Use **explicit rejects** when:

- The acceptance criteria are mechanical and enumerable (file exists,
  schema valid, regex match, render output present, etc.)
- The task is well-specified enough that a sub-list of "things that
  would make this wrong" captures reality
- Cost matters and you cannot afford a verifier that has to redo
  substantial work

Use **blind reproduction** when:

- The original request is the source of truth and the worker's
  interpretation might have drifted
- The artifact is hard to evaluate in isolation (e.g., "explain why
  this commit is buggy" — the verifier must understand the
  original reasoning to know if the explanation is right)
- "Looks good" is the actual concern, not "matches the spec"
- A second, independent perspective adds real value (e.g., security
  audits, refactor correctness, where the worker's reasoning might
  have a subtle flaw that the rejects list would miss)

Use **both** when:

- The task is high-stakes and cost is not the binding constraint
- The explicit rejects catch the mechanical part; the blind
  reproduction catches the "answers the wrong question" part

## The two patterns in plan JSON

The pattern is a property of the verifier sub-agent dispatch, not a
top-level plan field. The orchestrator decides which to use per
worker; the plan records the choice.

### Explicit rejects (this skill's default)

```json
{
  "type": "verifier-subagent",
  "prompt_ref": "reference/examples/prompts/verifier-auth.md",
  "rejects_if": [
    "any handler accepting user input is missing from the findings",
    "any finding lacks a line number",
    "any P0 finding lacks a recommended fix"
  ]
}
```

The verifier is given the worker's scope, the artifact path, and the
`rejects_if` list. It returns `yes` / `no` with reasons.

### Blind reproduction (Fable Foreman pattern)

```json
{
  "type": "verifier-subagent",
  "pattern": "blind",
  "prompt_ref": "reference/examples/prompts/verifier-blind.md",
  "rejects_if": [
    "the original user request is not satisfied as evidenced by [concrete reproducible check]"
  ]
}
```

The verifier is given ONLY the original user request (the one the
orchestrator started with), a fresh context, and read-only tools.
The `rejects_if` field, in this pattern, names the reproduction the
verifier must attempt. If the verifier cannot reproduce the evidence
the user asked for, it rejects.

The `rejects_if` list in the blind pattern is shorter and more
specific: it is the "show me the money" check, not the "are you
answering the right question" check. The latter is what the fresh
context buys you.

## The blind verifier prompt template

For the blind pattern, the verifier's system prompt is structurally
different from the explicit one. The example ships at
`reference/examples/prompts/verifier-blind.md`. The shape:

```text
You are a blind verifier in an orchestrator-minion run. You are
reviewing work done by another agent, but you have not seen that
agent's work, its scope, or its interpretation. You have only the
original user request, a fresh context, and read-only tools.

## What you do

1. Read the original user request carefully. The request is the
   source of truth; everything else is your inference.
2. Reproduce the evidence that the request is satisfied. If the
   request asked for X, show X. If the request asked you to verify
   Y, run Y. If the request cannot be satisfied by you with the
   tools you have, say so.
3. If you cannot reproduce, reject. The worker's claim of success
   is not evidence you.

## What you do NOT do

- Do not read the worker's artifact, code, files, or process. The
  point of being blind is that you cannot be biased by how the
  worker did the work.
- Do not trust the worker's claim of completion. Reproduce.
- Do not run a verification command without first stating what
  you are trying to verify.

## Output shape

Reply with exactly this JSON shape:

{
  "verdict": "yes" | "no",
  "reproduction": "...",  // what you did to verify; cite exact
                          // commands, exact files, exact values
  "reasons": ["..."],     // empty if verdict is "yes"
  "notes": "..."          // optional
}
```

The `reproduction` field is the audit trail: the verifier must say
*what* it did to verify, not just that it verified. This is what
makes the pattern stronger than a vibes-check: the orchestrator (or
the human reviewer) can read the reproduction and see if the
verification was real.

## When the orchestrator should pick blind by default

For tasks that look like:

- "explain why X is happening"
- "audit this code/skill/repo for Y"
- "refactor this so that Z is true"
- "is this regex/script/function correct?"
- "what would happen if we did W?"

the worker's success is hard to enumerate in a `rejects_if` list.
The verifier needs to look at the original request, form its own
hypothesis, and check whether the artifact actually answers it.
This is what blind reproduction is for.

For tasks that look like:

- "produce a JSON file with these specific fields"
- "make this test pass"
- "add this API endpoint with this signature"
- "render this HTML and check that the output has these classes"

the worker's success is well-specified; an explicit `rejects_if` is
the right tool. The verifier does not need a fresh context; it
needs the spec.

## Cost tradeoff

Blind reproduction is more expensive. The verifier has to redo
substantially the same work the worker did (without seeing the
worker's output) just to confirm the request is satisfied. For
high-stakes tasks that is the right tradeoff: the work was cheap
to do wrong and expensive to ship wrong. For low-stakes tasks
(rename this variable, fill in this form, etc.) explicit rejects
are enough.

The orchestrator should not pick blind by default. Pick blind when
the rejection-list pattern is insufficient; pick explicit when
the criteria are clear.

## Acknowledgement

The blind reproduction pattern as described here is the same
verifier shape Fable Foreman uses (Jordan Olsen, dontsleeponai.com,
MIT, v0.2.0, July 2026). This skill documents it as an alternative
to the explicit-rejects pattern; the implementations are independent
and the choice between them is a per-worker orchestrator decision.
