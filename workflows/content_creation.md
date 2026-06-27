# Content Creation

Workflow to create content: docs, ADRs, blogs, READMEs, specs, tutorials.

> **Prerequisite:** have the 14 superpowers skills installed (see `~/Projects/ai-os/CLAUDE.md` section 16). Without them, the load skill steps in this workflow will fail.
>
> Run `bash ~/Projects/ai-os/setup/verify.sh` to verify. If it reports `14/14 superpowers skills OK`, you're good.

## When to use

- Create/update README, AGENTS.md, CLAUDE.md.
- Write an ADR (Architecture Decision Record).
- Write a blog post.
- Write a tutorial.
- Write API documentation.
- Write release notes.

Do not use for: code changes (use `workflows/coding.md`), pure research (use `workflows/research.md`).

## Steps

### 1. Define the audience and goal (ask)

Who is the content for and what should they do after reading?

Examples:

- New developers joining the project → README + onboarding.
- Team making a technical decision → ADR.
- External devs using your library → API docs + tutorials.
- Future self (looking back) → ADR + spec archive.

Show the goal to the user. They must approve.

### 2. Determine the type of content (read Spec)

| Type | Structure | Length |
|---|---|---|
| README | What, why, install, usage, contributing | 200-800 lines |
| ADR | Context, decision, consequences, alternatives | 50-200 lines |
| Tutorial | Goal, prerequisites, steps, verification, next | 100-500 lines |
| API doc | Endpoint, params, response, example | 50-200 lines per endpoint |
| Blog post | Hook, problem, solution, code, result | 500-2000 words |
| Release notes | What's new, breaking changes, upgrade guide | 50-300 lines |
| Spec | Metadata, objective, criteria, plan, risks | 50-300 lines |

### 3. For ADRs: → Load skill `documentation-and-adrs` (load skill)

If the content is an ADR:

- Use the standard template: Context, Decision, Consequences, Alternatives.
- State the decision clearly in 1 sentence.
- List at least 2 alternatives and why they were rejected.
- Document the consequences (positive and negative).

### 4. For tutorials: structure with verification (load skill)

For tutorials, each step must have:

- Goal of the step.
- Concrete commands (not abstract descriptions).
- Expected output (what you should see).
- Verification (how to know it worked).

### 5. For READMEs: use the standard structure (write)

README standard structure:

1. **Title + 1-line description** — what is this?
2. **Status badges** — CI, version, license.
3. **Quickstart** — 1-command to install + run.
4. **Usage** — 1-3 common use cases with code.
5. **Configuration** — env vars, options.
6. **Development** — how to contribute, run tests.
7. **License** — MIT, Apache, etc.
8. **Acknowledgments** — credits, inspiration.

Keep it under 500 lines. Detailed docs go in `docs/`.

### 6. Write the first draft (write)

Write the content following the structure. Style:

- Active voice ("Run `npm install`" not "you should run `npm install`").
- Short sentences (max 25 words).
- Code examples tested.
- Links to official docs.
- No filler ("as you can see", "obviously", "simply").

### 7. Verify (load skill)

→ Load skill `verification-before-completion` with these gates:

1. Does the file exist?
2. Does it have the expected sections? (grep for headers)
3. Are all internal links valid? (`markdown-link-check` or `lychee`)
4. Are all code examples valid? (run them)
5. Is the content up to date with the actual code? (compare with reality)

### 8. Critical review (load skill)

→ Load skill `verifiers/critic_prompt.md` (AI-OS internal) to review:

- Is the audience clear?
- Is the goal achieved?
- Is the length appropriate (not too long, not too short)?
- Are there sections that could be removed?
- Are there missing sections?

Apply 2-3 improvements. Do not skip this step.

### 9. Review with → Load skill `code-review-and-quality` (load skill)

For content that includes code or technical accuracy:

- Verify the code runs.
- Verify the API is current.
- Verify imports/exports are correct.

### 10. Save the content (write file)

```bash
# Save to AI-OS outputs/ if reusable
mv ~/tmp/<content>.md ~/Projects/ai-os/outputs/$(date +%Y-%m-%d)-<slug>.md

# Or commit to the project
git add docs/
git commit -m "docs: add <topic> guide"
```

### 11. Update related context (write file)

If the content changes the AI-OS state, update `context/`:

- `03_preferences.md` — new style preferences.
- `04_tools.md` — new tools mentioned.
- `05_sources.md` — new official docs URLs.

## Output

At the end of this workflow, you should have:

- Content file in the right place (project's docs/ or AI-OS outputs/).
- All sections verified.
- Critical review applied.
- All links valid.
- All code examples tested.
- Context updated if applicable.

## Anti-patterns

- ❌ Writing without a clear audience → produces generic content that helps no one.
- ❌ Too long → no one reads.
- ❌ Untested code examples → lose trust.
- ❌ Invented URLs → lose trust.
- ❌ Not updating the file when the code changes → documentation rot.
- ❌ Skipping the verification phase → publish broken docs.
