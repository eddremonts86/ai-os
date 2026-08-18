/**
 * Read the pre-schema plan shape so `format` can migrate it faithfully.
 *
 * The patterns here are deliberately the same ones
 * `apps/plans-explorer/app/scripts/build-index.mjs` uses today. Migration must extract
 * exactly what the web currently shows, otherwise the format command silently
 * changes the site's data while claiming to only restructure it.
 */

import { htmlToText, markdownToText } from './normalize.mjs';

/** Spanish → schema heading map. The old docs were authored in Spanish. */
export const HEADING_MAP = {
  'Problema Detectado': 'Problem',
  'Objetivo Principal': 'Objective',
  'Usuarios Objetivo': 'Target Users',
  'Alcance MVP': 'MVP Scope',
  'Constraints': 'Constraints',
  'Design Direction': 'Design Direction',
  'Tech Stack Propuesta': 'Tech Stack',
  'Arquitectura': 'Architecture',
  'Milestones': 'Milestones',
  'Riesgos': 'Risks',
  'Value Proposition': 'Value Proposition',
  'Target Users': 'Target Users',
  'Jobs To Be Done': 'Jobs To Be Done',
  'Success Metrics (North Star)': 'Success Metrics',
  'Success Metrics': 'Success Metrics',
  'Pricing & Monetization': 'Pricing & Monetization',
  'Competitive Landscape': 'Competitive Landscape',
  'Risks & Open Questions': 'Risks & Open Questions',
  // DESIGN.md subsections. Present in all 552 with Spanish headings; renaming is
  // mechanical and satisfies the repo-wide English rule without touching content.
  'Tipografía': 'Typography',
  'Paleta de colores': 'Colour palette',
  'Componentes': 'Components',
  'Spacing (8px base)': 'Spacing (8px base)',
  'Border radius': 'Border radius',
  "Do's": "Do's",
  "Don'ts": "Don'ts",
};

const KNOWN_CATEGORIES = new Set([
  'validated', 'ai', 'hardware', 'dev', 'no-code', 'freelance', 'design',
  'marketing', 'seo', 'retail', 'finance', 'legal', 'realty', 'travel',
  'immigration', 'career', 'education', 'health', 'food', 'fitness',
  'productivity', 'media', 'social', 'startups', 'logistics',
  'transportation', 'business', 'security', 'psychology', 'agtech', 'other',
]);

export function extractTitle(md, fallback) {
  const m = md.match(/^#\s+(?:SPEC|PRODUCT|PLAN|DESIGN|TASKS)\.md\s*[-—–]\s*(.+)$/m);
  if (m) return htmlToText(m[1]);
  const h1 = md.match(/^#\s+(.+)$/m);
  return h1 ? htmlToText(h1[1]) : fallback;
}

export function extractCategory(specText) {
  const m = specText.match(/\*\*(?:Categoría primaria|Primary category):\*\*\s*([a-z][a-z-]*)/i)
    || specText.match(/\*\*Subreddit:\*\*\s*([A-Za-z][\w-]*)/);
  return m ? m[1].toLowerCase() : 'other';
}

export function extractTags(specText, productText) {
  const out = new Set();
  const re = /\*\*Tags:\*\*\s*([^*\n]+)/gi;
  for (const t of [specText, productText]) {
    if (!t) continue;
    let m;
    while ((m = re.exec(t)) !== null) {
      m[1].split(',').map((s) => s.trim()).filter(Boolean).forEach((x) => out.add(x));
    }
  }
  return [...out];
}

export function extractDate(specText) {
  // `Date` as well as `Fecha`: the scraper emits the English label now, and `date` is a
  // REQUIRED frontmatter field, so recognising only the Spanish one made every freshly
  // scraped plan fail `frontmatter-present` with "missing required: date" — a break that no
  // existing plan could reveal, because all 466 were already migrated.
  const iso = specText.match(/\*\*(?:Fecha|Date):\*\*\s*(\d{4}-\d{2}-\d{2})/);
  if (iso) return iso[1];
  const reddit = specText.match(/\*\*Posted:\*\*\s*(\d{4}-\d{2}-\d{2})/);
  return reddit ? reddit[1] : null;
}

/** Host → the `source.name` the schema allows. The host is the only durable evidence: the prose
 *  label is removed by stripMetadataBlock on the migrating run, so a plan that has already been
 *  formatted has nothing else left to identify where it came from. */
const SOURCE_BY_HOST = [
  [/(^|\.)problemhunt\.pro$/i, 'ProblemHunt'],
  [/(^|\.)reddit\.com$/i, 'Reddit'],
  [/(^|\.)ycombinator\.com$/i, 'HackerNews'],
  [/(^|\.)producthunt\.com$/i, 'ProductHunt'],
  [/(^|\.)indiehackers\.com$/i, 'IndieHackers'],
  [/(^|\.)betalist\.com$/i, 'BetaList'],
];

export function sourceNameForUrl(url) {
  if (!url) return null;
  let host;
  try { host = new URL(url).hostname; } catch { return null; }
  for (const [re, name] of SOURCE_BY_HOST) if (re.test(host)) return name;
  return null;
}

export function extractSource(specText) {
  // The label carries the name directly now: `**Source:** [BetaList](url)`. Reddit keeps its
  // `r/<sub>` suffix, so match it separately and first.
  const rd = specText.match(/\*\*(?:Source|Fuente):\*\*\s*\[(?:Reddit[^\]]*)\]\((https?:\/\/[^)]+)\)/);
  if (rd) return { name: 'Reddit', url: rd[1] };
  const named = specText.match(
    /\*\*(?:Source|Fuente):\*\*\s*\[(ProblemHunt|HackerNews|ProductHunt|IndieHackers|BetaList)\]\((https?:\/\/[^)]+)\)/,
  );
  if (named) return { name: named[1], url: named[2] };
  const any = specText.match(/\*\*(?:Source|Fuente):\*\*\s*\[[^\]]+\]\((https?:\/\/[^)]+)\)/);
  if (!any) return null;
  return { name: sourceNameForUrl(any[1]) ?? 'manual', url: any[1] };
}

/**
 * Country, from the same heuristic the indexer uses: the first Title-Case line
 * before the source label.
 *
 * This is the entanglement that made the migration necessary. It works because 163
 * of 552 plans have a bare country sitting where the problem statement belongs —
 * 82% of every country the web displays comes from that defect. Migrating lifts the
 * value into an explicit field, so fixing the problem statement later cannot silently
 * empty the country facet.
 */
export function extractCountry(specText) {
  const pre = specText.split(/\*\*(?:Fuente|Source):\*\*/)[0] ?? specText;
  const lines = pre.split('\n').map((l) => l.trim()).filter(Boolean);
  for (const line of lines) {
    if (/^[A-Z][a-zA-Z\s]+$/.test(line) && line.length < 40 && !line.startsWith('#')) {
      if (KNOWN_CATEGORIES.has(line.toLowerCase())) continue;
      if (/^(Problema|Problem|Objetivo|Objective|Alcance|Design|Constraints|MVP|Source|Subreddit|Posted|Tags|Categoría|Fecha|Date)$/i.test(line)) continue;
      return line;
    }
  }
  return null;
}

/** Returns { country, problemWasOnlyCountry } so the caller can flag the defect. */
export function extractProblem(specText) {
  const m = specText.match(/##\s+Problema Detectado\s*\n+([\s\S]+?)(?=\n##\s|\n\*\*(?:Fuente|Source)|\n---)/);
  const body = m ? markdownToText(m[1]) : '';
  const country = extractCountry(specText);
  return {
    problem: body,
    problemWasOnlyCountry: !!country && body.trim() === country.trim(),
  };
}

export function extractTech(planText) {
  if (!planText) return [];
  const out = [];
  const re = /\*\*\s*(Frontend|Backend|DB|Database|Despliegue|Deployment|Stack|Framework):\*\*\s*([^\n]+)/gi;
  let m;
  while ((m = re.exec(planText)) !== null) {
    out.push(...m[2].split(/[+,]/).map((s) => htmlToText(s)).filter(Boolean));
  }
  return [...new Set(out)];
}

/** Strip the metadata block that frontmatter replaces. */
export function stripMetadataBlock(body) {
  return body
    .replace(/^\*\*(?:Fuente|Source):\*\*[^\n]*\n?/gm, '')
    .replace(/^\*\*(?:Categoría primaria|Primary category|Subreddit):\*\*[^\n]*\n?/gm, '')
    .replace(/^\*\*Tags:\*\*[^\n]*\n?/gm, '')
    .replace(/^\*\*(?:Fecha|Date|Posted):\*\*[^\n]*\n?/gm, '')
    .replace(/\n{3,}/g, '\n\n');
}

export function renameHeadings(body) {
  return body.replace(/^(#{2,6})\s+(.+?)\s*$/gm, (whole, hashes, heading) => {
    const mapped = HEADING_MAP[heading.trim()];
    return mapped ? `${hashes} ${mapped}` : whole;
  });
}
