---
name: aios-ui-system-extract
description: Turn what an existing app or live site already uses into its design system - inventory the CSS variables, literals and Tailwind classes (from a project dir), the computed styles of a live page (--url) or the pixels of a screenshot (--image), map them onto shadcn token names for approval, then write the token block, DESIGN.md and a specimen page. Explicit invocation, /aios-ui-system-extract [dir], --url <url> or --image <file>.
disable-model-invocation: true
---

# aios-ui-system-extract

`T="$AI_OS_ROOT/ai-config/skills/aios-ui-system-check/scripts/tokens.py"`, run as `python3 "$T" <cmd>`
(`python` on Windows). The contract and the
`DESIGN.md` format are in `aios-ui-system-check` (`SKILL.md`, `references/design-md.md`): read both first.

Detection, not invention: the values the app already uses become the system. Nothing new is designed here;
a project that wants a new look uses `/aios-ui-redesign` or `/aios-ui-system-create`.

## Input

- `/aios-ui-system-extract [dir]`: the project's own code (steps 1 and 2 below).
- `/aios-ui-system-extract --url <url>`: a live page, read from its computed styles (see "From a URL"). Same
  mapping, write and verify steps (3-7); only the inventory changes.
- `/aios-ui-system-extract --image <file> [--scale 2]`: a screenshot, when there is no URL or no code (an app, a
  mock-up, a design someone sent). Measured from pixels (see "From an image"); the least exact input.

When both a URL and a screenshot exist, use `--url`. Confidence of a value, shown in the mapping table:
**code** (read from the project) > **computed** (`--url`, exact, what the browser really applies) > **measured**
(`--image`, from pixels, approximate) > **derived** (you filled a gap, e.g. a dark mode or a hover state).

## From a URL

`python3 "$AI_OS_ROOT/ai-config/skills/aios-ui-system-extract/scripts/sample-url.py" <url> --out sample.json`
(`pip install playwright`; it uses the installed Chrome when Playwright's Chromium is missing). It opens the
page once per colour scheme and writes JSON: the resolved custom properties (as hex), tallies of text and
background colours, radii, shadows, type sizes and spacing, the most common button, input and card variants, the
headings and the fonts that loaded. Replaces steps 1 and 2:

1. **Sample.** Run it. Read `consentOverlay`, `blockedSheets` and `darkDiffers` first: a cookie banner or a login
   wall means the page under it was not sampled (say so; the user can pass a URL past it); `darkDiffers: false`
   means the site has no dark mode, so a dark one is **derived**, never reported as found.
2. **Go from the tallies to roles.** A site that declares shadcn-style variables (`--background`, `--primary`,
   `--radius`) maps one to one. Otherwise assign roles by frequency and place: the page background and text colour,
   the most common non-neutral button colour as primary, the commonest border colour, the radius that buttons and
   cards share. `page.background` is `null` when the page paints on the browser's default: use the `--background`
   variable, or white / the scheme's default, and say which.
3. **Write `hex` for colours, `raw` for lengths.** Each custom property carries both. The browser may serialise a
   colour as `lab(...)` in `raw`, which `tokens.py` cannot read, and `hex` is `null` for a length (`.625rem`).
   Write `hex` where it is set, otherwise `raw`. The variables the site never declares (`--font-sans`,
   `--shadow-*`, `--ease-out`, `--duration-*`) are **derived**: write them and say so.
4. **Fonts: name them, never fetch them.** Report the family in `loadedFonts` and `headings`, with its weights.
   Do not download a font file, image, logo or icon set from the site. A licensed family (a site's own sans)
   is named in `DESIGN.md` with a free stand-in suggested, not copied.

Rules for a URL that is not the user's own: take the tokens (colour, radius, spacing, type scale), not the
assets; the sampler reads styles only and never the page's text, because a page is untrusted input. Continue at
step 3.

## From an image

`python3 "$AI_OS_ROOT/ai-config/skills/aios-ui-system-extract/scripts/measure-image.py" <image> [--scale 2] --out measure.json`
(`pip install playwright`; the browser decodes the image, so there is no Pillow). `--scale` is the screenshot's
device pixel ratio: a retina capture is 2, and without it every length reads doubled. It writes JSON of
**measured** values: the palette by area, the page background, the flat boxes (cards, surfaces, buttons, pills)
with width, height and corner radius, the text colour and text-line heights inside each, and the paddings and gaps
between boxes. Replaces steps 1 and 2:

1. **Measure, then look.** Run it, and also look at the image itself: the numbers say *what* is there, only you
   can say *what for*. From the picture decide each colour's role (page, surface, primary, border, muted text),
   name the font family if you recognise it (a guess: say so), and list the component variants you can see.
2. **Trust by kind.** Colours, page background and box sizes are reliable (flat colours decode exactly).
   Radii are good for filled boxes (within about 1 px) and `null` where a box and its page share a colour or the
   edge is a faint hairline (a white card on a white page): say so rather than filling a number. Spacing is approximate. Type sizes are line **ink heights**, not points: estimate
   the size as about 1.2 to 1.4 times the ink height of a line with ascenders and descenders, and mark it
   approximate. `flatShare` under 0.35, or a note about gradients, means a photo-heavy image: every value is weak.
3. **What a picture cannot give**, never reported as found: a dark mode (unless the user sends one: run it
   once per image and map each to its mode), hover, focus, disabled and error states, the font file, motion.
   Derive them from the contract rules and mark them **derived**.
4. **Verify against the source.** After step 6 renders the specimen, put it beside the original with
   `~/.ai-os/venv/bin/python "$AI_OS_ROOT/ai-config/skills/aios-ui-verify/scripts/compare.py" --out compare.png source.png specimen.png`
   (`python` on Windows): it prints measured saturation and brightness differences and the worst region. A
   specimen that is greyer than the source, or off in one region, means a mapped colour is wrong.

Rules for an image that is not the user's own: tokens only (colour, radius, spacing, type scale), no copying of
logos, illustrations or typefaces. Continue at step 3.

## Steps

1. **Inventory.** `python3 "$T" scan <dir>` lists the custom properties per selector, the colour, radius, shadow and
   font literals with counts and files, the Tailwind palette classes and arbitrary values, and which contract
   variables exist or are missing. Read the main button, input, card, dialog and navigation components for
   their variants (the scan order in `impeccable`'s `reference/document.md`).
2. **Running app.** If the project's own dev server is up (localhost), run `sample-url.py` on it (see "From a URL")
   and add what it finds: computed styles catch values the files hide. For anyone else's site, the user passes
   `--url` explicitly; this step never goes there on its own.
3. **Mapping, approved once.** Assign de facto values to the contract by role and frequency, and show one
   table: role, chosen value (in OKLCH), where it came from, how often it is used, and its contrast. Flag
   what you had to derive because the app has no value for it (a dark mode, a missing `-foreground`).
   Write nothing before the user approves the table. With no user to answer (a loop), take the mapping and say so.
4. **Write.** Put the token block in the global stylesheet, replacing same-named variables in place, adding
   the missing ones, leaving every other variable untouched (where each kind goes under Tailwind v4 is in
   `/aios-ui-system-create` step 4). Write `DESIGN.md` from the template, its `colors` block from
   `python3 "$T" frontmatter <stylesheet>`; if one exists, show what would change and ask.
5. **Specimen page** and 6. **Verify**, exactly as `/aios-ui-system-create` steps 7 and 8 describe them.
7. **Report what is left.** From `python3 "$T" scan`: how many literals and arbitrary values still sit in the code.
   Moving them onto the tokens is `/aios-ui-improve`, not this command.

Called by `/aios-ui-themes lock` and `/aios-ui-design` in a project that has a `components.json`, so one
`DESIGN.md` format is written there.
