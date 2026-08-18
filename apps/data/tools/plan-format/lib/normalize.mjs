/**
 * HTML → display text, and text hygiene for plan documents.
 *
 * This is the authoritative copy. `apps/plans-explorer/app/scripts/build-index.mjs`
 * carries an equivalent pipeline on purpose: it is the reader's safety net for
 * plans that have not been formatted yet, and the app is a standalone npm package
 * that must build without reaching up into tools/. Once every plan is web-ready the
 * indexer's copy becomes redundant rather than load-bearing — delete it then, not
 * before.
 */

const NAMED_ENTITIES = {
  amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: ' ',
  hellip: '…', mdash: '—', ndash: '–', minus: '−',
  lsquo: '‘', rsquo: '’', sbquo: '‚',
  ldquo: '“', rdquo: '”', bdquo: '„',
  laquo: '«', raquo: '»', deg: '°', middot: '·', bull: '•',
  euro: '€', pound: '£', yen: '¥', cent: '¢', copy: '©', reg: '®', trade: '™',
  eacute: 'é', egrave: 'è', agrave: 'à', ccedil: 'ç', ntilde: 'ñ',
  aacute: 'á', iacute: 'í', oacute: 'ó', uacute: 'ú', uuml: 'ü', ouml: 'ö', auml: 'ä',
};

const ENTITY_RE = /&(?:#[xX]([0-9a-fA-F]+)|#(\d+)|([a-zA-Z][a-zA-Z0-9]{1,31}));/g;
const ZERO_WIDTH_RE = /[​-‍⁠﻿]/g;

/** Bounded at 3: enough for the observed double encoding, cannot spin. */
const MAX_PASSES = 3;

function codePointToChar(cp) {
  if (!Number.isFinite(cp) || cp <= 0 || cp > 0x10ffff) return null;
  if (cp >= 0xd800 && cp <= 0xdfff) return null;
  try {
    return String.fromCodePoint(cp);
  } catch {
    return null;
  }
}

function decodePass(text) {
  return text.replace(ENTITY_RE, (match, hex, dec, name) => {
    if (hex !== undefined) return codePointToChar(parseInt(hex, 16)) ?? match;
    if (dec !== undefined) return codePointToChar(parseInt(dec, 10)) ?? match;
    const mapped = NAMED_ENTITIES[name.toLowerCase()];
    return mapped === undefined ? match : mapped;
  });
}

function stripMarkup(text) {
  return text
    // Reddit wraps bodies in <!-- SC_OFF --> / <!-- SC_ON -->; comments first, or
    // their contents survive as text.
    .replace(/<!--[\s\S]*?-->/g, ' ')
    .replace(/<br\s*\/?>/gi, ' ')
    // Closing block tags become a space: `<p>a</p><p>b</p>` is "a b", never "ab".
    .replace(/<\/(?:p|div|li|tr|td|h[1-6]|blockquote|pre)>/gi, ' ')
    // A tag name starts with a letter, and no tag spans a line break. `[^>]+` matched both,
    // so prose using `<` as "less than" was eaten up to the next `>` ANYWHERE in the document
    // — including a markdown blockquote marker lines below. A title reading
    // "$1.8K revenue in 3.5 months, <$45/month in costs" lost everything from `<` through the
    // following `> ` quote marker and swallowed the paragraph after it. 39 plans in the corpus
    // use `<` this way, so this deleted authored text on every format run over them.
    .replace(/<\/?[a-zA-Z][^>\n]*>/g, '');
}

/**
 * Decode AND strip, alternating to a fixed point. Two corpus facts force the loop:
 *
 *  1. Entities are mixed-depth — `&amp;#39;` sits beside single-encoded `&lt;`, so
 *     one pass leaves half the corpus broken.
 *  2. What the entities encode is itself markup —
 *     `&lt;!-- SC_OFF --&gt;&lt;div class="md"&gt;` — so decoding without stripping
 *     afterwards trades a visible `&#39;` for a visible `<div>`, which is worse.
 */
function decodeAndStrip(input) {
  let out = String(input);
  for (let pass = 0; pass < MAX_PASSES; pass++) {
    const next = stripMarkup(decodePass(out));
    if (next === out) break;
    out = next;
  }
  return out.replace(ZERO_WIDTH_RE, '');
}

/** One-line display text: titles, excerpts. Collapses all whitespace. */
export function htmlToText(input) {
  if (!input) return '';
  return decodeAndStrip(input).replace(/\s+/g, ' ').trim();
}

/**
 * Same conversion for markdown bodies, preserving line structure.
 *
 * Collapsing all whitespace would flatten every heading, list and fence. Fenced code
 * is left completely alone: horizontal runs inside a fence are significant, and
 * collapsing them turns indented code — or an ASCII diagram — into a single line of
 * mush. Only prose between fences is normalised.
 */
export function markdownToText(input) {
  if (!input) return '';
  const decoded = decodeAndStrip(input);
  // Split on fenced blocks, keeping them as delimiters so they pass through verbatim.
  const parts = decoded.split(/(^```[\s\S]*?^```$)/gm);
  const out = parts.map((part, i) =>
    // Odd indices are the captured fences.
    i % 2 === 1
      ? part
      : part.replace(/[^\S\n]+/g, ' ').replace(/ *\n/g, '\n'),
  ).join('');
  return out.replace(/\n{3,}/g, '\n\n').trim();
}

/**
 * Wrap a bare URL longer than `maxChars` as a markdown link with a readable label.
 * A 200-character preview.redd.it link pushed a plan page 285px past a 375px
 * viewport; as a link the label wraps and the href does not participate in layout.
 */
export function linkifyLongUrls(markdown, maxChars = 100) {
  return markdown.replace(/(^|[\s(])(https?:\/\/\S{2,})/g, (whole, lead, url, offset) => {
    /**
     * Leave URLs that are already the href of a markdown link or an image.
     *
     * This line is the one the comment above always promised and never had. The lead class must
     * accept `(` so that a bare URL written inside parentheses still gets wrapped — but `(` is also
     * the character that opens an href, and the only thing telling the two apart is the `]` in front
     * of it. Without the check the function is not idempotent: every run wraps the link the previous
     * run wrote, nesting the label inside itself one level deeper each time. It cost the corpus 253
     * links across 43 files, the worst of them eight levels deep.
     */
    if (lead === '(' && markdown[offset - 1] === ']') return whole;
    if (url.length <= maxChars) return whole;
    const trailing = url.match(/[).,;!?]+$/)?.[0] ?? '';
    const clean = trailing ? url.slice(0, -trailing.length) : url;
    let label;
    try {
      const u = new URL(clean);
      label = u.hostname.replace(/^www\./, '') + (u.pathname !== '/' ? u.pathname.slice(0, 24) : '');
    } catch {
      label = clean.slice(0, 32);
    }
    return `${lead}[${label}…](${clean})${trailing}`;
  });
}

/**
 * Collapse a link that `linkifyLongUrls` wrapped more than once back to a single link.
 *
 * Damage shape, one `[label](` per run and one `)` to match:
 *
 *     [preview.redd.it/x.png…]([preview.redd.it/x.png…]([preview.redd.it/x.png…](https://preview.redd.it/x.png)))
 *
 * The outermost label is the one to keep — every run produced the same label from the same URL, so
 * they are interchangeable, and taking the first avoids caring how deep it went.
 *
 * Closing parens are counted rather than trimmed with `)+`, because a link written inside parentheses
 * ends with one paren that belongs to the sentence, not to the link. Anything beyond the openers is
 * put back.
 *
 * A single, healthy link matches this shape too, with one opener — it is returned untouched, which is
 * what makes the pass safe to run over the whole corpus.
 */
export function unnestLinks(markdown) {
  return markdown.replace(
    /(?:\[[^\]\n]*\]\()+https?:\/\/[^)\s]+\)+/g,
    (whole) => {
      const openers = whole.match(/\[[^\]\n]*\]\(/g) ?? [];
      if (openers.length < 2) return whole;

      const label = openers[0].slice(1, -2);
      const url = whole.match(/(https?:\/\/[^)\s]+)/)[1];
      const surplus = (whole.match(/\)+$/)?.[0].length ?? 0) - openers.length;

      return `[${label}](${url})` + ')'.repeat(Math.max(0, surplus));
    },
  );
}

export const HYGIENE = { ENTITY_RE, ZERO_WIDTH_RE };

/** True when the text still holds anything the reader would render as markup. */
export function hasMarkup(text) {
  return /<!--|<\/?[a-zA-Z][a-zA-Z0-9]*(?:\s|>|\/)/.test(text);
}

export function hasEntities(text) {
  return /&#\d+;|&#x[0-9a-fA-F]+;|&[a-zA-Z]{2,8};/.test(text);
}

export function hasZeroWidth(text) {
  return /[​-‍⁠﻿]/.test(text);
}
