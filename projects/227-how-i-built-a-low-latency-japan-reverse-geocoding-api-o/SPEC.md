# SPEC.md — How I built a low-latency Japan reverse geocoding API on Cloudflare Workers + D1 to solve Google Maps API pricing spikes

## Problema Detectado

&lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;&lt;em&gt;Disclosure: I am the founder/developer of ReverseGeoJP.&lt;/em&gt;&lt;/p&gt; &lt;p&gt;Hey everyone,&lt;/p&gt; &lt;p&gt;I wanted to share some technical &amp;amp; architecture learnings from building a micro-SaaS: a reverse geocoding API specifically tailored for Japan location data.&lt;/p&gt; &lt;h1&gt;The Problem: Google Maps API Costs &amp;amp; Complex GIS Data&lt;/h1&gt; &lt;p&gt;If you&amp;#39;ve built location-based apps operating in Japan (travel tools, delivery apps, geotagged content), you usually run into two main obstacles:&lt;/p&gt; &lt;ol&gt; &lt;li&gt;&lt;strong&gt;Unpredictable API Costs&lt;/strong&gt;: Google Maps Geocoding API costs $5.00 per 1,000 requests. For early-stage apps or high-frequency polling, a sudden traffic spike can cause terrifying unexpected bills.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Messy Local Data&lt;/strong&gt;: Official Japanese address datasets (MLIT) and postal code files from Japan Post are fragmented in heavy Japanese CSVs. Running your own PostGIS server just for basic reverse geocoding is heavy and expensive to maintain.&lt;/li&gt; &lt;/ol&gt; &lt;h1&gt;Architecture &amp;amp; Solution&lt;/h1&gt; &lt;p&gt;To fix this, I built an API with predictable flat-rate pricing and zero server maintenance:&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Compute &amp;amp; Database&lt;/strong&gt;: Built entirely on Cloudflare Workers + D1 (SQLite at the edge).&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Data Indexing&lt;/strong&gt;: Pre-processed and indexed official MLIT coordinate data and 7-digit postal code records into optimized SQLite spatial lookup tables.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Latency&lt;/strong&gt;: Sub-50ms responses globally by avoiding origin server roundtrips.&lt;/li&gt; &lt;/ul&gt; &lt;h1&gt;Lessons Learned&lt;/h1&gt; &lt;p&gt;Storing spatial indices inside D1 SQLite databases allows executing lightweight B-Tree/R-Tree queries right on the edge node nearest to the user. This eliminated $100+/mo cloud database server costs completely.&lt;/p&gt; &lt;p&gt;Happy to answer any questions about spatial indexing on D1 or structuring flat-rate APIs!&lt;/p&gt; &lt;p&gt;&lt;em&gt;(Feel free to ask if you&amp;#39;d like the link to test the live demo/docs!)&lt;/em&gt;&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/tarkun55&quot;&gt; /u/tarkun55 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vjaphw/how_i_built_a_lowlatency_japan_reverse_geocoding/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vjaphw/how_i_built_a_lowlatency_japan_reverse_geocoding/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**Source:** [Reddit r/SideProject](https://www.reddit.com/r/SideProject/comments/1vjaphw/how_i_built_a_lowlatency_japan_reverse_geocoding/)
**Subreddit:** SideProject
**Posted:** 2026-08-08T23:49:44+00:00

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
