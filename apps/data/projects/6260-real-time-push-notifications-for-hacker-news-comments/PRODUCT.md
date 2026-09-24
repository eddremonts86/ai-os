# PRODUCT.md — Real-time push notifications for Hacker News comments

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello folks,<p>I built a service to provide you with real-time push notifications whenever someone replies to you on Hacker News, served right through your browser: <a href="https:&#x2F;&#x2F;hcker.news&#x2F;notifications" rel="nofollow">https:&#x2F;&#x2F;hcker.news&#x2F;notifications</a><p>It has always been difficult to keep track of replies here, especially across long threads (purposefully so[0]).<p>What makes this differe nt from other implementations (notable prior art: hnreplies.com by @dangrossman):<p><pre><code>  1. Real-time or once a day: You can choose to have notifications sent immediately (you get notified within ~20 seconds) or once a day. 

  2. Stories + Replies: Choose to get notified of replies to your comments and your submissions.

  3. Private: You don&#x27;t have to provide an email address (many people value their pseudonymity)
</code></pre>
How it works:<p><pre><code>  1. Go to https:&#x2F;&#x2F;hcker.news&#x2F;notifications and enter your HN username.

  2. Allow browser notifications when prompted.

  3. That&#x27;s it. When someone replies to you, your browser receives a push notification.
</code></pre>
Caveats: It works on Desktop (Chrome, Safari, Firefox, Edge), Android, and iOS. On desktop, your browser must be open to receive notifications. On iOS, it works via PWA – you must add it to your home screen.<p>Give it a try, I&#x27;d love your feedback. Cheers!<p>0: <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=27897211#27901918">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=27897211#27901918</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49644273) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
