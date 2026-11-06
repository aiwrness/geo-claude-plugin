---
name: geo-impact-check
description: Measures whether an action changed the brand's visibility in AI assistants' answers - compares aiwrness metrics before and after an event (a launch, a page rewrite, a campaign, PR, a site fix) by prompt and by AI model, adding Google Search Console and Google Analytics when connected, and gives a clear, honest conclusion. Use when the user asks if a change worked, the impact of a launch or campaign on AI visibility, or before/after results. Requires the aiwrness connector.
---

# GEO impact check

Did the action move anything in AI answers? Compare equal windows before and after, and conclude without overclaiming. Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `rewrite-for-ai` meanwhile.

## 1. The event

1. `list_events` (`limit` 50): events logged in the app, by `launch-geo-checklist` or by `rewrite-for-ai`. Let the user pick one, or take the date they give.
2. If the event is not logged and the user wants it on record, offer `create_event` (title, category, date; ask first).
3. What it touched: a topic, a product line (tag), a page, a market? Ask if unclear — it decides the filters.

## 2. Windows

Two windows of the same length around the event date: before = [date − N days, date), after = [date + lag, date + lag + N). Default N = 28 days, lag = 0. If the after window is not complete yet, say how many days it has and call the result provisional. Models that search the web can react in days; others may take months.

## 3. Compare (3–5 calls)

- `get_metrics` for each window, with the filters that match the event (`tag_ids`, `category`, `location`).
- `get_metrics` with `group_by: model` for each window: change per model.
- `get_prompt_metrics` for each window: change per prompt; keep the prompts that moved most, up or down.
- If the event was a page: `list_source_urls` for that domain in both windows (sources feature) — is the page cited more?

Optional: if Google Search Console or Google Analytics connector tools are available, compare clicks or sessions for the affected pages over the same windows.

## 4. Conclude

1. One sentence: what changed, with the base ("Visibility in comparison prompts rose from 18% to 27% of 160 and 172 answers, ChatGPT and Perplexity, in the 4 weeks after the launch").
2. Table: before, after and change (percentage points) — overall, per model, and the prompts that moved most.
3. Confidence: high (large change, enough answers, several models agree), medium, or low (small change, few answers, one model only). A change of a few points with under ~100 answers per window is usually noise.
4. Never say the event caused it: "rose after", and name anything else that happened in the period (other events in `list_events`, competitor changes).
5. Next step: if it worked, where to repeat it; if not, what to try (`geo-action-plan`, `ai-blindspot-finder`).
