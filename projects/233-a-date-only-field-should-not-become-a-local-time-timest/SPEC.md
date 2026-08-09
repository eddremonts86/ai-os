# SPEC.md — A date-only field should not become a local-time timestamp

## Problema Detectado

&lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;I’m building a browser-based health calculator suite, and a small JavaScript date choice turned into a correctness boundary.&lt;/p&gt; &lt;p&gt;An input type=date gives a calendar date. It does not give a moment in time. If that string becomes a local Date, midnight, timezone offsets, or a daylight-saving transition can move formatting or arithmetic onto an adjacent day.&lt;/p&gt; &lt;p&gt;In Flowy’s calculator engine, 2026-08-09 is parsed with Date.UTC. Every calculation adds whole UTC days, and formatting pins the timezone to UTC. Invalid calendar inputs such as 30 February are rejected by comparing the reconstructed UTC fields.&lt;/p&gt; &lt;p&gt;That keeps date-only semantics through period ranges, pregnancy dating, and calendar exports. The same rule is covered by a test that parses a date and expects the identical ISO date back.&lt;/p&gt; &lt;p&gt;The tradeoff is deliberate: these are calendar calculations, not event timestamps. If the domain later needs an actual appointment time, that should be a separate type with a timezone.&lt;/p&gt; &lt;p&gt;The calculators run in the browser, and the current methods are here: &lt;a href=&quot;https://flowyhealth.com/tools&quot;&gt;https://flowyhealth.com/tools&lt;/a&gt;&lt;/p&gt; &lt;p&gt;This feels bigger than health software. Birthdays, billing dates, hotel stays, and deadlines can all break when a calendar date is treated as an instant.&lt;/p&gt; &lt;p&gt;How are you representing date-only values in your product: ISO strings, Temporal.PlainDate, or a UTC-based wrapper?&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/Particular_Luck80&quot;&gt; /u/Particular_Luck80 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vja9ih/a_dateonly_field_should_not_become_a_localtime/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vja9ih/a_dateonly_field_should_not_become_a_localtime/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**Source:** [Reddit r/SideProject](https://www.reddit.com/r/SideProject/comments/1vja9ih/a_dateonly_field_should_not_become_a_localtime/)
**Subreddit:** SideProject
**Posted:** 2026-08-08T23:28:21+00:00

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
