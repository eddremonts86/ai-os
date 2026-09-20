# PRODUCT.md — Do you route only certain websites through a VPN?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I often need a particular exit IP to access certain websites. Switching my VPN back and forth gets annoying, and finding separate proxies isn&#x27;t much fun either. I also wanted one place to see how much traffic I&#x27;m using and whether the connection is actually working.<p>So I built a small tool for myself: a Chrome extension and a local dashboard, with a proxy connected to its own WireGuard tunnel. I choose the website domains that should use it, while my other apps keep their normal connection. It uses Mullvad at the moment, and I can set it up with my Mullvad account number. The dashboard handles the connection and shows traffic over time, domain stats, and errors.<p>There&#x27;s also an &quot;Add page&quot; button that finds domains the page requests, including things like images, scripts, and APIs, and adds them to the proxy rules. It&#x27;s still domain-based routing, so the same domains in another tab follow those rules too. It isn&#x27;t a separate VPN for each tab.<p>I&#x27;m curious if anyone else needs something like this, or how you&#x27;re handling it now. I haven&#x27;t cleaned up the project for release yet, and I&#x27;m trying to decide whether it&#x27;s worth spending the time to open-source it.<p>Honestly, I&#x27;ve been less motivated to open-source my personal tools lately. I build them with AI, and part of me thinks anyone who needs one could just build their own version. Cleaning things up takes time too. I used to work in security, so I&#x27;d want to go through it carefully before publishing anything.<p>Then there&#x27;s maintenance. I know I don&#x27;t have to take every feature request, but I&#x27;d probably feel some responsibility once people started using it. A small tool that does exactly what I need can slowly turn into a much bigger project that I never needed in the first place.<p>Lately I&#x27;ve been pretty happy just making things for myself and using them. Anyone else finding themselves doing that more? I&#x27;d be interested to hear how you decide which personal tools are worth sharing.<p>Screenshots use demo data rather than my real account or traffic.<p>Extension: https:&#x2F;&#x2F;postimg.cc&#x2F;sM4QzNPM<p>Dashboard: https:&#x2F;&#x2F;postimg.cc&#x2F;CRsB0QCz

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49583757) · **Category:** ask-hn · **Tags:** Ask HN,Problem
