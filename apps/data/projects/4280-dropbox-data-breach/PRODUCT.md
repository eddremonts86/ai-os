# PRODUCT.md — Dropbox Data Breach

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I received a security notice from Dropbox today saying that my account was accessed without authorization between August 4 and August 21, 2026, and that Dropbox believes files in the account were viewed or downloaded.<p>According to the email, Dropbox uses Lenovo as an identity provider, allowing users to authenticate to Dropbox with a verified Lenovo ID.<p>Dropbox says:<p>an issue with Lenovo’s email verification process allowed an unauthorized party to register a Lenovo ID using your email address and then use that Lenovo ID to log into the Dropbox account associated with that email address.<p>So, as I understand it, the attack path was roughly:<p>1. Attacker registers a Lenovo ID using the victim’s email address.
2. Lenovo incorrectly treats the email address as verified.
3. Dropbox trusts the Lenovo identity.
4. Attacker gets access to the Dropbox account associated with that email address.<p>Dropbox says it has since expired all sessions authenticated through Lenovo ID and removed the Lenovo link from my account. It also says Lenovo authentication can no longer be used for the account without first entering the Dropbox password.<p>I’ve searched for a public disclosure from Dropbox or Lenovo and haven’t found one yet.<p>Has anyone else received the same notice, or seen any public information about this vulnerability?<p>I’m particularly interested in knowing how broadly the Lenovo ID login mechanism was available and how many Dropbox accounts may have been affected.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49514427) · **Category:** ask-hn · **Tags:** Ask HN,Problem
