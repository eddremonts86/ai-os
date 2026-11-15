---
name: aios-ui-themes
description: Browse, deal and apply Hallmark's 50 design themes (paper, type, colour, surfaces) - list them, deal three for a brief with pictures, show one, apply its tokens to a project, or lock a system into DESIGN.md. Explicit invocation, /aios-ui-themes [list | deal "<brief>" | show <slug> | apply <slug> | lock].
disable-model-invocation: true
---

# aios-ui-themes

`H=$AI_OS_ROOT/ai-config/skills/aios-ui-verify/scripts/hallmark.sh`; theme files are in
`$AI_OS_ROOT/ai-config/skills/hallmark/references/themes/` (`<slug>.md` and `<slug>.jpg`).

- **list:** `$H theme list` (slug, axes paper/display/accent, genre, one line).
- **deal "<brief>":** pick the genre from the brief (Hallmark `SKILL.md` § 1: atmospheric, modern-minimal,
  playful, else editorial), then `$H theme deal --genre <g> --prompt "<brief>" [--n 3] [--reroll 1]`. Look at the
  three pictures, send them to the user (they often follow from the phone), say which fits and why.
- **show <slug>:** read `<slug>.md` and look at `<slug>.jpg`; summarise palette, type, surfaces and its Range.
- **apply <slug>:** `$H theme scaffold <slug> --dir <beside the project's stylesheet>` writes `tokens.css` and
  `base.css`; then map the tokens onto the project's own names (shadcn's `--background`, `--primary`... per
  `references/export-formats.md`) instead of adding a second system, check contrast for every text-on-colour
  pair, and run `/aios-ui-verify`. The folder's scope brand wins on its own surfaces (`ai-os scope which`):
  apply a theme there only when the user asks.
- **lock:** write the project's `DESIGN.md` from the applied or chosen theme (`references/design-md.md`), so
  later builds (Hallmark's pre-flight, `/aios-ui-design`) share it.
- **check:** for a palette of your own, `$H theme check --axes "<paper>/<display>/<accent>" --face "<face>"`
  says how close it sits to the themes and to recent builds.

Fonts in themes load from Google Fonts or Fontshare: say so when applying, and self-host them for anything that ships.
