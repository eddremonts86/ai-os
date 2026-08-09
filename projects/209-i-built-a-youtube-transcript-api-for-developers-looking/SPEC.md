# SPEC.md — I built a YouTube Transcript API for developers — looking for feedback

## Problema Detectado

&lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;Hi everyone,&lt;/p&gt; &lt;p&gt;I recently built a YouTube Transcript API for developers who need to extract transcripts, captions, metadata, and available subtitle languages from YouTube videos.&lt;/p&gt; &lt;p&gt;The API supports:&lt;/p&gt; &lt;p&gt;- Get transcript by YouTube video ID&lt;/p&gt; &lt;p&gt;- Get video metadata&lt;/p&gt; &lt;p&gt;- Check available transcript languages&lt;/p&gt; &lt;p&gt;- Batch transcript requests&lt;/p&gt; &lt;p&gt;- JSON responses&lt;/p&gt; &lt;p&gt;- API key authentication&lt;/p&gt; &lt;p&gt;- Rate limiting&lt;/p&gt; &lt;p&gt;- Caching&lt;/p&gt; &lt;p&gt;- OpenAPI documentation&lt;/p&gt; &lt;p&gt;Example endpoint:&lt;/p&gt; &lt;p&gt;GET /api/transcript?id=VIDEO_ID&amp;amp;lang=en&lt;/p&gt; &lt;p&gt;Example use cases:&lt;/p&gt; &lt;p&gt;- AI summarization apps&lt;/p&gt; &lt;p&gt;- Chatbots&lt;/p&gt; &lt;p&gt;- SEO/content tools&lt;/p&gt; &lt;p&gt;- Podcast/video analysis&lt;/p&gt; &lt;p&gt;- Subtitle workflows&lt;/p&gt; &lt;p&gt;- Research tools&lt;/p&gt; &lt;p&gt;- Educational apps&lt;/p&gt; &lt;p&gt;I published it on RapidAPI here:&lt;/p&gt; &lt;p&gt;&lt;a href=&quot;https://rapidapi.com/dtech4099/api/youtube-transcript27&quot;&gt;https://rapidapi.com/dtech4099/api/youtube-transcript27&lt;/a&gt;&lt;/p&gt; &lt;p&gt;Documentation / website:&lt;/p&gt; &lt;p&gt;&lt;a href=&quot;https://youtube-transcript-api-production-0221.up.railway.app/docs&quot;&gt;https://youtube-transcript-api-production-0221.up.railway.app/docs&lt;/a&gt;&lt;/p&gt; &lt;p&gt;I’m looking for feedback from developers:&lt;/p&gt; &lt;ol&gt; &lt;li&gt;&lt;p&gt;Is the API structure clear?&lt;/p&gt;&lt;/li&gt; &lt;li&gt;&lt;p&gt;Are there any endpoints you would expect but don’t see?&lt;/p&gt;&lt;/li&gt; &lt;li&gt;&lt;p&gt;Would batch transcript extraction be useful for your workflow?&lt;/p&gt;&lt;/li&gt; &lt;li&gt;&lt;p&gt;What pricing/limits would feel reasonable?&lt;/p&gt;&lt;/li&gt; &lt;/ol&gt; &lt;p&gt;Note: transcript availability depends on whether YouTube exposes captions for the requested video/language. Some private, restricted, or caption-disabled videos may not return transcripts.&lt;/p&gt; &lt;p&gt;Thanks — happy to answer questions.&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/Significant_Sail_722&quot;&gt; /u/Significant_Sail_722 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/indiehackers/comments/1vgc5aa/i_built_a_youtube_transcript_api_for_developers/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/indiehackers/comments/1vgc5aa/i_built_a_youtube_transcript_api_for_developers/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**Source:** [Reddit r/IndieHackers](https://www.reddit.com/r/indiehackers/comments/1vgc5aa/i_built_a_youtube_transcript_api_for_developers/)
**Subreddit:** IndieHackers
**Posted:** 2026-08-05T16:24:06+00:00

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
