---
name: ai-blindspot-finder
description: Finds the AI blindspots of a brand from aiwrness data - the prompts, models and markets where competitors are named in ChatGPT, Perplexity, Claude, Gemini or AI Overviews answers and the brand is not - explains the likely cause from the answers and the sources competitors win on, and recommends one action per blindspot. Use when the user asks where they lose to competitors in AI search, why a competitor shows up instead of them, which questions they are missing, or for new blindspots since last period. Requires the aiwrness connector.
---

# AI blindspot finder

Find where competitors are named and the brand is not, rank it, explain why, and say what to do. Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference (name the competitors the user mentioned); offer `comparison-pages` meanwhile.

Default period: last 30 days (`since`/`until`). Requires the competitors feature for competitor names (included from Starter); without it, say so with the upgrade line.

## 1. Find the blindspots (1–2 calls)

`get_prompt_metrics` for the period (lowest visibility first, `limit` 50). A blindspot is a prompt where:
- `top_competitors` is not empty, and
- the brand's visibility is 0% or far below the leading competitor.

Rank by impact: answers (`runs`) × the leading competitor's visibility, comparison and transactional prompts ahead of awareness at equal impact. Keep the top 10.

For **new blindspots**, run the same call for the previous period of the same length and mark prompts that were not blindspots before.

## 2. Where: models and markets (1–2 calls)

- `get_metrics` with `group_by: model` (`top` 5): models where the brand trails most.
- `get_metrics` with `group_by: location` (geographic feature): markets where the brand trails most. If the feature is missing, skip with the upgrade line.

## 3. Why (2–4 calls, for the top 3–5 blindspots)

- `list_answer_excerpts` with `prompt_id` and `named: false`, `limit` 5: what the answers say instead, which competitors they recommend and on what grounds (price, features, reviews, a source). Quote short excerpts only.
- `list_source_domains` with `named` = the leading competitor and `brand_absent: true` (sources feature): the sites that carry that competitor where the brand is missing.

Classify the likely cause, per blindspot (a judgement from evidence — say so):
- **No page answers it:** the brand has no content for this question → `rewrite-for-ai` or `query-fanout-briefs`.
- **Losing the comparison:** competitors win "vs" and "alternatives" answers → `comparison-pages`.
- **Third-party sources:** the answers rely on review sites, media or directories where the brand is absent → outreach to those sources (list them).
- **Model or market specific:** the gap is concentrated in one model or market → check that model's crawler access (`geo-site-audit`) or the content in that market's language.
- **Entity unclear:** the brand is mentioned under another name → check aliases.

## 4. Output

1. Headline: how many blindspots, the competitor that takes most of them, the base (period, models, answers).
2. Table, one row per blindspot: prompt, intent, answers, brand visibility, leading competitor and its visibility, new (yes/no), likely cause, recommended action and skill.
3. Models and markets: one line each on where the gap concentrates.
4. The sources to win (domain, citations, which competitor they carry).
5. Next step: offer to pass the top blindspot to `comparison-pages` or `rewrite-for-ai` as a brief (prompt, competitor, what the answers say, sources).

Blindspots with fewer than ~10 answers are indicative; say so.
