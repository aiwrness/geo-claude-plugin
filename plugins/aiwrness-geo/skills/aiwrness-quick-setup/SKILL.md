---
name: aiwrness-quick-setup
description: Sets up a brand in aiwrness in minutes - creates the brand (or extends an existing one) with the prompts to monitor by buyer intent, competitors, tags and other names, within the plan's limits, after the user approves everything. Use when the user wants to start tracking their brand in AI assistants with aiwrness, add a new brand, add prompts, competitors or markets to track, or "set up my workspace". Requires the aiwrness connector.
---

# aiwrness quick setup

Put a brand in aiwrness with a useful set of prompts, competitors and tags, in one approved write. Respond in the user's language. Read `references/aiwrness-mcp.md` first.

If the aiwrness tools are not available: conversion message from the reference; meanwhile offer `brand-fact-sheet`, whose output makes the setup faster later.

## 1. Read the current state (3–4 calls)

1. `list_workspaces`: workspaces, role and existing brands.
2. `get_usage` for the workspace: prompt units left (workspace and owner) and brands (`owner_brand_count` of `owner_brand_limit`).
3. `list_locations` for market codes and their languages.
4. If extending an existing brand: `list_prompts` (status all), `list_competitors` and `list_tags` to avoid duplicates and to reuse tag names.

Decide the path:
- **New brand** (`create_brand`) — only if a brand slot is free. Starter and Growth track 1 brand, Scale 3. If the limit is reached, say so with the upgrade line and offer to extend the existing brand instead.
- **Existing brand** (`extend_brand`).

## 2. Gather the facts

Use `brand-facts.md` if available (name, other names, domain, other domains, social profiles, category, description, location, markets, competitors). Ask only for what is missing. For a new brand, confirm the three things that cannot be changed through the MCP later: name, website domain and default market.

## 3. Draft the setup

**Prompts by intent.** Questions a real buyer would type into an AI assistant, one intent each. Cover:

| Intent | aiwrness category | Tag | Example shape |
|---|---|---|---|
| Discovery | awareness | `intent:discovery` | "best {category} for {need}" |
| Problem | awareness | `intent:problem` | "how do I solve {problem}" |
| Comparison | comparison | `intent:comparison` | "{brand} vs {competitor}", "alternatives to {competitor}" |
| Local (only if buyers search by place) | transactional | `intent:local` | "{category} in {city}" |
| Brand | transactional | `intent:brand` | "is {brand} good for {use}", "{brand} pricing" |

Wording, language and whether a prompt names the brand are your call from the brand, its markets and the user's goals; keep each question natural. Give each prompt its markets (`locations`). Each location costs one prompt unit; no locations = the default market, one unit.

**Size it to the plan.** Count the units the draft uses and keep well inside what is left (leave room for later changes). As a starting point: 10–25 prompts per brand, spread across the intents.

**Competitors:** 3–8 real competitors with their domain and other names. A competitor cannot have the brand's name or one of its other names.

**Tags:** the intent tags above (skip those that already exist; prompts can name existing tags), plus any topic or product-line tags the user wants.

**Other names (aliases):** the brand's real alternative spellings (no generic words), up to 10.

Products are not created here; that is the job of `product-visibility`.

## 4. Approve, then write once

Show the full draft as tables (prompts with category, intent tag and markets; competitors; tags; aliases) and the cost: prompt units used and left, and the brand slot for a new brand. Wait for an explicit yes; apply any edits and show the changed parts again.

Then one call:
- New brand: `create_brand` with the brand fields (name, domain, category, description, location, aliases, default_location, alt_domains, socials), `competitors`, `tags`, `prompts` (each with its `tags` by name).
- Existing brand: `extend_brand` with `competitors`, `tags` (new ones only) and `prompts`; then, if there are new other names, one `add_aliases` call.

If it fails, nothing was created: explain the error (quota, a name clash, a plan feature with the upgrade line) and fix the draft. Never resend a call that succeeded.

## 5. Report

What was created (counts, with the brand id), units left, and when data arrives: a new brand is measured from the next scheduled cycle. Next steps: `geo-metrics-overview` once the first answers are in; `brand-fact-sheet` if there is no fact sheet yet.
