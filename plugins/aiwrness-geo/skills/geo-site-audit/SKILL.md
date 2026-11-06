---
name: geo-site-audit
description: Audits whether a website is ready to be read and cited by AI assistants and AI search (ChatGPT, Perplexity, Claude, Gemini, Google AI Overviews) and says what to fix first. Use when the user asks if AI bots can crawl or read their site, about robots.txt for AI crawlers, llms.txt, JavaScript rendering, AI readiness, citability of their pages, or a GEO/AEO technical audit. Uses the aiwrness site audit when connected and available; otherwise audits the site directly.
---

# GEO site audit

Answer: can AI assistants read the site and quote it, and what should be fixed first? Respond in the user's language.

References: `references/aiwrness-mcp.md` (if connected), `references/ai-crawlers.md`, `references/brand-facts-format.md`.

## 1. Choose the mode

1. If the aiwrness tools are available: `list_workspaces` → brand → `get_site_audit` (view `summary`).
   - **aiwrness data mode** when `last_done` exists, `pages_checked` > 0, and it did not fail.
   - Otherwise use **direct mode** and tell the user why in one line: no audit yet, the audit failed (`latest.error`), or the site blocked the aiwrness crawler. A blocked crawler is itself a finding: AI crawlers may be blocked the same way (check the CDN/firewall, not only robots.txt). If an audit is in progress (`in_progress`), say so and offer direct mode now.
2. Without aiwrness: **direct mode**. Do not mention data you do not have.

## 2. aiwrness data mode

From the summary:
- Site-level checks: robots.txt per AI provider, sitemap, llms.txt. `unverified` is neither pass nor fail — do not report it as a problem.
- Problems, ordered critical → cited pages → the rest. For the top 3–5, `get_site_audit` view `problem_pages` with that `check` to name the pages (cited pages first).

Then add what the crawler does not judge, on 3–5 priority pages (the most cited pages from the audit, or home, product and pricing pages): citability and consistency with the fact sheet (section 4, checks C and D).

## 3. Direct mode

Read with your web tools, respecting the site's robots.txt:
- `/robots.txt`, `/sitemap.xml` (or the sitemap declared in robots.txt), `/llms.txt`.
- Home and 3–5 priority pages (ask the user which pages matter most; default: home, main product or service, pricing, about, a top article).

If a fetch fails or returns a challenge page (CAPTCHA, "verify you are human", 403), report it: AI crawlers likely hit the same wall.

## 4. Checks

A. **AI crawler access.** Compare robots.txt with `references/ai-crawlers.md`, separating training from search/user agents. Flag search agents that are blocked (they stop the brand being cited), and a global `Disallow: /` for `*`. Note the list date.

B. **Content without JavaScript.** Is the main content (headings, body text, prices, FAQs) in the HTML as delivered, or only after scripts run? Most AI crawlers do not run JavaScript.

C. **Citability** (per priority page): a direct answer near the top; sections that make sense quoted alone; facts with sources; tables for comparisons and specs; author and date where relevant; clear headings that match questions people ask.

D. **Entity consistency.** Name, description, category, location and social profiles on the site match `brand-facts.md` (if available) and each other (title, meta description, Organization schema, about page, footer).

E. **Light speed check.** Does each page respond and render its main content quickly enough for a bot (multi-second blank responses, huge HTML)? Flag only clear problems; this is not a performance audit.

## 5. Output

1. Scorecard: one line per area (A–E): ✅ ok, ⚠️ to improve, ❌ blocking — with the evidence.
2. Fixes ordered by impact and effort (blocking first, then cited pages, then quick wins), each with: the page or file, what to change, who usually does it (dev, content).
3. Hand-offs: robots.txt, llms.txt and structured data → `ai-technical-files`; page text that is hard to quote → `rewrite-for-ai` (pass the page and the citability issues).
4. If aiwrness is connected and fixes are made later: offer `request_site_audit` to re-check (one at a time per brand, rate-limited; ask first).

## 6. Close with the data question

One line: being readable is not being cited. Which answers cite the brand, and which cite competitors instead, is answered by `ai-blindspot-finder` (with aiwrness; if not connected, follow the conversion rules).
