---
name: query-fanout-briefs
description: Turns the searches AI models actually make when answering (query fan-out), recorded by aiwrness, into content briefs - groups them into topics, shows where the brand is absent, which sites the models search inside (site: queries), which of the brand's pages come closest, and writes one brief per content gap for rewrite-for-ai. Use when the user asks what content to create for AI search, what ChatGPT or Perplexity search for, query fan-out, topic gaps, or content ideas from AI data. Requires the aiwrness connector.
---

# Query fan-out briefs

When AI models answer, they search the web. aiwrness records those searches and groups them into topics. Turn the gaps into briefs. Respond in the user's language; write briefs in the language of the market the searches are in. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `rewrite-for-ai` meanwhile for a page the user already knows matters.

## 1. Find the gaps (2–3 calls)

1. `get_insights` with `kinds: ["topic_no_page", "page_not_cited", "page_language_gap"]`: topics the models search with no brand page answering, pages that cover a topic but are not cited (with the search words they miss), and pages missing in a search language. These are already ranked by impact.
2. `get_topics` with `include: ["searches", "pages"]` (`limit` 15, or `topic_ids` from the insights): per topic, the searches, answers, how often the brand is named, the rivals named, the most repeated searches, and the brand's closest pages with the words they miss. Topic numbers use the latest insights window (`window_days`) — state it.
3. `get_search_universe` with `view: sources`, `kind: searched`: the sites the models search inside (`site:reddit.com …`) and on which topics.

Optional, for one topic the user picks: `list_search_answers` with the exact search text and `brand_named: false` — the answers behind it that left the brand out.

## 2. Pick the briefs

Rank topics by searches × low brand presence; prefer topics where rivals are named (lost answers) and where an insight already exists. Propose 3–5 and let the user choose; then write the briefs.

## 3. Brief format (one per gap)

```
## Brief: {topic name}
- Why: {searches} searches in {window_days} days, brand named in {x}% of {answers} answers; rivals named: {…}
- Gap type: no page / page not cited / page missing in {language}
- Target page: new page, or {closest existing URL} (missing words: …)
- Questions to answer (from the real searches): …
- Searches to cover verbatim or close: …
- Sources the models search for this topic: {site: domains} → be present there too
- Format: guide / comparison / FAQ / pricing / data page — and why
- Must include: facts from brand-facts.md; [ADD: …] for the missing ones
- Competitor pages to beat: {from the insight evidence, if any}
- Language and market: …
```

Use only searches and numbers the tools returned; never invent searches.

## 4. Hand-off

Offer to pass each brief to `rewrite-for-ai` (existing page) or to draft the new page with it; comparison-shaped topics go to `comparison-pages`. If an insight is the reason for the brief, mention that `geo-action-plan` can mark it as in progress once work starts.
