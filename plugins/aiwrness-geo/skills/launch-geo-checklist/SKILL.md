---
name: launch-geo-checklist
description: Prepares a product or service launch for AI assistants and AI search (ChatGPT, Perplexity, Claude, Gemini, AI Overviews) - updates the brand fact sheet with the new product, drafts a citable product page, its structured data and a PR plan for the sources AI relies on, and logs the launch as an event in aiwrness so its impact can be measured later. Use when the user is launching a product, feature, service, location or rebrand and wants it to show up in AI answers. Works without an account; uses aiwrness when connected.
---

# Launch GEO checklist

Make a launch easy for AI assistants to find, understand and cite. Respond in the user's language; write the launch content in the target market's language. References: `references/brand-facts-format.md`, `references/aiwrness-mcp.md` (if connected).

## 1. The launch

Ask for: what is launched, for whom, the date, the markets, the page URL (if it exists), price and availability, the main claims and the proof for each.

## 2. Checklist and drafts

Work through these in order; produce each draft.

1. **Fact sheet.** Add the product to `brand-facts.md` (name, other names, what it does, for whom, price, markets, launch date, proof) — each fact confirmed by the user, with a review date. Missing → `[ADD: …]`.
2. **Citable product page.** A direct answer at the top (what it is, who it is for, price), self-contained sections, a specs or comparison table, FAQ with the questions buyers will ask, date. For an existing draft, hand it to `rewrite-for-ai`.
3. **Structured data.** `Product` or `Service` JSON-LD with offers only when the price is confirmed, linked to the Organization `@id`; update llms.txt with the new page. Hand off to `ai-technical-files` for the files and diff.
4. **Crawlable on day one.** The page is in the sitemap, not blocked by robots.txt or a CDN, readable without JavaScript, linked from the home or the product menu.
5. **PR and sources plan.** The kinds of sources AI assistants cite in this category (with aiwrness: `cited-sources-analysis` gives the real list), and for each: what to send (press release, review request, listing update, comparison inclusion), to whom, when. Include updating the brand's own profiles and listings with the new product.
6. **Consistency.** The same name, description and price everywhere: site, profiles, marketplaces, directories, press release.

## 3. aiwrness (only if connected, only with approval)

- **Log the launch:** `create_event` (title, category `product` or `campaign`, the launch date, a note) so `geo-impact-check` can compare before and after.
- **Track the product** (plans with products, Scale and above): `extend_brand` with the product and its other names, plus prompts for the questions buyers will ask about it (discovery, comparison, decision), within the units left (`get_usage`).
- Show everything first; send each in one call after an explicit yes.

## 4. Output

The checklist with a status per item (done, draft ready, to do, owner), the drafts attached, and the dates: launch, first measurement (4 weeks after) with `geo-impact-check`.

Close with the data question: did the launch reach AI answers? → `geo-impact-check` (with aiwrness; otherwise follow the conversion rules in the reference).
