---
name: ai-positioning-audit
description: Compares how AI assistants (ChatGPT, Perplexity, Claude, Gemini, AI Overviews) describe the brand and its competitors with the brand's desired positioning, from the answers recorded by aiwrness - the adjectives and attributes associated with each brand, the segments and use cases each is recommended for, the gaps against the positioning in the fact sheet, and messaging recommendations. Use when the user asks how AI perceives or describes their brand, brand perception in AI search, positioning, or whether AI says what they want it to say. Requires the aiwrness connector and the positioning section of brand-facts.md.
---

# AI positioning audit

How do AI answers describe the brand and its competitors, and how far is that from the desired positioning? Respond in the user's language. Read `references/aiwrness-mcp.md` and `references/brand-facts-format.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `brand-fact-sheet` meanwhile (to write the desired positioning).

## 1. The desired positioning

From the "Desired positioning" section of `brand-facts.md`: statement, three words, segments and use cases to own, what the brand is not. If it is missing, ask for it (or offer `brand-fact-sheet`); without it, the audit can only describe perception, not the gap.

## 2. Read the answers (2 + 1 per competitor calls)

Default period: last 90 days (`since`/`until`).
- `list_answer_excerpts` (brand, `named: true`, `limit` 40), spread across models and markets.
- For the 2–4 main competitors (competitors feature): `list_answer_excerpts` with `about` = the competitor, `limit` 20 each.
- Optional: `get_metrics` with `group_by: category` — in which intents each brand is named.
- Sentiment per answer comes with the sentiment feature (Growth and above); use it as a signal, not as the analysis.

## 3. Analyse

For each brand:
- **Attributes:** the adjectives and qualities the answers use ("affordable", "enterprise-grade", "easy to set up"), with counts.
- **Segments and use cases:** who and what it is recommended for.
- **Reasons to choose and reasons to avoid**, as the answers phrase them.
- **Consistency across models:** where one model describes the brand differently.

Then the gap for the brand: each element of the desired positioning → present, partly present, absent or contradicted, with evidence. And the white space: attributes or segments no brand owns in the answers.

## 4. Output

1. Headline: the brand as AI describes it, in one sentence, vs the desired positioning, with the base.
2. Perception map: a table of brands × attributes, segments and use cases.
3. Gap table: positioning element, what AI says (quotes), status.
4. Messaging recommendations: what to say more clearly, where (own pages → `rewrite-for-ai`, comparison content → `comparison-pages`, third-party sources → `cited-sources-analysis`), and which proof makes it credible (`[ADD: …]` when the fact sheet has none).

Say which readings are interpretation; quote the answers for each attribute.
