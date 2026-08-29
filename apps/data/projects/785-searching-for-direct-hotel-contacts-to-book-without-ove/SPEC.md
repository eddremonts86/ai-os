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

## Problem

The poster searches for direct contacts at hotels — front desk, reservations, sales — in order to book a room without paying the markup that online aggregators add. The post quotes the poster's own figure for that markup: 15-30%, which is the lever that makes the search worth doing in the first place. Booking through the hotel directly has been possible in principle forever; the problem is that finding the right contact for a specific property, in a specific city, on a specific date, without bouncing through five web pages that all want a commission is hard enough that most travellers give up and pay the markup.

The capture is a one-line ProblemHunt problem statement with the country UK as its only extra detail. The title carries the rest: the actor is a traveller who would rather not pay the aggregator markup, the pain is the friction of finding the right hotel phone number or email, and the missing thing is a focused tool that turns "I want this hotel on these dates" into a contact-able reservation or sales person. The poster names no volume, no specific chain, and no preferred channel beyond the implication that direct contact is the goal. Without more material from the poster we cannot claim a typical user profile or a budget per booking; the figure the poster did name — 15-30% markup — is the only concrete number and we are quoting it exactly.

The implied hard parts are accuracy and trust. A tool that returns stale phone numbers or generic contact forms is no better than what Google already gives. The interesting design work is therefore in verification: which contact method is actually answered, which hotels reply fastest, and which properties respond differently to a polite email than to a phone call. Distribution is the second hard part, since the value is only real once the traveller trusts the tool enough to use it instead of an aggregator in the moment of booking.

## Objective

Ship a UK-first directory that turns a hotel name, a city or a postcode into the most direct contact method available for that property — phone, reservations email, sales email, WhatsApp, or a verified booking link — together with the cost the traveller would save relative to the same night on the dominant aggregators. The capture is rich enough to fix a verification standard: every contact is verified, every saving is computed from a comparable aggregator quote, and the project does not pretend to be a booking site itself.

## Target Users

- Independent travellers who would rather call or email the hotel directly than pay aggregator markups and recognise the poster's stated 15-30% figure as the cost of giving up.
- Small-business bookers arranging a handful of nights for a team, for whom the per-night saving compounds fast and for whom a single wrong number costs more than the subscription would.
- Travel arrangers for weddings, family gatherings and club trips where the group size justifies the extra effort of going direct.
- Travellers who want to negotiate — direct contact is the only way to ask for a better rate or a room upgrade, and the directory is the entry point for that conversation.
- Returning users who have used the directory once and want to know which properties on a saved shortlist answer quickly and which do not.

## MVP Scope

- UK-first hotel index sourced from a public listings feed plus SerpAPI lookups for properties the public feed does not cover.
- Per-property contact cards with a verified phone number, a reservations email, a sales email where one exists, and a WhatsApp link where the property publishes one.
- Aggregator-comparable price snapshot for the same night on the dominant UK aggregators, computed for the user's chosen dates and used to display the saving the user would make by going direct.
- Outbound email helper built on Resend that drafts a reservations enquiry the user can edit and send from their own mailbox, with the property's reply routed back through the tool so the conversation is captured.
- A contact-confidence score per property that combines date-of-last-verification, channel reply rate where known and the share of channels confirmed by an independent caller test on a rolling sample.
- Stripe Checkout for a small monthly subscription that unlocks the contact cards, the price comparison and the outbound email helper for more than a few searches per month.
- Manual editorial override so the team can flag a property whose contact has changed and surface that change ahead of the next automated verification.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The directory is verification-first: no property is listed without a verified direct contact, and the verification date is shown on every card.
- The 15-30% saving figure in the capture is the poster's own number; the product quotes it as a starting range and recomputes the actual saving against a live aggregator quote for the user's dates rather than asserting that range is always true.
- The product does not handle payments and does not pretend to be a booking site; it ends at the moment of contact, and the booking happens between the traveller and the property.
- GDPR applies because the user and the property are both UK-located, so contact data, outbound logs and reply captures have a documented retention and deletion path.
- No property's contact details are sold or shared with third-party affiliates; the directory's business model is the subscription, not a referral fee.
- The MVP is UK-first, not UK-only; properties outside the UK can be added later once the verification process holds up at scale in one country.
