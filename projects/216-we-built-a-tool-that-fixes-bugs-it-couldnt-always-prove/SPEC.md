# SPEC.md — We built a tool that fixes bugs. It couldn't always prove it.

## Problema Detectado

&lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;&lt;strong&gt;Our tool was telling users bugs were fixed. It couldn&amp;#39;t always prove it.&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Not lying exactly. More like the polite version of &amp;quot;trust me.&amp;quot;&lt;/p&gt; &lt;p&gt;When we built FetchSandbox, we drew a hard line early: a fix doesn&amp;#39;t count until we (1) make the bug actually happen on your real code, (2) apply the fix, and (3) show it stops happening. Reproduce first, then prove. The little test that triggers the bug is what flips from red to green.&lt;/p&gt; &lt;p&gt;That rule felt airtight. It wasn&amp;#39;t.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;The hole we didn&amp;#39;t see&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;We could only reproduce bugs we&amp;#39;d scripted a reproduction for in advance. For anything outside that set, the honest answer we were forced to give users was: &amp;quot;found it, fixed it, but I can&amp;#39;t demonstrate this specific one.&amp;quot;&lt;/p&gt; &lt;p&gt;Say that out loud and it sounds fine. But think about what you&amp;#39;re actually asking the user to do: take your word for it. For a billing bug. For a security edge case. For anything that matters.&lt;/p&gt; &lt;p&gt;That bothered me more the longer I sat with it.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;So we taught it to write the reproduction itself&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;The idea is straightforward. If FetchSandbox encounters a bug it has no pre-scripted test for, it figures out how to trigger that bug on your real code, then runs the same reproduce-apply-prove loop it always has.&lt;/p&gt; &lt;p&gt;The implementation was not straightforward.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;The fake green problem&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;A generated test could be subtly wrong. It could pass your broken code and hand you a green checkmark on an unfixed bug. That&amp;#39;s worse than admitting you can&amp;#39;t prove it, because now you&amp;#39;ve actively misled the user.&lt;/p&gt; &lt;p&gt;So we added a safety rule: before we trust a reproduction, it has to actually catch the bug on the broken code first. If the generated test can&amp;#39;t catch the bug it&amp;#39;s supposed to catch, we throw it away. A test that can&amp;#39;t fail when the code is broken can&amp;#39;t be trusted to pass when the code is fixed.&lt;/p&gt; &lt;p&gt;This one rule is what makes the whole thing honest.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;What it looks like in practice&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;We ran it on a real billing app last week. The bug: a negative seat count slipping through validation and potentially shrinking a customer&amp;#39;s plan without them knowing.&lt;/p&gt; &lt;p&gt;FetchSandbox found the code path, drove the real request handler, worked out a valid webhook signature on its own to reach it, and stubbed only the database as a passive recorder so the app&amp;#39;s own logic decided the outcome. Then it confirmed the test failed on broken code before trusting it to verify the fix.&lt;/p&gt; &lt;p&gt;No scripts we wrote. No hand-holding. We just watched it go.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;Why this matters beyond the feature&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Most of the AI coding tools I see right now optimize for &amp;quot;did the model produce a plausible fix.&amp;quot; That&amp;#39;s a low bar dressed up in a nice UI. The harder question is: how do you know the fix is real?&lt;/p&gt; &lt;p&gt;The reproduction test is our answer. Not because it&amp;#39;s the only answer, but because &amp;quot;make the bug happen, then make it stop&amp;quot; is something you can verify. Confidence is a byproduct of that, not a claim you make.&lt;/p&gt; &lt;p&gt;Still early and still building this in the open. If you&amp;#39;ve run into the prove-vs-claim problem with your own tooling, I&amp;#39;d genuinely like to hear how you&amp;#39;re thinking about it.&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/Common_Dream9420&quot;&gt; /u/Common_Dream9420 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/indiehackers/comments/1ve51dd/we_built_a_tool_that_fixes_bugs_it_couldnt_always/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/indiehackers/comments/1ve51dd/we_built_a_tool_that_fixes_bugs_it_couldnt_always/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**Source:** [Reddit r/IndieHackers](https://www.reddit.com/r/indiehackers/comments/1ve51dd/we_built_a_tool_that_fixes_bugs_it_couldnt_always/)
**Subreddit:** IndieHackers
**Posted:** 2026-08-03T06:05:15+00:00

---

## Objetivo Principal

Crear una solución que aborde este problema de forma clara y escalable.

---

## Usuarios Objetivo

1. **[Usuario primario]** — descripción del usuario principal
2. **[Usuario secundario]** — otros usuarios relevantes

## Alcance MVP

- Funcionalidad core
- Evitar funcionalidades fuera del MVP

## Design Direction

Ver `DESIGN.md` para tokens específicos del proyecto.

## Constraints

- Mantener simple el MVP
- Sin dependencias externas innecesarias
