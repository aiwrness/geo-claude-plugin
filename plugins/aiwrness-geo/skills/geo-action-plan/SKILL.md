---
name: geo-action-plan
description: Turns the aiwrness insights - tasks the platform derives from AI answers, the brand's site and its audit, ranked by impact - into a prioritised GEO action plan, routes each step to the skill that does it, and tracks progress by marking insights in progress or done after the user approves. Use when the user asks "what should we do to improve AI visibility", for a GEO roadmap or to-do list, to work through or update insights, or what to fix first. Requires the aiwrness connector.
---

# GEO action plan

aiwrness already works out tasks ("insights") from the answers, the site and its audit. Turn them into a plan the user can execute, and keep their status up to date. Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `geo-site-audit` meanwhile.

## 1. Read the insights (1 call)

`get_insights` (default: open and in_progress, biggest impact first, `limit` 25). Each insight has a `task` line, a `kind`, a `category`, `impact` (the number of answers it is about — an order, not a promised gain), `strength` (how much data is behind it, not how bad it is), `status`, `lever_key` and `evidence`.

Kinds by category:
- **site:** `bot_blocked` (an AI crawler cannot read the site), `page_issue` (a cited page fails a check)
- **content:** `topic_no_page`, `page_not_cited`, `page_language_gap`
- **sources:** `reach_source` (a site cited in answers that leave the brand out), `rival_concentration`, `negative_source`
- **changes:** `audit_regression`, `topic_regression`

Some kinds and evidence are hidden by the plan (no sentiment → no `negative_source`). If the list is empty, say there are no open tasks and suggest `geo-metrics-overview`.

## 2. Build the plan

1. Group by `lever_key`: one fix (a page, a topic, the site) can close several insights. One plan item per lever.
2. Order: site blockers first (they cap everything else), then by total impact, then strength.
3. For each item: the task in plain words, the evidence that justifies it (URLs, topic, searches, competitors, counts), the effort (low, medium, high — your estimate, say so), and the skill that does it:

| Kind | Skill |
|---|---|
| `bot_blocked` | `ai-technical-files` (robots.txt) and `geo-site-audit` (CDN/firewall) |
| `page_issue`, `audit_regression` | `geo-site-audit` (the failing check) and `ai-technical-files` when it is structured data or llms.txt |
| `topic_no_page`, `page_language_gap` | `query-fanout-briefs` → `rewrite-for-ai` |
| `page_not_cited` | `rewrite-for-ai` with the missing words from the evidence |
| `reach_source`, `rival_concentration` | outreach list (the sources in the evidence); `cited-sources-analysis` for context |
| `negative_source` | review the source's claims; correct facts with the source; `brand-fact-sheet` if facts changed |
| `topic_regression` | `ai-blindspot-finder` for that topic's prompts |

4. Keep it to 5–8 items; list the rest briefly.

## 3. Track progress (only with approval)

- When the user decides to start items: "Mark these {n} insights as in progress?" → on yes, one `set_insight_status` call with all their ids and `in_progress`. This fixes the baseline aiwrness measures the result against.
- When the user says items are done: one call with `done`. The next aiwrness cycle confirms them (resolved) or reopens them; never set `resolved` yourself.
- Not relevant: `dismissed` (comes back only if the evidence gets stronger).
- After site fixes: offer `request_site_audit` (one at a time per brand, rate-limited; ask first).

## 4. Output

The plan as a table (item, why, impact, effort, skill, status), the base (open insights, period of the data), and the next concrete step for item 1. If the user wants to start now, hand item 1 to its skill with the evidence as the brief.
