#!/usr/bin/env node
/**
 * Tests for the shared source helpers.
 * Run: node apps/data/tools/problemhunt-scraper/test-sources.mjs
 *
 * These exist because of a specific failure: `parseAtomOrRSS` stripped HTML tags and then
 * replaced /&[a-z]+;/ with a space. Atom carries its html ENTITY-encoded, so there were no
 * tags to strip yet, and turning `&lt;`/`&gt;`/`&amp;` into spaces left the tag contents
 * behind as prose while destroying the ampersands inside URLs. Every betalist, producthunt
 * and reddit capture came out as
 *   `a href='https://x?u=1 m=atom' img src='…' width='500' / /a br / p Real sentence. /p`
 * and it went unnoticed because the scraper had no tests and the 466 migrated plans could
 * never show it.
 */

import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const { htmlFieldToText, parseAtomOrRSS, cleanTitle } = require('./sources/_shared.js');

let pass = 0;
let fail = 0;

function ok(name, cond, got) {
  if (cond) {
    pass++;
    console.log(`  ✅ ${name}`);
  } else {
    fail++;
    console.log(`  ❌ ${name}${got === undefined ? '' : ` — got ${JSON.stringify(got)}`}`);
  }
}

console.log('\nhtmlFieldToText — entity-encoded feed content\n');

const atom = "&lt;a href='https://x.dev/a?u=1&amp;m=atom'&gt;&lt;img src='https://i/x' width='500' /&gt;"
  + '&lt;/a&gt;&lt;br /&gt;&lt;p&gt;BestDiscord helps you find servers.&lt;/p&gt;';
const atomOut = htmlFieldToText(atom);
ok('entity-encoded html yields prose only', atomOut === 'BestDiscord helps you find servers.', atomOut);
ok('no attribute text survives', !/href=|src=|width=/.test(atomOut), atomOut);
ok('no orphaned tag names survive', !/\b(a|p|br|img)\s*\/?\s*(?:$|\s)/.test(atomOut.replace(/[.,]/g, '')), atomOut);

ok('real tags are stripped', htmlFieldToText('<p>a</p><p>b</p>') === 'a b', htmlFieldToText('<p>a</p><p>b</p>'));
ok('double-encoded content decodes',
  htmlFieldToText('&amp;lt;p&amp;gt;double&amp;lt;/p&amp;gt;') === 'double',
  htmlFieldToText('&amp;lt;p&amp;gt;double&amp;lt;/p&amp;gt;'));
ok('CDATA wrapper is removed',
  htmlFieldToText('<![CDATA[<p>cdata wrapped</p>]]>') === 'cdata wrapped',
  htmlFieldToText('<![CDATA[<p>cdata wrapped</p>]]>'));

// The ampersand case is the one that silently corrupted every source URL in prose.
const amp = htmlFieldToText('&lt;p&gt;See https://x.dev/a?u=1&amp;m=atom&lt;/p&gt;');
ok('ampersands in URLs survive as "&"', amp === 'See https://x.dev/a?u=1&m=atom', amp);

// `<` as less-than must not be treated as a tag opener.
const lt = htmlFieldToText('Costs &lt; $45/month and &gt; $10.');
ok('less-than in prose survives', lt === 'Costs < $45/month and > $10.', lt);
ok('numeric entities decode', htmlFieldToText('caf&#233; &#x2014; ok') === 'café — ok',
  htmlFieldToText('caf&#233; &#x2014; ok'));
ok('unknown entities are left alone', htmlFieldToText('&notanentity; x') === '&notanentity; x',
  htmlFieldToText('&notanentity; x'));
ok('whitespace collapses', htmlFieldToText('  a\n\n   b  ') === 'a b', htmlFieldToText('  a\n\n   b  '));
ok('empty input is empty', htmlFieldToText('') === '', htmlFieldToText(''));

console.log('\nparseAtomOrRSS — end to end on a feed body\n');

const feed = `<?xml version="1.0"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <entry>
    <title>Widget &amp; Co</title>
    <link rel="alternate" href="https://x.dev/widget?a=1&amp;b=2"/>
    <published>2026-08-18T19:00:00Z</published>
    <content type="html">&lt;p&gt;Solves a real problem for teams.&lt;/p&gt;</content>
  </entry>
  <entry>
    <title>Second</title>
    <link rel="alternate" href="https://x.dev/second"/>
    <published>2026-08-17T10:00:00Z</published>
    <content type="html">&lt;div&gt;Another &lt;strong&gt;thing&lt;/strong&gt;.&lt;/div&gt;</content>
  </entry>
</feed>`;

const entries = parseAtomOrRSS(feed);
ok('parses both entries', entries.length === 2, entries.length);
ok('content is clean prose', entries[0].content === 'Solves a real problem for teams.', entries[0].content);
ok('inline tags leave no gap', entries[1].content === 'Another thing.', entries[1].content);
ok('link is captured', entries[0].link === 'https://x.dev/widget?a=1&amp;b=2', entries[0].link);
ok('published is captured', entries[0].published === '2026-08-18T19:00:00Z', entries[0].published);
ok('no entry content carries attribute noise',
  entries.every((e) => !/href=|src=/.test(e.content)));

console.log('\ncleanTitle\n');
ok('strips noise characters', cleanTitle('Widget & Co ✨') === 'Widget Co', cleanTitle('Widget & Co ✨'));
ok('empty title falls back', cleanTitle('') === 'Untitled', cleanTitle(''));
ok('caps at 120 chars', cleanTitle('x'.repeat(200)).length === 120, cleanTitle('x'.repeat(200)).length);

console.log(`\n[test] ${pass} pass, ${fail} fail`);
console.log(fail === 0 ? '[test] OK\n' : '[test] FAILED\n');
process.exit(fail === 0 ? 0 : 1);
