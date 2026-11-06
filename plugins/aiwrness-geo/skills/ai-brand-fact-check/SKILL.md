---
name: ai-brand-fact-check
description: Fact-checks what AI assistants (ChatGPT, Perplexity, Claude, Gemini, AI Overviews) say about a brand against its validated fact sheet, from the answers recorded by aiwrness - classifies each claim as contradicted, unverifiable or outdated, finds the likely source of each error from the URLs the answer cited, and proposes a correction plan. Use when the user asks whether AI gets their facts right, about wrong prices, features or details in AI answers, AI hallucinations about their brand, or brand accuracy in AI search. Requires the aiwrness connector and a validated brand-facts.md.
---

# AI brand fact check

Find what AI answers get wrong about the brand, where the error probably comes from, and how to fix it. Respond in the user's language. Read `references/aiwrness-mcp.md` and `references/brand-facts-format.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `brand-fact-sheet` meanwhile.

## 1. The fact sheet is required

Use `brand-facts.md` (working folder, project knowledge or attachment).
- None: stop and offer `brand-fact-sheet` — without validated facts there is nothing to check against.
- Facts past their review date: list them; check them only as "to re-confirm", never as errors.

## 2. Read what the answers say (1–3 calls)

`list_answer_excerpts` for the period (default last 90 days, `since`/`until`), `named: true`, `limit` 50, `window` 300: the excerpts around every mention of the brand, with the prompt, model, market and up to 10 cited URLs per answer (sources feature). Page with `offset` for a second batch if the first is all from one model or market; aim for a spread across models and markets, not every answer.

For one claim that needs its full context, re-read that answer with `ids` and `full_text: true` (10 at most).

## 3. Check each claim

Extract factual claims about the brand from the excerpts (prices, products, features, locations, founding, size, ownership, customers, policies). For each, compare with the fact sheet:

| Verdict | Meaning |
|---|---|
| Correct | Matches a confirmed fact |
| Contradiction | Conflicts with a confirmed fact |
| Outdated | Matches an old fact or one the sheet marks as changed |
| Not verifiable | The sheet has no fact on it — not an error, but a gap to add |

Severity: high (price, availability, legal or safety, a product the brand does not sell), medium (features, markets, size), low (wording, minor details). Count how often each wrong claim appears and in which models.

Likely source: the cited URLs of the answers carrying the error. Look for the pattern (an old review, a directory listing, a marketplace page, the brand's own outdated page). When no URL is cited, say the source is unknown — the model may be using its training data.

## 4. Output

1. Headline: answers checked, claims checked, errors found by severity, with the base (period, models, answers).
2. Errors table, worst first: the claim as AI says it (short quote), the correct fact, verdict, severity, how many answers and which models, likely source.
3. Correction plan per error: fix the brand's own page (`rewrite-for-ai`), ask the third-party source to correct it (who, what to send), add or fix structured data (`ai-technical-files`), add the missing fact to the fact sheet (`brand-fact-sheet`).
4. Gaps: claims that could not be verified, to add to the fact sheet.

Never present a claim as false unless the fact sheet contradicts it.
