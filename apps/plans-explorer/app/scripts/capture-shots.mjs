#!/usr/bin/env node
/**
 * Capture the real product screenshots the landing page uses.
 *
 * The landing promotes three live products, so it shows the three actual products. Hand-built
 * "product previews" made of styled divs are the single clearest tell of a generated page, and
 * a fake preview of a real thing is worse than no preview at all.
 *
 * Re-run after a UI change so the landing does not advertise a version that no longer exists:
 *
 *   node scripts/capture-shots.mjs [--explorer http://localhost:3020]
 *
 * Needs the explorer running locally for its own three shots; the two external ones are public.
 */

import { mkdirSync, rmSync, existsSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const APP = dirname(dirname(fileURLToPath(import.meta.url)));
const OUT = join(APP, 'public', 'img');

// Playwright is a dependency of the scraper, not of this app: it is a heavy install and only
// this dev-only script needs it here. Resolved relative to the repo so the path is not one
// machine's home directory baked into a committed file.
const PW = resolve(APP, '..', '..', 'data', 'tools', 'problemhunt-scraper', 'node_modules', 'playwright', 'index.mjs');
if (!existsSync(PW)) {
  console.error(`[shots] playwright not found at ${PW}\n        run: npm --prefix apps/data/tools/problemhunt-scraper install`);
  process.exit(2);
}
const { chromium } = await import(pathToFileURL(PW).href);

const argv = process.argv.slice(2);
const val = (f, d) => { const i = argv.indexOf(f); return i === -1 ? d : argv[i + 1]; };
const EXPLORER = (val('--explorer', 'http://localhost:3020') || '').replace(/\/$/, '');

const SHOTS = [
  // '/#/plans', not '/#/': the landing owns '/' now, and pointing this at the root made the
  // hero image a screenshot of the hero it sits in.
  { name: 'shot-explorer.png', url: `${EXPLORER}/#/plans`, wait: 2600, h: 820 },
  { name: 'shot-plan.png', url: `${EXPLORER}/#/plans/004`, wait: 2600, h: 820 },
  // The two external ones are cropped to the hero: it is the part worth showing, and it sits
  // above the consent dialog. The dialog is hidden rather than dismissed — clicking a consent
  // control to tidy a screenshot is answering a question that was not ours to answer.
  { name: 'shot-builderhunt.png', url: 'https://builderhunt.dev', wait: 3200, h: 660 },
  // HunterReady opens straight onto step 1 of its wizard rather than a marketing hero, and
  // its content starts 383px down. Clipped to the step itself; from y=0 the frame was three
  // quarters white space and read as a broken image rather than as a product. The two cells
  // are normalised to one aspect ratio in CSS, so these crops need not match.
  { name: 'shot-hunterready.png', url: 'https://hunterready.eduardoinerarte.dk', wait: 3200, y: 340, h: 520 },
];

// Fixed overlays (consent dialogs, chat bubbles, banners) are page furniture, not product, and
// they date a screenshot the moment the site changes them.
const HIDE_OVERLAYS = `
  [class*="cookie" i], [id*="cookie" i],
  [class*="consent" i], [id*="consent" i],
  [aria-label*="cookie" i], [role="dialog"][class*="banner" i] {
    display: none !important;
  }
`;

mkdirSync(OUT, { recursive: true });

const browser = await chromium.launch();
const ctx = await browser.newContext({
  viewport: { width: 1440, height: 900 },
  // 1.5 rather than 2: these are decorative product shots inside a rounded frame, and at 2x
  // each one lands around a megabyte, which is a poor trade for a hero image.
  deviceScaleFactor: 1.5,
  colorScheme: 'dark',
  // Do not animate on capture: entry transitions caught mid-flight produce half-faded
  // screenshots, which is exactly how the first pass at this produced a blank hero.
  reducedMotion: 'reduce',
});

let ok = 0;
for (const s of SHOTS) {
  const page = await ctx.newPage();
  try {
    await page.goto(s.url, { waitUntil: 'networkidle', timeout: 45_000 });
    // Hash routing does not re-navigate, so give the SPA a beat to render the route.
    await page.waitForTimeout(s.wait);
    await page.addStyleTag({ content: HIDE_OVERLAYS });
    await page.screenshot({
      path: join(OUT, s.name),
      clip: { x: 0, y: s.y ?? 0, width: 1440, height: s.h },
    });
    console.log(`[shots] ${s.name}  ←  ${s.url}`);
    ok++;
  } catch (err) {
    console.error(`[shots] FAILED ${s.name} (${s.url}): ${err.message}`);
  } finally {
    await page.close();
  }
}

await browser.close();

// PNG screenshots of a dark UI run ~400KB each; five of them is nearly 2MB of hero payload and
// an LCP the page cannot recover from. WebP at q82 is visually identical here and ~8x smaller.
// The PNGs are intermediates, so they do not survive.
let converted = 0;
for (const s of SHOTS) {
  const png = join(OUT, s.name);
  const webp = png.replace(/\.png$/, '.webp');
  try {
    execFileSync('cwebp', ['-quiet', '-q', '82', png, '-o', webp]);
    rmSync(png);
    converted++;
  } catch (err) {
    console.error(`[shots] cwebp failed for ${s.name} (${err.message}) — keeping the PNG`);
  }
}

console.log(`[shots] ${ok}/${SHOTS.length} captured, ${converted} converted to webp in public/img/`);
process.exit(ok === SHOTS.length ? 0 : 1);
