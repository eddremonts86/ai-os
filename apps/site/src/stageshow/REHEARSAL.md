# Rehearsal: hero install demo

`InstallDemo.tsx` is the landing hero's product demo, built with the Stageshow skill
(`ai-config/skills/stageshow`, v1.1.1). `kit/` holds only the 24 kit files it imports, copied
unmodified from the skill (MIT, `kit/LICENSE`).

## Gold and changes

- **Copied from** `examples/dark-hero`: a dark surface a step above the page, one lit color, a
  status that changes on its own pill (`Mark` and `Label` are its spinner/dot cell and
  width-easing word cell).
- **Changed:** the deployments window became a `chrome="terminal"` window with the AI-OS
  command; the list became a satellite card of the six CLIs over the terminal's empty right half;
  brand tokens from `context/global/06_brand.md` (page `#08090e`, acid `#b3ee55` lit only on
  Ready, Space Grotesk and JetBrains Mono).
- **Real strings:** the command, the installer's eight steps with their counts (`stats.json`),
  the six CLIs and Ready. The earlier run above the command repeats the steps dimmed.
- **Compact (below 480 px):** the card keeps only its headline and the first three steps are
  left out, so the command stays in view above it.
- **Hero fit:** the figure carries `data-ss-fill`, so the stage grows past 600 px to its column.

## Checked

- `film.mjs --gate` in the skill playground (looping version) at 1280 and 390: `rehearsal passed`.
  The loop seam (an earlier run on screen that scrolls away, so the last screen equals the
  first) was rehearsed there; the page plays it once and holds Ready, so the landing goes idle
  (`src/__tests__/renders.test.tsx`).
- `film.mjs --gate` on the running site (`#top figure`) at 1440 and 390: `rehearsal passed`.
- Loaded lazily (`App.tsx`) so first-load JS+CSS stays inside the e2e gzip budget; the fallback
  holds the 600x380 box.
- Tailwind's preflight is in `@layer base`; `index.css` declares `stageshow` above it so the
  kit keeps its padding.

## Not checked

- No fresh-eye review by a second agent (`references/review.md`).
- Remaining advisory film lines: the top line clipped under the screen's fade mask (deliberate
  scroll), and the caret moving while typing.
