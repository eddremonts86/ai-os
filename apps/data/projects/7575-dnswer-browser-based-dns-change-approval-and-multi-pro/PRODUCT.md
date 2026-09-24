# PRODUCT.md — Dnswer – browser-based DNS change approval and multi-provider sync

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Imagine you have to manage DNS for domains spread across multiple DNS providers. You want to apply consistent DNS settings across your zones but the only way is applying the same change manually zone by zone (using multiple control panels). Tedious and a mistake is bound to happen. You want to delegate permissions to other teams but many times the only way is handing out access to everything. If something breaks you have no idea who did it and what exactly was changed.<p>The existing solution is IaC. Tools like OctoDNS or DNSControl can help you with some of the problems described above. But they require the whole team to feel at home with setting up pipelines, command line tools and git.<p>With dnswer I want to provide the same level of structure, but in a browser:<p>- staging &#x2F; preview before publishing DNS changes (edit and publish are separate roles)<p>- reusable blocks of records with per-zone variables (not a one-off template: update once, bulk-upgrade every zone that uses it)<p>- granular access control from full access down to write access on just a single record<p>- multi-provider sync with drift detection and resolution<p>- provision new zones at your provider(s), not only importing existing ones<p>- nameserver verification after changes (verifies that the change is live)<p>- for providers without an API, a shareable change request with on-demand re-verification (viewable without a dnswer account)<p>- modern record types (HTTPS&#x2F;SVCB) and DANE&#x2F;TLSA for mail, with cert-drift monitoring<p>- a zone logbook showing what changed, who did it, and why<p>There are a few ways you can learn more about it:<p>- Learn: <a href="https:&#x2F;&#x2F;dnswer.net&#x2F;show&#x2F;" rel="nofollow">https:&#x2F;&#x2F;dnswer.net&#x2F;show&#x2F;</a> (walkthroughs; annotated screenshots explaining how to use key features)<p>- Try it: <a href="https:&#x2F;&#x2F;app.demo.dnswer.net&#x2F;" rel="nofollow">https:&#x2F;&#x2F;app.demo.dnswer.net&#x2F;</a> (sandbox with mock providers, free; sign up and verify your email to get in)<p>- Pricing: <a href="https:&#x2F;&#x2F;dnswer.net&#x2F;pricing" rel="nofollow">https:&#x2F;&#x2F;dnswer.net&#x2F;pricing</a><p>If you want to try it with your own zones and API access to your DNS provider(s): I&#x27;m looking for up to ten teams (ideally managing 20+ domains across multiple providers) willing to manage real zones using dnswer. Not a big beta: I want to watch how it actually gets used and adapt things quickly. Free for the first 3 months, and early users keep their price for 2 years even after it goes up for new customers. If you&#x27;re interested, reach out by emailing joost@dnswer.net.<p>A few things worth knowing before you do. dnswer is not in your resolution path: your records stay at your provider and your nameservers keep answering. If dnswer is down, DNS keeps resolving and you can still change records directly in your provider&#x27;s control panel, you just lose the workflow on top until it is back. You can leave whenever you like: every zone exports as a BIND file with your record descriptions preserved as comments, so your documentation comes with you. Your provider credentials are encrypted at rest.<p>I&#x27;ve built it to solve the DNS problems I ran into in the last 20 years. I&#x27;d like to learn about other people&#x27;s DNS problems as well.<p>Tech stack: Django&#x2F;DRF, PostgreSQL, NATS, Lit web components, deployed with Ansible.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49740831) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
