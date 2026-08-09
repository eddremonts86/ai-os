# SPEC.md — Shipped a Shopify app into a platform deprecation window — live yesterday, 30 days before the deadline

## Problema Detectado

&lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;Shopify is retiring Stocky, its own free purchase-order and inventory-forecasting app, on August 31. The help page now states plainly that it &amp;quot;will no longer be available after August 31st, 2026.&amp;quot; A dated deadline attached to a defined group of people who have to move is about as legible as a market window gets.&lt;/p&gt; &lt;p&gt;So I built into it. Replenora went live on the App Store yesterday: purchase orders with per-supplier lead times, receiving into Shopify inventory with partial receipts and a full audit trail, incoming stock visible before it lands, reorder points and days of cover derived from live sales velocity, one-click suggested draft POs per supplier, landed costs allocated from freight and duty across the PO lines, and CSV in and out so Stocky history moves across and nothing gets trapped. Starter is free up to five open POs; Pro is $29/month flat with a 14-day trial. The pricing bet is that incumbents in this category sit around $150+/month, and merchants losing a free tool were never going to be the ones paying that.&lt;/p&gt; &lt;p&gt;&lt;a href=&quot;https://apps.shopify.com/replenora&quot;&gt;https://apps.shopify.com/replenora&lt;/a&gt;&lt;/p&gt; &lt;p&gt;The two things I&amp;#39;d actually like critique on, since that&amp;#39;s what this flair is for:&lt;/p&gt; &lt;p&gt;Distribution. I have 30 days before the tool people are searching to replace actually dies, and roughly zero audience. The obvious move is to answer the migration threads where they already exist, except the biggest one, &lt;a href=&quot;/r/shopify&quot;&gt;r/shopify&lt;/a&gt;, bans vendor self-promotion outright with a ban as the stated penalty. So the highest-intent audience is the one place I can&amp;#39;t pitch. I&amp;#39;ve been answering there without naming the product to build some standing first, but that&amp;#39;s slow and the window isn&amp;#39;t. I don&amp;#39;t have a better answer and would take one.&lt;/p&gt; &lt;p&gt;Testing blind spots. My first submission got paused by Shopify&amp;#39;s reviewer on a crash in the purchase-order form. A React useState updater was reading event.currentTarget from inside the updater closure, which runs during a later render, by which point the browser has already nulled it. Typing a freight cost white-screened the whole page. I had 196 passing tests at the time. All of them were pure logic, and the runner&amp;#39;s glob couldn&amp;#39;t even load .tsx files, so no component was ever rendered in a test. The suite was structurally incapable of catching it. I rebuilt the harness, reintroduced the bug deliberately to confirm six tests actually failed, then fixed it. 228 passing now. The lesson wasn&amp;#39;t &amp;quot;write more tests,&amp;quot; it was &amp;quot;prove your tests can fail.&amp;quot; Curious whether anyone has a habit that catches that class of blind spot before a reviewer does.&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/Altruistic_Play8816&quot;&gt; /u/Altruistic_Play8816 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/indiehackers/comments/1vckn0i/shipped_a_shopify_app_into_a_platform_deprecation/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/indiehackers/comments/1vckn0i/shipped_a_shopify_app_into_a_platform_deprecation/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**Source:** [Reddit r/IndieHackers](https://www.reddit.com/r/indiehackers/comments/1vckn0i/shipped_a_shopify_app_into_a_platform_deprecation/)
**Subreddit:** IndieHackers
**Posted:** 2026-08-01T11:15:12+00:00

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
