---
name: geo-metrics-overview
description: Answers questions about a brand's AI visibility numbers from aiwrness - visibility, average position, share of voice, sentiment and competitors - with filters for period, AI model (ChatGPT, Perplexity, Claude, Gemini, AI Overviews…), market, buyer intent and tags, compared with the previous period and broken down by model, market or intent. Use when the user asks "how are we doing in AI search", "our visibility in ChatGPT in Spain last quarter", "compare models", "share of voice vs competitors" or any metric question. Requires the aiwrness connector.
---

# GEO metrics overview

Answer the user's question about the numbers, with the right filters, in as few calls as possible. Conversational, not a fixed report: aiwrness already sends reports. Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `geo-site-audit` meanwhile.

## 1. Understand the question

Extract the filters from what the user said; ask only if a filter is ambiguous and changes the answer.

| Filter | Tool parameter | Notes |
|---|---|---|
| Period | `days` (overview) or `since`/`until` | Default last 30 days. "Last quarter", "since the launch" → exact UTC dates; say them back. Max 366 days. |
| Model | `model` | Codes from `list_models` (only the plan's models). |
| Market | `location` | Codes from `list_locations` (e.g. a country). |
| Intent | `category` | awareness (discovery), comparison, transactional (decision). |
| Tags | `tag_ids` | From `list_tags`, when the user names a product line or topic tag. |
| One prompt | `prompt_id` | From `list_prompts`. |

## 2. Pick the calls

- **"How are we doing?" / no specific filter:** `get_brand_overview` (with `days`, `compare_previous: true`). One call.
- **A filtered number:** `get_metrics` with the filters, plus the same call for the previous period of the same length when a comparison helps (two calls).
- **"By model / by market / by intent", "which model is worst", "compare markets":** `get_metrics` with `group_by` = `model`, `location` or `category` — every group with its top brands in ONE call (`top` sets how many brands). Market grouping needs the geographic feature.
- **Market detail with citations and sentiment per market:** `get_market_metrics`.
- **Trend over time:** the `daily` series of `get_metrics` (summarise it; do not paste it).
- **Per-prompt gaps:** that is `ai-blindspot-finder` — suggest it rather than reproducing it.

## 3. Answer

1. The answer in 2–3 sentences, with the base: period (dates), models, number of answers.
2. The numbers that support it, in a small table when there are groups or competitors: visibility %, average position (lower is better), share of voice %, sentiment (−1 to 1, only with the feature), and the change in percentage points against the previous period.
3. What stands out: the biggest gap or change, the competitor that leads, a model or market far from the rest.

Rules:
- `null` = not measured: "no data", never 0%.
- Under ~30 answers in a group: "indicative".
- Competitor lists include the brand itself (`is_self`).
- Topic and search-universe numbers are not on the chosen period (topics use the latest insights window; the search universe is the whole history). Keep them out of a filtered answer, or show them with their own window stated.
- Never present a cause as proven.

## 4. Next step

Suggest one skill that acts on what the numbers show: `ai-blindspot-finder` (competitors win prompts), `geo-action-plan` (open insights), `cited-sources-analysis` (sources), `query-fanout-briefs` (topics without content).
