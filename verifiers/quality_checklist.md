# Quality Checklist

Checklist that the Verifier applies to every output. **All boxes must pass** to consider the deliverable acceptable.

## Spec compliance

- [ ] Does it meet the actual objective defined in the Spec?
- [ ] Are all acceptance criteria met?
- [ ] Are the non-goals respected (no scope creep)?
- [ ] Does the implementation match the plan in the Spec?

## Code quality

- [ ] Does the code compile without errors?
- [ ] Are there no warnings (TypeScript strict, Python strict, etc.)?
- [ ] Does the lint pass (ESLint, ruff, shellcheck)?
- [ ] Is the format applied (Prettier, black)?
- [ ] Are the tests passing (coverage > 80%)?
- [ ] Is the code DRY (no obvious duplication)?
- [ ] Is the code readable (clear names, short functions, comments where needed)?
- [ ] Are there no `any`/`unknown`/`@ts-ignore` without justification?

## Documentation

- [ ] Is the README updated (if the project has one)?
- [ ] Is the API doc updated (if applicable)?
- [ ] Are the inline comments in English?
- [ ] Is the CHANGELOG updated (if applicable)?
- [ ] Are the examples in the docs tested?

## Diagrams (only if the deliverable includes one)

- [ ] Produced with `diagram-design` (not hand-rolled SVG, not a mermaid fence passed off as a deliverable)?
- [ ] Tokens resolved from `context/06_brand.md` / project `.ai-os/brand-tokens.md` — no upstream default skin, no inlined hex?
- [ ] Taste gate applied (`diagram-design` SKILL.md §9)?
- [ ] `python3 ~/.claude/skills/diagram-design/scripts/self_check.py <file>` clean?
- [ ] Opened in a browser — renders as intended, no overlapping labels, no clipped nodes?
- [ ] ≤9 nodes, or explicitly zoned/split if `faithful` detail was requested?
- [ ] Accent used on 1–2 focal nodes only?
- [ ] `<title>` + `<desc>` present, IDs prefixed per diagram, `role="img"` set?

## Security

- [ ] Are there no secrets in the commit?
- [ ] Are there no `console.log` / `print` with sensitive data?
- [ ] Are the inputs validated (no SQL injection, no XSS)?
- [ ] Are the auth/authz checks in place (if applicable)?
- [ ] Is HTTPS enforced (if applicable)?

## Performance

- [ ] Is there no N+1 query (database)?
- [ ] Is there no unnecessary re-render (React)?
- [ ] Is there no synchronous I/O in async code?
- [ ] Are the assets optimized (images, fonts)?

## Runtime evidence

- [ ] Did the dev server start?
- [ ] Did the build complete?
- [ ] Did the smoke test pass (curl, browser, etc.)?
- [ ] Is the URL accessible?
- [ ] Are there no errors in the browser console / server logs?
- [ ] Is the system healthy (no 500s, no crashes)?

## Verifier-specific

- [ ] critic_prompt applied? (3+ improvements applied)
- [ ] source_check_prompt applied? (URLs verified, no hallucinated claims)

## Final

- [ ] Did the user say "ok" or "go" before you started?
- [ ] Is the Spec archived?
- [ ] Is the commit message conventional?
- [ ] Is the branch pushed (or PR open)?

## If any box fails

- Mark the deliverable as **NOT complete**.
- Specify which box failed.
- Apply the fix.
- Re-verify.
- Repeat until all boxes pass.
