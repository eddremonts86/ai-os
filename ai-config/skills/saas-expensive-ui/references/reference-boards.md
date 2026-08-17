# The reference-screenshot workflow

The goal is never to copy a screen. It is to study specific decisions and extract rules you can
reuse.

## Step 1 — pick one flow

High-impact candidates: signup and activation · first dashboard · creating the main object ·
reviewing results · configuring an integration · team management · upgrade or payment.

One flow at a time. A board that mixes navigation, landing, dashboard and checkout inspiration
teaches nothing.

## Step 2 — gather 10–20 references

Prioritise:

- Products with comparable users and comparable constraints
- Real product states, not marketing shots
- Desktop and mobile where both matter
- Loading, empty, error and permission states
- Comparable data density

## Step 3 — decompose each reference

Note, for every screenshot:

- The screen's goal
- The hierarchy
- Where the primary action sits
- Density
- Navigation model
- Use of colour
- How data is presented
- How feedback is given
- What works
- What would *not* fit your product, and why

## Step 4 — one board per flow

Separate boards, separate questions. Cross-contamination is how products end up incoherent.

## Step 5 — extract rules, not pixels

Good extracted rules look like this:

- "The primary action stays pinned for the whole flow."
- "Advanced filters open on demand."
- "The table leads with state, name, next action."
- "The empty state ships a realistic sample."
- "Errors appear next to the field and preserve the entered data."

## Step 6 — design against real data

Test every candidate with: long names · zeros · thousands of rows · extreme values · restricted
permissions · disconnected integrations · partial states · stale data · translated content.

## Step 7 — review against a rubric

Never accept an output because it "looks good". Score it on clarity, hierarchy, consistency, speed,
accessibility, states, trust, and alignment with the user's job. Use `saas-ui-audit` for the matrix.
