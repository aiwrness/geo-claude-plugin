---
name: competitor-xray
description: X-rays one competitor in AI search from aiwrness data - where it beats the brand by AI model (ChatGPT, Perplexity, Claude, Gemini, AI Overviews), by buyer intent and by market, which prompts and topics it wins, which sources carry it where the brand is missing, and what the answers say about it - with an engine-by-engine gap analysis, opportunities to overtake it and an optional short battlecard. Use when the user asks why a competitor shows up more in AI answers, how a rival wins, or for a competitor analysis in AI search. Requires the aiwrness connector.
---

# Competitor X-ray

Explain why one competitor wins visibility, model by model, and where the brand can overtake it. Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference (with the competitor's name); offer `comparison-pages` meanwhile.

Needs the competitors feature. Default period: last 30 days (`since`/`until`). Use the competitor's name exactly as tracked (`list_competitors`); if it is not tracked, say so and offer to add it with `extend_brand` (approval needed; it is measured from the next cycle).

## 1. Collect (5–7 calls)

1. `get_metrics` with `group_by: model` (`top` 10): the competitor against the brand in every model.
2. `get_metrics` with `group_by: category`: by intent (awareness, comparison, transactional).
3. `get_metrics` with `group_by: location` if the brand tracks several markets (geographic feature).
4. `get_prompt_metrics` (`limit` 100): prompts where the competitor is in `top_competitors` and the brand is low or absent.
5. `get_topics` (`limit` 25): topics where it appears among the rivals.
6. `list_answer_excerpts` with `about` = the competitor, `named: true`, `limit` 15: what the answers say about it — strengths, prices, segments, sources.
7. `list_source_domains` with `named` = the competitor and `brand_absent: true` (sources feature): the sites that carry it where the brand is missing.

## 2. Analyse

- **Strengths by model and intent:** where its visibility, share of voice and position beat the brand, and by how much.
- **Engine by engine:** for each model, the gap, the likely cause (sources that model relies on, crawler access — check `geo-site-audit` if the brand is weak in one model only — content type the competitor has), and one recommendation for that model.
- **Why it is chosen:** the reasons the answers give, grouped (price, feature, reviews, integrations, local presence…), with short quotes.
- **Source dependence:** the domains it wins on, by type (review sites, media, forums, directories, its own pages).
- **Where the brand can overtake it:** prompts or topics where its lead is small, sources where the brand could appear, claims the answers make that the brand can match with facts.

Say which causes are judgement from the evidence.

## 3. Output

1. Headline: the competitor's lead in one sentence, with the base (period, models, answers).
2. Tables: by model and by intent (competitor vs brand: visibility, share of voice, position).
3. Engine-by-engine section: one short paragraph per model.
4. Why it wins (with quotes) and the sources it depends on.
5. Opportunities, ranked, each with the skill that acts on it (`comparison-pages`, `rewrite-for-ai`, `query-fanout-briefs`, outreach to the listed sources).

Optional battlecard format (when asked): one page — what AI says about them, what it says about us, where we win, three talking points. For a full sales battlecard, `ai-sales-battlecards` takes this analysis.
