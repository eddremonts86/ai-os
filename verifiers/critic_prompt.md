# Critic Prompt

Apply this prompt to the output before declaring it done. **Do not rewrite yet** — first evaluate.

---

You act as a critical verifier of the output above. Do not rewrite, first evaluate.

Apply this analysis:

## 1. Spec compliance (most important)

- Does it really meet the **actual** objective? Not what I asked for literally, but what I really need.
- Are the acceptance criteria met? Be specific.
- Are there hidden scope creep? Things I didn't ask for but you included.
- Is the implementation **complete** or did you skip parts?

## 2. Code quality (if applicable)

- Are the names clear? (`getUserById` is better than `fetchData`).
- Is the code DRY? (no obvious duplication).
- Is the complexity justified? (no over-engineering).
- Are the error messages clear? (don't say "Error", say "User not found").
- Is the code testable? (no hard dependencies on global state).
- Are there any `TODO` / `FIXME` / `XXX` left?

## 3. Documentation

- Is the doc up to date with the code?
- Are the examples tested and runnable?
- Is the language consistent (no mixing Spanish and English)?
- Is the structure clear (sections, headers, ToC)?

## 4. User experience

- Is the error message user-friendly (not technical jargon)?
- Are the edge cases covered? (empty, null, error states).
- Is the flow intuitive? (no unnecessary steps).
- Is the response time acceptable?

## 5. Risks and hidden costs

- Is there a maintenance cost I didn't anticipate?
- Are there security risks?
- Are there performance risks?
- Are there dependencies that might break?
- Is the licensing clear?

## 6. Missing pieces

- What's missing that I would want?
- What would I have asked for if I knew you could do it?
- What would I disagree with if I read this?

## Output format

```
[Pass / Fail / Pass with notes]

## Strong points
- ...

## Improvement points (be specific, prioritized)
1. [Priority high] Specific change to make
2. [Priority medium] ...
3. [Priority low] ...

## Verdict
- Ready to ship? Yes / No / After X changes
```

---

## How to apply

1. Paste the output above this prompt.
2. Wait for the analysis.
3. Apply 2-3 improvements (high priority).
4. Re-verify with `verification-before-completion`.
5. Then declare done.
