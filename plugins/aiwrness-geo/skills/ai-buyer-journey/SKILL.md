---
name: ai-buyer-journey
description: Maps what a buyer hears from AI assistants (ChatGPT, Perplexity, Claude, Gemini, AI Overviews) at each stage of their search - discovery, comparison and decision - from aiwrness data, showing which brands are present at each stage, where the brand drops out of the journey, and what to do stage by stage. Use when the user asks about the buyer journey in AI search, funnel visibility, where they lose buyers to competitors, or visibility by intent or stage. Requires the aiwrness connector.
---

# AI buyer journey

Follow the buyer through the questions they ask AI, stage by stage, and see where the brand disappears. Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `comparison-pages` meanwhile.

Default period: last 30 days (`since`/`until`); 90 days if there are few answers.

## 1. Stages

Prompt categories in aiwrness map to stages:

| Stage | Category | Typical question |
|---|---|---|
| Discovery | awareness | "best {category} for {need}", "how to solve {problem}" |
| Comparison | comparison | "{A} vs {B}", "alternatives to {A}" |
| Decision | transactional | "{brand} pricing", "where to buy {product}", "{category} in {city}" |

If the brand uses intent tags (`list_tags`, e.g. `intent:problem`, `intent:local`), use them to split a stage further with `tag_ids`.

## 2. Collect (2–4 calls)

1. `get_metrics` with `group_by: category` (`top` 8): per stage, answers, the brand's visibility, position and the brands named.
2. `get_prompt_metrics` (`limit` 100): the prompts of each stage where the brand is absent and who is named instead.
3. Optional, several markets: `get_metrics` with `group_by: location` and `category` filters per stage (geographic feature) — only if the user asks about markets.
4. Optional: `list_answer_excerpts` with a decision-stage `prompt_id` and `named: false` — what buyers are told at the moment of choosing.

If a stage has no prompts, say so: the journey cannot be measured there yet, and `prompt-portfolio-review` or `aiwrness-quick-setup` can add prompts for it.

## 3. Output

1. Headline: where the brand is strongest and where it drops out, with the base.
2. Journey table: stage → answers, brand visibility, position, the top brands present, the brand's rank among them.
3. Drop-off: the stage where visibility falls most, and the competitors who take the buyer there.
4. Actions per stage:
   - Discovery: category and problem content (`query-fanout-briefs`, `rewrite-for-ai`), third-party sources (`cited-sources-analysis`).
   - Comparison: `comparison-pages`.
   - Decision: pricing, availability and local pages that answer directly (`rewrite-for-ai`), structured data (`ai-technical-files`), facts AI gets wrong (`ai-brand-fact-check`).
