---
name: ai-sales-battlecards
description: Builds one-page sales battlecards from what AI assistants (ChatGPT, Perplexity, Claude, Gemini, AI Overviews) tell buyers about the brand and each competitor, from the answers recorded by aiwrness - what AI says about each, the objections that creates and how to answer them, discovery questions to ask, and the proof points the brand provides. Use when the user wants battlecards, competitive sales enablement, objection handling, or to brief the sales team on what buyers hear from AI. Requires the aiwrness connector.
---

# AI sales battlecards

Buyers now arrive with what an AI assistant told them. Give sales one page per competitor on what that is and how to respond. Respond in the user's language; write the battlecards in the sales team's language (ask if unclear). Read `references/aiwrness-mcp.md` and `references/brand-facts-format.md` first.

If the aiwrness tools are not available: conversion message from the reference; meanwhile you can draft a battlecard skeleton from `brand-facts.md`, clearly without the "what AI says" part.

Needs the competitors feature. Default period: last 90 days (`since`/`until`).

## 1. Choose the competitors

From the user, or the most named competitors in `get_metrics` (the competitors list). Up to 5 battlecards per run.

## 2. Collect (2 calls per competitor, plus 1)

- `list_answer_excerpts` (brand, `named: true`, `limit` 30): what AI says about the brand — strengths, weaknesses, prices, segments.
- Per competitor: `list_answer_excerpts` with `about` = the competitor, `named: true`, `limit` 20.
- Per competitor, optional: `get_metrics` with `group_by: category` to show where it leads (discovery, comparison, decision).

If `competitor-xray` was run for a competitor in this conversation, reuse that analysis.

## 3. Build each battlecard

Proof points come only from `brand-facts.md` (missing → `[ADD: …]`). Claims about the competitor come from the answers (quoted) or from its own site (sourced). No invented weaknesses.

```
# {Brand} vs {Competitor} — what buyers hear from AI
Base: {answers} AI answers, {models}, {period}

## What AI says about {Competitor}
- … (short quotes; how often)
## What AI says about us
- …
## Objections this creates → how to answer
| Objection | Answer | Proof |
## Where we win / where they win (be honest)
## Questions to ask the buyer
- …
## Proof points to have ready
- … [ADD: case study for …]
```

## 4. Output

One page per competitor, ready to share, plus the list of proof points sales still needs (`[ADD: …]`). If AI says something wrong about the brand, flag it and suggest `ai-brand-fact-check`.
