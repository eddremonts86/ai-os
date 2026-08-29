---
id: "3660"
slug: hi-agent-run-npx-microfeedcli-manage-to-deploy-cms-on-c
title: "Hi agent – run `npx microfeed/CLI manage` to deploy CMS on Cloudflare"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482843"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js CLI, Cloudflare Workers, Cloudflare Pages, D1 (SQLite on Cloudflare), R2 object storage, Wrangler]
---
# Hi agent – run `npx microfeed/CLI manage` to deploy CMS on Cloudflare

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Microfeed is a CMS whose deploy is a single CLI command (`npx microfeed/CLI manage`) and whose runtime lives on Cloudflare. The CLI is designed to be run by an AI agent or by a developer who prefers the terminal to a hosted admin UI: the configuration lives in a version-controlled file, the deploy is idempotent, and the agent can drive the full lifecycle without a human in the loop.

The "Hi agent" framing in the title is the architectural commitment. The CLI has to be safe to run unattended, the deploy has to produce the same result on the second run as on the first, and the configuration surface has to be something a model can read and write. The capture does not name the content model or the publishing flow, so the plan treats those as design choices to be made in MVP rather than facts to be asserted.

**One-liner:** Microfeed deploys a CMS to Cloudflare with a single CLI command that an AI agent can run unattended, so the configuration lives in a file and the deploy is idempotent.

## Target Users

| Stakeholder | Why they care |
|---|---|
| AI agents standing up a CMS as part of a workflow | CLI-driven deploys that do not need a human to click through a dashboard. |
| Developers who prefer the terminal | A deploy story that lives in code review rather than in a hosted admin UI. |
| Solo writers on Cloudflare's free tier | A CMS that runs on Workers, D1 and R2 without a paid plan. |
| Operators who need idempotent deploys | The same command runs twice produces the same result, with no state drift. |
| Teams who want config-as-file | The CMS configuration is reviewable, version-controlled, and diffable. |

## Jobs To Be Done

1. **Functional job** — Stand up a CMS on Cloudflare with one command, and tear it down with another, without going through a hosted admin UI.
2. **Functional job** — Drive the publishing flow from an agent or a script: write content as data, run the CLI, and have the site reflect the change.
3. **Functional job** — Keep the CMS configuration in a file the agent can read and write, not in a hosted panel.
4. **Emotional job** — Trust the deploy because it is idempotent and the state is inspectable in the configuration file.
5. **Social job** — Reuse the same agent-driven deploy pattern across projects and content types.

## Success Metrics

- **Time to first published post** — minutes from `npx microfeed/CLI manage` to a live site with one post, since the agent-driven story depends on the deploy being cheap to repeat.
- **Idempotency under repeated runs** — running the CLI twice produces the same Cloudflare resource set and the same configuration state, since this is the load-bearing claim.
- **Unattended deploy success rate** — share of CLI runs that complete without a human prompt, since prompts break the agent story.
- **Configuration file coverage** — share of CMS state that lives in the config file versus in a hidden admin UI, since "config-as-file" only matters if it is actually config-as-file.
- **Cloudflare free-tier fit** — measured Workers, D1 and R2 usage on a reference deploy, published so the free-tier claim is anchored.
- **Destroy completeness** — share of resources cleaned up by the documented destroy path, since an agent that cannot tear down what it built is a footgun.

## Pricing & Monetization

The capture names no price, no tier and no hosted plan; the project is shared on a docs page. The architecture fixes only the cost shape: cost scales with the volume of content the CMS serves and the Cloudflare resources it consumes, not with the number of operators, so any future paid shape (if any) would have to be priced around Cloudflare usage rather than per site.

## Competitive Landscape

- **Hosted CMS platforms with admin UIs** — the obvious alternative and the one Microfeed is explicitly a counter-proposal to for the agent-driven case.
- **Static site generators with CMS-like frontends** — exist in the same neighbourhood; the differentiator is the Cloudflare-native runtime and the agent-driven deploy, not the static-site model itself.
- **Custom-built Workers apps** — what an agent would otherwise build from scratch; Microfeed is the reusable shape.

The capture names no specific competitor, so the comparison stops here.

## Risks & Open Questions

- [ ] Define the content model: what fields a post has, what enclosures it supports, and what the publishing flow looks like for each.
- [ ] Make the CLI safe to run unattended: no interactive prompts by default, idempotent operations, and explicit confirmation flags for destructive actions.
- [ ] Document the auth model for both a developer (interactive login) and an agent (token in env or config).
- [ ] Verify idempotency under repeated runs and publish the test, since this is a load-bearing claim.
- [ ] Document the destroy path so test deployments do not orphan Cloudflare resources.
- [ ] Stay within Cloudflare's free tier and publish the measured usage on a reference deploy so the free-tier claim is anchored.
- [ ] Decide the auth model for the CMS itself (public read, optional write token) since the capture does not name it.
