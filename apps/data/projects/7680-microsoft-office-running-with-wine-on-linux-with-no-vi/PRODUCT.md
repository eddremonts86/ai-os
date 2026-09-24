# PRODUCT.md — Microsoft Office running with Wine on Linux with no virtualization

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Microsoft Office famously hasn&#x27;t worked well with Wine since Office 2007.  There are lots of solutions out there to work around this, but all of them involve fairly heavy virtualization.<p>Multiple people have told me that their biggest hangup for switching to Linux from Windows is the lack of the desktop version of Microsoft Office, and they don&#x27;t want to run a VM to get around it.<p>I recently fell into a bunch of free time with a Claude Max subscription, so I got Fable to hack at this until it worked! And with this, we have Microsoft Office running on Linux, with no Windows in sight!<p>I can&#x27;t promise that this will work on everyone&#x27;s computer, <i>but</i> I did put this all in Nix Flakes, so ideally it should be relatively reproducible on any Linux system with the Nix package manager and Flakes enabled. Also, it does <i>not</i> work very well with X, but Wayland appears to work fine.<p>This is not warez.  You need a valid license for Office 365 for this to work.  You also need to register <i>on Microsoft&#x27;s website in a browser</i>; the flow for registering in the app proved to be tricky and not worth pursuing.<p>This is more proof of concept than anything else; I have no doubt that there are bugs and improvements to be made. I have only tested this with NixOS on Sway and KDE, and as stated it only really works with Wayland and the absolute latest GE-Proton, but I believe it would work fine with Gnome or any other Wayland desktop.<p>Full disclosure, Claude Code with Fable did the vast <i>vast</i> majority of the work on this.  I ended up primarily just reading log messages and complaining back to it.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49746401) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
