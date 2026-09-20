# PRODUCT.md — Cutting (Claude Code) token spend on dynamic workflows 80%

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Discovered something very interesting by chance a few days ago, and thought it might be interesting for other people running dynamic workflows with claude code. The workflow scripts themselves are javascript. Claude code knows the format and it can make a tool that composes workflows instead of going through LLM each time.<p>I got it to do that, and with a few more tweaks it got the token spend for workflow execution and monitoring down to about 20% of what it was before, significantly speeding it up (most of our workflows used to take 5-6 hours, they now take 20-40 minutes).<p>We got Claude to analyze the workflows from the past few weeks (the workflow execution is on disk, in ~&#x2F;.claude&#x2F;projects) and identify commonalities between them. It turned out to be effectively 3 kinds of workflow steps, done in a million ad-hoc ways.<p>- a code change agent&#x2F;implementer&#x2F;worker - this takes a task from the plan and does it; such agents can run in parallel<p>- a check gate agent - this tries to figure out what the implementer agents did and evaluates things that should not be done in parallel<p>- the final check, which deploys, runs api tests etc.<p>It also turns out you that Claude can compose workflows out of standard &quot;agents&quot; (from .&#x2F;claude&#x2F;agents), not writing the prompts for workflow agents by LLM each time; so I asked it to figure out commonalities&#x2F;variabilities, and it wrote 3 agent scripts, which we later reduced to two:<p>- workflow-worker - gets a piece of the plan and very tight permissions to only write and run tests for it&#x27;s own part of the plan&#x2F;file boundary, and not fix anything that others might be doing, and definitely not run the whole test suite<p>- workflow-gate - gets the results from parallel workflow agents in a group, runs serial verifications based on what changed in git (e.g. if any www files changed run web tests; if any backend files changed, run api tests etc. This used to be custom-written by LLM each time but we moved it to a makefile with two targets, so make workflow-serial-gate checks the git tree and runs tests for changes, make workflow-final-gate runs clean tests on everything, deploys to a staging environment, runs post-deployment tests<p>as the variability moved into the makefile, both of these agent definitions became standard 100-line markdown, that the LLM did not need to write each time.<p>next, since the agent definitions are standardized, we got claude to actually write a tool that would read out the plan file with steps and dependencies, and write the workflow javascript directly. previously it used to take 10 minutes for something like this to come back for complex plans, now it takes a second.<p>Since the workflow agent prompts are static and written once, no tokens get spent writing them. since the whole choreography of which tests to run when is in the makefile, based on git changes, no tokens get spent on that. since worker agents are getting the plan and a step number, no tokens are spent telling them what to do (besides them reading the specific step, but this is unavoidable). Tokens get spent pretty much only on creating the plan, narrow implementation tasks and contextually fixing issues.<p>When a named agent runs as part of the workflow, the context passed to pre-tool use hooks includes the name of the agent (e.g. workflow-worker, workflow-gate) so we were able to constrain them significantly. For example, workflow-worker is not allowed to run make, or run the entire test suite, with a message to delegate that to the gate agent.<p>The end result is amazing, workflows run much much faster and spend far fewer tokens than before. Claude pretty much wrote the whole thing itself, so I definitely recommend this as an experiment if you run dynamic workflows. Happy to provide any additional info if people are interested.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49587379) · **Category:** ask-hn · **Tags:** Ask HN,Problem
