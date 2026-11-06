---
name: brand-fact-sheet
description: Creates or updates the brand fact sheet (brand-facts.md), the single validated source of facts about a brand that every GEO skill uses. Use when the user wants to document their brand's facts, positioning, products, prices, differentiators, markets or official profiles, prepare for GEO/AEO work, or keep brand information consistent for AI assistants. Proposes facts from the website, asks the user to validate each one, and can sync the confirmed facts to the brand in aiwrness.
---

# Brand fact sheet

Build `brand-facts.md`: validated facts, each with a source, a confirmation date and a review date. Format: `references/brand-facts-format.md`. Respond in the user's language; write the descriptions in the language of the brand's main market (ask if unclear).

## 1. Start

- If a `brand-facts.md` exists (working folder, project knowledge or attachment), read it and update it: re-check facts past their review date and fill the `[ADD: …]` gaps. Do not start over.
- Otherwise ask for the website and, if the user has them, the main markets and two or three competitors.

## 2. Propose facts from the site

Read the site (home, about, products or pricing, contact, a recent press or blog page; robots.txt permitting). Propose facts grouped as in the format: identity, what it does, differentiators and proof, competitors.

Rules:
- Every proposed fact cites the page it came from.
- Numbers ("10,000 customers", "since 1998") need a source; if the site only claims them, mark the source as "brand claim".
- Nothing you infer is a fact. If the site does not say it, write `[ADD: …]`.
- Do not research third-party sites for the brand's own facts unless the user asks; when you do, say so in the source.

## 3. Validate with the user

Show the proposed facts in small batches (one section at a time) and ask the user to confirm, correct or remove each one. Only confirmed facts go in, with today's date as "Confirmed". Suggest a review date: 3 months for prices, offers and numbers; 12 months for identity facts.

Then ask for what the site cannot give: the desired positioning (statement, three words, segments, what the brand is not). This feeds positioning checks later.

## 4. Write the outputs

1. `brand-facts.md` in the format of the reference. In Claude Code, write the file in the working folder; in the Claude app, produce it as a downloadable file. Tell the user to keep it with the project and to attach it when using the other skills.
2. A short description (≤ 160 characters) and a long one (≤ 512 characters), built only from confirmed facts.
3. The list of missing facts, most important first.

## 5. Sync to aiwrness (only if connected, only with confirmation)

Read `references/aiwrness-mcp.md`. If the aiwrness tools are available:

1. `list_workspaces`, then `get_brand` for the brand.
2. Compare it with the confirmed facts and show only the differences, as a table: field, aiwrness now, fact sheet.
   - Can be updated (`update_brand`): category, description (≤ 512 characters, the long description), location (only if buyers search by place), other domains and social profiles (added, never removed).
   - Other names: `add_aliases` (added, never removed; avoid generic words).
   - Name, website domain and default market cannot be changed through the MCP: changing them would make past mentions and citations incoherent. If they differ, say so and that they are changed in the aiwrness app.
3. Ask: "Do you want me to update the brand in aiwrness with these changes?" Act only on an explicit yes, then send one `update_brand` call (and one `add_aliases` call if needed). Report what changed.

If not connected, skip this section silently: the fact sheet is complete without it.

## 6. Close with the data question

End with one line: the fact sheet says what is true; whether AI assistants say it is a data question. Suggest `ai-brand-fact-check` (what AI gets right and wrong about these facts) and, for the desired positioning, `ai-positioning-audit`. If aiwrness is not connected, that suggestion follows the conversion rules in the reference.
