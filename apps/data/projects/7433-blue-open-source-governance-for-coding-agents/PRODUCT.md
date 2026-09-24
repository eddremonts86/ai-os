# PRODUCT.md — Blue – open-source governance for coding agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN,<p>After migrating to an inference gateway to serve internal usage across an organization, problems have started to pop up. Once you detach from a managed ecosystem such as OpenAI or Anthropic you lose governance capabilities that makes the transition difficult.<p>- Losing access to a central plugin hub for delivering MCPs, skills, etc. A gateway can sort of do this but has low compatibility beyond skills, different harnesses, and version ranges<p>- Inability to deliver managed config (model defaults, etc). Can sort of be done with MDM&#x2F;Jamf but doesn&#x27;t reach contractors and doesn&#x27;t follow employees to other machines<p>- Gateway configuration is awkward for devs transitioning from SSO and API keys sit in plain text on their machines<p>The gateway transition facilitates new model families (Kimi, Deepseek, etc) which are best utilized with new harnesses beyond Codex or Claude Code. Managing these additional tools multiplies the governance problems.<p>Lastly, attempting to deliver an attribution program which can tag inference requests with ticket numbers and other metadata to facilitate Opex&#x2F;Capex calcs for finance becomes fairly unfeasible when there are multiple harnesses across arbitrary versions. This was not solved with managed ecosystems either to be fair, but requires some self-serve program or some local MITM proxy which is a distribution and versioning problem in of itself.<p>I built Blue to attempt to solve these problems. It&#x27;s an MIT open source, self-hostable control plane. Developers install a universal CLI and point it at their hosted control plane tenant. On launch, it reconciles the organization&#x27;s policy per harness, delivers extensions, and configures the gateway. It then launches and passes control to the native CLI (Kimi, OpenCode, Codex, etc) that devs already use.<p>Authentication is via browser device authorization which mints ephemeral bearer tokens. For gateway access, these tokens are exchanged at the inference proxy (part of the self-hosted Blue image) for the real API keys. This means that devs don&#x27;t need to manage API keys or even log into the gateway at all. Lastly, SCIM and OIDC are supported out of the box, so orgs can connect their identity solution immediately.<p>Curious to hear your thoughts and if you have&#x2F;solved this problem. I believe it can also be solved to some degree with a harness like Pi or even OpenCode, but that of course depends on the entire org migrating to those.<p>Last thing I&#x27;ll say is nowadays a CLI isn&#x27;t enough since I&#x27;ve seen over 80% of devs prefer desktop apps like the ChatGPT app. We&#x27;re also working on an open source desktop app that supports metaharnesses like Blue to make this transition easier.<p>Thanks!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49728525) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
