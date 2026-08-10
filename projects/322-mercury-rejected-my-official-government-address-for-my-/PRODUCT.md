# PRODUCT.md — Mercury rejected my official government address for my US LLC. Here is the 4-Part &quot;Infrastructure Stack&quot; I had to build to launch my SaaS as a non-US founder.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ &lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;I’m an Algerian software engineer. I formed my US LLC got the LLC formation documents, operating agreement and EIN. I thought I was done. I went to open my Mercury bank account, submitted my official, state-issued, English-translated Algerian proof of address... and Mercury flat-out denied me.&lt;/p&gt; &lt;p&gt;Many formation platforms get you the LLC, but they abandon you when you hit banking compliance. I realized that to actually accept global payments, I didn&amp;#39;t just need an LLC. I needed a 4-Part Infrastructure Stack to bypass US risk algorithms.&lt;/p&gt; &lt;p&gt;Here is what I had to build to finally get live:&lt;/p&gt; &lt;ol&gt; &lt;li&gt;The IRS Fax Protocol: You can&amp;#39;t get an EIN online without an SSN. You have to manually fax Form SS-4 to the IRS. If you mess up the &amp;#39;Reason for Applying&amp;#39; code or the fax cover sheet, you sit in a 45-day queue. I had to learn the exact IRS fax protocol to get my EIN without getting stuck.&lt;/li&gt; &lt;li&gt;The &amp;#39;Global Address Bridge&amp;#39;: US bank bots don&amp;#39;t trust local MENA/Africa/LATAM utility bills. I had to bypass this by opening a Tier-1 European digital bank account that accepted my local docs. Once approved, I used that bank&amp;#39;s official statement as my &amp;#39;Proof of Address&amp;#39; for Mercury. The US bank bot accepted it instantly. &lt;em&gt;(I don&amp;#39;t post the exact bank and KYC script here because their compliance questions change monthly, but this mechanism is mandatory if you live outside the US/EU).&lt;/em&gt;&lt;/li&gt; &lt;li&gt;The Stripe Anti-Ban Audit: Getting the bank account is only half the battle. When you apply for Stripe, their bots scrape your website. If you are missing 3 specific compliance clauses that non-US founders usually forget, Stripe will ban your account 48 hours after your first sale. I had to rewrite my Terms of Service to pass the bot.&lt;/li&gt; &lt;li&gt;The Tax Compliance Trap: A single-member foreign-owned LLC is a &amp;#39;disregarded entity&amp;#39; for tax purposes, but you MUST file Form 5472 and 1120 every year. The penalty for missing this is $25,000. I had to set up a white-label CPA workflow to handle this so I don&amp;#39;t accidentally commit tax fraud.&lt;/li&gt; &lt;/ol&gt; &lt;p&gt;The Result: I now have a fully functioning US LLC, Mercury account, and Stripe, with my tax compliance handled.&lt;/p&gt; &lt;p&gt;I mapped this entire 4-Part Stack into a visual flowchart and checklist so other non-US founders don&amp;#39;t hit the same brick walls I did. If you&amp;#39;re interested let me know and I&amp;#39;ll send it to you.&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/Neither-List-1005&quot;&gt; /u/Neither-List-1005 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SaaS/comments/1vjv2t6/mercury_rejected_my_official_government_address/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SaaS/comments/1vjv2t6/mercury_rejected_my_official_government_address/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| SaaS founders | _[What pain they feel]_
| _[How this solves it]_ |
| B2B teams | _[What pain they feel]_
| _[How this solves it]_ |
| Operators | _[What pain they feel]_
| _[How this solves it]_ |

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

_Source:_ [Reddit r/SaaS](https://www.reddit.com/r/SaaS/comments/1vjv2t6/mercury_rejected_my_official_government_address/) · **Posted:** 2026-08-09T17:00:37+00:00
