# PRODUCT.md — Ardent, a code-first agent for non-engineering work

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I’m Nate, the founder of Ardent. We just shipped our public beta, and we’d love your thoughts!<p>Ardent is an agent running in a desktop (Electron) app built to help with knowledge work, designed for less-technical people outside engineering. Think Codex or Claude Cowork, but built around collaboration and customization.<p>I know, I know, it’s yet another agent harness! Ardent is a little different – it leans heavily on codegen to solve problems. Most agents are basically just a bag of tools and a while loop, but Ardent writes code to complete tasks, making it much faster and more token-efficient. [0]<p>Lots of companies are trying to build their own agent harness right now, because token budgets make software appear cheap, and it seems like a competitive advantage to own a custom agent.<p>The thing is, agents are deceptively complex. They aren’t light wrappers around the model anymore; the harness makes a big difference in how capable the agent is. They also come with lots of sticky problems: context management, sandboxing and permissions, authz&#x2F;authn to remote services, etc.<p>Instead of building your own harness from scratch, you can customize Ardent using abilities: TypeScript libraries that can expose tools and prompts which can be used by the agent. They’re like agent skills, but closer to regular code libraries: type-safe, importable, and with well-defined permissions. Ardent can help you build abilities, but you can also create them by hand if you prefer.<p>Anyone can share abilities with everyone in their organization with a single click, and if Ardent notices that the user is doing repeatable work, it offers to transform the adhoc solution into a reusable ability. Say you prepare the same project update every Friday, pulling issues from Linear and docs from Google Drive. Ardent can turn that workflow into a reusable ability that you can share with everyone in your company.<p>Your company’s ability catalog is like a standard library. To solve a problem, Ardent searches for existing abilities, and then writes glue code to compose them. Because the code is ephemeral, it doesn’t need to be maintainable, which lets us use cheaper, less-capable open weight models like Kimi and GLM. [1]<p>Code executes on the user’s machine in a Deno sandbox with zero permissions by default. Abilities declare required permissions up front, and any code that exceeds the current scope gets terminated and prompts the user for approval.<p>Ardent can also connect to a bunch of tools which you’re already using, like Google, Linear, and so on. We support MCP servers, but in our experience, MCP is slow, token-expensive, and provides a pretty bad experience for both agents and users. [2]<p>Instead, Ardent connectors handle auth, but instead of using MCP, we generate client shims which call the service’s primary API. This is a much better fit for Ardent’s codegen approach, because the agent can read the client and treat it like any other library.<p>There’s a bunch of other interesting stuff in Ardent: memory, conversational recall, scheduled tasks, prompt suggestions, and so on. During our beta period, we’re selling inference at-cost, and we’re giving each organization some free credits to experiment.<p>Please take a look and tell us what you think! We’d love your feedback, whether you think what we’re doing is good, bad, or meh. I’m also happy to answer any questions that you might have.<p>---<p>[0] Cloudflare has taken to calling this “code mode”: <a href="https:&#x2F;&#x2F;blog.cloudflare.com&#x2F;code-mode&#x2F;" rel="nofollow">https:&#x2F;&#x2F;blog.cloudflare.com&#x2F;code-mode&#x2F;</a><p>[1] In our benchmarks, Ardent consumed 63% fewer tokens than Opus running in Claude Cowork, with half the model requests.<p>[2] MCP servers rarely define input&#x2F;output contracts, and it’s hard to write code that calls a function when you don’t know its arguments, or even its arity! Here&#x27;s a good read on the subject: <a href="https:&#x2F;&#x2F;www.blacksmith.sh&#x2F;blog&#x2F;code-smith-code-mode">https:&#x2F;&#x2F;www.blacksmith.sh&#x2F;blog&#x2F;code-smith-code-mode</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49550931) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
