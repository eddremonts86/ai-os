# SPEC.md — Prompt to Brick Model Webapp

## Problema Detectado

&lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;Recently, I&amp;#39;ve been building BrickForgerAI — you type a prompt, and it generates an actual buildable brick sculpture: a real 3D preview you can rotate, plus a downloadable &lt;code&gt;.ldr&lt;/code&gt; file and full parts list you can take to BrickLink Studio to get step-by-step instructions and order the real pieces.&lt;/p&gt; &lt;p&gt;The interesting part (to me, anyway) is the pipeline behind it - turning an arbitrary shape into something made of real, purchasable brick pieces — that&amp;#39;s actually structurally sound, not just visually close. I built a system that checks the idea for structural weak points and automatically repairs them before you ever see the output.&lt;/p&gt; &lt;p&gt;Currently, it&amp;#39;s noticeably better at organic/sculptural shapes right now (animals, creatures, objects) than boxy structured builds like houses or castles (although it still works - you can give it a shot) — the tiling logic hasn&amp;#39;t caught up to that case yet, but I constantly aim to improve the &amp;quot;brickifying&amp;quot; algorithm.&lt;/p&gt; &lt;p&gt;It&amp;#39;s free to generate and preview (a handful of credits/month, no card needed) — you only pay if you actually want the downloadable file for something you like.&lt;/p&gt; &lt;p&gt;Genuinely curious what people would try to build with it, and where it breaks - this is the first launch so please let me know of any issues (for this initial phase, there is a total daily cap of 100 generations a day for all users). I have also attached some renders of some of the builds that it has generated (using Blender Advanced addon from MecaBricks). Link (with the usual disclaimer — not affiliated with or endorsed by the LEGO Group) above.&lt;/p&gt; &lt;p&gt;&lt;a href=&quot;https://reddit.com/link/1vja6of/video/b0s9mbjji8ih1/player&quot;&gt;https://reddit.com/link/1vja6of/video/b0s9mbjji8ih1/player&lt;/a&gt;&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/Leading_Green5185&quot;&gt; /u/Leading_Green5185 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://brickforgerai.com/?ref=reddit-sideproject&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vja6of/prompt_to_brick_model_webapp/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**Source:** [Reddit r/SideProject](https://www.reddit.com/r/SideProject/comments/1vja6of/prompt_to_brick_model_webapp/)
**Subreddit:** SideProject
**Posted:** 2026-08-08T23:24:41+00:00

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
