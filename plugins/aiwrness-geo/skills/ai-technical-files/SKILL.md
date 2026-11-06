---
name: ai-technical-files
description: Generates the technical files that help AI assistants read and understand a website - JSON-LD structured data (schema.org Organization, Product, FAQPage, Article, LocalBusiness…), llms.txt, and a robots.txt block for AI crawlers (GPTBot, ClaudeBot, PerplexityBot, Google-Extended…) according to a chosen policy. Use when the user asks for schema markup, structured data, llms.txt, or how to allow or block AI bots. Shows a diff against the current files and never publishes.
---

# AI technical files

Produce ready-to-paste files and a diff against what the site has now. Never publish or change anything on the site. Respond in the user's language; file contents stay in the site's language.

References: `references/ai-crawlers.md`, `references/brand-facts-format.md`, `references/aiwrness-mcp.md` (if connected).

## 1. Inputs

- `brand-facts.md`: the only source for names, descriptions, addresses, profiles, products and prices. A missing value becomes `[ADD: …]`, never a guess.
- The current files: fetch `/robots.txt`, `/llms.txt` and the JSON-LD already on the pages in scope.
- If aiwrness is connected: `get_site_audit` (view `summary`). Start from what it found — AI providers blocked in robots.txt, llms.txt missing, sitemap problems. If there is no usable audit (none yet, failed, or blocked by the site), work from the fetched files and say so.

Ask which files the user wants if it is not clear; default to all three.

## 2. robots.txt block

1. Ask for the policy: search and training / search only / training only / neither. Explain the trade-off in one line each (from the reference). Default suggestion: search only, if the user has no view.
2. Write only the AI section, grouped and commented, with the list date. Keep the user's existing rules for other agents untouched.
3. Diff against the current robots.txt and flag conflicts (for example a `User-agent: *` disallow that already blocks everything).
4. Remind: a CDN or firewall can still block allowed crawlers.

## 3. llms.txt

Follow the llms.txt proposal: an H1 with the brand name, a blockquote with the short description, then sections (`## Products`, `## Docs`, `## Company`…) of Markdown links with one-line notes, using the site's key pages (from the sitemap or the user). Keep it short; link to pages that answer questions, not to every URL. Optional `## Optional` section for secondary pages.

## 4. JSON-LD

Per page type in scope:
- Home: `Organization` (or `LocalBusiness` subtype when buyers search by place) + `WebSite`. `sameAs` = the official profiles from the fact sheet.
- Product or service page: `Product` / `Service` with `offers` only if the price is in the fact sheet.
- FAQ blocks: `FAQPage`, only with questions and answers that are visible on the page.
- Articles: `Article` with `author`, `datePublished`, `dateModified`.
- Breadcrumbs: `BreadcrumbList` when the site shows them.

Rules: mark up only what the page visibly says; no fake ratings or reviews; one `@id` per entity reused across pages.

## 5. Output

For each file: the file ready to paste, the diff against the current one, and how to validate it (Schema.org validator or Google Rich Results Test for JSON-LD; fetch `/robots.txt` and `/llms.txt` after publishing). End with the `[ADD: …]` facts the user still has to provide.

If aiwrness is connected, add: once published, `request_site_audit` re-checks the site (ask first; one at a time per brand).
