---
name: cited-sources-analysis
description: Shows which websites, pages and social profiles AI assistants (ChatGPT, Perplexity, Claude, Gemini, AI Overviews) actually cite when answering about a brand's market, from aiwrness data - a ranking of cited domains by type (own, competitor, media, review sites, forums, marketplaces…), the brand's most cited pages, the social profiles cited, and the sites the models search inside. Use when the user asks which sources AI relies on, where to get mentioned, PR or outreach targets for AI search, or which of their pages get cited. Requires the aiwrness connector.
---

# Cited sources analysis

Which sources do AI assistants use for this market, and where does the brand stand among them? Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; offer `geo-site-audit` meanwhile (whether the brand's own site can be cited at all).

Default period: last 30 days (`since`/`until`). Needs the sources feature (included from Starter).

## 1. Collect (3–4 calls)

1. `list_source_domains` (`limit` 50): cited domains with citations, answers, models, share of all citations, and `owner` (self, competitor, or none = third party). `self_citations` against `total_citations` is the brand's own share.
2. `list_source_urls` with `domain` = the brand's own domain: its most cited pages.
3. `get_search_universe` with `view: sources` (`kind: all`): each site the answers searched inside (`site:` searches) or cited — social and forum networks grouped with their profiles — with the topics of those answers. This covers social profiles and forums.
4. Optional, if the user asks about one competitor: `list_source_domains` with `named` = competitor and `brand_absent: true` — the sources that carry it where the brand is missing.

## 2. Classify

Group third-party domains by type, from the domain and its pages (a judgement; say "probable" when unsure):
own · competitor · media and news · review and comparison sites · forums and communities (Reddit…) · social networks · marketplaces · directories and listings · reference (Wikipedia…) · official and institutional · other.

## 3. Output

1. Headline: total citations and the brand's own share, the base (period, models, answers).
2. Ranking by type: citations and share per type, and the top domains of each.
3. The brand's most cited pages (URL, citations, models), and pages competitors get cited for where the brand has none.
4. Social profiles and forums cited (whose profiles, which communities).
5. Sites the models search inside (`site:`): a strong sign they trust them for this market.
6. Actions: the 3–5 third-party sources most worth appearing on (cited a lot, brand absent), and own pages to strengthen → `rewrite-for-ai`.

Do not promise that appearing on a source produces mentions; it raises the odds.
