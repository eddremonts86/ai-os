# README art

Sources for the images in `docs/images/`, rendered with Playwright from the AI-OS venv. Brand tokens and fonts:
`context/global/06_brand.md`; copy `space-grotesk-latin-wght-normal.woff2` and
`jetbrains-mono-latin-wght-normal.woff2` from `apps/site/node_modules/@fontsource-variable/*/files/` beside the HTML first.

- `hero.html` → `readme-hero-dark.png`, and with `class="light"` on `<body>` → `readme-hero-light.png`:
  `~/.ai-os/venv/bin/python render.py . hero-dark.png:hero.html:1280:440 hero-light.png:hero.html:1280:440:light`
- `term.tpl` → `installer-*.png`: real terminal output of the create-ai-os selector (recorded in a pty with
  `--dry-run`), substituted for `__S__` as JSON `{state: bytes}`, then `python shot.py . <out.png> "<state>#rows=27"`.

The hero has no counts in it on purpose: numbers live in text, where `ai-os stats --check` keeps them true.
