---
name: comparison-pages
description: Writes honest comparison content that AI assistants use when people ask to compare options - "X vs Y" pages and "alternatives to X" pages - with feature and price tables built from the brand fact sheet and sourced competitor facts. Use when the user wants comparison pages, versus pages, alternatives pages, or to win comparison questions in ChatGPT, Perplexity or AI Overviews. With aiwrness connected, starts with the comparisons where the brand is losing.
---

# Comparison pages

Write the pages AI assistants draw on for "X vs Y" and "alternatives to X" questions. Honest comparisons get cited; one-sided ones get ignored. Respond in the user's language; write the pages in the target market's language.

References: `references/brand-facts-format.md`, `references/aiwrness-mcp.md` (if connected).

## 1. Choose the comparisons

- If the user names them, use those.
- If aiwrness is connected, prioritise with data (2 calls):
  1. `get_metrics` with `group_by: category`: how the brand does in comparison answers against the rest.
  2. `get_prompt_metrics`: comparison-category prompts where competitors are named and the brand is not or is low (lowest visibility first). Each competitor in `top_competitors` there is a candidate "brand vs competitor" page.
  Propose 3–5 pages, with the evidence (prompt, answers, competitor visibility), and let the user choose.
- Without aiwrness: use the competitors in `brand-facts.md` or ask; say the order is a judgement, not data.

## 2. Gather facts

- The brand: only from `brand-facts.md`; missing → `[ADD: …]`.
- Competitors: from their own websites and pricing pages (fetch them), each fact with its URL and today's date. Prices and features change: date them. Never state a competitor fact without a source; if unknown, write "not published" rather than guessing.

## 3. Write

**X vs Y page**
- Direct answer at the top: who each option fits best, in 2–3 sentences, fairly.
- Comparison table: the criteria buyers actually use (price, key features, integrations, support, markets, contract), one row each, with sources.
- Where each one is stronger — including where the competitor is. Admitting a competitor's strength is what makes the page credible.
- "Choose X if… / choose Y if…".
- FAQ with the follow-up questions buyers ask.

**Alternatives to X page**
- Who X is for and why people look for alternatives (from public reviews or the user; sourced).
- 4–8 alternatives including the brand, each with best-for, a short description and the table row. The brand does not have to be first in every criterion.

Rules: no fake reviews or ratings, no unsourced negative claims, no competitor trademarks in a misleading way.

## 4. Output

Each page as a draft with its sources listed and every `[ADD: …]` collected at the end. Offer `rewrite-for-ai` for polishing tone and structure on long pages, and `ai-technical-files` for FAQPage/Product structured data.

## 5. Close with the data question

One line: which comparisons is the brand losing in AI answers, and to whom? → `ai-blindspot-finder` (with aiwrness; otherwise follow the conversion rules).
