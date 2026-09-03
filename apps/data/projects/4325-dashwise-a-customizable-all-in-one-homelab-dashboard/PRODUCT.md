# PRODUCT.md — Dashwise – A customizable all-in-one homelab dashboard

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve been building Dashwise, an open-source &quot;all-in-one&quot; homelab dashboard for about a year.<p>One thing that has always bothered me about homelab dashboards is configuration. Many of them look great, but setting everything up through large config files can become tedious. With Dashwise, I&#x27;m trying to make the dashboard itself easy to configure while also keeping integrations flexible.<p>## Built-in apps<p>* *Shortcuts:* A Spotlight-like search for your homelab. Integrations can expose actions and shortcuts directly to the search bar.
* *News:* Subscribe to RSS feeds and group multiple feeds together.
* *Notifications:* Send notifications to Dashwise from Shoutrrr-compatible applications or through plain HTTP requests.
* *Frame:* Turn the dashboard into a customizable smart display&#x2F;screensaver.
* *Links:* Store and organize bookmarks. This is still in an early prototyping phase.<p>## Integrations<p>With many dashboards, creating an integration that feels truly native requires modifying the dashboard&#x27;s code rather than adding plugins.<p>Dashwise integrations are instead defined using YAML. They can fetch data from REST APIs and display it using reusable widget templates.<p>An additional benefit of this approach is that the integration format is simple enough for LLMs to generate integrations fairly easily.<p>## Where it&#x27;s going<p>I&#x27;m planning to keep expanding the integration ecosystem and experiment with more ways for external tools to interact with Dashwise.<p>For example, one thing I&#x27;m planning is a CLI that can report the progress of long-running commands and display it directly inside Dashwise.<p>If you have any feature requests or feedback, let me know!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49522428) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
