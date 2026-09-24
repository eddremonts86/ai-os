# PRODUCT.md — How to Detect Residential Proxies

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;m feeling pretty depressed right now, and hopefully sharing this little anomaly I discovered in January might help someone make the world a better place, and figure out how to put a dent in online crime. Fuck criminals.<p>Most residential proxy providers that I&#x27;ve seen don&#x27;t support UDP. UDP is what WebRTC uses and has been part of the browser&#x27;s &quot;core&quot; since 2021. If someone says they&#x27;re on Chrom(<i>), FireFox, Safari - they have it.<p>So the setup goes like this:<p>1) Create a subdomain to get the client&#x27;s TCP ip address. You can force it to ipv4 by not giving it an AAAA record. This will make future-comparison easier.<p>2) Create a subdomain to get the client&#x27;s UDP ip address. Ditto the quad-a bit. You&#x27;ll want to run your own STUN server (are you there, Claude? Its me, Justin...). To make it tamper resistant, I have the STUN server encrypt the ipv4 address and some other stuff and return it as an ipv6 ice candidate. Its abuse, but it works and I don&#x27;t have to worry about back-end-server communication bottle necking anything. Just catch, encrypt, return.<p>And the algorithm looks like this:<p>**</i> YOU HAVE A TCP AND UDP IP ADDRESS ***<p>1) If both IP Addresses are the same - probably not a residential proxy<p>2) If both IP Addresses are different but on the same ASN and in the same ...&#x2F;24(?) - they&#x27;re on a cell network<p>3) If the IP Addresses are on different ASNs - that&#x27;s a MAJOR red flag. Most people who use residential proxies have it drilled into their head - TURN OFF WebRTC. This leaked bad in the mid 2010&#x27;s and people are still terrified of it.<p>4) If one of the Addresses is on Cisco Web Umbrella or zScaler - and other is residential - they&#x27;re behind a corporate protection firewall. Not really a proxy per se, but it&#x27;ll trip this algorithm. Based on your threat model, they&#x27;re probably ok to whitelist.<p>*** YOU __ONLY__ HAVE TCP IP ***<p>So this is the &quot;one weird trick&quot; &#x2F; secret sauce &#x2F; whatever that makes this work. TLS-duration &#x2F; TCP-rtt &gt; 3.0<p>* &quot;Many residential proxies split the connection at the exit: the origin’s TCP socket ends there, so Linux TCP_INFO estimates only origin &lt;=&gt; exit RTT. The exit forwards TLS handshake bytes to the true client, making ClientHello handshake-complete include the hidden proxy chain. An unusually high TLS-duration&#x2F;TCP-RTT ratio exposes that split.&quot; *<p>This is really all we need. From here, we just do the following:<p>TCP == UDP === not proxy<p>TCP ~= UDP === if on same ASN, not proxy<p>TCP != UDP === proxy or zScaler-thing. Whitelist to suit.<p>No UDP and TLS&#x2F;TCP RTT Ratio &lt; 3 === probably not a proxy (lower is better here)<p>No UDP and TLS&#x2F;TCP RTT &gt; 3 === probably a proxy (most I&#x27;ve seen float between 6-12x)<p>I&#x27;ve worked with this thing for the last 6 months and have worked mainly with Soax, BrightData, and OxyLabs proxies. I also built my own ProxyDevice (android) and C2 - put it on my own network and it caught it.<p>This is extremely cool because this means you don&#x27;t have to blacklist IP addresses (not like it works) since a legitimate user and a proxy will come from the same IP - the proxy client will look _very_ different. They get blocked by NetAcuity&#x2F;MaxMind&#x2F;StaticList - the entire IP is killed. This is surgical.<p>This probably isn&#x27;t perfect, but based on my limited experience its spooky accurate. I won&#x27;t claim its 100% accurate for all cases everywhere but if its better than nothing - by definition its better than nothing - and that helps. Which, at the end of the day is all I want to do with this - help.<p>p.s. more than happy to share what I&#x27;ve built. Test, evidence, code, whatever. Just let me know.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49668557) · **Category:** ask-hn · **Tags:** Ask HN,Problem
