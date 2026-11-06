---
name: prompt-portfolio-review
description: Reviews the prompts a brand monitors in aiwrness and proposes adjustments - prompts that produce no mentions of anyone, duplicated or off-target prompts, buyer intents or markets that are missing, and topics the AI models search for that no prompt covers - then archives and adds prompts in one approved step. Use when the user asks to review, clean up, improve or rebalance their tracked prompts, or wonders whether they track the right questions. Requires the aiwrness connector.
---

# Prompt portfolio review

Keep the monitored prompts useful: every skill with data depends on them. Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `brand-fact-sheet` meanwhile.

Default period: last 30 days (`since`/`until`); use 60–90 days if prompts run weekly and there are few answers.

## 1. Collect (4–5 calls)

1. `get_usage`: prompt units used and left.
2. `list_prompts` (status all, `limit` 100, page if needed): text, category, markets, archived state.
3. `get_prompt_metrics` for the period (status `active`, `limit` 100): answers, brand visibility, top competitors and searches per prompt.
4. `list_tags`: existing tags (intent tags such as `intent:discovery` if the brand uses them).
5. `get_topics` (`limit` 25): what the models actually search for, with brand presence.

## 2. Diagnose

- **Silent prompts:** answers but no brand and no competitor named in any of them → the question does not produce brand answers; candidate to reword or archive.
- **Gaps, not failures:** 0% brand visibility with competitors named is a blindspot — keep it (it is what `ai-blindspot-finder` works on).
- **Duplicates:** prompts asking the same thing in different words, in the same market.
- **Intent balance:** count prompts per category (awareness, comparison, transactional) and per intent tag. Flag a missing or very thin intent.
- **Markets:** markets in the fact sheet or the brand's other prompts that a key question does not cover; markets that cost units but are not a target.
- **Topic coverage:** topics with many searches and no prompt asking about them.
- **Archived prompts** that would be worth restoring (they keep their history).

## 3. Propose

Three lists, each with the reason and the evidence:
1. Archive (prompt, why, answers so far). Archiving keeps all history and frees units; say whether their past answers should still count in overall metrics (`include_in_metrics`).
2. Add (text, category, intent tag, markets), sized to the units left after the archives.
3. Restore (archived prompts worth bringing back), if any.

Show the unit balance: units now, freed by archiving, used by the additions, left.

## 4. Write (only with explicit approval)

- Archive: one `set_prompt_archived` call with all `prompt_ids` and `archived: true`.
- Restore: one `set_prompt_archived` call with `archived: false` (refused if the quota has no room for all of them).
- Add: one `extend_brand` call with the new `prompts` (tags by name; new tags in `tags`).

Archive before adding when the additions need the freed units. Report what changed and the units left.
