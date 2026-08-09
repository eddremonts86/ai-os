# PRODUCT.md — I built a command center for teams running coding agents — BYOK, persistent sessions, agent mesh

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ &lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;I got tired of agent work disappearing into terminal tabs with no shared visibility, so I built a browser-based control plane on top of the tools we already use.&lt;/p&gt; &lt;p&gt;How it works: a daemon runs on your machine (or a shared company server), dials out to a lightweight hub, and you + your team connect via browser. Agents are native OS processes orchestrated by the daemon — they talk to each other through a WebSocket mesh, not through the cloud.&lt;/p&gt; &lt;p&gt;What&amp;#39;s working today:&lt;/p&gt; &lt;p&gt;- Sessions that survive reconnects, terminal closures, machine sleep&lt;/p&gt; &lt;p&gt;- Three permission modes + plan mode (explore first, edit after approval)&lt;/p&gt; &lt;p&gt;- Teams: orgs, roles, shared dashboards, session handoff&lt;/p&gt; &lt;p&gt;- BYOK: 17+ providers, no token markup&lt;/p&gt; &lt;p&gt;- Sub-agents with P2P messaging (same-machine direct, cross-daemon via hub)&lt;/p&gt; &lt;p&gt;- Docker execution, MCP, skills, plugins, hooks, webhook/scheduled automations&lt;/p&gt; &lt;p&gt;- Enterprise deployment: shared daemon on company infra, dedicated control plane&lt;/p&gt; &lt;p&gt;Tech: Java 25 + GraalVM native binary. Virtual threads for the agent mesh without JVM startup overhead. React frontend.&lt;/p&gt; &lt;p&gt;Free tier, 60-day unrestricted trial for everything else. Pre-revenue, self-funded, running on a homelab.&lt;/p&gt; &lt;p&gt;&lt;a href=&quot;https://www.mooglest.com&quot;&gt;https://www.mooglest.com&lt;/a&gt;&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/West-Violinist-7075&quot;&gt; /u/West-Violinist-7075 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vjaljv/i_built_a_command_center_for_teams_running_coding/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vjaljv/i_built_a_command_center_for_teams_running_coding/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Hobbyist builders | _[What pain they feel]_
| _[How this solves it]_ |
| Weekend hackers | _[What pain they feel]_
| _[How this solves it]_ |

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

_Source:_ [Reddit r/SideProject](https://www.reddit.com/r/SideProject/comments/1vjaljv/i_built_a_command_center_for_teams_running_coding/) · **Posted:** 2026-08-08T23:44:26+00:00
