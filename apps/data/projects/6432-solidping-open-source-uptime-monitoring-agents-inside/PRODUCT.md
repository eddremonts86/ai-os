# PRODUCT.md — SolidPing — open-source uptime monitoring, agents inside your network

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ SolidPing is a single Go binary, AGPL-3.0 — 40 check types, status pages, incidents, on-call escalation, and sub-minute intervals that aren&#x27;t paywalled.<p>I loved Better Stack, and then the free plan kept getting thinner. What finally pushed me over: incidents used to get one Slack thread each, so an outage lived in one conversation instead of a stream of disconnected messages. That went away. I wanted it back, so I built my own.<p>The part I&#x27;d most like torn apart is the agents. You run one inside the network you want watched and it dials out over a WebSocket, so there&#x27;s no inbound port and no firewall hole. On first start it generates its own keypairs and keeps the private halves — Ed25519 for identity, an X25519 (age) recipient that the server seals check credentials to. So the credentials for a private check are encrypted for that agent, and the server storing them can&#x27;t read them.<p>All of it is open source: the agents, WhatsApp alerts, SSO, every check type. Nothing held back for a hosted edition.<p>Self-hosting is genuinely easy, and I depend on it, <a href="https:&#x2F;&#x2F;status.solidping.io" rel="nofollow">https:&#x2F;&#x2F;status.solidping.io</a> is a second SolidPing running on fly.io that watches the cluster hosting the first one. A monitor that lives inside what it monitors isn&#x27;t a monitor.<p>I&#x27;ve maintained a small Go FTP server library for 10 years (github.com&#x2F;fclairamb&#x2F;ftpserverlib), so open source isn&#x27;t a marketing decision here.<p>Demo, no signup: <a href="https:&#x2F;&#x2F;solidping.io&#x2F;demo" rel="nofollow">https:&#x2F;&#x2F;solidping.io&#x2F;demo</a>
Source: <a href="https:&#x2F;&#x2F;github.com&#x2F;fclairamb&#x2F;solidping" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;fclairamb&#x2F;solidping</a><p>What I want is UX feedback and missing features — where the interface gets in your way, what you went looking for and couldn&#x27;t find, what would have to exist before you&#x27;d run this instead of what you run now. Please be blunt. &quot;Nice project&quot; teaches me nothing.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49656831) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
