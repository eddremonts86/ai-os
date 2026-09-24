# PRODUCT.md — Linting 216 public Claude Code skills – 69% won't reliably trigger

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built a linter for Claude Code artifacts (skills, subagents, slash commands, .mcp.json configs, and plugins) and then pointed it at a pile of public repos to see what people actually ship. A few of the numbers surprised me enough that I wrote them up.<p>The one that stuck: across 87 public subagents, 57% (50 of 87) declare no `tools` list at all. That reads like a safe default, but it&#x27;s the opposite. A subagent with no `tools` inherits the caller&#x27;s entire toolbox, Bash included. Permission prompts still gate execution, but a worker you meant to &quot;just read code&quot; now carries the grant surface to run shell — the opposite of least-privilege. Add 16 more that grant bare `Bash` and 8 that grant a wildcard, and 85% of the sample isn&#x27;t least-privilege.<p>Other findings from the two scans:<p>- Of 215 public skills scored for triggering, 69% have a `description` that won&#x27;t reliably trigger (40% outright unlikely to fire, 28% borderline). &quot;My skill never fires&quot; is the #1 real-world failure, and it hides in one frontmatter line.
- 83% of subagents (72 of 87) lack invocation cues (&quot;use when…&quot;) in their description.
- 1 of 216 skills, and 0 of 87 subagents, pass every check cleanly. Almost everyone got secrets right: only 6 of 216 skills tripped the scanner.<p>How it works: mostly pure, deterministic checks that emit file:line evidence (&quot;SKILL.md:14 links .&#x2F;references&#x2F;converter.md, not found&quot;). An optional LLM check (bring your own key) judges whether a description will actually trigger. The CLI is free (`npx skillcrossroads .&#x2F;my-skill`), there&#x27;s a GitHub Action that gates PRs, and it&#x27;s open-core: the public audits are free, money is a hosted Pro tier.<p>Limits: the two reports ran different editions (skills on rubric v1.2 with the LLM checks, agents on v1.2 deterministic-only), both labeled, tree SHAs pinned, reproduction commands published. The rubric is strict on purpose, and every finding carries file:line evidence you can check against the artifact itself. The sample is 216 skills across 18 repos and 123 agents&#x2F;commands (87 subagents + 36 commands) across 10 repos, caps disclosed, and you can re-run it on your own repos.<p>Reports: <a href="https:&#x2F;&#x2F;skillcrossroads.com&#x2F;report?ref=hn-show" rel="nofollow">https:&#x2F;&#x2F;skillcrossroads.com&#x2F;report?ref=hn-show</a> and <a href="https:&#x2F;&#x2F;skillcrossroads.com&#x2F;report-agents?ref=hn-show" rel="nofollow">https:&#x2F;&#x2F;skillcrossroads.com&#x2F;report-agents?ref=hn-show</a>
Code: <a href="https:&#x2F;&#x2F;github.com&#x2F;sgharlow&#x2F;skillcrossroads" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;sgharlow&#x2F;skillcrossroads</a>

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49744398) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
