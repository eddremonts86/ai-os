# The slop catalog

Patterns that make an interface read as machine-generated or unconsidered. None of them is wrong in
every context — they are wrong when they appear *by default*, with no relation to the brand or to the
work the user is doing.

## Tier 1 — the three giveaways

### 1. Emojis used as functional iconography

Emojis render differently per OS, carry inconsistent visual weight, and never form a coherent family.

- Replace every emoji that represents navigation, state or an action with one icon family.
- Keep size, stroke weight and alignment consistent.
- Add accessible text when the meaning is not obvious from the glyph.
- Emojis are acceptable only as deliberate conversational tone for a brand that owns that voice —
  never on critical controls.

### 2. Colour without function

If each card gets a different colour "to make it interesting", the hierarchy is gone.

- Build a neutral base, pick one brand colour, define stable semantic colours.
- Never let a decorative colour compete with the primary-action colour.
- Same colour, same meaning, everywhere.

### 3. Repeated data

An interface gains nothing by showing the same figure four times. A KPI in a card, a chart, a table
and a banner is noise, not thoroughness.

- For each datum, name the question it answers.
- Keep one primary representation.
- Add a second only when it enables comparison, diagnosis or action.
- Delete metric cards that change no decision.

## Tier 2 — patterns that need justification

Audit each of these; keep it only if someone can name the job it does:

- Purple or cyan gradients as a universal solution
- Glows or halos around every CTA
- Glassmorphism on surfaces that need legibility
- Rounded cards inside rounded cards
- Three identical cards for any group of features
- Fake avatars, notifications, charts or activity feeds
- `AI` / `Live` / `New` / `Pro` badges that change no decision
- Grandiose headlines inside an operational tool
- Entrance animations on everything
- Multicolour icons pulled from different icon sets
- Copy so generic it could belong to any SaaS

## Tier 3 — the deletion test

For every effect, ask: **remove it — is the product equally clear or clearer?** If yes, it was
decoration. Ship without it.

## Removal checklist

- [ ] No emojis as controls or critical icons
- [ ] No colours without semantic or brand function
- [ ] No default gradients or glows
- [ ] No glassmorphism that reduces legibility
- [ ] No cards inside cards without a structural reason
- [ ] No invented or duplicated data
- [ ] No decorative charts
- [ ] No badges that change no decision
- [ ] No multiple primary CTAs
- [ ] No mixed icon families
- [ ] No blanket entrance animation
- [ ] No copy that could belong to any other product
