# Research

Workflow to research a new topic and summarize actionable findings.

> **Prerequisite:** have the 14 superpowers skills installed (see `~/Projects/ai-os/CLAUDE.md` section 16). Without them, the load skill steps in this workflow will fail.
>
> Run `bash ~/Projects/ai-os/setup/verify.sh` to verify. If it reports `14/14 superpowers skills OK`, you're good.

## When to use

- Investigate a new library/framework.
- Compare options before deciding (e.g., Hetzner vs DO, TanStack Query vs SWR).
- Evaluate a tool for adoption.
- Research a bug root cause (rare; usually use `systematic-debugging` instead).
- Learn a new concept.

Do not use for: tasks that need code changes (use `workflows/coding.md`).

## Steps

### 1. Define the question (read Spec)

Read `specs/current_spec.md`. If empty, the user has no Spec. Ask:

> "What is the question you want answered?"

Examples:

- "Should we use TanStack Query or SWR for data fetching?"
- "What's the difference between Hetzner Cloud Volumes and S3?"
- "How does Oh My Zsh handle plugins?"

The question must be specific. If vague, run → Load skill `brainstorming` first.

### 2. Define acceptance criteria (ask)

What does "research complete" look like? Examples:

- A comparison table with 3+ options.
- A recommendation with justification.
- A list of pros/cons for each option.
- Links to official docs.
- Code examples that work.

Show criteria to the user. They must approve.

### 3. Search (execute)

Use `context/05_sources.md` as starting point (it has official docs URLs).

Search patterns:

```bash
# Official docs (preferred)
web_fetch("https://official-docs-url")

# GitHub repos
gh repo view <owner>/<repo>
gh api repos/<owner>/<repo>/contents/

# Comparison articles
web_search("X vs Y comparison 2026")
```

Tools:

- `web_search` (Hermes tool) — Google search.
- `web_fetch` — fetch URL content.
- `web_extract` (Hermes tool) — extract main content from URL.

For code-specific research:

- `gh search code` — search code in repos.
- `gh search repos` — search repos.
- `context7` (if installed) — official docs for any library.

### 4. Summarize findings (write)

Structure the research as:

```markdown
## Question

[the question]

## Options evaluated

- Option 1: [name]
  - Pros: ...
  - Cons: ...
  - Use case: ...
- Option 2: [name]
  ...

## Recommendation

[the recommended option with justification]

## Sources

- [Link 1](url)
- [Link 2](url)

## Next steps

- [concrete next step]
```

Length: 200-1000 words. Not too short (no value), not too long (no action).

### 5. Verify sources (execute)

Apply `verifiers/source_check_prompt.md` to verify:

- All URLs are real (not invented).
- Versions are current.
- No hallucinated content.

If any check fails, redo the search or remove the claim.

### 6. Critical review

Apply `verifiers/critic_prompt.md` to review:

- Is the recommendation justified?
- Are there missing options?
- Is the analysis biased?
- Are there hidden costs (licensing, maintenance, learning curve)?

Apply the 2-3 improvements suggested. Do not skip this step.

### 7. Review with → Load skill `code-review-and-quality` (load skill)

For research that includes code examples:

- Verify the code compiles/runs.
- Verify the API is current.
- Verify imports/exports are correct.

### 8. Present to user (communicate)

```markdown
## [Topic]

[1 paragraph summary]

### Recommendation

[the recommended option]

### Why

[3-5 bullet points]

### Sources

- [link]
- [link]
```

Do not use long tables for 2-option comparisons. Use prose.

### 9. Save as output (write file)

If the research is reusable, save to `outputs/`:

```bash
cp ~/tmp/research-<topic>.md ~/Projects/ai-os/outputs/$(date +%Y-%m-%d)-<slug>.md
```

### 10. Update context (write file)

If the research changes the AI-OS state, update `context/`:

- `04_tools.md` — new tool added.
- `05_sources.md` — new official docs URL.
- `02_projects.md` — new project.

## Output

At the end of this workflow, you should have:

- A research document with the question, options, recommendation, sources.
- Sources verified (no invented URLs).
- Critical review applied.
- Optionally saved to `outputs/`.
- Context updated if applicable.

## Anti-patterns

- ❌ Research without a clear question → produces a document with no thesis.
- ❌ Inventing sources or URLs → loses trust.
- ❌ Not verifying versions → recommend deprecated tools.
- ❌ Not including licensing/maintenance costs → biased comparison.
- ❌ Research that doesn't end in a decision → wastes time.
