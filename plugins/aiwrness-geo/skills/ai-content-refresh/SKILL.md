---
name: ai-content-refresh
description: Finds the brand's own pages that are losing citations in AI assistants' answers (ChatGPT, Perplexity, Claude, Gemini, AI Overviews), from aiwrness data compared across two periods and with Google Search Console when connected, and writes a refresh brief for each one. Use when the user asks which pages to update, why a page stopped being cited, content decay in AI search, or for a content refresh plan. Requires the aiwrness connector; does not rewrite pages itself.
---

# AI content refresh

Which of the brand's pages are being cited less, and what should each refresh do? Respond in the user's language; write briefs in the page's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `rewrite-for-ai` for a page the user already suspects.

Needs the sources feature. Periods: the last 30 days against the 30 days before (`since`/`until`); use 90 against 90 for low-volume brands.

## 1. Find the pages losing citations (2–3 calls)

1. `list_source_urls` with `domain` = the brand's domain, current period (`limit` 100).
2. The same call for the previous period.
3. `get_insights` with `kinds: ["page_not_cited", "audit_regression", "topic_regression"]`: pages that cover a topic but are not cited, checks that used to pass, topics the brand dropped out of.

Compare per URL: citations and answers now vs before. A page is losing when it drops clearly (rule of thumb: −30% or more, with at least 5 citations before) or disappears. Small numbers are indicative; say so. Repeat for the brand's other domains if it has them.

## 2. Add Search Console (only if connected)

If a Google Search Console connector's tools are available, read clicks, impressions and position for the losing URLs over the same periods. A page losing both AI citations and search clicks points to the content; losing only AI citations points to how citable it is or to newer competing sources. Without the connector, say what it would add in one line.

## 3. Understand why (per page, light)

- Read the page (fetch it): date, outdated facts or prices, missing direct answer, thin sections.
- The insight evidence: missing search words, failing checks.
- Optional: `list_answer_excerpts` for a prompt that used to cite it, to see which sources replaced it.

## 4. Brief per page

```
## Refresh: {URL}
- Citations: {now} vs {before} ({period}); models: …; Search Console: …
- What changed: {outdated facts, failing check, newer sources cited instead, topic lost}
- Questions it must answer (from the insight's search words or topics): …
- Update: facts to refresh [ADD: …], sections to add, direct answer, tables, FAQ, date
- Technical: {failing check → ai-technical-files / geo-site-audit}
- Priority: {high/medium/low} — why
```

## 5. Output and hand-off

Pages to refresh in priority order, each with its brief. The rewriting itself is done by `rewrite-for-ai` (pass the brief). After publishing, `rewrite-for-ai` can log the update as an event so `geo-impact-check` can measure it.
