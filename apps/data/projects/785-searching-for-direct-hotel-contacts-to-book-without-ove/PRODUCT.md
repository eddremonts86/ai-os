---
id: "785"
slug: searching-for-direct-hotel-contacts-to-book-without-ove
title: "Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/travel/kymbn6kp61-searching-for-direct-hotel-contacts-to-b"
category: travel
date: "2026-01-19"
tags: [Travel, AI, Other]
country: UK
tech: [Next.js (App Router), TypeScript, Postgres, SerpAPI, Resend, Stripe Checkout, Vercel]
---
# Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Booking through an aggregator is convenient and the markup is real. The poster names the markup as 15-30%, which is the gap between the price a property would accept and the price most travellers end up paying because the friction of finding the right direct contact is too high to bother with. The directory closes that gap by turning a hotel name, a city or a postcode into a verified direct contact plus a comparable price snapshot.

The product does not try to be a booking site. Its job is to end well at the moment of contact: a phone number the user can dial, an email the user can edit and send, a WhatsApp link for properties that prefer messaging. The comparison is shown as a saving against the same night on the dominant aggregators, computed for the user's actual dates. A small subscription unlocks the contact cards and the outbound helper; the directory is paid by the traveller, not by the property, so the contact it surfaces is genuinely the cheapest path.

**One-liner:** A UK-first directory of verified direct hotel contacts with a comparable aggregator price per night, so travellers stop paying the 15-30% markup because the friction of going direct was too high.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Independent travellers | They recognise the poster's 15-30% figure as the cost of giving up and want a tool that makes the direct route easier than the aggregator route. |
| Small-business bookers | A team of four paying £120/night through an aggregator is paying £36/night extra; a subscription that finds the direct contact pays for itself on a single trip. |
| Group and event arrangers | Wedding blocks, family reunions and club weekends justify the effort of direct contact and the directory makes that effort one search instead of twenty phone calls. |
| Travellers who want to negotiate | Direct contact is the only path to a better rate or an upgrade; the directory is the entry point to that conversation. |
| Returning users | A saved shortlist with reply-rate signals turns the directory into the place the user checks before they book anywhere. |

## Jobs To Be Done

1. **Functional job** — Find a verified direct contact for a specific hotel on specific dates without bouncing through five commission-paying websites.
2. **Functional job** — See what the same night would cost through an aggregator so the saving from going direct is concrete rather than guessed.
3. **Functional job** — Send a short, polite enquiry to the property from the user's own mailbox rather than a contact form that goes nowhere.
4. **Emotional job** — Stop feeling like the price on screen was inflated by a middleman the user never asked for.
5. **Social job** — Be the person in the group chat who already has the direct number for the wedding venue.

## Success Metrics

- **Verification freshness** — share of listings whose phone, email or WhatsApp was confirmed inside the last 30 days. Verification is the product, so this is the headline number.
- **Outbound reply rate** — share of Resend-sent enquiries that produce a property reply inside 48 hours, tracked at the property level so the score updates over time.
- **Stated saving per booking** — median quoted saving per booking against the comparable aggregator price for the same night, which is the figure the poster named as 15-30% and the metric that justifies the subscription.
- **Aggregator-fallback rate** — share of searches that returned a verified direct contact and the user proceeded to contact the property, as opposed to giving up and booking via an aggregator anyway.
- **Subscription renewal** — paying users who stay past the first renewal, since the value is only real if the user comes back next trip.
- **Editorial override load** — flags raised per week by the team, which signals whether automated verification is keeping up with reality.

## Pricing & Monetization

The post names no price, no tier and no business model; it is a one-line ProblemHunt problem statement from the UK. The architecture forces a particular cost shape nonetheless: outbound email volume scales with searches, comparable aggregator price lookups scale with date-specific quotes, and verification labour scales with the size of the property index. Any paid tier would therefore have to be bounded by monthly searches, by monthly verified-contact unlocks, or by a flat subscription for a small set of frequent travellers, not by a per-booking referral fee — because taking a referral from an aggregator would recreate the very markup the product exists to avoid.

A small Stripe Checkout subscription is the shape the architecture suggests; the post names no figure, so no figure is claimed here.

## Competitive Landscape

- Generic search engines — return contact pages but not always verified contact cards, and never show the aggregator comparison the user needs to justify going direct.
- Aggregator booking sites — solve the convenience problem and are the reason the poster's stated 15-30% markup exists; they are the comparison point, not the competition.
- Hotel-chain direct-booking sites — work for the chains that run them and not for independent properties or small groups, which is the long tail the directory is built for.

The post names no competitor, so the listing above is scoped to channels a traveller might compare against and is not a full market map.

## Risks & Open Questions

- [ ] Decide how phone verification is sampled — which properties get an independent test call and how often — so the verification date on every card is honest.
- [ ] Confirm the aggregator price comparison is shown as a saving against the same night on the same room type, not a misleading headline.
- [ ] Establish a deletion path for property managers who ask to be removed or to update their contact, since the directory's accuracy is its only asset.
- [ ] Verify the Resend outbound helper preserves the user's reply routing across providers so the conversation is not silently captured.
- [ ] Test the WhatsApp link flow on properties that publish a number but do not answer outside business hours, since the directory cannot promise a reply.
- [ ] Decide what happens to a card when verification has lapsed: hide it, mark it as unverified, or take it down until it can be re-checked.
