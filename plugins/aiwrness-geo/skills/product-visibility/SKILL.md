---
name: product-visibility
description: Shows which of a brand's products appear in AI assistants' answers (ChatGPT, Perplexity, Claude, Gemini, AI Overviews) and which are absent, by model and market, and which sources each product depends on, from aiwrness data. If the products are not set up yet, proposes them from the website and creates them after approval. Use when the user asks which products AI recommends, why a product is never mentioned, or about product visibility in AI search. Requires the aiwrness connector and a plan with products (Scale or above).
---

# Product visibility

Which products do AI answers name, which do they ignore, and what carries them? Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `rewrite-for-ai` for a product page meanwhile.

Products start at the Scale plan. On `FEATURE_UNAVAILABLE`, say so with the upgrade line and stop the data part; you can still review product pages with `rewrite-for-ai`.

Default period: last 30 days (`since`/`until`).

## 1. Are the products set up?

`list_products` (`limit` 100).

If there are none, or important ones are missing:
1. Propose products from the website (product or pricing pages) and `brand-facts.md`: name, other names (how people and AI write it; avoid generic words), URL.
2. Show the list and wait for explicit approval.
3. One `extend_brand` call with `products`.
4. Products are matched in answers from the next cycle: say that there is no data for new products yet, and stop here unless older products exist.

## 2. Measure (1–2 calls)

- `get_product_metrics` with `sources_per_product: 5`: per product, answers naming it, visibility, average position, answers per model, sentiment (with the feature) and the domains most cited in those answers. Products never named are included with 0.
- Optional: the same call with `model` or `location` to compare one model or market.

## 3. Explain (optional, 1–2 calls)

For an absent or weak product that matters: `list_answer_excerpts` with the prompt where it should appear (`get_prompt_metrics` helps find it) to see which products — the brand's or competitors' — are named instead and why.

## 4. Output

1. Headline: how many products appear, which lead, which are absent, with the base (period, models, answers).
2. Map: one row per product — answers, visibility, position, models where it appears, top sources.
3. Absent products: likely reason (no page, page not citable, not on the sources the models use for that category) and the action (`rewrite-for-ai` for the product page, `ai-technical-files` for Product structured data, outreach to the listed sources).
